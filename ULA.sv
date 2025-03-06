module ULA(A, B, reset, mode, oper, O, overflow, zero);
input logic [5:0] A, B;
input logic reset, mode;
input logic [2:0] oper;

output logic [5:0] O;
output logic overflow, zero;


always @(*) begin
	if (reset) begin
		O <= 6'b000000;
		overflow <= 0;
		zero = 0;
	end
	else begin
		case({mode, oper})
			4'b0000:
				begin
					if (A + B >= 7'b1000000) 
						overflow <= 1;
					O <= A + B;
				end
			4'b0001: // subtracao
				begin
					{overflow, O} <= {1'b0, A} - {1'b0, B};
				end
			4'b0010:
				begin
					if (A + ~(B) >= 7'b1000000)
						overflow <= 1;
					O <= A + ~(B);
				end
			4'b0011: // subtracao com inversor
				begin
					{overflow, O} <= {1'b0, A} + {1'b0, ~B} + 1; // ~B equivale a B + 1
				end
			4'b0100:
				begin
					if (A + 1 >= 7'b1000000)
						overflow <= 1;
					O <= A + 1;
				end
			4'b0101:
				begin
				if (A == 6'b000000)
					overflow <= 1;
				O <= A - 1;
				end
			4'b0110:
				begin
					if (B + 1 >= 7'b1000000)
						overflow <= 1;
					O <= B + 1;
				end
			4'b0111:
				begin
				if (B == 6'b000000)
					overflow <= 1;
				O <= B - 1;
				end
			4'b1000:
				begin
				O <= A & B;
				end
			4'b1001:
				begin
				O <= ~(A);
				end
			4'b1010:
				begin
				O <= ~(B);
				end
			4'b1011:
				begin
				O <= A | B;
				end
			4'b1100:
				begin
				O <= A ^ B;
				end
			4'b1101:
				begin
				O <= ~(A ^ B);
				end
			4'b1110:
				begin
				O <= A;
				end
			4'b1111:
				begin
				O <= B;
				end
			
			default:
				begin
				O = 6'b000000;
				overflow = 0;
				zero = 0;
				end
		endcase
	end
	
	zero = (O == 6'b000000 ? 1 : 0);
	end	
endmodule

