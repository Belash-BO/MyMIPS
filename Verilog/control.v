module control(i_instrCode, 
               o_regDst,
               o_jump, 
               o_branch,
               o_memToReg,
               o_aluOp,
               o_memWrite,
               o_aluSrc,
               o_regWrite
               );
  
input     [15:0]  i_instrCode;
output            o_regDst;
output            o_jump; 
output            o_branch;
output            o_memToReg;
output    [1:0]   o_aluOp;
output            o_memWrite;
output            o_aluSrc;
output            o_regWrite;

  
endmodule