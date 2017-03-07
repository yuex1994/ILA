module gaussianRTL(
arg_0_TREADY,
arg_1_TDATA,
arg_1_TVALID,
LB2D_shift_0,
LB2D_shift_1,
LB2D_shift_2,
LB2D_shift_3,
LB2D_shift_4,
LB2D_shift_5,
LB2D_shift_6,
LB2D_shift_7,
LB2D_w_idx,
LB2D_x_idx,
LB2D_y_idx,
arg_0_TDATA,
arg_0_TVALID,
arg_1_TREADY,
slice_buff,
slice_full,
stencil_buff,
stencil_full,
clk,rst,
step
);
input            arg_0_TREADY;
input      [7:0] arg_1_TDATA;
input            arg_1_TVALID;
input clk;
input rst;
input step;
output     [71:0] LB2D_shift_0;
output     [71:0] LB2D_shift_1;
output     [71:0] LB2D_shift_2;
output     [71:0] LB2D_shift_3;
output     [71:0] LB2D_shift_4;
output     [71:0] LB2D_shift_5;
output     [71:0] LB2D_shift_6;
output     [71:0] LB2D_shift_7;
output     [63:0] LB2D_w_idx;
output      [8:0] LB2D_x_idx;
output      [9:0] LB2D_y_idx;
output      [7:0] arg_0_TDATA;
output            arg_0_TVALID;
output            arg_1_TREADY;
output     [71:0] slice_buff;
output            slice_full;
output    [647:0] stencil_buff;
output            stencil_full;
reg     [71:0] LB2D_shift_0;
reg     [71:0] LB2D_shift_1;
reg     [71:0] LB2D_shift_2;
reg     [71:0] LB2D_shift_3;
reg     [71:0] LB2D_shift_4;
reg     [71:0] LB2D_shift_5;
reg     [71:0] LB2D_shift_6;
reg     [71:0] LB2D_shift_7;
reg     [63:0] LB2D_w_idx;
reg      [8:0] LB2D_x_idx;
reg      [9:0] LB2D_y_idx;
reg      [7:0] arg_0_TDATA;
reg            arg_0_TVALID;
reg            arg_1_TREADY;
reg     [71:0] slice_buff;
reg            slice_full;
reg    [647:0] stencil_buff;
reg            stencil_full;
wire            arg_0_TREADY;
wire      [7:0] arg_1_TDATA;
wire            arg_1_TVALID;
wire            n0;
wire            n1;
wire            n2;
wire            n3;
wire            n4;
wire            n5;
wire            n6;
wire            n7;
wire            n8;
wire            n9;
wire            n10;
wire            n11;
wire            n12;
wire            n13;
wire     [71:0] n14;
wire     [71:0] n15;
wire     [71:0] n16;
wire     [71:0] n17;
wire     [71:0] n18;
wire     [71:0] n19;
wire     [71:0] n20;
wire     [71:0] n21;
wire     [71:0] n22;
wire     [71:0] n23;
wire     [71:0] n24;
wire     [71:0] n25;
wire     [71:0] n26;
wire     [71:0] n27;
wire     [71:0] n28;
wire     [71:0] n29;
wire     [71:0] n30;
wire     [71:0] n31;
wire     [71:0] n32;
wire     [71:0] n33;
wire     [71:0] n34;
wire     [71:0] n35;
wire     [71:0] n36;
wire     [71:0] n37;
wire            n38;
wire            n39;
wire     [63:0] n40;
wire     [63:0] n41;
wire     [63:0] n42;
wire     [63:0] n43;
wire     [63:0] n44;
wire     [63:0] n45;
wire            n46;
wire      [8:0] n47;
wire      [8:0] n48;
wire      [8:0] n49;
wire      [8:0] n50;
wire      [8:0] n51;
wire            n52;
wire      [9:0] n53;
wire      [9:0] n54;
wire      [9:0] n55;
wire      [9:0] n56;
wire      [9:0] n57;
wire      [9:0] n58;
wire      [7:0] n59;
wire      [7:0] n60;
wire      [7:0] n61;
wire            n62;
wire            n63;
wire            n64;
wire            n65;
wire            n66;
wire            n67;
wire            n68;
wire            n69;
wire      [7:0] n70;
wire            n71;
wire      [7:0] n72;
wire            n73;
wire      [7:0] n74;
wire            n75;
wire      [7:0] n76;
wire            n77;
wire      [7:0] n78;
wire            n79;
wire      [7:0] n80;
wire            n81;
wire      [7:0] n82;
wire      [7:0] n83;
wire      [7:0] n84;
wire      [7:0] n85;
wire      [7:0] n86;
wire      [7:0] n87;
wire      [7:0] n88;
wire      [7:0] n89;
wire      [7:0] n90;
wire      [7:0] n91;
wire      [7:0] n92;
wire      [7:0] n93;
wire      [7:0] n94;
wire      [7:0] n95;
wire      [7:0] n96;
wire      [7:0] n97;
wire      [7:0] n98;
wire      [7:0] n99;
wire      [7:0] n100;
wire      [7:0] n101;
wire      [7:0] n102;
wire      [7:0] n103;
wire      [7:0] n104;
wire      [7:0] n105;
wire      [7:0] n106;
wire      [7:0] n107;
wire      [7:0] n108;
wire      [7:0] n109;
wire      [7:0] n110;
wire      [7:0] n111;
wire      [7:0] n112;
wire      [7:0] n113;
wire      [7:0] n114;
wire      [7:0] n115;
wire      [7:0] n116;
wire      [7:0] n117;
wire      [7:0] n118;
wire      [7:0] n119;
wire      [7:0] n120;
wire      [7:0] n121;
wire      [7:0] n122;
wire      [7:0] n123;
wire      [7:0] n124;
wire      [7:0] n125;
wire      [7:0] n126;
wire      [7:0] n127;
wire      [7:0] n128;
wire      [7:0] n129;
wire      [7:0] n130;
wire      [7:0] n131;
wire      [7:0] n132;
wire      [7:0] n133;
wire      [7:0] n134;
wire      [7:0] n135;
wire      [7:0] n136;
wire      [7:0] n137;
wire      [7:0] n138;
wire      [7:0] n139;
wire     [15:0] n140;
wire     [23:0] n141;
wire     [31:0] n142;
wire     [39:0] n143;
wire     [47:0] n144;
wire     [55:0] n145;
wire     [63:0] n146;
wire     [71:0] n147;
wire     [71:0] n148;
wire     [71:0] n149;
wire     [71:0] n150;
wire     [71:0] n151;
wire            n152;
wire            n153;
wire            n154;
wire      [7:0] n155;
wire      [7:0] n156;
wire      [7:0] n157;
wire      [7:0] n158;
wire      [7:0] n159;
wire      [7:0] n160;
wire      [7:0] n161;
wire      [7:0] n162;
wire      [7:0] n163;
wire     [15:0] n164;
wire     [23:0] n165;
wire     [31:0] n166;
wire     [39:0] n167;
wire     [47:0] n168;
wire     [55:0] n169;
wire     [63:0] n170;
wire     [71:0] n171;
wire      [7:0] n172;
wire      [7:0] n173;
wire      [7:0] n174;
wire      [7:0] n175;
wire      [7:0] n176;
wire      [7:0] n177;
wire      [7:0] n178;
wire      [7:0] n179;
wire      [7:0] n180;
wire     [15:0] n181;
wire     [23:0] n182;
wire     [31:0] n183;
wire     [39:0] n184;
wire     [47:0] n185;
wire     [55:0] n186;
wire     [63:0] n187;
wire     [71:0] n188;
wire      [7:0] n189;
wire      [7:0] n190;
wire      [7:0] n191;
wire      [7:0] n192;
wire      [7:0] n193;
wire      [7:0] n194;
wire      [7:0] n195;
wire      [7:0] n196;
wire      [7:0] n197;
wire     [15:0] n198;
wire     [23:0] n199;
wire     [31:0] n200;
wire     [39:0] n201;
wire     [47:0] n202;
wire     [55:0] n203;
wire     [63:0] n204;
wire     [71:0] n205;
wire      [7:0] n206;
wire      [7:0] n207;
wire      [7:0] n208;
wire      [7:0] n209;
wire      [7:0] n210;
wire      [7:0] n211;
wire      [7:0] n212;
wire      [7:0] n213;
wire      [7:0] n214;
wire     [15:0] n215;
wire     [23:0] n216;
wire     [31:0] n217;
wire     [39:0] n218;
wire     [47:0] n219;
wire     [55:0] n220;
wire     [63:0] n221;
wire     [71:0] n222;
wire      [7:0] n223;
wire      [7:0] n224;
wire      [7:0] n225;
wire      [7:0] n226;
wire      [7:0] n227;
wire      [7:0] n228;
wire      [7:0] n229;
wire      [7:0] n230;
wire      [7:0] n231;
wire     [15:0] n232;
wire     [23:0] n233;
wire     [31:0] n234;
wire     [39:0] n235;
wire     [47:0] n236;
wire     [55:0] n237;
wire     [63:0] n238;
wire     [71:0] n239;
wire      [7:0] n240;
wire      [7:0] n241;
wire      [7:0] n242;
wire      [7:0] n243;
wire      [7:0] n244;
wire      [7:0] n245;
wire      [7:0] n246;
wire      [7:0] n247;
wire      [7:0] n248;
wire     [15:0] n249;
wire     [23:0] n250;
wire     [31:0] n251;
wire     [39:0] n252;
wire     [47:0] n253;
wire     [55:0] n254;
wire     [63:0] n255;
wire     [71:0] n256;
wire      [7:0] n257;
wire      [7:0] n258;
wire      [7:0] n259;
wire      [7:0] n260;
wire      [7:0] n261;
wire      [7:0] n262;
wire      [7:0] n263;
wire      [7:0] n264;
wire      [7:0] n265;
wire     [15:0] n266;
wire     [23:0] n267;
wire     [31:0] n268;
wire     [39:0] n269;
wire     [47:0] n270;
wire     [55:0] n271;
wire     [63:0] n272;
wire     [71:0] n273;
wire      [7:0] n274;
wire      [7:0] n275;
wire      [7:0] n276;
wire      [7:0] n277;
wire      [7:0] n278;
wire      [7:0] n279;
wire      [7:0] n280;
wire      [7:0] n281;
wire      [7:0] n282;
wire     [15:0] n283;
wire     [23:0] n284;
wire     [31:0] n285;
wire     [39:0] n286;
wire     [47:0] n287;
wire     [55:0] n288;
wire     [63:0] n289;
wire     [71:0] n290;
wire      [7:0] n291;
wire      [7:0] n292;
wire      [7:0] n293;
wire      [7:0] n294;
wire      [7:0] n295;
wire      [7:0] n296;
wire      [7:0] n297;
wire      [7:0] n298;
wire      [7:0] n299;
wire     [15:0] n300;
wire     [23:0] n301;
wire     [31:0] n302;
wire     [39:0] n303;
wire     [47:0] n304;
wire     [55:0] n305;
wire     [63:0] n306;
wire     [71:0] n307;
wire    [143:0] n308;
wire    [215:0] n309;
wire    [287:0] n310;
wire    [359:0] n311;
wire    [431:0] n312;
wire    [503:0] n313;
wire    [575:0] n314;
wire    [647:0] n315;
wire    [647:0] n316;
wire    [647:0] n317;
wire    [647:0] n318;
wire            n319;
wire            n320;
wire            n321;
wire      [8:0] LB2D_buff_0_addr0;
wire      [7:0] LB2D_buff_0_data0;
wire            n322;
wire            n323;
wire            n324;
wire            n325;
wire            n326;
wire            n327;
wire            n328;
wire            n329;
wire            n330;
wire            n331;
wire      [8:0] LB2D_buff_1_addr0;
wire      [7:0] LB2D_buff_1_data0;
wire            n332;
wire            n333;
wire            n334;
wire      [8:0] LB2D_buff_2_addr0;
wire      [7:0] LB2D_buff_2_data0;
wire            n335;
wire            n336;
wire            n337;
wire      [8:0] LB2D_buff_3_addr0;
wire      [7:0] LB2D_buff_3_data0;
wire            n338;
wire            n339;
wire            n340;
wire      [8:0] LB2D_buff_4_addr0;
wire      [7:0] LB2D_buff_4_data0;
wire            n341;
wire            n342;
wire            n343;
wire      [8:0] LB2D_buff_5_addr0;
wire      [7:0] LB2D_buff_5_data0;
wire            n344;
wire            n345;
wire            n346;
wire      [8:0] LB2D_buff_6_addr0;
wire      [7:0] LB2D_buff_6_data0;
wire            n347;
wire            n348;
wire            n349;
wire      [8:0] LB2D_buff_7_addr0;
wire      [7:0] LB2D_buff_7_data0;
wire            n350;
wire            n351;
wire            n352;
wire            n353;
reg      [7:0] LB2D_buff_0[511:0];
reg      [7:0] LB2D_buff_1[511:0];
reg      [7:0] LB2D_buff_2[511:0];
reg      [7:0] LB2D_buff_3[511:0];
reg      [7:0] LB2D_buff_4[511:0];
reg      [7:0] LB2D_buff_5[511:0];
reg      [7:0] LB2D_buff_6[511:0];
reg      [7:0] LB2D_buff_7[511:0];
wire clk;
wire rst;
wire step;
assign n0 =  ( arg_1_TVALID ) == ( 1'd1 )  ;
assign n1 =  ( arg_0_TVALID ) == ( 1'd0 )  ;
assign n2 =  ( n0 ) & ( n1 )  ;
assign n3 =  ( slice_full ) == ( 1'd0 )  ;
assign n4 =  ( n2 ) & ( n3 )  ;
assign n5 =  ( slice_full ) == ( 1'd1 )  ;
assign n6 =  ( n5 ) & ( n1 )  ;
assign n7 =  ( stencil_full ) == ( 1'd0 )  ;
assign n8 =  ( n6 ) & ( n7 )  ;
assign n9 =  ( arg_0_TREADY ) == ( 1'd1 )  ;
assign n10 =  ( arg_0_TVALID ) == ( 1'd1 )  ;
assign n11 =  ( n9 ) & ( n10 )  ;
assign n12 =  ( arg_1_TVALID ) == ( 1'd0 )  ;
assign n13 =  ( n11 ) & ( n12 )  ;
assign n14 =  ( n13 ) ? ( LB2D_shift_0 ) : ( LB2D_shift_0 ) ;
assign n15 =  ( n8 ) ? ( slice_buff ) : ( n14 ) ;
assign n16 =  ( n4 ) ? ( LB2D_shift_0 ) : ( n15 ) ;
assign n17 =  ( n13 ) ? ( LB2D_shift_1 ) : ( LB2D_shift_1 ) ;
assign n18 =  ( n8 ) ? ( LB2D_shift_0 ) : ( n17 ) ;
assign n19 =  ( n4 ) ? ( LB2D_shift_1 ) : ( n18 ) ;
assign n20 =  ( n13 ) ? ( LB2D_shift_2 ) : ( LB2D_shift_2 ) ;
assign n21 =  ( n8 ) ? ( LB2D_shift_1 ) : ( n20 ) ;
assign n22 =  ( n4 ) ? ( LB2D_shift_2 ) : ( n21 ) ;
assign n23 =  ( n13 ) ? ( LB2D_shift_3 ) : ( LB2D_shift_3 ) ;
assign n24 =  ( n8 ) ? ( LB2D_shift_2 ) : ( n23 ) ;
assign n25 =  ( n4 ) ? ( LB2D_shift_3 ) : ( n24 ) ;
assign n26 =  ( n13 ) ? ( LB2D_shift_4 ) : ( LB2D_shift_4 ) ;
assign n27 =  ( n8 ) ? ( LB2D_shift_3 ) : ( n26 ) ;
assign n28 =  ( n4 ) ? ( LB2D_shift_4 ) : ( n27 ) ;
assign n29 =  ( n13 ) ? ( LB2D_shift_5 ) : ( LB2D_shift_5 ) ;
assign n30 =  ( n8 ) ? ( LB2D_shift_4 ) : ( n29 ) ;
assign n31 =  ( n4 ) ? ( LB2D_shift_5 ) : ( n30 ) ;
assign n32 =  ( n13 ) ? ( LB2D_shift_6 ) : ( LB2D_shift_6 ) ;
assign n33 =  ( n8 ) ? ( LB2D_shift_5 ) : ( n32 ) ;
assign n34 =  ( n4 ) ? ( LB2D_shift_6 ) : ( n33 ) ;
assign n35 =  ( n13 ) ? ( LB2D_shift_7 ) : ( LB2D_shift_7 ) ;
assign n36 =  ( n8 ) ? ( LB2D_shift_6 ) : ( n35 ) ;
assign n37 =  ( n4 ) ? ( LB2D_shift_7 ) : ( n36 ) ;
assign n38 =  ( LB2D_x_idx ) == ( 9'd487 )  ;
assign n39 =  ( LB2D_w_idx ) != ( 64'd7 )  ;
assign n40 =  ( LB2D_w_idx ) + ( 64'd1 )  ;
assign n41 =  ( n39 ) ? ( n40 ) : ( 64'd0 ) ;
assign n42 =  ( n38 ) ? ( n41 ) : ( LB2D_w_idx ) ;
assign n43 =  ( n13 ) ? ( LB2D_w_idx ) : ( LB2D_w_idx ) ;
assign n44 =  ( n8 ) ? ( LB2D_w_idx ) : ( n43 ) ;
assign n45 =  ( n4 ) ? ( n42 ) : ( n44 ) ;
assign n46 =  ( LB2D_x_idx ) != ( 9'd487 )  ;
assign n47 =  ( LB2D_x_idx ) + ( 9'd1 )  ;
assign n48 =  ( n46 ) ? ( n47 ) : ( 9'd0 ) ;
assign n49 =  ( n13 ) ? ( LB2D_x_idx ) : ( LB2D_x_idx ) ;
assign n50 =  ( n8 ) ? ( LB2D_x_idx ) : ( n49 ) ;
assign n51 =  ( n4 ) ? ( n48 ) : ( n50 ) ;
assign n52 =  ( LB2D_y_idx ) != ( 10'd687 )  ;
assign n53 =  ( LB2D_y_idx ) + ( 10'd1 )  ;
assign n54 =  ( n52 ) ? ( n53 ) : ( LB2D_y_idx ) ;
assign n55 =  ( n38 ) ? ( n54 ) : ( LB2D_y_idx ) ;
assign n56 =  ( n13 ) ? ( LB2D_y_idx ) : ( LB2D_y_idx ) ;
assign n57 =  ( n8 ) ? ( LB2D_y_idx ) : ( n56 ) ;
assign n58 =  ( n4 ) ? ( n55 ) : ( n57 ) ;
assign n59 =  ( n13 ) ? ( arg_0_TDATA ) : ( arg_0_TDATA ) ;
assign n60 =  ( n8 ) ? ( arg_0_TDATA ) : ( n59 ) ;
assign n61 =  ( n4 ) ? ( arg_0_TDATA ) : ( n60 ) ;
assign n62 =  ( n13 ) ? ( 1'd0 ) : ( arg_0_TVALID ) ;
assign n63 =  ( n8 ) ? ( 1'd0 ) : ( n62 ) ;
assign n64 =  ( n4 ) ? ( 1'd0 ) : ( n63 ) ;
assign n65 =  ( n13 ) ? ( 1'd1 ) : ( arg_1_TREADY ) ;
assign n66 =  ( n8 ) ? ( 1'd1 ) : ( n65 ) ;
assign n67 =  ( n4 ) ? ( 1'd0 ) : ( n66 ) ;
assign n68 =  ( LB2D_y_idx ) >= ( 10'd8 )  ;
assign n69 =  ( LB2D_w_idx ) == ( 64'd0 )  ;
assign n70 =  (  LB2D_buff_7 [ LB2D_x_idx ] )  ;
assign n71 =  ( LB2D_w_idx ) == ( 64'd1 )  ;
assign n72 =  (  LB2D_buff_0 [ LB2D_x_idx ] )  ;
assign n73 =  ( LB2D_w_idx ) == ( 64'd2 )  ;
assign n74 =  (  LB2D_buff_1 [ LB2D_x_idx ] )  ;
assign n75 =  ( LB2D_w_idx ) == ( 64'd3 )  ;
assign n76 =  (  LB2D_buff_2 [ LB2D_x_idx ] )  ;
assign n77 =  ( LB2D_w_idx ) == ( 64'd4 )  ;
assign n78 =  (  LB2D_buff_3 [ LB2D_x_idx ] )  ;
assign n79 =  ( LB2D_w_idx ) == ( 64'd5 )  ;
assign n80 =  (  LB2D_buff_4 [ LB2D_x_idx ] )  ;
assign n81 =  ( LB2D_w_idx ) == ( 64'd6 )  ;
assign n82 =  (  LB2D_buff_5 [ LB2D_x_idx ] )  ;
assign n83 =  (  LB2D_buff_6 [ LB2D_x_idx ] )  ;
assign n84 =  ( n81 ) ? ( n82 ) : ( n83 ) ;
assign n85 =  ( n79 ) ? ( n80 ) : ( n84 ) ;
assign n86 =  ( n77 ) ? ( n78 ) : ( n85 ) ;
assign n87 =  ( n75 ) ? ( n76 ) : ( n86 ) ;
assign n88 =  ( n73 ) ? ( n74 ) : ( n87 ) ;
assign n89 =  ( n71 ) ? ( n72 ) : ( n88 ) ;
assign n90 =  ( n69 ) ? ( n70 ) : ( n89 ) ;
assign n91 =  ( n81 ) ? ( n80 ) : ( n82 ) ;
assign n92 =  ( n79 ) ? ( n78 ) : ( n91 ) ;
assign n93 =  ( n77 ) ? ( n76 ) : ( n92 ) ;
assign n94 =  ( n75 ) ? ( n74 ) : ( n93 ) ;
assign n95 =  ( n73 ) ? ( n72 ) : ( n94 ) ;
assign n96 =  ( n71 ) ? ( n70 ) : ( n95 ) ;
assign n97 =  ( n69 ) ? ( n83 ) : ( n96 ) ;
assign n98 =  ( n81 ) ? ( n78 ) : ( n80 ) ;
assign n99 =  ( n79 ) ? ( n76 ) : ( n98 ) ;
assign n100 =  ( n77 ) ? ( n74 ) : ( n99 ) ;
assign n101 =  ( n75 ) ? ( n72 ) : ( n100 ) ;
assign n102 =  ( n73 ) ? ( n70 ) : ( n101 ) ;
assign n103 =  ( n71 ) ? ( n83 ) : ( n102 ) ;
assign n104 =  ( n69 ) ? ( n82 ) : ( n103 ) ;
assign n105 =  ( n81 ) ? ( n76 ) : ( n78 ) ;
assign n106 =  ( n79 ) ? ( n74 ) : ( n105 ) ;
assign n107 =  ( n77 ) ? ( n72 ) : ( n106 ) ;
assign n108 =  ( n75 ) ? ( n70 ) : ( n107 ) ;
assign n109 =  ( n73 ) ? ( n83 ) : ( n108 ) ;
assign n110 =  ( n71 ) ? ( n82 ) : ( n109 ) ;
assign n111 =  ( n69 ) ? ( n80 ) : ( n110 ) ;
assign n112 =  ( n81 ) ? ( n74 ) : ( n76 ) ;
assign n113 =  ( n79 ) ? ( n72 ) : ( n112 ) ;
assign n114 =  ( n77 ) ? ( n70 ) : ( n113 ) ;
assign n115 =  ( n75 ) ? ( n83 ) : ( n114 ) ;
assign n116 =  ( n73 ) ? ( n82 ) : ( n115 ) ;
assign n117 =  ( n71 ) ? ( n80 ) : ( n116 ) ;
assign n118 =  ( n69 ) ? ( n78 ) : ( n117 ) ;
assign n119 =  ( n81 ) ? ( n72 ) : ( n74 ) ;
assign n120 =  ( n79 ) ? ( n70 ) : ( n119 ) ;
assign n121 =  ( n77 ) ? ( n83 ) : ( n120 ) ;
assign n122 =  ( n75 ) ? ( n82 ) : ( n121 ) ;
assign n123 =  ( n73 ) ? ( n80 ) : ( n122 ) ;
assign n124 =  ( n71 ) ? ( n78 ) : ( n123 ) ;
assign n125 =  ( n69 ) ? ( n76 ) : ( n124 ) ;
assign n126 =  ( n81 ) ? ( n70 ) : ( n72 ) ;
assign n127 =  ( n79 ) ? ( n83 ) : ( n126 ) ;
assign n128 =  ( n77 ) ? ( n82 ) : ( n127 ) ;
assign n129 =  ( n75 ) ? ( n80 ) : ( n128 ) ;
assign n130 =  ( n73 ) ? ( n78 ) : ( n129 ) ;
assign n131 =  ( n71 ) ? ( n76 ) : ( n130 ) ;
assign n132 =  ( n69 ) ? ( n74 ) : ( n131 ) ;
assign n133 =  ( n81 ) ? ( n83 ) : ( n70 ) ;
assign n134 =  ( n79 ) ? ( n82 ) : ( n133 ) ;
assign n135 =  ( n77 ) ? ( n80 ) : ( n134 ) ;
assign n136 =  ( n75 ) ? ( n78 ) : ( n135 ) ;
assign n137 =  ( n73 ) ? ( n76 ) : ( n136 ) ;
assign n138 =  ( n71 ) ? ( n74 ) : ( n137 ) ;
assign n139 =  ( n69 ) ? ( n72 ) : ( n138 ) ;
assign n140 =  { ( n132 ) , ( n139 ) }  ;
assign n141 =  { ( n125 ) , ( n140 ) }  ;
assign n142 =  { ( n118 ) , ( n141 ) }  ;
assign n143 =  { ( n111 ) , ( n142 ) }  ;
assign n144 =  { ( n104 ) , ( n143 ) }  ;
assign n145 =  { ( n97 ) , ( n144 ) }  ;
assign n146 =  { ( n90 ) , ( n145 ) }  ;
assign n147 =  { ( arg_1_TDATA ) , ( n146 ) }  ;
assign n148 =  ( n68 ) ? ( n147 ) : ( slice_buff ) ;
assign n149 =  ( n13 ) ? ( slice_buff ) : ( slice_buff ) ;
assign n150 =  ( n8 ) ? ( slice_buff ) : ( n149 ) ;
assign n151 =  ( n4 ) ? ( n148 ) : ( n150 ) ;
assign n152 =  ( n13 ) ? ( slice_full ) : ( slice_full ) ;
assign n153 =  ( n8 ) ? ( 1'd0 ) : ( n152 ) ;
assign n154 =  ( n4 ) ? ( 1'd1 ) : ( n153 ) ;
assign n155 = slice_buff[71:64] ;
assign n156 = LB2D_shift_0[71:64] ;
assign n157 = LB2D_shift_1[71:64] ;
assign n158 = LB2D_shift_2[71:64] ;
assign n159 = LB2D_shift_3[71:64] ;
assign n160 = LB2D_shift_4[71:64] ;
assign n161 = LB2D_shift_5[71:64] ;
assign n162 = LB2D_shift_6[71:64] ;
assign n163 = LB2D_shift_7[71:64] ;
assign n164 =  { ( n162 ) , ( n163 ) }  ;
assign n165 =  { ( n161 ) , ( n164 ) }  ;
assign n166 =  { ( n160 ) , ( n165 ) }  ;
assign n167 =  { ( n159 ) , ( n166 ) }  ;
assign n168 =  { ( n158 ) , ( n167 ) }  ;
assign n169 =  { ( n157 ) , ( n168 ) }  ;
assign n170 =  { ( n156 ) , ( n169 ) }  ;
assign n171 =  { ( n155 ) , ( n170 ) }  ;
assign n172 = slice_buff[63:56] ;
assign n173 = LB2D_shift_0[63:56] ;
assign n174 = LB2D_shift_1[63:56] ;
assign n175 = LB2D_shift_2[63:56] ;
assign n176 = LB2D_shift_3[63:56] ;
assign n177 = LB2D_shift_4[63:56] ;
assign n178 = LB2D_shift_5[63:56] ;
assign n179 = LB2D_shift_6[63:56] ;
assign n180 = LB2D_shift_7[63:56] ;
assign n181 =  { ( n179 ) , ( n180 ) }  ;
assign n182 =  { ( n178 ) , ( n181 ) }  ;
assign n183 =  { ( n177 ) , ( n182 ) }  ;
assign n184 =  { ( n176 ) , ( n183 ) }  ;
assign n185 =  { ( n175 ) , ( n184 ) }  ;
assign n186 =  { ( n174 ) , ( n185 ) }  ;
assign n187 =  { ( n173 ) , ( n186 ) }  ;
assign n188 =  { ( n172 ) , ( n187 ) }  ;
assign n189 = slice_buff[55:48] ;
assign n190 = LB2D_shift_0[55:48] ;
assign n191 = LB2D_shift_1[55:48] ;
assign n192 = LB2D_shift_2[55:48] ;
assign n193 = LB2D_shift_3[55:48] ;
assign n194 = LB2D_shift_4[55:48] ;
assign n195 = LB2D_shift_5[55:48] ;
assign n196 = LB2D_shift_6[55:48] ;
assign n197 = LB2D_shift_7[55:48] ;
assign n198 =  { ( n196 ) , ( n197 ) }  ;
assign n199 =  { ( n195 ) , ( n198 ) }  ;
assign n200 =  { ( n194 ) , ( n199 ) }  ;
assign n201 =  { ( n193 ) , ( n200 ) }  ;
assign n202 =  { ( n192 ) , ( n201 ) }  ;
assign n203 =  { ( n191 ) , ( n202 ) }  ;
assign n204 =  { ( n190 ) , ( n203 ) }  ;
assign n205 =  { ( n189 ) , ( n204 ) }  ;
assign n206 = slice_buff[47:40] ;
assign n207 = LB2D_shift_0[47:40] ;
assign n208 = LB2D_shift_1[47:40] ;
assign n209 = LB2D_shift_2[47:40] ;
assign n210 = LB2D_shift_3[47:40] ;
assign n211 = LB2D_shift_4[47:40] ;
assign n212 = LB2D_shift_5[47:40] ;
assign n213 = LB2D_shift_6[47:40] ;
assign n214 = LB2D_shift_7[47:40] ;
assign n215 =  { ( n213 ) , ( n214 ) }  ;
assign n216 =  { ( n212 ) , ( n215 ) }  ;
assign n217 =  { ( n211 ) , ( n216 ) }  ;
assign n218 =  { ( n210 ) , ( n217 ) }  ;
assign n219 =  { ( n209 ) , ( n218 ) }  ;
assign n220 =  { ( n208 ) , ( n219 ) }  ;
assign n221 =  { ( n207 ) , ( n220 ) }  ;
assign n222 =  { ( n206 ) , ( n221 ) }  ;
assign n223 = slice_buff[39:32] ;
assign n224 = LB2D_shift_0[39:32] ;
assign n225 = LB2D_shift_1[39:32] ;
assign n226 = LB2D_shift_2[39:32] ;
assign n227 = LB2D_shift_3[39:32] ;
assign n228 = LB2D_shift_4[39:32] ;
assign n229 = LB2D_shift_5[39:32] ;
assign n230 = LB2D_shift_6[39:32] ;
assign n231 = LB2D_shift_7[39:32] ;
assign n232 =  { ( n230 ) , ( n231 ) }  ;
assign n233 =  { ( n229 ) , ( n232 ) }  ;
assign n234 =  { ( n228 ) , ( n233 ) }  ;
assign n235 =  { ( n227 ) , ( n234 ) }  ;
assign n236 =  { ( n226 ) , ( n235 ) }  ;
assign n237 =  { ( n225 ) , ( n236 ) }  ;
assign n238 =  { ( n224 ) , ( n237 ) }  ;
assign n239 =  { ( n223 ) , ( n238 ) }  ;
assign n240 = slice_buff[31:24] ;
assign n241 = LB2D_shift_0[31:24] ;
assign n242 = LB2D_shift_1[31:24] ;
assign n243 = LB2D_shift_2[31:24] ;
assign n244 = LB2D_shift_3[31:24] ;
assign n245 = LB2D_shift_4[31:24] ;
assign n246 = LB2D_shift_5[31:24] ;
assign n247 = LB2D_shift_6[31:24] ;
assign n248 = LB2D_shift_7[31:24] ;
assign n249 =  { ( n247 ) , ( n248 ) }  ;
assign n250 =  { ( n246 ) , ( n249 ) }  ;
assign n251 =  { ( n245 ) , ( n250 ) }  ;
assign n252 =  { ( n244 ) , ( n251 ) }  ;
assign n253 =  { ( n243 ) , ( n252 ) }  ;
assign n254 =  { ( n242 ) , ( n253 ) }  ;
assign n255 =  { ( n241 ) , ( n254 ) }  ;
assign n256 =  { ( n240 ) , ( n255 ) }  ;
assign n257 = slice_buff[23:16] ;
assign n258 = LB2D_shift_0[23:16] ;
assign n259 = LB2D_shift_1[23:16] ;
assign n260 = LB2D_shift_2[23:16] ;
assign n261 = LB2D_shift_3[23:16] ;
assign n262 = LB2D_shift_4[23:16] ;
assign n263 = LB2D_shift_5[23:16] ;
assign n264 = LB2D_shift_6[23:16] ;
assign n265 = LB2D_shift_7[23:16] ;
assign n266 =  { ( n264 ) , ( n265 ) }  ;
assign n267 =  { ( n263 ) , ( n266 ) }  ;
assign n268 =  { ( n262 ) , ( n267 ) }  ;
assign n269 =  { ( n261 ) , ( n268 ) }  ;
assign n270 =  { ( n260 ) , ( n269 ) }  ;
assign n271 =  { ( n259 ) , ( n270 ) }  ;
assign n272 =  { ( n258 ) , ( n271 ) }  ;
assign n273 =  { ( n257 ) , ( n272 ) }  ;
assign n274 = slice_buff[15:8] ;
assign n275 = LB2D_shift_0[15:8] ;
assign n276 = LB2D_shift_1[15:8] ;
assign n277 = LB2D_shift_2[15:8] ;
assign n278 = LB2D_shift_3[15:8] ;
assign n279 = LB2D_shift_4[15:8] ;
assign n280 = LB2D_shift_5[15:8] ;
assign n281 = LB2D_shift_6[15:8] ;
assign n282 = LB2D_shift_7[15:8] ;
assign n283 =  { ( n281 ) , ( n282 ) }  ;
assign n284 =  { ( n280 ) , ( n283 ) }  ;
assign n285 =  { ( n279 ) , ( n284 ) }  ;
assign n286 =  { ( n278 ) , ( n285 ) }  ;
assign n287 =  { ( n277 ) , ( n286 ) }  ;
assign n288 =  { ( n276 ) , ( n287 ) }  ;
assign n289 =  { ( n275 ) , ( n288 ) }  ;
assign n290 =  { ( n274 ) , ( n289 ) }  ;
assign n291 = slice_buff[7:0] ;
assign n292 = LB2D_shift_0[7:0] ;
assign n293 = LB2D_shift_1[7:0] ;
assign n294 = LB2D_shift_2[7:0] ;
assign n295 = LB2D_shift_3[7:0] ;
assign n296 = LB2D_shift_4[7:0] ;
assign n297 = LB2D_shift_5[7:0] ;
assign n298 = LB2D_shift_6[7:0] ;
assign n299 = LB2D_shift_7[7:0] ;
assign n300 =  { ( n298 ) , ( n299 ) }  ;
assign n301 =  { ( n297 ) , ( n300 ) }  ;
assign n302 =  { ( n296 ) , ( n301 ) }  ;
assign n303 =  { ( n295 ) , ( n302 ) }  ;
assign n304 =  { ( n294 ) , ( n303 ) }  ;
assign n305 =  { ( n293 ) , ( n304 ) }  ;
assign n306 =  { ( n292 ) , ( n305 ) }  ;
assign n307 =  { ( n291 ) , ( n306 ) }  ;
assign n308 =  { ( n290 ) , ( n307 ) }  ;
assign n309 =  { ( n273 ) , ( n308 ) }  ;
assign n310 =  { ( n256 ) , ( n309 ) }  ;
assign n311 =  { ( n239 ) , ( n310 ) }  ;
assign n312 =  { ( n222 ) , ( n311 ) }  ;
assign n313 =  { ( n205 ) , ( n312 ) }  ;
assign n314 =  { ( n188 ) , ( n313 ) }  ;
assign n315 =  { ( n171 ) , ( n314 ) }  ;
assign n316 =  ( n13 ) ? ( stencil_buff ) : ( stencil_buff ) ;
assign n317 =  ( n8 ) ? ( n315 ) : ( n316 ) ;
assign n318 =  ( n4 ) ? ( stencil_buff ) : ( n317 ) ;
assign n319 =  ( n13 ) ? ( 1'd0 ) : ( stencil_full ) ;
assign n320 =  ( n8 ) ? ( 1'd0 ) : ( n319 ) ;
assign n321 =  ( n4 ) ? ( stencil_full ) : ( n320 ) ;
assign n322 = ~ ( n4 ) ;
assign n323 = ~ ( n8 ) ;
assign n324 =  ( n322 ) & ( n323 )  ;
assign n325 = ~ ( n13 ) ;
assign n326 =  ( n324 ) & ( n325 )  ;
assign n327 =  ( n324 ) & ( n13 )  ;
assign n328 =  ( n322 ) & ( n8 )  ;
assign n329 = ~ ( n69 ) ;
assign n330 =  ( n4 ) & ( n329 )  ;
assign n331 =  ( n4 ) & ( n69 )  ;
assign LB2D_buff_0_addr0 = n331 ? (LB2D_x_idx) : (0);
assign LB2D_buff_0_data0 = n331 ? (arg_1_TDATA) : (LB2D_buff_0[0]);
assign n332 = ~ ( n71 ) ;
assign n333 =  ( n4 ) & ( n332 )  ;
assign n334 =  ( n4 ) & ( n71 )  ;
assign LB2D_buff_1_addr0 = n334 ? (LB2D_x_idx) : (0);
assign LB2D_buff_1_data0 = n334 ? (arg_1_TDATA) : (LB2D_buff_1[0]);
assign n335 = ~ ( n73 ) ;
assign n336 =  ( n4 ) & ( n335 )  ;
assign n337 =  ( n4 ) & ( n73 )  ;
assign LB2D_buff_2_addr0 = n337 ? (LB2D_x_idx) : (0);
assign LB2D_buff_2_data0 = n337 ? (arg_1_TDATA) : (LB2D_buff_2[0]);
assign n338 = ~ ( n75 ) ;
assign n339 =  ( n4 ) & ( n338 )  ;
assign n340 =  ( n4 ) & ( n75 )  ;
assign LB2D_buff_3_addr0 = n340 ? (LB2D_x_idx) : (0);
assign LB2D_buff_3_data0 = n340 ? (arg_1_TDATA) : (LB2D_buff_3[0]);
assign n341 = ~ ( n77 ) ;
assign n342 =  ( n4 ) & ( n341 )  ;
assign n343 =  ( n4 ) & ( n77 )  ;
assign LB2D_buff_4_addr0 = n343 ? (LB2D_x_idx) : (0);
assign LB2D_buff_4_data0 = n343 ? (arg_1_TDATA) : (LB2D_buff_4[0]);
assign n344 = ~ ( n79 ) ;
assign n345 =  ( n4 ) & ( n344 )  ;
assign n346 =  ( n4 ) & ( n79 )  ;
assign LB2D_buff_5_addr0 = n346 ? (LB2D_x_idx) : (0);
assign LB2D_buff_5_data0 = n346 ? (arg_1_TDATA) : (LB2D_buff_5[0]);
assign n347 = ~ ( n81 ) ;
assign n348 =  ( n4 ) & ( n347 )  ;
assign n349 =  ( n4 ) & ( n81 )  ;
assign LB2D_buff_6_addr0 = n349 ? (LB2D_x_idx) : (0);
assign LB2D_buff_6_data0 = n349 ? (arg_1_TDATA) : (LB2D_buff_6[0]);
assign n350 =  ( LB2D_w_idx ) == ( 64'd7 )  ;
assign n351 = ~ ( n350 ) ;
assign n352 =  ( n4 ) & ( n351 )  ;
assign n353 =  ( n4 ) & ( n350 )  ;
assign LB2D_buff_7_addr0 = n353 ? (LB2D_x_idx) : (0);
assign LB2D_buff_7_data0 = n353 ? (arg_1_TDATA) : (LB2D_buff_7[0]);
/*
function [7:0] gaussianBlurStencil ;
input [647:0] arg0;
    begin
//TODO: Add the specific function HERE.    end
endfunction
*/

always @(posedge clk) begin
   if(rst) begin
       LB2D_shift_0 <= LB2D_shift_0;
       LB2D_shift_1 <= LB2D_shift_1;
       LB2D_shift_2 <= LB2D_shift_2;
       LB2D_shift_3 <= LB2D_shift_3;
       LB2D_shift_4 <= LB2D_shift_4;
       LB2D_shift_5 <= LB2D_shift_5;
       LB2D_shift_6 <= LB2D_shift_6;
       LB2D_shift_7 <= LB2D_shift_7;
       LB2D_w_idx <= LB2D_w_idx;
       LB2D_x_idx <= LB2D_x_idx;
       LB2D_y_idx <= LB2D_y_idx;
       arg_0_TDATA <= arg_0_TDATA;
       arg_0_TVALID <= arg_0_TVALID;
       arg_1_TREADY <= arg_1_TREADY;
       slice_buff <= slice_buff;
       slice_full <= slice_full;
       stencil_buff <= stencil_buff;
       stencil_full <= stencil_full;
   end
   else if(step) begin
       LB2D_shift_0 <= n16;
       LB2D_shift_1 <= n19;
       LB2D_shift_2 <= n22;
       LB2D_shift_3 <= n25;
       LB2D_shift_4 <= n28;
       LB2D_shift_5 <= n31;
       LB2D_shift_6 <= n34;
       LB2D_shift_7 <= n37;
       LB2D_w_idx <= n45;
       LB2D_x_idx <= n51;
       LB2D_y_idx <= n58;
       arg_0_TDATA <= n61;
       arg_0_TVALID <= n64;
       arg_1_TREADY <= n67;
       slice_buff <= n151;
       slice_full <= n154;
       stencil_buff <= n318;
       stencil_full <= n321;
       LB2D_buff_0 [ LB2D_buff_0_addr0 ] <= LB2D_buff_0_data0;
       LB2D_buff_1 [ LB2D_buff_1_addr0 ] <= LB2D_buff_1_data0;
       LB2D_buff_2 [ LB2D_buff_2_addr0 ] <= LB2D_buff_2_data0;
       LB2D_buff_3 [ LB2D_buff_3_addr0 ] <= LB2D_buff_3_data0;
       LB2D_buff_4 [ LB2D_buff_4_addr0 ] <= LB2D_buff_4_data0;
       LB2D_buff_5 [ LB2D_buff_5_addr0 ] <= LB2D_buff_5_data0;
       LB2D_buff_6 [ LB2D_buff_6_addr0 ] <= LB2D_buff_6_data0;
       LB2D_buff_7 [ LB2D_buff_7_addr0 ] <= LB2D_buff_7_data0;
   end
end
endmodule