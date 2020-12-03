`timescale 10ms/10ms

module tb_decoderPPM ();

reg clk, rst_n, Din;

wire [7:0] Dout;
wire D_en, F_en;

initial begin
    clk = 1'b0;
    rst_n = 1'b1;
    Din = 1'b0;
    #20 
    rst_n = 1'b0;
    #20 
    rst_n = 1'b1; 
    Din = 1'b1;
    #20    //The first frame
//SOF
    #10 
    Din = 1'b0;
    #160 
    Din = 1'b1;
    #640 
    Din = 1'b0;
    #160 
    Din = 1'b1;
    #320 
    Din = 1'b1;  //DATA   
    #480 
    Din = 1'b0;
    #160  
    Din = 1'b1;
    #640    //01
    Din = 1'b1;
    #160  
    Din = 1'b0;
    #160
    Din = 1'b1;
    #960    //00
    Din = 1'b1;
    #800
    Din = 1'b0;
    #160
    Din = 1'b1;
    #320    // 10
    Din = 1'b1;
    #1120 
    Din = 1'b0;
    #160    //2'b 11 = 3

    Din = 1'b1;  //DATA   
    #480 
    Din = 1'b0;
    #160  
    Din = 1'b1;
    #640    //01
    Din = 1'b1;
    #160  
    Din = 1'b0;
    #160
    Din = 1'b1;
    #960    //00
    Din = 1'b1;
    #1120 
    Din = 1'b0;
    #160    //2'b 11 = 3
    Din = 1'b1;
    #800
    Din = 1'b0;
    #160
    Din = 1'b1;
    #320    // 10




    Din = 1'b1; //EOF
    #960
    Din = 1'b0;
    #160
    Din = 1'b1;

///////////////////////////////////////////////////////////////////////////////
    #4950    //The second frame
//SOF
    #10 
    Din = 1'b0;
    #160 
    Din = 1'b1;
    #640 
    Din = 1'b0;
    #160 
    Din = 1'b1;
    #320 
    Din = 1'b1;  //DATA   
    #480 
    Din = 1'b0;
    #160  
    Din = 1'b1;
    #640    //01
    Din = 1'b1;
    #160  
    Din = 1'b0;
    #160
    Din = 1'b1;
    #960    //00
    Din = 1'b1;
    #800
    Din = 1'b0;
    #160
    Din = 1'b1;
    #320    // 10
    Din = 1'b1;
    #1120 
    Din = 1'b0;
    #160    //2'b 11 = 3

    Din = 1'b1;  //DATA   
    #480 
    Din = 1'b0;
    #160  
    Din = 1'b1;
    #640    //01
    Din = 1'b1;
    #160  
    Din = 1'b0;
    #160
    Din = 1'b1;
    #960    //00
    Din = 1'b1;
    #1120 
    Din = 1'b0;
    #160    //2'b 11 = 3
    Din = 1'b1;
    #800
    Din = 1'b0;
    #160
    Din = 1'b1;
    #320    // 10




    Din = 1'b1; //EOF
    #960
    Din = 1'b0;
    #160
    Din = 1'b1;
    
///////////////////////////////////////////////////////////////////////////////
    #4950   //The third frame
//SOF
    #10 
    Din = 1'b0;
    #160 
    Din = 1'b1;
    #640 
    Din = 1'b0;
    #160 
    Din = 1'b1;
    #320 
    Din = 1'b1;  //DATA   
    #480 
    Din = 1'b0;
    #160  
    Din = 1'b1;
    #640    //01
    Din = 1'b1;
    #160  
    Din = 1'b0;
    #160
    Din = 1'b1;
    #960    //00
    Din = 1'b1;
    #800
    Din = 1'b0;
    #160
    Din = 1'b1;
    #320    // 10
    Din = 1'b1;
    #1120 
    Din = 1'b0;
    #160    //2'b 11 = 3

    Din = 1'b1;  //DATA   
    #480 
    Din = 1'b0;
    #160  
    Din = 1'b1;
    #640    //01
    Din = 1'b1;
    #160  
    Din = 1'b0;
    #160
    Din = 1'b1;
    #960    //00
    Din = 1'b1;
    #1120 
    Din = 1'b0;
    #160    //2'b 11 = 3
    Din = 1'b1;
    #800
    Din = 1'b0;
    #160
    Din = 1'b1;
    #320    // 10




    Din = 1'b1; //EOF
    #960
    Din = 1'b0;
    #160
    Din = 1'b1;    
///////////////////////////////////////////////////////////////////////////////
    #4950   //The fourth frame
//SOF
    #10 
    Din = 1'b0;
    #160 
    Din = 1'b1;
    #640 
    Din = 1'b0;
    #160 
    Din = 1'b1;
    #320 
    Din = 1'b1;  //DATA   
    #480 
    Din = 1'b0;
    #160  
    Din = 1'b1;
    #640    //01
    Din = 1'b1;
    #160  
    Din = 1'b0;
    #160
    Din = 1'b1;
    #960    //00
    Din = 1'b1;
    #800
    Din = 1'b0;
    #160
    Din = 1'b1;
    #320    // 10
    Din = 1'b1;
    #1120 
    Din = 1'b0;
    #160    //2'b 11 = 3

    Din = 1'b1;  //DATA   
    #480 
    Din = 1'b0;
    #160  
    Din = 1'b1;
    #640    //01
    Din = 1'b1;
    #160  
    Din = 1'b0;
    #160
    Din = 1'b1;
    #960    //00
    Din = 1'b1;
    #1120 
    Din = 1'b0;
    #160    //2'b 11 = 3
    Din = 1'b1;
    #800
    Din = 1'b0;
    #160
    Din = 1'b1;
    #320    // 10




    Din = 1'b1; //EOF
    #960
    Din = 1'b0;
    #160
    Din = 1'b1; 

///////////////////////////////////////////////////////////////////////////////
    #4950   //The fifth frame
//SOF
    #10 
    Din = 1'b0;
    #160 
    Din = 1'b1;
    #640 
    Din = 1'b0;
    #160 
    Din = 1'b1;
    #320 
    Din = 1'b1;  //DATA   
    #480 
    Din = 1'b0;
    #160  
    Din = 1'b1;
    #640    //01
    Din = 1'b1;
    #160  
    Din = 1'b0;
    #160
    Din = 1'b1;
    #960    //00
    Din = 1'b1;
    #800
    Din = 1'b0;
    #160
    Din = 1'b1;
    #320    // 10
    Din = 1'b1;
    #1120 
    Din = 1'b0;
    #160    //2'b 11 = 3

    Din = 1'b1;  //DATA   
    #480 
    Din = 1'b0;
    #160  
    Din = 1'b1;
    #640    //01
    Din = 1'b1;
    #160  
    Din = 1'b0;
    #160
    Din = 1'b1;
    #960    //00
    Din = 1'b1;
    #1120 
    Din = 1'b0;
    #160    //2'b 11 = 3
    Din = 1'b1;
    #800
    Din = 1'b0;
    #160
    Din = 1'b1;
    #320    // 10




    Din = 1'b1; //EOF
    #960
    Din = 1'b0;
    #160
    Din = 1'b1; 

end

always #5 clk = ~clk;

ppm_decoder DUT (.clk(clk), .rst_n(rst_n), .Din(Din), .Dout(Dout), .D_en(D_en), .F_en(F_en));
    
endmodule