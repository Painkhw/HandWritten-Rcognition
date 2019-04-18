`timescale 1 ns / 1 ps

module tb_weights_operation();

reg                             clk;
reg                             rst;
reg     [ 7:0]                  pixel_in;
reg     [ 9:0]                  pixel_index;

/*
wire    [31:0]                  result_0;
wire    [31:0]                  result_1;
wire    [31:0]                  result_2;
wire    [31:0]                  result_3;
wire    [31:0]                  result_4;
wire    [31:0]                  result_5;
wire    [31:0]                  result_6;
wire    [31:0]                  result_7;
wire    [31:0]                  result_8;
wire    [31:0]                  result_9;
*/

//reg     [31:0]                  weights_in;
//reg     [15:0]                  pixel_data;
wire    [79:0]                  weights_row;
//wire    [31:0]                  operation_out_0;


initial begin 
    
    //weights_in                  =   16'b0000_0000_0000_0110;
    //pixel_data                  =   16'b0000_0000_0000_0001;
    pixel_in                     =   8'd1;
    pixel_index                  =   10'd35;
    clk                          =   1'b0; 
    rst                          =   1'b1;
    
end

initial begin

    $display("pixel_in  is %d ", pixel_in);
    $display("pixel_index  is %d ", pixel_index);

end

always #10 clk = ~clk;
/*
mult_accum  mult_accum_inst0(   .clock0(clk), 
                                .dataa(pixel_data), 
                                .datab(weights_in), 
                                .result(operation_out_0)
                            ); 

    
rom_weights_784_10	rom_weights_784_10_inst 
(
	.address            (pixel_index                 ),
	.clock              (clk                         ),
	.q                  (weights_row                 )
);
*/

weights_operation weights_operation_inst
(
    .pclk                       (clk                ),
    .rst                        (rst                ),
    //.pixel_in                   (pixel_in           ),
    //.pixel_index                (pixel_index        ),
    .operation_out_0            (result_0           ),
    .operation_out_1            (result_1           ),
    .operation_out_2            (result_2           ),
    .operation_out_3            (result_3           ),
    .operation_out_4            (result_4           ),
    .operation_out_5            (result_5           ),
    .operation_out_6            (result_6           ),
    .operation_out_7            (result_7           ),
    .operation_out_8            (result_8           ),
    .operation_out_9            (result_9           )            
);


endmodule