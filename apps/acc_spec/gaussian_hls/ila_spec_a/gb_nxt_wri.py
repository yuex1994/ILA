# ILA for Halide Gaussian Blur (GB) accelerator that abstracts buffering.
# write instruction - architecture-level instruction.

import ila

from gb_arch import GBArch

# Define next state functions for architectural states
def WRI (gb):
    m = gb.abst

    READY_T     = gb.READY_TRUE
    READY_F     = gb.READY_FALSE
    VALID_T     = gb.VALID_TRUE
    VALID_F     = gb.VALID_FALSE
    DATA_SIZE   = gb.DATA_SIZE

    decode = (gb.arg_1_TVALID == VALID_T) & \
             (gb.arg_1_TREADY == READY_T) & \
             (gb.arg_0_TVALID == VALID_F) & \
             (gb.arg_0_TREADY == READY_F)

    # next state functions for output ports
    arg_1_TREADY_nxt = READY_F
    gb.arg_1_TREADY_nxt = ila.ite (decode, arg_1_TREADY_nxt, gb.arg_1_TREADY_nxt)

    arg_0_TVALID_nxt = VALID_F
    gb.arg_0_TVALID_nxt = ila.ite (decode, arg_0_TVALID_nxt, gb.arg_0_TVALID_nxt)

    arg_0_TDATA_nxt = gb.arg_0_TDATA
    gb.arg_0_TDATA_nxt = ila.ite (decode, arg_0_TDATA_nxt, gb.arg_0_TDATA_nxt)

    # next state functions for internal arch-states
    # x index (column) in the 2-D RAM
    RAM_x_nxt = ila.ite (gb.RAM_x == gb.RAM_x_M, 
                         gb.RAM_x_1, 
                         gb.RAM_x + gb.RAM_x_1)
    gb.RAM_x_nxt = ila.ite (decode, RAM_x_nxt, gb.RAM_x_nxt)

    # y index (row) in the 2-D RAM
    RAM_y_nxt = ila.ite (gb.RAM_x == gb.RAM_x_M, 
                ila.ite (gb.RAM_y == gb.RAM_y_M,
                         gb.RAM_y_0, 
                         gb.RAM_y + gb.RAM_y_1),
                         gb.RAM_y)
    gb.RAM_y_nxt = ila.ite (decode, RAM_y_nxt, gb.RAM_y_nxt)

    # w index (write) in the 2-D RAM
    RAM_w_nxt = ila.ite (gb.RAM_x == gb.RAM_x_M,
                ila.ite (gb.RAM_w == gb.RAM_w_M,
                         gb.RAM_w_0,
                         gb.RAM_w + gb.RAM_w_1),
                         gb.RAM_w)
    gb.RAM_w_nxt = ila.ite (decode, RAM_w_nxt, gb.RAM_w_nxt)

    # 8 488x1 bytes buffer in the 20D RAM
    in_byte = gb.arg_1_TDATA
    for i in xrange (0, gb.RAM_size):
        RAM_i_nxt = ila.ite (gb.RAM_w == i,
                             ila.store (gb.RAM[i],
                                        gb.RAM_x - gb.RAM_x_1, 
                                        in_byte),
                             gb.RAM[i])
        gb.RAM_nxt[i] = ila.ite (decode, RAM_i_nxt, gb.RAM_nxt[i])

    # 8 1x9 bytes slice in the stencil
    for i in xrange (0, gb.stencil_size-1):
        stencil_i_nxt = gb.stencil[i]
        gb.stencil_nxt[i] = ila.ite (decode, stencil_i_nxt, gb.stencil_nxt[i])

    def sliceSelect (start, seqs):
        def sliceSelectOne (modCase):
            idx = seqs[modCase]
            if modCase == gb.RAM_size - 1:
                return ila.load (gb.RAM[idx], gb.RAM_x - gb.RAM_x_1)
            else:
                return ila.ite (start == modCase,
                                ila.load (gb.RAM[i], gb.RAM_x - gb.RAM_x_1),
                                sliceSelectOne (modCase + 1))
        return sliceSelectOne (0)

    def genSliceSeqs (start):
        res = []
        for i in xrange (0, gb.RAM_size):
            res.append ((start + i) % gb.RAM_size)
        return res

    slice_seqs = []
    for i in xrange (0, gb.RAM_size):
        slice_seqs.append (genSliceSeqs (i))

    slice_chunks = [in_byte]
    for i in xrange (7, -1, -1):
        slice_chunks.append (sliceSelect (gb.RAM_w, slice_seqs[i]))

    n = gb.stencil_size - 1
    stencil_n_nxt = ila.ite (gb.RAM_y < gb.RAM_size,
                             gb.stencil[n],
                             ila.concat (slice_chunks))
    gb.stencil_nxt[n] = ila.ite (decode, stencil_n_nxt, gb.stencil_nxt[n])
    