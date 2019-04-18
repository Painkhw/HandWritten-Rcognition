
module  image_interface
#
(
    parameter   WEIGHTS_ADDR        =       10,             
    parameter   SAMPLE_COUNT        =       4,              //Down-Sample, 16pixel to 1pixel
    parameter   GRAY_WIDTH          =       8,
    parameter   GARY_THRESHOLD      =       128
)
(
    input                                   pclk,
    input                                   rst,
    input                                   de,
    input       [GRAY_WIDTH-1:0]            pixel_in,
    output reg  [GRAY_WIDTH-1:0]            pixel_out,
    output reg  [WEIGHTS_ADDR-1:0]          pixel_index_out,
    output reg                              classification_en              
);

    reg         [WEIGHTS_ADDR-1:0]          pixel_index_temp;
    reg         [SAMPLE_COUNT-1:0]          sample_count; 
    reg                                     pixel_en;
    
always@(posedge pclk)begin 

    if(de)begin
        sample_count = sample_count + 4'd1;
        pixel_en     = (sample_count == 4'd15) ? 1'd1 : 1'd0; 
    end
    
    if(sample_count == 4'd15)begin
        sample_count =  4'd0;
    end

end

always@(pixel_en)begin

    if(pixel_index_temp < 10'd784)begin
        pixel_index_temp = pixel_index_temp + 1'd1;
        pixel_out   = (pixel_in > GARY_THRESHOLD) ? 8'd1 : 8'd0;
        classification_en = (pixel_index_temp < 10'd748) ? 1'd0 : 1'd1; 
    end
    else begin 
        pixel_index_temp = 10'd0;
    end
end

always@(*)begin
    pixel_index_out <= pixel_index_temp;
end

endmodule
