module ConditionCheck(input [3:0] cond,SR,output reg res);
  
  assign {n,z,c,v}=SR;
  
  always@(*)begin
    if(cond==4'd0)        res=z;
    else if(cond==4'd1)   res=!z;
    else if(cond==4'd2)   res=c;
    else if(cond==4'd3)   res=!c;
    else if(cond==4'd4)   res=n;
    else if(cond==4'd5)   res=!n;
    else if(cond==4'd6)   res=v;
    else if(cond==4'd7)   res=!v;
    else if(cond==4'd8)   res=c&!z;
    else if(cond==4'd9)   res=!c|z;
    else if(cond==4'd10)  res=(n==v);
    else if(cond==4'd11)  res=(n!=v);
    else if(cond==4'd12)  res=!z &(n==v);
    else if(cond==4'd13)  res=z&(n!=v);
    else if(cond==4'd14)  res=1'b1;
  end  
endmodule
