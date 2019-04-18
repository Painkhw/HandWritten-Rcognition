/*
module weights_controller
#
(   
    parameter   WEIGHTS_DAPTH     =       784,
    parameter   WEIGHTS_ADDR      =       10, 
    parameter   WEIGHTS_ROW       =       10,
    parameter   WEIGHTS_WIDTH     =       16,
    parameter   WEIGHTS_BITS      =       80
)
(
    input                                 pclk,
    input                                 rst,
    input       [WEIGHTS_ADDR-1:0]        pixel_index,
  //input                                  Update_en,                  //Update Matrix Weights Flag
  //input       [WEIGHTS_WIDTH-1:0]        weight_in,
    output      [WEIGHTS_WIDTH-1:0]       weights_out   [WEIGHTS_ROW-1:0]
);

    wire        [WEIGHTS_BITS-1:0]        weights_row   [WEIGHTS_ROW-1:0];

//  The data of the Matrix that save in BRAM
/*
initial begin

    $readmemh("weights.txt", weights_matrix);

end

assign weights_row  =   weights_matrix[pixel_index];

 This module is Update weighs

always@(posedge clk) begin

    if(Update_en) begin
        weights_matrix[index]   <=  {       weights_in[9][7:0],
                                            weights_in[8][7:0],
                                            weights_in[7][7:0],
                                            weights_in[6][7:0],
                                            weights_in[5][7:0],
                                            weights_in[4][7:0],
                                            weights_in[3][7:0],
                                            weights_in[2][7:0],
                                            weights_in[1][7:0],
                                            weights_in[0][7:0],
        };
    end
end


always@(posedge pclk) begin

    //Matrix Coutput_reg corresponding to each pixel
    weights_out[9]  <=   {{8{weights_row[79]}},weights_row[79:72]};
    weights_out[8]  <=   {{8{weights_row[71]}},weights_row[71:64]};
    weights_out[7]  <=   {{8{weights_row[63]}},weights_row[63:56]};
    weights_out[6]  <=   {{8{weights_row[55]}},weights_row[55:48]};
    weights_out[5]  <=   {{8{weights_row[47]}},weights_row[47:40]};
    weights_out[4]  <=   {{8{weights_row[39]}},weights_row[39:32]};
    weights_out[3]  <=   {{8{weights_row[31]}},weights_row[31:24]};
    weights_out[2]  <=   {{8{weights_row[23]}},weights_row[23:16]};
    weights_out[1]  <=   {{8{weights_row[15]}},weights_row[15: 8]};
    weights_out[0]  <=   {{8{weights_row[ 7]}},weights_row[ 7: 0]};

end

rom_weights_784_10	rom_weights_784_10_inst 
(
	.address            (pixel_index                   ),
	.clock              (pclk                          ),
	.q                  (weights_row                   )
);

endmodule

*/