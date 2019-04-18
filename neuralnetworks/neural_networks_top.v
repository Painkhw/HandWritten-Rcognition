
module neural_networks_top
#
(
    parameter   WEIGHTS_DAPTH     =       784,
    parameter   WEIGHTS_COLUMN    =       10,
    parameter   WEIGHTS_ROW       =       10,
    parameter   WEIGHTS_WIDTH     =       16,
    parameter   WEIGHTS_BITS      =       80,
    parameter   WEIGHTS_ADDR      =       10,             
    parameter   GRAY_WIDTH        =       8,
    parameter   NEURAL_RESULT     =       10,
    parameter   CLASSF_WIDTH      =       32,
    parameter   CLASSF_RESULT     =       4
)
(
    input                                 pclk,
    input                                 rst,
    input                                 de,
    input       [GRAY_WIDTH-1:0]          pixel_in,
    output      [CLASSF_RESULT-1:0]       classfication_result                                
);

    wire                                  classfication_en;  
	wire        [WEIGHTS_ADDR-1:0]        pixel_index;
    wire        [GRAY_WIDTH-1:0]      	  pixel_data;
    //wire        [WEIGHTS_BITS-1:0]        weights           [WEIGHTS_ROW-1:0];
    //wire        [WEIGHTS_WIDTH-1:0]       mult_accum_output [NEURAL_RESULT-1:0];
    wire        [CLASSF_WIDTH-1:0]        opration_data_0; 
    wire        [CLASSF_WIDTH-1:0]        opration_data_1; 
    wire        [CLASSF_WIDTH-1:0]        opration_data_2; 
    wire        [CLASSF_WIDTH-1:0]        opration_data_3; 
    wire        [CLASSF_WIDTH-1:0]        opration_data_4; 
    wire        [CLASSF_WIDTH-1:0]        opration_data_5; 
    wire        [CLASSF_WIDTH-1:0]        opration_data_6; 
    wire        [CLASSF_WIDTH-1:0]        opration_data_7; 
    wire        [CLASSF_WIDTH-1:0]        opration_data_8; 
    wire        [CLASSF_WIDTH-1:0]        opration_data_9; 
    //wire        [CLASSF_RESULT-1:0]       classfication_result;

image_interface image_interface_inst
(
    .pclk                        (pclk                  ),
    .rst                         (rst                   ),   
    .de                          (de                    ),
    .pixel_in                    (pixel_in              ),
    .pixel_out                   (pixel_data            ),
    .pixel_index_out             (pixel_index           ),
    .classification_en           (classfication_en      )
);

weights_operation weights_operation_inst
(
    .pclk                        (pclk                  ),
    .rst                         (rst                   ), 
    .pixel_in                    (pixel_data            ),
    .pixel_index                 (pixel_index           ),         
    .operation_out_0             (opration_data_0       ),
    .operation_out_1             (opration_data_1       ),
    .operation_out_2             (opration_data_2       ),
    .operation_out_3             (opration_data_3       ),
    .operation_out_4             (opration_data_4       ),
    .operation_out_5             (opration_data_5       ),
    .operation_out_6             (opration_data_6       ),
    .operation_out_7             (opration_data_7       ),
    .operation_out_8             (opration_data_8       ),
    .operation_out_9             (opration_data_9       )     
);

classfication classfication_inst
(
    .rst                          (rst                  ),
    .clk                          (pclk                 ),
    .classfication_en             (classfication_en     ),                     
    .data_in_0                    (opration_data_0      ),
    .data_in_1                    (opration_data_1      ),
    .data_in_2                    (opration_data_2      ),
    .data_in_3                    (opration_data_3      ),
    .data_in_4                    (opration_data_4      ),
    .data_in_5                    (opration_data_5      ),
    .data_in_6                    (opration_data_6      ),
    .data_in_7                    (opration_data_7      ),
    .data_in_8                    (opration_data_8      ),                   
    .data_in_9                    (opration_data_9      ), 
    .classfication_out            (classfication_result ) 
);


endmodule