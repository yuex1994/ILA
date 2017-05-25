; mapping between ILA to the MMIO functions
;; variables
(declare-var acc_state_nxt Int)
(declare-var acc_state_nxt_1 Int)
(declare-var bytes_read_nxt Int)
(declare-var bytes_read_nxt_1 Int)
(declare-var XRAM_nxt (Array Int Int))
;; relations
(declare-rel mmio_acc (Int Int Int Int Int Int Int Int))
(declare-rel loop_acc (Int Int Int Int Int))
;;;;;;;;;;;;;;;;;;;; clauses for interleaving loop ;;;;;;;;;;;;;;;;;;;;;;;
(rule (loop_acc acc_len acc_state bytes_read acc_state bytes_read))
;
(rule (=> (and b64
            (loop_acc acc_len acc_state bytes_read acc_state_nxt bytes_read_nxt)
            (rel.decode_st1 acc_state_nxt b64)
            (rel.child_1_acc_state_nxt acc_state_nxt acc_state_nxt_1)
            (rel.child_1_bytes_read_nxt acc_state_nxt bytes_read_nxt bytes_read_nxt_1))
          (loop_acc acc_len acc_state bytes_read acc_state_nxt_1 bytes_read_nxt_1)))
;
(rule (=> (and b78
            (loop_acc acc_len acc_state bytes_read acc_state_nxt bytes_read_nxt)
            (rel.decode_st2 acc_state_nxt b78)
            (rel.child_2_acc_state_nxt acc_state_nxt acc_state_nxt_1)
            (rel.child_2_bytes_read_nxt bytes_read_nxt bytes_read_nxt_1))
          (loop_acc acc_len acc_state bytes_read acc_state_nxt_1 bytes_read_nxt_1)))
;
(rule (=> (and b87
            (loop_acc acc_len acc_state bytes_read acc_state_nxt bytes_read_nxt)
            (rel.decode_st3 acc_state_nxt b87)
            (rel.child_3_acc_state_nxt acc_len acc_state_nxt bytes_read_nxt acc_state_nxt_1)
            (rel.child_3_bytes_read_nxt bytes_read_nxt bytes_read_nxt_1))
          (loop_acc acc_len acc_state bytes_read acc_state_nxt_1 bytes_read_nxt_1)))
;
(rule (=> (and b100
            (loop_acc acc_len acc_state bytes_read acc_state_nxt bytes_read_nxt)
            (rel.decode_st4 acc_state_nxt b100)
            (rel.child_4_acc_state_nxt acc_state_nxt acc_state_nxt_1)
            (rel.child_4_bytes_read_nxt bytes_read_nxt bytes_read_nxt_1))
          (loop_acc acc_len acc_state bytes_read acc_state_nxt_1 bytes_read_nxt_1)))
;;;;;;;;;;;;;;;;;;;;;;;;; clauses for instructions ;;;;;;;;;;;;;;;;;;;;;;;;;
(rule (=> (and b0
            (rel.decode_fe00 cmd cmdaddr b0)
            (rel.instr_fe00_acc_state_nxt acc_state cmd cmdaddr cmddata acc_state_nxt)
            (rel.instr_fe00_bytes_read_nxt acc_state bytes_read cmd cmdaddr cmddata bytes_read_nxt)
            (loop_acc acc_len acc_state_nxt bytes_read_nxt acc_state_nxt_1 bytes_read_nxt_1))
          (mmio_acc acc_len acc_state bytes_read cmd cmdaddr cmddata acc_state_nxt_1 bytes_read_nxt_1)))
;
(rule (=> (and b40
            (rel.decode_fe01 cmd cmdaddr b40)
            (rel.instr_fe01_acc_state_nxt acc_state acc_state_nxt)
            (rel.instr_fe01_bytes_read_nxt bytes_read bytes_read_nxt)
            (loop_acc acc_len acc_state_nxt bytes_read_nxt acc_state_nxt_1 bytes_read_nxt_1))
          (mmio_acc acc_len acc_state bytes_read cmd cmdaddr cmddata acc_state_nxt_1 bytes_read_nxt_1)))
;
(rule (=> (and b48
            (rel.decode_fe02 cmd cmdaddr b48)
            (rel.instr_fe02_acc_state_nxt acc_state acc_state_nxt)
            (rel.instr_fe02_bytes_read_nxt bytes_read bytes_read_nxt)
            (loop_acc acc_len acc_state_nxt bytes_read_nxt acc_state_nxt_1 bytes_read_nxt_1))
          (mmio_acc acc_len acc_state bytes_read cmd cmdaddr cmddata acc_state_nxt_1 bytes_read_nxt_1)))
