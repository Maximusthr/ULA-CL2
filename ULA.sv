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
		zero <= 0;
	end
	else begin
		case({mode, oper})
			4'b0000:
				{overflow, O} <= {1'b0, A} + {1'b0, B};

			4'b0001:
				{overflow, O} <= {1'b0, A} - {1'b0, B};

			4'b0010:
				{overflow, O} <= {1'b0, A} + {1'b0, ~B};

			4'b0011: 
				{overflow, O} <= {1'b0, A} - {1'b0, ~B};
			
        	4'b0100:
				{overflow, O} <= {1'b0, A} + 1;
				
			4'b0101:
				{overflow, O} <= {1'b0, A} - 1;
				
			4'b0110:
				{overflow, O} <= {1'b0, B} + 1;

			4'b0111:
				{overflow, O} <= {1'b0, B} -1;

			4'b1000:
				O <= A & B;

			4'b1001:
				O <= ~(A);

			4'b1010:
				O <= ~(B);

			4'b1011:
				O <= A | B;

			4'b1100:
				O <= A ^ B;

			4'b1101:
				O <= ~(A & B);

			4'b1110:
				O <= A;

			4'b1111:
				O <= B;

			default:
				begin
					O <= 6'b000000;
					overflow <= 0;
					zero <= 0;
				end
		endcase
	end

	if (mode == 1) overflow <= 0;
	zero <= (O == 6'b000000 ? 1 : 0);
	end	
endmodule

