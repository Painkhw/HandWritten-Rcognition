module classfication
#
(
    parameter      WEIGHTS_DAPTH     =     784,
    parameter      WEIGHTS_COLUMN    =     10,
    parameter      WEIGHTS_ROW       =     10,
    parameter      WEIGHTS_WIDTH     =     16,
    parameter      WEIGHTS_BITS      =     80,
    parameter      OUTPUT_WIDTH      =     4,
    parameter      RESULT_WIDTH      =     32
)
(
    input                                  rst,
    input                                  clk,
    input                                  classfication_en,                     
    input         [RESULT_WIDTH-1:0]       data_in_0,
    input         [RESULT_WIDTH-1:0]       data_in_1,
    input         [RESULT_WIDTH-1:0]       data_in_2,
    input         [RESULT_WIDTH-1:0]       data_in_3,
    input         [RESULT_WIDTH-1:0]       data_in_4,
    input         [RESULT_WIDTH-1:0]       data_in_5,
    input         [RESULT_WIDTH-1:0]       data_in_6,
    input         [RESULT_WIDTH-1:0]       data_in_7,
    input         [RESULT_WIDTH-1:0]       data_in_8,
    input         [RESULT_WIDTH-1:0]       data_in_9, 
    output        [OUTPUT_WIDTH-1:0]       classfication_out
);

    reg           [OUTPUT_WIDTH-1:0]       temp;            
    reg           [RESULT_WIDTH-1:0]       compare_data [WEIGHTS_COLUMN-1:0];
    
initial begin
  
    compare_data[0]   =     data_in_0;
    compare_data[1]   =     data_in_1;
    compare_data[2]   =     data_in_2;
    compare_data[3]   =     data_in_3;
    compare_data[4]   =     data_in_4;
    compare_data[5]   =     data_in_5;
    compare_data[6]   =     data_in_6;
    compare_data[7]   =     data_in_7;
    compare_data[8]   =     data_in_8;
    compare_data[9]   =     data_in_9;
end


reg [OUTPUT_WIDTH-1:0] i;

always@(posedge clk)begin
    if(classfication_en)begin
        for(i=0;i<4'd10;i=i+1)begin
            temp <= (compare_data[i] > compare_data[temp]) ? i : temp;
        end
    end
end

assign classfication_out = temp;

endmodule   