;
(rule (=> (and b56
            (rel.decode_fe03 cmd cmdaddr b56)
            (rel.instr_fe03_acc_state_nxt acc_state acc_state_nxt)
            (rel.instr_fe03_bytes_read_nxt bytes_read bytes_read_nxt)
            (loop_acc acc_len acc_state_nxt bytes_read_nxt acc_state_nxt_1 bytes_read_nxt_1))
          (mmio_acc acc_len acc_state bytes_read cmd cmdaddr cmddata acc_state_nxt_1 bytes_read_nxt_1)))

;;;;;;;;;;;;;;;;;;;;;;;;; clauses for mapping to mmio function ;;;;;;;;;;;;;
(declare-var addr_start Int)
(declare-var addr_state Int)
(declare-var addr_len Int)
(declare-var addr_bytes Int)
(declare-var l1 Bool)
(declare-var l2 Bool)
(declare-var l3 Bool)
(rule (=> (and (HW_REG_WRITE@_1 HW_REG_WRITE@%_call_0
                          HW_REG_WRITE@%addr_0
                          HW_REG_WRITE@%data_0
                          @acc_ptr_0)
         true
         ;; 
         ;(= addr_start (+ @acc_ptr_0 0))
         ;(= addr_state (+ @acc_ptr_0 1))
         ;(= addr_len (+ @acc_ptr_0 12))
         ;(= addr_bytes (+ @acc_ptr_0 16))
         (= addr_start 65024)
         (= addr_state 65025)
         (= addr_len 65036)
         (= addr_bytes 65040)
         ;
         (= HW_REG_WRITE@%addr_0 @acc_ptr_0)
         (= cmd 2)
         (= cmdaddr 65024)
         (= cmddata HW_REG_WRITE@%data_0)
         (= acc_state (select HW_REG_WRITE@%_call_0 addr_state))
         (= acc_len (select HW_REG_WRITE@%_call_0 addr_len))
         (= bytes_read (select HW_REG_WRITE@%_call_0 addr_bytes))
         ;
         (mmio_acc acc_len acc_state bytes_read cmd cmdaddr cmddata acc_state_nxt bytes_read_nxt)
         ;
         (= XRAM_nxt (store HW_REG_WRITE@%_call_0 addr_state acc_state_nxt))
         (= HW_REG_WRITE@%_store_0 (store XRAM_nxt addr_bytes bytes_read_nxt)))
         ;;
    (HW_REG_WRITE@.split
      HW_REG_WRITE@%_call_0
      HW_REG_WRITE@%_store_0
      HW_REG_WRITE@%addr_0
      HW_REG_WRITE@%data_0
      @acc_ptr_0)))
(rule (=> (and (HW_REG_WRITE@_1 HW_REG_WRITE@%_call_0
                          HW_REG_WRITE@%addr_0
                          HW_REG_WRITE@%data_0
                          @acc_ptr_0)
         true
         ;(= addr_start (+ @acc_ptr_0 0))
         ;(= addr_state (+ @acc_ptr_0 1))
         ;(= addr_len (+ @acc_ptr_0 12))
         ;(= addr_bytes (+ @acc_ptr_0 16))
         (= addr_start 65024)
         (= addr_state 65025)
         (= addr_len 65036)
         (= addr_bytes 65040)
         ;
         (= HW_REG_WRITE@%addr_0 (+ @acc_ptr_0 1))
         (= cmd 2)
         (= cmdaddr 65025)
         (= cmddata HW_REG_WRITE@%data_0)
         (= acc_state (select HW_REG_WRITE@%_call_0 addr_state))
         (= acc_len (select HW_REG_WRITE@%_call_0 addr_len))
         (= bytes_read (select HW_REG_WRITE@%_call_0 addr_bytes))
         ;
         (mmio_acc acc_len acc_state bytes_read cmd cmdaddr cmddata acc_state_nxt bytes_read_nxt)
         ;
         (= XRAM_nxt (store HW_REG_WRITE@%_call_0 addr_state acc_state_nxt))
         (= HW_REG_WRITE@%_store_0 (store XRAM_nxt addr_bytes bytes_read_nxt)))
         ;;
    (HW_REG_WRITE@.split
      HW_REG_WRITE@%_call_0
      HW_REG_WRITE@%_store_0
      HW_REG_WRITE@%addr_0
      HW_REG_WRITE@%data_0
      @acc_ptr_0)))
