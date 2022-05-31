module adder(
	input clk,
	input [3:0] control,
	input [31:0]a,
	input [31:0]b,
	input [31:0]c,
	input [31:0]d,
	output reg [1:0] status,
	output reg [31:0] ketqua
);


always@(posedge clk, negedge control[2])
	begin
		if(~control[2])
			begin 
			ketqua<= 32'h0;
			status<= 2'h0;
			end
		else 
			begin
				if (control[3])
					begin
						if(control[1:0]==3'b00)
							begin
							//status <= 2'b10;
							ketqua <= a[3:0]*c[3:0]+b[3:0]*d[3:0];
							status <= 2'b11;
							end
						else if (control[2:0]==3'b01)
								begin
								//status <= 2'b10;
								ketqua <= a[7:0]*c[7:0]+b[7:0]*d[7:0];
								status <= 2'b11;
								end
								else if (control[2:0]==3'b11)
										begin
										status <= 2'b10;
										ketqua <= a[15:0]*c[15:0]+b[15:0]*d[15:0];
										status <= 2'b11;
										end
										
					
					end
				else
					begin
					status <= 2'b00;
					ketqua <= 32'h0;
					end
			end
		end
					
					
endmodule
