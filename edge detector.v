module edge_detector(
  input clk,rst,sgnl,
  output reg pos_edge,
  output reg neg_edge
);
  reg prev_sgnl;
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      pos_edge<=0;neg_edge<=0;prev_sgnl<=0;
    end
    else begin
      pos_edge<=(prev_sgnl==0)&&(sgnl==1);
      neg_edge<=(sgnl==0)&&(prev_sgnl==1);
      prev_sgnl<=sgnl;
    end
  end
endmodule
