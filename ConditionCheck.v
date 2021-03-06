module ConditionCheck(input [3:0] condition,SR,
                      output reg condition_check_result);
  
  assign {n,z,c,v}=SR;
  
  always@(*)begin
    if(condition==4'd0)
      condition_check_result=z;
    else if(condition==4'd1)
      condition_check_result=!z;
    else if(condition==4'd2)
      condition_check_result=c;
    else if(condition==4'd3)
      condition_check_result=!c;
    else if(condition==4'd4)
      condition_check_result=n;
    else if(condition==4'd5)
      condition_check_result=!n;
    else if(condition==4'd6)
      condition_check_result=v;
    else if(condition==4'd7)
      condition_check_result=!v;
    else if(condition==4'd8)
      condition_check_result=c&!z;
    else if(condition==4'd9)
      condition_check_result=!c|z;
    else if(condition==4'd10)
      condition_check_result=(n==v);
    else if(condition==4'd11)
      condition_check_result=(n!=v);
    else if(condition==4'd12)
      condition_check_result=!z &(n==v);
    else if(condition==4'd13)
      condition_check_result=z&(n!=v);
    else if(condition==4'd14)
      condition_check_result=1'b1;
  end  
endmodule

