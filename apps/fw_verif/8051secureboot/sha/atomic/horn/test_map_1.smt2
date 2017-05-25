; mapping from ILA to HW_REG_WRITE_char for (sha_reg + 1)
(rule (let ((a!1 (and (HW_REG_WRITE_chr@_1
                  HW_REG_WRITE_chr@%_7_0
                  HW_REG_WRITE_chr@%_2_0
                  HW_REG_WRITE_chr@%_3_0
                  HW_REG_WRITE_chr@%_call_0
                  HW_REG_WRITE_chr@%_4_0
                  HW_REG_WRITE_chr@%_5_0
                  HW_REG_WRITE_chr@%_6_0
                  HW_REG_WRITE_chr@%data_0
                  HW_REG_WRITE_chr@%addr_0
                  @sha_regs_0)
                true
    ;; 
    ;(= XRAM HW_REG_WRITE_chr@%_6_0)
    ;(= addr_state 65025)
    ;(= addr_rdaddr 65028)
    ;(= addr_wraddr 65032)
    ;(= addr_len 65036)
    ;
    (= HW_REG_WRITE_chr@%addr_0 (+ @sha_regs_0 1))
    false
    ;(= HW_REG_WRITE_chr@%addr_0 65025) 
    ;(= cmd 2)
    ;(= cmdaddr 65025)
    ;(= cmddata HW_REG_WRITE_chr@%data_0)
    ;(= sha_state (select XRAM addr_state))
    ;(= sha_rdaddr (select HW_REG_WRITE_chr@%_call_0 addr_rdaddr))
    ;(= sha_wraddr (select HW_REG_WRITE_chr@%_call_0 addr_wraddr))
    ;(= sha_len (select HW_REG_WRITE_chr@%_call_0 addr_len))
    ;
    ;(rel.decode_fe00 cmd cmdaddr b59)
    ;b59
    ;(rel.instr_fe01_sha_state_nxt cmd cmdaddr sha_state sha_state_nxt)
    ;(rel.instr_fe00_sha_len_nxt sha_len sha_len_nxt)
    ;(rel.instr_fe00_sha_rdaddr_nxt sha_rdaddr sha_rdaddr_nxt)
    ;(rel.instr_fe00_sha_wraddr_nxt sha_wraddr sha_wraddr_nxt)
    ;(rel.instr_fe00_XRAM_nxt XRAM cmd cmdaddr cmddata sha_hs_data sha_state sha_wraddr XRAM_nxt)
    ;
    ;(= XRAM XRAM_nxt)
    ;(= XRAM_state (store XRAM_nxt addr_state sha_state_nxt))
    ;(= XRAM_len (store XRAM_state addr_len sha_len_nxt))
    ;(= XRAM_rdaddr (store XRAM_len addr_rdaddr sha_rdaddr_nxt))
    ;(= XRAM_wraddr (store XRAM_rdaddr addr_wraddr sha_wraddr_nxt))
    ;(= XRAM_state HW_REG_WRITE_chr@%_store8_0))))
    ;; store
  (=> a!1
      (HW_REG_WRITE_chr@.split
        HW_REG_WRITE_chr@%_7_0
        HW_REG_WRITE_chr@%_2_0
        HW_REG_WRITE_chr@%_3_0
        HW_REG_WRITE_chr@%_call_0
        HW_REG_WRITE_chr@%_4_0
        HW_REG_WRITE_chr@%_5_0
        HW_REG_WRITE_chr@%_6_0
        HW_REG_WRITE_chr@%_store8_0
        HW_REG_WRITE_chr@%data_0
        HW_REG_WRITE_chr@%addr_0
        @sha_regs_0))))

