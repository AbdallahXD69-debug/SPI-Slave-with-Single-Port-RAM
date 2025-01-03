module RAM #(
    parameter MEM_DEPTH = 256,
    parameter ADDR_SIZE = 8
)(
    input clk, rst_n,
    input [ADDR_SIZE+1:0] din,
    input rx_valid,

    output reg [ADDR_SIZE-1:0]dout,
    output reg tx_valid
);
    reg [ADDR_SIZE-1:0]w_addr, r_addr;
    reg [ADDR_SIZE-1:0] ram [MEM_DEPTH-1:0];

always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            dout <= 0;
            tx_valid <= 0;

    end

    else begin
        if (rx_valid) begin
            case (din[9:8])
                2'b00:begin
                    w_addr <= din[7:0];
                    tx_valid <=0;
                end
                2'b01:begin
                    ram[w_addr] <= din[7:0];
                    tx_valid <= 0;
                end    
                2'b10: begin
                    r_addr <= din[7:0];
                    tx_valid = 0;
                end
                2'b11: begin
                    dout <= ram[r_addr];
                    tx_valid = 1;
                end
            endcase
        end
    end       
end
endmodule