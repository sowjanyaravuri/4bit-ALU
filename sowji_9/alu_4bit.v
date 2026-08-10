`timescale 1ns/1ps

module alu_4bit (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [2:0] ALU_Sel,

    output reg [3:0] Result,
    output reg Carry,
    output reg Zero
);

    reg [4:0] Temp;

    always @(*) begin

        // Default values
        Result = 4'b0000;
        Carry  = 1'b0;

        case (ALU_Sel)

            // Addition
            3'b000: begin
                Temp = A + B;
                Result = Temp[3:0];
                Carry = Temp[4];
            end

            // Subtraction
            3'b001: begin
                Result = A - B;
                Carry = (A >= B);
            end

            // AND
            3'b010: begin
                Result = A & B;
            end

            // OR
            3'b011: begin
                Result = A | B;
            end

            // XOR
            3'b100: begin
                Result = A ^ B;
            end

            // NOT A
            3'b101: begin
                Result = ~A;
            end

            // Shift Left
            3'b110: begin
                Result = A << 1;
                Carry = A[3];
            end

            // Shift Right
            3'b111: begin
                Result = A >> 1;
                Carry = A[0];
            end

            default: begin
                Result = 4'b0000;
                Carry = 1'b0;
            end

        endcase

        // Zero flag
        if (Result == 4'b0000)
            Zero = 1'b1;
        else
            Zero = 1'b0;

    end

endmodule