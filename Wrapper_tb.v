module FullDesign_tb();
    reg clk, rst_n;
    reg MOSI, SS_n;
    wire MISO;

    FullDesign DUT(
        .clk(clk), .rst_n(rst_n),
        .MOSI(MOSI), .SS_n(SS_n),
        .MISO(MISO)
    );

    reg [9:0] temp;
    integer i;

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        SS_n = 1;
        temp = 0;
        #10;
        temp = 10'b0000_01010;
        rst_n = 1;
        #10;
        @(negedge clk) SS_n = 0;
        @(negedge clk) MOSI = 0;
        for(i = 10; i > 0; i = i - 1) begin
            @(negedge clk) MOSI = temp[i - 1];
        end
        @(negedge clk) SS_n = 1;
        @(negedge clk) SS_n = 0;
        @(negedge clk) begin
            MOSI = 0;
            temp = 10'b01000_01010;
        end
        for(i = 10; i > 0; i = i - 1) begin
            @(negedge clk) MOSI = temp[i - 1];
        end
        @(negedge clk) SS_n = 1;
        @(negedge clk) SS_n = 0;
        @(negedge clk) begin
            MOSI = 1;
            temp = 10'b10000_01010;
        end
        for(i = 10; i > 0; i = i - 1) begin
            @(negedge clk) MOSI = temp[i - 1];
        end
        @(negedge clk) SS_n = 1;
        @(negedge clk) SS_n = 1;
        @(negedge clk) SS_n = 0;
        @(negedge clk) begin
            MOSI = 1;
            temp = 10'b11000_01010;
        end
        for(i = 10; i > 0; i = i - 1) begin
            @(negedge clk) MOSI = temp[i - 1];
        end
        #25;
        @(negedge clk) SS_n = 1;
        #100;
        $stop;
    end

    initial begin
        $monitor("MOSI=%b, MISO=%b, SS_n=%b, clk=%b", MOSI, MISO, SS_n, clk);
    end
endmodule
