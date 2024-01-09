module PulseEveryThirdClock(
	input logic clk, rst,
	output logic out);

logic [1:0] count;

always_ff @ (posedge clk, posedge rst) begin
	if (rst == 1'b1) begin
		count <= 2'b00;
		out <= 1'b0;
	end
	else if(count == 2'b00) begin
		count <= 2'b01;
		out <= 1'b0;
	end
	else if(count == 2'b01) begin
		count <= 2'b10;
		out <= 1'b0;
	end
	else if(count == 2'b10) begin
		out <= 1'b1;
		count <= 2'b00;
	end
end

always_ff @ (negedge clk) begin
	if(out == 1'b1 && count == 2'b00) begin
		out <= 1'b0;
	end
end 

always_comb begin
	$monitor("count is %d at time %t", count, $time);
end


endmodule

