module LFSR
(
	input clk, load_data, // key_2: put an inverter in the middle of load_data and key_2
	output q15
);

reg d0;
reg [15:0] q, data;

(* noprune *) reg [15:0] counter;

assign data = 16'HFFFF;

always @ (posedge clk)
	if (load_data == 1'b0) // if pressing (active low)
		q = data;
	else
		q = { q[14:0], d0 };

always @ (posedge clk)
	q15 = q[15];

always @ *
	d0 = (((q[4] ^ q[15]) ^ q[2]) ^ q[1]); // q4 is the maximal length sequence: longest sequence gives more combinations

always @ (posedge clk)
	if (q == 16'HFFFF)
		counter = 16'H0001;
	else
		counter = counter + 1;

endmodule
