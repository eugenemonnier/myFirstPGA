module my_first_pga (
  input CLOCK_50,
  input KEY,
  output [7:0] LEDR,
  output o_Segment_A,
  output o_Segment_B,
  output o_Segment_C,
  output o_Segment_D,
  output o_Segment_E,
  output o_Segment_F,
  output o_Segment_G,
  output oo_Segment_A,
  output oo_Segment_B,
  output oo_Segment_C,
  output oo_Segment_D,
  output oo_Segment_E,
  output oo_Segment_F,
  output oo_Segment_G
);

reg [31:0] count;
reg [6:0] r_Hex_Encoding = 7'h00; // register for 1st hex display
reg [6:0] rr_Hex_Encoding = 7'h00; // register for 2nd hex display
wire reset_n;

assign reset_n = KEY;

always @(posedge CLOCK_50 or negedge reset_n) begin
  if(!reset_n) begin
    count = 0;
    r_Hex_Encoding = 7'h00;
  end
  else
    count = count + 1;

  // first 7-segment display
  case (count [27:24])
    4'b0000 : r_Hex_Encoding <= 7'h7E;
    4'b0001 : r_Hex_Encoding <= 7'h30;
    4'b0010 : r_Hex_Encoding <= 7'h6D;
    4'b0011 : r_Hex_Encoding <= 7'h79;
    4'b0100 : r_Hex_Encoding <= 7'h33;          
    4'b0101 : r_Hex_Encoding <= 7'h5B;
    4'b0110 : r_Hex_Encoding <= 7'h5F;
    4'b0111 : r_Hex_Encoding <= 7'h70;
    4'b1000 : r_Hex_Encoding <= 7'h7F;
    4'b1001 : r_Hex_Encoding <= 7'h7B;
    4'b1010 : r_Hex_Encoding <= 7'h77;
    4'b1011 : r_Hex_Encoding <= 7'h1F;
    4'b1100 : r_Hex_Encoding <= 7'h4E;
    4'b1101 : r_Hex_Encoding <= 7'h3D;
    4'b1110 : r_Hex_Encoding <= 7'h4F;
    4'b1111 : r_Hex_Encoding <= 7'h47;
  endcase
  //  second 7-segment display
  case (count [31:28])
    4'b0000 : rr_Hex_Encoding <= 7'h7E;
    4'b0001 : rr_Hex_Encoding <= 7'h30;
    4'b0010 : rr_Hex_Encoding <= 7'h6D;
    4'b0011 : rr_Hex_Encoding <= 7'h79;
    4'b0100 : rr_Hex_Encoding <= 7'h33;          
    4'b0101 : rr_Hex_Encoding <= 7'h5B;
    4'b0110 : rr_Hex_Encoding <= 7'h5F;
    4'b0111 : rr_Hex_Encoding <= 7'h70;
    4'b1000 : rr_Hex_Encoding <= 7'h7F;
    4'b1001 : rr_Hex_Encoding <= 7'h7B;
    4'b1010 : rr_Hex_Encoding <= 7'h77;
    4'b1011 : rr_Hex_Encoding <= 7'h1F;
    4'b1100 : rr_Hex_Encoding <= 7'h4E;
    4'b1101 : rr_Hex_Encoding <= 7'h3D;
    4'b1110 : rr_Hex_Encoding <= 7'h4F;
    4'b1111 : rr_Hex_Encoding <= 7'h47;
  endcase
  
end
// binary LED   
assign LEDR [7:0] = count [31:24];

// first hex display
assign o_Segment_A = !r_Hex_Encoding[6];
assign o_Segment_B = !r_Hex_Encoding[5];
assign o_Segment_C = !r_Hex_Encoding[4];
assign o_Segment_D = !r_Hex_Encoding[3];
assign o_Segment_E = !r_Hex_Encoding[2];
assign o_Segment_F = !r_Hex_Encoding[1];
assign o_Segment_G = !r_Hex_Encoding[0];

// second hex display
assign oo_Segment_A = !rr_Hex_Encoding[6];
assign oo_Segment_B = !rr_Hex_Encoding[5];
assign oo_Segment_C = !rr_Hex_Encoding[4];
assign oo_Segment_D = !rr_Hex_Encoding[3];
assign oo_Segment_E = !rr_Hex_Encoding[2];
assign oo_Segment_F = !rr_Hex_Encoding[1];
assign oo_Segment_G = !rr_Hex_Encoding[0];

endmodule