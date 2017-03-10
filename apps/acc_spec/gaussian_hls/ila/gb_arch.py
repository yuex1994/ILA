# ILA for Halide Gaussian blur accelerator, with both the read and write 
# instructions have child-instructions for data movement.
# Architecture states

import ila

DATA_SIZE       = 8
X_EXTEND        = 9
Y_EXTEND        = 9
IMG_X_SIZE      = 488
IMG_Y_SIZE      = 488
COL_ADDR_SIZE   = 9
ROW_ADDR_SIZE   = 10
WR_ADDR_SIZE    = 64

class GBArch ():
    def __init__ (self):
        self.abst = ila.Abstraction ('GB')
        m = self.abst

        BV_TRUE     = m.const (0x1, 1)
        BV_FALSE    = m.const (0x0, 1)
        self.READY_TRUE  = READY_TRUE  = BV_TRUE
        self.READY_FALSE = READY_FALSE = BV_FALSE
        self.VALID_TRUE  = VALID_TRUE  = BV_TRUE
        self.VALID_FALSE = VALID_FALSE = BV_FALSE
        self.FULL_TRUE   = FULL_TRUE   = BV_TRUE
        self.FULL_FALSE  = FULL_FALSE  = BV_FALSE
        self.EMPTY_TRUE  = EMPTY_TRUE  = BV_TRUE
        self.EMPTY_FALSE = EMPTY_FALSE = BV_FALSE

        ######################## input ports ###################################
        self.arg_0_TREADY = m.inp ('arg_0_TREADY', 1)
        self.arg_1_TVALID = m.inp ('arg_1_TVALID', 1)
        self.arg_1_TDATA  = m.inp ('arg_1_TDATA', DATA_SIZE)
        
        ######################## output ports ##################################
        self.arg_1_TREADY = m.reg ('arg_1_TREADY', 1)
        self.arg_0_TVALID = m.reg ('arg_0_TVALID', 1)
        self.arg_0_TDATA  = m.reg ('arg_0_TDATA', DATA_SIZE)

        ######################## states  #######################################
        # 1-D buffer for input data
        self.LB1D_buff = m.reg ('LB1D_buff', DATA_SIZE)

        # stream buffer for input data
        self.in_stream_full  = m.reg ('in_stream_full', 1)
        self.in_stream_empty = m.reg ('in_stream_empty', 1)
        self.in_stream_buff  = []
        self.in_stream_size  = 2
        for i in xrange (0, self.in_stream_size):
            buffName = 'in_stream_buff_%d' % i
            self.in_stream_buff.append (m.reg (buffName, DATA_SIZE))

        # 8 488x1 bytes buffer in the 2-D buffer proc
        self.LB2D_proc = []
        self.LB2D_proc_size = Y_EXTEND - 1
        for i in xrange (0, self.LB2D_proc_size):
            buffName = 'LB2D_proc_%d' % i
            self.LB2D_proc.append (m.mem (buffName, COL_ADDR_SIZE, DATA_SIZE))

        # x index (column) in the 2-D buffer proc
        self.LB2D_proc_x   = m.reg ('LB2D_proc_x', COL_ADDR_SIZE)
        self.LB2D_proc_x_0 = m.const (0x0, COL_ADDR_SIZE)
        self.LB2D_proc_x_1 = m.const (0x1, COL_ADDR_SIZE)
        self.LB2D_proc_x_M = m.const (IMG_X_SIZE-1, COL_ADDR_SIZE)

        # y index (row) in the 2-D buffer proc
        self.LB2D_proc_y   = m.reg ('LB2D_proc_y', ROW_ADDR_SIZE)
        self.LB2D_proc_y_0 = m.const (0x0, ROW_ADDR_SIZE)
        self.LB2D_proc_y_1 = m.const (0x1, ROW_ADDR_SIZE)
        self.LB2D_proc_y_M = m.const (IMG_Y_SIZE-1, ROW_ADDR_SIZE)

        # w index (write) in the 2-D buffer proc
        self.LB2D_proc_w = m.reg ('LB2D_proc_w', WR_ADDR_SIZE)
        self.LB2D_proc_w_0 = m.const (0x0, WR_ADDR_SIZE)
        self.LB2D_proc_w_1 = m.const (0x1, WR_ADDR_SIZE)
        self.LB2D_proc_w_M = m.const (self.LB2D_proc_size-1, WR_ADDR_SIZE)

        # stream buffer for slice
        self.slice_stream_full  = m.reg ('slice_stream_full', 1)
        self.slice_stream_empty = m.reg ('slice_stream_empty', 1)
        self.slice_stream_buff  = []
        self.slice_stream_size  = 2
        self.slice_size = Y_EXTEND * DATA_SIZE
        for i in xrange (0, self.slice_stream_size):
            buffName = 'slice_stream_buff_%d' % i
            self.slice_stream_buff.append (m.reg (buffName, self.slice_size))

        # 8 9x1 bytes buffer in the 2-D buffer shifter
        self.LB2D_shift = []
        self.LB2D_shift_size = X_EXTEND - 1
        for i in xrange (0, self.LB2D_shift_size):
            buffName = 'LB2D_shift_%d' % i
            self.LB2D_shift.append (m.reg (buffName, self.slice_size))

        # x index (column) in the 2-D buffer shifter
        self.LB2D_shift_x   = m.reg ('LB2D_shift_x', COL_ADDR_SIZE)
        self.LB2D_shift_x_0 = m.const (0x0, COL_ADDR_SIZE)
        self.LB2D_shift_x_1 = m.const (0x1, COL_ADDR_SIZE)
        self.LB2D_shift_x_M = m.const (IMG_X_SIZE-1, COL_ADDR_SIZE)

        # y index (row) in the 2-D buffer shifter
        self.LB2D_shift_y   = m.reg ('LB2D_shift_y', ROW_ADDR_SIZE)
        self.LB2D_shift_y_0 = m.const (0x0, ROW_ADDR_SIZE)
        self.LB2D_shift_y_1 = m.const (0x1, ROW_ADDR_SIZE)
        self.LB2D_shift_y_M = m.const (IMG_Y_SIZE-1, ROW_ADDR_SIZE)

        # stream buffer for stencil
        self.stencil_stream_full  = m.reg ('stencil_stream_full', 1)
        self.stencil_stream_empty = m.reg ('stencil_stream_empty', 1)
        self.stencil_stream_buff  = []
        self.stencil_stream_size  = 2
        self.stencil_size = X_EXTEND * Y_EXTEND * DATA_SIZE
        for i in xrange (0, self.stencil_stream_size):
            buffName = 'stencil_stream_buff_%d' % i
            self.stencil_stream_buff.append (m.reg (buffName, self.stencil_size))
        

        ######################## next states functions #########################
        self.arg_1_TREADY_nxt = self.arg_1_TREADY
        self.arg_0_TVALID_nxt = self.arg_0_TVALID
        self.arg_0_TDATA_nxt  = self.arg_0_TDATA

        self.LB1D_buff_nxt = self.LB1D_buff

        self.in_stream_full_nxt  = self.in_stream_full
        self.in_stream_empty_nxt = self.in_stream_empty
        self.in_stream_buff_nxt = []
        for i in xrange (0, self.in_stream_size):
            self.in_stream_buff_nxt.append (self.in_stream_buff[i])

        self.LB2D_proc_x_nxt = self.LB2D_proc_x
        self.LB2D_proc_y_nxt = self.LB2D_proc_y
        self.LB2D_proc_w_nxt = self.LB2D_proc_w
        self.LB2D_proc_nxt = []
        for i in xrange (0, self.LB2D_proc_size):
            self.LB2D_proc_nxt.append (self.LB2D_proc[i])

        self.slice_stream_full_nxt  = self.slice_stream_full
        self.slice_stream_empty_nxt = self.slice_stream_empty
        self.slice_stream_buff_nxt = []
        for i in xrange (0, self.slice_stream_size):
            self.slice_stream_buff_nxt.append (self.slice_stream_buff[i])

        self.LB2D_shift_x_nxt = self.LB2D_shift_x
        self.LB2D_shift_y_nxt = self.LB2D_shift_y
        self.LB2D_shift_nxt = []
        for i in xrange (0, self.LB2D_shift_size):
            self.LB2D_shift_nxt.append (self.LB2D_shift[i])

        self.stencil_stream_full_nxt  = self.stencil_stream_full
        self.stencil_stream_empty_nxt = self.stencil_stream_empty
        self.stencil_stream_buff_nxt = []
        for i in xrange (0, self.stencil_stream_size):
            self.stencil_stream_buff_nxt.append (self.stencil_stream_buff[i])


if __name__ == '__main__':
    gb = GBArch ()
    print 'create GB arch states'