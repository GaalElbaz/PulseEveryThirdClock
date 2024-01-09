module clockTB();

logic clk, rst,out;

PulseEveryThirdClock clockTB (.clk(clk), .rst(rst), .out(out));

always begin
	#10 clk = ~clk;
end

initial begin
	clk = 0;
	rst = 1;
	#5 rst = 0;
	#300
	$finish;
end
endmodule


