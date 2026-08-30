module PC (
    input logic clk, rst, pc_write,
    input logic [31:0] next_pc,
    output logic [31:0] pc
);

    always_ff @ (posedge clk or posedge rst) begin
        if (rst) begin
            pc <= 32'h0000_0000;
        end else if (pc_write) begin
            pc <= next_pc;
        end 
    end

endmodule 