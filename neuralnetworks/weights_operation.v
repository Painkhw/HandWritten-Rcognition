/* 
    To completed  Weights Matrix multiplation 
    And creat the level of output in NN

*/

module  weights_operation
#
(
    parameter   	WEIGHTS_WIDTH     =         16,
    parameter       WEIGHTS_BITS      =         80,
    parameter       WEIGHTS_ADDR      =         10, 
    parameter       WEIGHTS_ROW       =         10,
    parameter       WEIGHTS_COLUMN    =         10,
    parameter       RESULT_WIDTH      =         32,
    parameter       GRAY_WIDTH        =         8
)
(
    input                                       pclk,
    input                                       rst,
    input           [GRAY_WIDTH-1:0]            pixel_in,
    input       	[WEIGHTS_ADDR-1:0]          pixel_index,
    output          [RESULT_WIDTH-1:0]          operation_out_0,
    output          [RESULT_WIDTH-1:0]          operation_out_1,
    output          [RESULT_WIDTH-1:0]          operation_out_2,
    output          [RESULT_WIDTH-1:0]          operation_out_3,
    output          [RESULT_WIDTH-1:0]          operation_out_4,
    output          [RESULT_WIDTH-1:0]          operation_out_5,
    output          [RESULT_WIDTH-1:0]          operation_out_6,
    output          [RESULT_WIDTH-1:0]          operation_out_7,
    output          [RESULT_WIDTH-1:0]          operation_out_8,
    output          [RESULT_WIDTH-1:0]          operation_out_9            
);

    wire            [WEIGHTS_BITS-1:0]          weights_row;     
    reg             [WEIGHTS_WIDTH-1:0]         weights_in      [WEIGHTS_COLUMN-1:0];
    reg             [WEIGHTS_WIDTH-1:0]         result          [WEIGHTS_COLUMN-1:0]; 
    reg             [WEIGHTS_WIDTH-1:0]         pixel_data;

initial begin
  
    weights_in[9]  =   {8'd0,weights_row[79:72]};
    weights_in[8]  =   {8'd0,weights_row[71:64]};
    weights_in[7]  =   {8'd0,weights_row[63:56]};
    weights_in[6]  =   {8'd0,weights_row[55:48]};
    weights_in[5]  =   {8'd0,weights_row[47:40]};
    weights_in[4]  =   {8'd0,weights_row[39:32]};
    weights_in[3]  =   {8'd0,weights_row[31:24]};
    weights_in[2]  =   {8'd0,weights_row[23:16]};
    weights_in[1]  =   {8'd0,weights_row[15: 8]};
    weights_in[0]  =   {8'd0,weights_row[ 7: 0]};
    
    pixel_data     =   {8'd0,pixel_in};

end



//  Output data by current weights of pixel multiplate pixel 

mult_accum  mult_accum_inst0(.clock0(pclk), .dataa(pixel_data), .datab(weights_in[0]), .result(operation_out_0)); 
mult_accum  mult_accum_inst1(.clock0(pclk), .dataa(pixel_data), .datab(weights_in[1]), .result(operation_out_1)); 
mult_accum  mult_accum_inst2(.clock0(pclk), .dataa(pixel_data), .datab(weights_in[2]), .result(operation_out_2)); 
mult_accum  mult_accum_inst3(.clock0(pclk), .dataa(pixel_data), .datab(weights_in[3]), .result(operation_out_3)); 
mult_accum  mult_accum_inst4(.clock0(pclk), .dataa(pixel_data), .datab(weights_in[4]), .result(operation_out_4)); 
mult_accum  mult_accum_inst5(.clock0(pclk), .dataa(pixel_data), .datab(weights_in[5]), .result(operation_out_5)); 
mult_accum  mult_accum_inst6(.clock0(pclk), .dataa(pixel_data), .datab(weights_in[6]), .result(operation_out_6)); 
mult_accum  mult_accum_inst7(.clock0(pclk), .dataa(pixel_data), .datab(weights_in[7]), .result(operation_out_7)); 
mult_accum  mult_accum_inst8(.clock0(pclk), .dataa(pixel_data), .datab(weights_in[8]), .result(operation_out_8)); 
mult_accum  mult_accum_inst9(.clock0(pclk), .dataa(pixel_data), .datab(weights_in[9]), .result(operation_out_9)); 


rom_weights_784_10	rom_weights_784_10_inst 
(
	.address            (pixel_index                   ),
	.clock              (pclk                          ),
	.q                  (weights_row                   )
);

endmodule
