module block_b(
	input rd_clk,
	input rd_rst,
	input [7:0] rd_data,
	input rd_empty,
	output reg rd_en
);

always@(posedge rd_clk or posedge rd_rst) begin
	if(rd_rst)
		rd_en <= 0;
	else begin
		rd_en <= !rd_empty;
	end
end
endmodule

