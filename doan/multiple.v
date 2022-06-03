module multiple(
 input iClk,
 input iReset_n,
 input iChipSelect_n,
 input iWrite_n,
 input iRead_n,
 input [3:0] iAddress,
 input [31:0] iData,
 output reg [31:0] oData
 );
	reg [31:0]a , b, c, d;
	reg [3:0] control;
	wire [31:0] kt;
	wire [1:0] status;
	
	
	
	always@(posedge iClk, negedge iReset_n)
	begin
		if(~iReset_n)
			begin
			oData <= 32'd0;
			a <= 32'd0;
			b <= 32'd0;
			c <= 32'd0;
			d <= 32'd0;
			control<=4'd0;
			
			end
		else 		
			begin 
				if( ~iChipSelect_n & ~iWrite_n)
					begin
						case (iAddress)
						
						4'd0: a[31:0] <= iData[31:0];
						4'd1: b[31:0] <= iData[31:0];
						4'd2: c[31:0] <= iData[31:0];
						4'd3: d[31:0] <= iData[31:0];
						4'd4: control[3:0]<= iData[3:0];
						
						endcase 
					end
					if (~iChipSelect_n & ~iRead_n)
						 begin
							case (iAddress)
							 4'd0: oData <= a;
							 4'd1: oData <= b;
							 4'd2: oData <= c;
							 4'd3: oData <= d;
							 4'd4: oData[3:0] <= control[3:0];
							 4'd5: oData <= kt;
							 4'd6: oData[1:0] <= status[1:0];
							 
							endcase
						 end
			end
	end
	adder adder1(
	.clk(iClk),
	.control(control),
	.a(a),
	.b(b),
	.c(c),
	.d(d),
	.status(status),
	.ketqua(kt)
	);
	
	
	
	endmodule
	