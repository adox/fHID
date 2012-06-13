//POVRay-File created by 3d41.ulp v20110101
//C:/Projekty/fHID/sch/PKD.brd
//2012-06-06 11:30:55

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 291;
#local cam_z = -155;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -6;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 23;
#local lgt1_pos_y = 38;
#local lgt1_pos_z = 35;
#local lgt1_intense = 0.759937;
#local lgt2_pos_x = -23;
#local lgt2_pos_y = 38;
#local lgt2_pos_z = 35;
#local lgt2_intense = 0.759937;
#local lgt3_pos_x = 23;
#local lgt3_pos_y = 38;
#local lgt3_pos_z = -24;
#local lgt3_intense = 0.759937;
#local lgt4_pos_x = -23;
#local lgt4_pos_y = 38;
#local lgt4_pos_z = -24;
#local lgt4_intense = 0.759937;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 61.900000;
#declare pcb_y_size = 67.780000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(850);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-30.950000,0,-33.890000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro PKD(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><61.900000,0.000000>
<61.900000,0.000000><61.900000,67.780000>
<61.900000,67.780000><0.000000,67.780000>
<0.000000,67.780000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_CERAMIC_25MM_50MM("1n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.860000,0.000000,45.720000>}#end		//ceramic disc capacitator C1 1n C025-025X050
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("1n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<8.890000,0.000000,44.450000>}#end		//ceramic disc capacitator C2 1n C050-030X075
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_CERAMIC_25MM_50MM("100p",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<44.450000,0.000000,60.960000>}#end		//ceramic disc capacitator C3 100p C025-025X050
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_25MM_50MM("33n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<52.070000,0.000000,62.230000>}#end		//ceramic disc capacitator C4 33n C025-025X050
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_CERAMIC_25MM_50MM("33n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.370000,0.000000,34.290000>}#end		//ceramic disc capacitator C5 33n C025-025X050
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_CERAMIC_25MM_50MM("1n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<12.700000,0.000000,62.230000>}#end		//ceramic disc capacitator C6 1n C025-025X050
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_DIS_CERAMIC_25MM_50MM("2n2",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<15.240000,0.000000,62.230000>}#end		//ceramic disc capacitator C7 2n2 C025-025X050
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_DIS_CERAMIC_50MM_76MM("33n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<10.160000,0.000000,34.290000>}#end		//ceramic disc capacitator C8 33n C050-030X075
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO35_102MM_H("1N4148",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<16.510000,-1.500000,50.800000>}#end		//Diode DO35 10mm hor. D1 1N4148 DO35-10
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_DIS_DO35_102MM_H("1N4148",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<7.620000,0.000000,50.800000>}#end		//Diode DO35 10mm hor. D2 1N4148 DO35-10
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_DIS_DIP8("LM393N","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<39.370000,0.000000,26.670000>translate<0,3.000000,0> }#end		//DIP8 IC1 LM393N DIL08
#ifndef(pack_IC1) object{SOCKET_DIP8()rotate<0,-270.000000,0> rotate<0,0,0> translate<39.370000,0.000000,26.670000>}#end					//IC-Sockel 8Pin IC1 LM393N
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_DIS_DIP14("TL084P","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<52.070000,0.000000,50.800000>translate<0,3.000000,0> }#end		//DIP14 IC2 TL084P DIL14
#ifndef(pack_IC2) object{SOCKET_DIP14()rotate<0,-270.000000,0> rotate<0,0,0> translate<52.070000,0.000000,50.800000>}#end					//IC-Sockel 14Pin IC2 TL084P
#ifndef(pack_IC4) #declare global_pack_IC4=yes; object {IC_DIS_DIP20("74HC244N","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<12.700000,0.000000,15.240000>translate<0,3.000000,0> }#end		//DIP20 IC4 74HC244N DIL20
#ifndef(pack_IC4) object{SOCKET_DIP20()rotate<0,-270.000000,0> rotate<0,0,0> translate<12.700000,0.000000,15.240000>}#end					//IC-Sockel 20Pin IC4 74HC244N
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_1X7()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<55.880000,0.000000,15.240000>}#end		//Header 2,54mm Grid 7Pin 1Row (jumper.lib) JP1  1X07
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PHW_1X3()translate<0,0,-3.8> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<5.080000,0.000000,58.420000>}#end		//Header 2,54MM Grid 90deg (con-lstb.lib) JP2  1X03/90
#ifndef(pack_Q1) #declare global_pack_Q1=yes; object {TR_TO92_L("BS170",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<20.320000,0.000000,62.230000>}#end		//TO92 straight vertical Q1 BS170 TO92-
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<34.290000,0.000000,41.910000>}#end		//Discrete Resistor 0,3W 10MM Grid R1 100k 0207/10
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.370000,0.000000,19.050000>}#end		//Discrete Resistor 0,3W 10MM Grid R2 10k 0207/10
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_10MM(texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<29.210000,0.000000,30.480000>}#end		//Discrete Resistor 0,3W 10MM Grid R3 240k 0207/10
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<36.830000,0.000000,50.800000>}#end		//Discrete Resistor 0,3W 10MM Grid R4 100k 0207/10
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<48.260000,0.000000,27.940000>}#end		//Discrete Resistor 0,3W 10MM Grid R5 10k 0207/10
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_10MM(texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<50.800000,0.000000,27.940000>}#end		//Discrete Resistor 0,3W 10MM Grid R6 2,2k 0207/10
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_10MM(texture{pigment{Green*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<7.620000,0.000000,48.260000>}#end		//Discrete Resistor 0,3W 10MM Grid R7 510k 0207/10
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<44.450000,0.000000,48.260000>}#end		//Discrete Resistor 0,3W 10MM Grid R8 100k 0207/10
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<41.910000,0.000000,50.800000>}#end		//Discrete Resistor 0,3W 10MM Grid R9 10k 0207/10
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.640000,0.000000,58.420000>}#end		//Discrete Resistor 0,3W 10MM Grid R10 100k 0207/10
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_DIS_0207_10MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.590000,0.000000,26.670000>}#end		//Discrete Resistor 0,3W 10MM Grid R11 33 0207/10
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_DIS_0207_10MM(texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<24.130000,0.000000,55.880000>}#end		//Discrete Resistor 0,3W 10MM Grid R12 220 0207/10
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_DIS_0207_10MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<12.700000,0.000000,30.480000>}#end		//Discrete Resistor 0,3W 10MM Grid R13 33 0207/10
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<21.590000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.130000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<11.430000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<6.350000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<43.180000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<45.720000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<53.340000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<40.640000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<38.100000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<12.700000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<12.700000,0,63.500000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,63.500000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<12.700000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<7.620000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<16.510000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<16.510000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<2.540000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<12.700000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<43.180000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<43.180000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<43.180000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<43.180000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<48.260000,0,58.420000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<48.260000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<48.260000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<48.260000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<48.260000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<48.260000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<48.260000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,58.420000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<8.890000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<8.890000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<8.890000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<8.890000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<8.890000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<8.890000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<8.890000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<8.890000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<8.890000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<8.890000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<16.510000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<16.510000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<16.510000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<16.510000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<16.510000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<16.510000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<16.510000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<16.510000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<16.510000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<16.510000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<55.880000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<8.890000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<8.890000,0,58.420000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<8.890000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<20.320000,0,59.690000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<20.320000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<20.320000,0,64.770000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<39.370000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<29.210000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<44.450000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<34.290000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<29.210000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<29.210000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<36.830000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<36.830000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.260000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.260000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<50.800000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<50.800000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<12.700000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<2.540000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<44.450000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<44.450000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<41.910000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<41.910000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,58.420000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<45.720000,0,58.420000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_R11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<29.210000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_R12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<19.050000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<7.620000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R13) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<17.780000,0,30.480000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<23.797200,0,23.971200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<49.060500,0,12.759700> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<2.540000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<2.540000,0.000000,50.800000>}
box{<0,0,-0.350000><2.540000,0.035000,0.350000> rotate<0,90.000000,0> translate<2.540000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<2.540000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<2.540000,-1.535000,57.689000>}
box{<0,0,-0.350000><6.889000,0.035000,0.350000> rotate<0,90.000000,0> translate<2.540000,-1.535000,57.689000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<2.540000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<4.050500,-1.535000,48.260000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<2.540000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<5.472900,-1.535000,30.632400>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<5.472900,-1.535000,5.056200>}
box{<0,0,-0.350000><25.576200,0.035000,0.350000> rotate<0,-90.000000,0> translate<5.472900,-1.535000,5.056200> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.350000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.350000,0.000000,37.070500>}
box{<0,0,-0.350000><7.379500,0.035000,0.350000> rotate<0,-90.000000,0> translate<6.350000,0.000000,37.070500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<4.050500,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.350000,-1.535000,45.960500>}
box{<0,0,-0.350000><3.251984,0.035000,0.350000> rotate<0,44.997030,0> translate<4.050500,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.350000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.350000,-1.535000,45.960500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,90.000000,0> translate<6.350000,-1.535000,45.960500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<5.472900,-1.535000,5.056200>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,3.810000>}
box{<0,0,-0.350000><1.762393,0.035000,0.350000> rotate<0,44.997030,0> translate<5.472900,-1.535000,5.056200> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,11.430000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,90.000000,0> translate<6.719100,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,11.430000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,-90.000000,0> translate<6.719100,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,21.590000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,90.000000,0> translate<6.719100,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,28.068600>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,21.590000>}
box{<0,0,-0.350000><6.478600,0.035000,0.350000> rotate<0,-90.000000,0> translate<6.719100,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<7.019200,-1.535000,16.510000>}
box{<0,0,-0.350000><0.300100,0.035000,0.350000> rotate<0,0.000000,0> translate<6.719100,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,28.068600>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<7.620000,-1.535000,28.969500>}
box{<0,0,-0.350000><1.274065,0.035000,0.350000> rotate<0,-44.997030,0> translate<6.719100,-1.535000,28.068600> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<7.620000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<7.620000,-1.535000,28.969500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,-90.000000,0> translate<7.620000,-1.535000,28.969500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<5.472900,-1.535000,30.632400>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<7.620000,-1.535000,32.779500>}
box{<0,0,-0.350000><3.036458,0.035000,0.350000> rotate<0,-44.997030,0> translate<5.472900,-1.535000,30.632400> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<7.620000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<7.620000,-1.535000,32.779500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,-90.000000,0> translate<7.620000,-1.535000,32.779500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.350000,0.000000,37.070500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<7.620000,0.000000,35.800500>}
box{<0,0,-0.350000><1.796051,0.035000,0.350000> rotate<0,44.997030,0> translate<6.350000,0.000000,37.070500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<7.620000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<7.620000,0.000000,35.800500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,90.000000,0> translate<7.620000,0.000000,35.800500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<2.540000,-1.535000,57.689000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.351000,-1.535000,63.500000>}
box{<0,0,-0.350000><8.217995,0.035000,0.350000> rotate<0,-44.997030,0> translate<2.540000,-1.535000,57.689000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,3.810000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<6.719100,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,6.350000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<6.719100,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,11.430000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<6.719100,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<7.019200,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,16.510000>}
box{<0,0,-0.350000><1.870800,0.035000,0.350000> rotate<0,0.000000,0> translate<7.019200,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<6.719100,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,21.590000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<6.719100,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,35.891900>}
box{<0,0,-0.350000><19.988100,0.035000,0.350000> rotate<0,-90.000000,0> translate<8.890000,-1.535000,35.891900> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<10.760900,-1.535000,13.970000>}
box{<0,0,-0.350000><1.870900,0.035000,0.350000> rotate<0,0.000000,0> translate<8.890000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.060900,-1.535000,8.890000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<8.890000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.060900,-1.535000,19.050000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<8.890000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.060900,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.060900,-1.535000,19.050000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,-90.000000,0> translate<11.060900,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.060900,-1.535000,24.130000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<8.890000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.430000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.430000,-1.535000,45.960500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,90.000000,0> translate<11.430000,-1.535000,45.960500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.799100,-1.535000,26.670000>}
box{<0,0,-0.350000><2.909100,0.035000,0.350000> rotate<0,0.000000,0> translate<8.890000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.430000,-1.535000,45.960500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.911000,-1.535000,45.960500>}
box{<0,0,-0.350000><0.481000,0.035000,0.350000> rotate<0,0.000000,0> translate<11.430000,-1.535000,45.960500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.911000,-1.535000,45.960500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<12.700000,-1.535000,46.749500>}
box{<0,0,-0.350000><1.115815,0.035000,0.350000> rotate<0,-44.997030,0> translate<11.911000,-1.535000,45.960500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<12.700000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<12.700000,-1.535000,46.749500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,46.749500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<12.700000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<12.700000,-1.535000,48.260000>}
box{<0,0,-0.350000><2.540000,0.035000,0.350000> rotate<0,-90.000000,0> translate<12.700000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<12.700000,-1.535000,60.960000>}
box{<0,0,-0.350000><3.810000,0.035000,0.350000> rotate<0,0.000000,0> translate<8.890000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.351000,-1.535000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<12.700000,-1.535000,63.500000>}
box{<0,0,-0.350000><4.349000,0.035000,0.350000> rotate<0,0.000000,0> translate<8.351000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<12.700000,-1.535000,46.749500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<13.729500,-1.535000,45.720000>}
box{<0,0,-0.350000><1.455933,0.035000,0.350000> rotate<0,44.997030,0> translate<12.700000,-1.535000,46.749500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<12.700000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.210500,-1.535000,34.290000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<12.700000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<8.890000,-1.535000,35.891900>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.301900,-1.535000,30.480000>}
box{<0,0,-0.350000><7.653582,0.035000,0.350000> rotate<0,44.997030,0> translate<8.890000,-1.535000,35.891900> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.060900,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,8.890000>}
box{<0,0,-0.350000><3.278200,0.035000,0.350000> rotate<0,0.000000,0> translate<11.060900,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,8.890000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,90.000000,0> translate<14.339100,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,8.890000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,-90.000000,0> translate<14.339100,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<10.760900,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,13.970000>}
box{<0,0,-0.350000><3.578200,0.035000,0.350000> rotate<0,0.000000,0> translate<10.760900,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,13.970000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,-90.000000,0> translate<14.339100,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.060900,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,19.050000>}
box{<0,0,-0.350000><3.278200,0.035000,0.350000> rotate<0,0.000000,0> translate<11.060900,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<11.799100,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,24.130000>}
box{<0,0,-0.350000><3.592102,0.035000,0.350000> rotate<0,44.997030,0> translate<11.799100,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<15.240000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<15.240000,0.000000,59.320900>}
box{<0,0,-0.350000><1.639100,0.035000,0.350000> rotate<0,-90.000000,0> translate<15.240000,0.000000,59.320900> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<12.700000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<15.240000,-1.535000,60.960000>}
box{<0,0,-0.350000><2.540000,0.035000,0.350000> rotate<0,0.000000,0> translate<12.700000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<12.700000,-1.535000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<15.240000,-1.535000,63.500000>}
box{<0,0,-0.350000><2.540000,0.035000,0.350000> rotate<0,0.000000,0> translate<12.700000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,3.810000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<14.339100,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,8.890000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<14.339100,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,13.970000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<14.339100,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,19.050000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<14.339100,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.339100,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,24.130000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<14.339100,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<13.729500,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,45.720000>}
box{<0,0,-0.350000><2.780500,0.035000,0.350000> rotate<0,0.000000,0> translate<13.729500,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<15.240000,0.000000,59.320900>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,0.000000,58.050900>}
box{<0,0,-0.350000><1.796051,0.035000,0.350000> rotate<0,44.997030,0> translate<15.240000,0.000000,59.320900> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,0.000000,58.050900>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,90.000000,0> translate<16.510000,0.000000,58.050900> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<15.240000,-1.535000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.750500,-1.535000,63.500000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<15.240000,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.782600,-1.535000,60.383200>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.782600,-1.535000,63.467800>}
box{<0,0,-0.350000><3.084600,0.035000,0.350000> rotate<0,90.000000,0> translate<16.782600,-1.535000,63.467800> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.750500,-1.535000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.782700,-1.535000,63.467900>}
box{<0,0,-0.350000><0.045467,0.035000,0.350000> rotate<0,44.907929,0> translate<16.750500,-1.535000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.782600,-1.535000,63.467800>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.782700,-1.535000,63.467900>}
box{<0,0,-0.350000><0.000141,0.035000,0.350000> rotate<0,-44.997030,0> translate<16.782600,-1.535000,63.467800> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.301900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<17.780000,-1.535000,30.480000>}
box{<0,0,-0.350000><3.478100,0.035000,0.350000> rotate<0,0.000000,0> translate<14.301900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.782700,-1.535000,63.467900>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.084800,-1.535000,64.770000>}
box{<0,0,-0.350000><1.841447,0.035000,0.350000> rotate<0,-44.997030,0> translate<16.782700,-1.535000,63.467900> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.380900,-1.535000,11.430000>}
box{<0,0,-0.350000><1.870900,0.035000,0.350000> rotate<0,0.000000,0> translate<16.510000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,6.350000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<16.510000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,6.350000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,-90.000000,0> translate<18.680900,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.380900,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,11.430000>}
box{<0,0,-0.350000><0.300000,0.035000,0.350000> rotate<0,0.000000,0> translate<18.380900,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,11.430000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,-90.000000,0> translate<18.680900,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,16.510000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<16.510000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,16.510000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,-90.000000,0> translate<18.680900,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,21.590000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<16.510000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,24.130000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<16.510000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.839700,-1.535000,23.971200>}
box{<0,0,-0.350000><0.224577,0.035000,0.350000> rotate<0,44.997030,0> translate<18.680900,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<19.050000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<19.050000,0.000000,46.097600>}
box{<0,0,-0.350000><9.782400,0.035000,0.350000> rotate<0,-90.000000,0> translate<19.050000,0.000000,46.097600> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<19.050000,-1.535000,55.880000>}
box{<0,0,-0.350000><2.540000,0.035000,0.350000> rotate<0,0.000000,0> translate<16.510000,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<17.780000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<19.290500,-1.535000,30.480000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<17.780000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<19.290500,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<19.290500,-1.535000,30.961000>}
box{<0,0,-0.350000><0.481000,0.035000,0.350000> rotate<0,90.000000,0> translate<19.290500,-1.535000,30.961000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<19.290500,-1.535000,30.961000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<20.079500,-1.535000,31.750000>}
box{<0,0,-0.350000><1.115815,0.035000,0.350000> rotate<0,-44.997030,0> translate<19.290500,-1.535000,30.961000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.084800,-1.535000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<20.320000,-1.535000,64.770000>}
box{<0,0,-0.350000><2.235200,0.035000,0.350000> rotate<0,0.000000,0> translate<18.084800,-1.535000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.680900,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<21.590000,-1.535000,21.590000>}
box{<0,0,-0.350000><2.909100,0.035000,0.350000> rotate<0,0.000000,0> translate<18.680900,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<20.079500,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<21.590000,-1.535000,31.750000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<20.079500,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<21.590000,-1.535000,45.720000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,0.000000,0> translate<16.510000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<20.320000,-1.535000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<22.490900,-1.535000,62.230000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<20.320000,-1.535000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.782600,-1.535000,60.383200>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<22.796300,-1.535000,54.369500>}
box{<0,0,-0.350000><8.504656,0.035000,0.350000> rotate<0,44.997030,0> translate<16.782600,-1.535000,60.383200> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<23.100500,-1.535000,26.670000>}
box{<0,0,-0.350000><6.590500,0.035000,0.350000> rotate<0,0.000000,0> translate<16.510000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<23.100500,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<23.100500,-1.535000,26.670000>}
box{<0,0,-0.350000><7.620000,0.035000,0.350000> rotate<0,-90.000000,0> translate<23.100500,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<14.210500,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<23.100500,-1.535000,34.290000>}
box{<0,0,-0.350000><8.890000,0.035000,0.350000> rotate<0,0.000000,0> translate<14.210500,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<18.839700,-1.535000,23.971200>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<23.797200,-1.535000,23.971200>}
box{<0,0,-0.350000><4.957500,0.035000,0.350000> rotate<0,0.000000,0> translate<18.839700,-1.535000,23.971200> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<20.320000,-1.535000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<23.889500,-1.535000,59.690000>}
box{<0,0,-0.350000><3.569500,0.035000,0.350000> rotate<0,0.000000,0> translate<20.320000,-1.535000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<22.490900,-1.535000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<24.068400,-1.535000,63.807500>}
box{<0,0,-0.350000><2.230922,0.035000,0.350000> rotate<0,-44.997030,0> translate<22.490900,-1.535000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<23.100500,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<25.159500,-1.535000,26.670000>}
box{<0,0,-0.350000><2.059000,0.035000,0.350000> rotate<0,0.000000,0> translate<23.100500,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<24.130000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<25.640500,-1.535000,45.720000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<24.130000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<23.889500,-1.535000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<27.699500,-1.535000,55.880000>}
box{<0,0,-0.350000><5.388154,0.035000,0.350000> rotate<0,44.997030,0> translate<23.889500,-1.535000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<19.050000,0.000000,46.097600>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<28.077100,0.000000,37.070500>}
box{<0,0,-0.350000><12.766247,0.035000,0.350000> rotate<0,44.997030,0> translate<19.050000,0.000000,46.097600> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<28.077100,0.000000,37.070500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<29.210000,0.000000,37.070500>}
box{<0,0,-0.350000><1.132900,0.035000,0.350000> rotate<0,0.000000,0> translate<28.077100,0.000000,37.070500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<29.210000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<29.210000,0.000000,37.070500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,90.000000,0> translate<29.210000,0.000000,37.070500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<23.100500,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<29.210000,-1.535000,40.399500>}
box{<0,0,-0.350000><8.640138,0.035000,0.350000> rotate<0,-44.997030,0> translate<23.100500,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<29.210000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<29.210000,-1.535000,40.399500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,-90.000000,0> translate<29.210000,-1.535000,40.399500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<27.699500,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<29.210000,-1.535000,55.880000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<27.699500,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<29.210000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<30.720500,-1.535000,41.910000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<29.210000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<23.797200,0.000000,23.971200>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<31.525000,0.000000,16.243400>}
box{<0,0,-0.350000><10.928760,0.035000,0.350000> rotate<0,44.997030,0> translate<23.797200,0.000000,23.971200> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<25.640500,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<32.427800,-1.535000,52.507300>}
box{<0,0,-0.350000><9.598692,0.035000,0.350000> rotate<0,-44.997030,0> translate<25.640500,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<30.720500,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<32.493500,-1.535000,43.683000>}
box{<0,0,-0.350000><2.507401,0.035000,0.350000> rotate<0,-44.997030,0> translate<30.720500,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<32.493500,-1.535000,43.683000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<32.628600,-1.535000,43.683000>}
box{<0,0,-0.350000><0.135100,0.035000,0.350000> rotate<0,0.000000,0> translate<32.493500,-1.535000,43.683000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<32.628600,-1.535000,43.683000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<32.693100,-1.535000,43.747500>}
box{<0,0,-0.350000><0.091217,0.035000,0.350000> rotate<0,-44.997030,0> translate<32.628600,-1.535000,43.683000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<25.159500,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<32.779500,-1.535000,19.050000>}
box{<0,0,-0.350000><10.776307,0.035000,0.350000> rotate<0,44.997030,0> translate<25.159500,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<22.796300,-1.535000,54.369500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<33.809000,-1.535000,54.369500>}
box{<0,0,-0.350000><11.012700,0.035000,0.350000> rotate<0,0.000000,0> translate<22.796300,-1.535000,54.369500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<34.032000,-1.535000,31.732500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<34.032000,-1.535000,29.468000>}
box{<0,0,-0.350000><2.264500,0.035000,0.350000> rotate<0,-90.000000,0> translate<34.032000,-1.535000,29.468000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<34.290000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<34.290000,-1.535000,15.240000>}
box{<0,0,-0.350000><3.810000,0.035000,0.350000> rotate<0,-90.000000,0> translate<34.290000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<32.779500,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<34.290000,-1.535000,19.050000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<32.779500,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.292100,0.000000,52.831600>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.292100,0.000000,38.608400>}
box{<0,0,-0.350000><14.223200,0.035000,0.350000> rotate<0,-90.000000,0> translate<35.292100,0.000000,38.608400> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<33.809000,-1.535000,54.369500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.319500,-1.535000,55.880000>}
box{<0,0,-0.350000><2.136170,0.035000,0.350000> rotate<0,-44.997030,0> translate<33.809000,-1.535000,54.369500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<34.290000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.560000,-1.535000,13.970000>}
box{<0,0,-0.350000><1.796051,0.035000,0.350000> rotate<0,44.997030,0> translate<34.290000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<29.210000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.560000,-1.535000,25.400000>}
box{<0,0,-0.350000><6.350000,0.035000,0.350000> rotate<0,0.000000,0> translate<29.210000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<34.032000,-1.535000,29.468000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.560000,-1.535000,27.940000>}
box{<0,0,-0.350000><2.160918,0.035000,0.350000> rotate<0,44.997030,0> translate<34.032000,-1.535000,29.468000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.560000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.481100,-1.535000,23.781100>}
box{<0,0,-0.350000><1.302632,0.035000,0.350000> rotate<0,-44.997030,0> translate<35.560000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<34.032000,-1.535000,31.732500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.589500,-1.535000,34.290000>}
box{<0,0,-0.350000><3.616851,0.035000,0.350000> rotate<0,-44.997030,0> translate<34.032000,-1.535000,31.732500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,0.000000,44.209500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,-90.000000,0> translate<36.830000,0.000000,44.209500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.292100,0.000000,52.831600>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,0.000000,54.369500>}
box{<0,0,-0.350000><2.174919,0.035000,0.350000> rotate<0,-44.997030,0> translate<35.292100,0.000000,52.831600> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,0.000000,55.124800>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,0.000000,54.369500>}
box{<0,0,-0.350000><0.755300,0.035000,0.350000> rotate<0,-90.000000,0> translate<36.830000,0.000000,54.369500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.319500,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,-1.535000,55.880000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<35.319500,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,0.000000,55.124800>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,0.000000,55.880000>}
box{<0,0,-0.350000><0.755200,0.035000,0.350000> rotate<0,90.000000,0> translate<36.830000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,0.000000,57.390500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,90.000000,0> translate<36.830000,0.000000,57.390500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.481100,-1.535000,23.781100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<37.111300,-1.535000,24.411300>}
box{<0,0,-0.350000><0.891237,0.035000,0.350000> rotate<0,-44.997030,0> translate<36.481100,-1.535000,23.781100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<37.111300,-1.535000,26.388700>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<37.111300,-1.535000,24.411300>}
box{<0,0,-0.350000><1.977400,0.035000,0.350000> rotate<0,-90.000000,0> translate<37.111300,-1.535000,24.411300> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.560000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<37.111300,-1.535000,26.388700>}
box{<0,0,-0.350000><2.193869,0.035000,0.350000> rotate<0,44.997030,0> translate<35.560000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<37.859500,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<37.859500,0.000000,41.910000>}
box{<0,0,-0.350000><1.270000,0.035000,0.350000> rotate<0,-90.000000,0> translate<37.859500,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,0.000000,44.209500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<37.859500,0.000000,43.180000>}
box{<0,0,-0.350000><1.455933,0.035000,0.350000> rotate<0,44.997030,0> translate<36.830000,0.000000,44.209500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.560000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<37.859500,-1.535000,58.420000>}
box{<0,0,-0.350000><2.299500,0.035000,0.350000> rotate<0,0.000000,0> translate<35.560000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.589500,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<38.100000,-1.535000,34.290000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<36.589500,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.292100,0.000000,38.608400>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<38.100000,0.000000,35.800500>}
box{<0,0,-0.350000><3.970970,0.035000,0.350000> rotate<0,44.997030,0> translate<35.292100,0.000000,38.608400> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<38.100000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<38.100000,0.000000,35.800500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,90.000000,0> translate<38.100000,0.000000,35.800500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<38.340500,-1.535000,45.720000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<36.830000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<32.693100,-1.535000,43.747500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<38.405800,-1.535000,49.460200>}
box{<0,0,-0.350000><8.078978,0.035000,0.350000> rotate<0,-44.997030,0> translate<32.693100,-1.535000,43.747500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<16.510000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<38.469100,-1.535000,3.810000>}
box{<0,0,-0.350000><21.959100,0.035000,0.350000> rotate<0,0.000000,0> translate<16.510000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<37.859500,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<39.370000,0.000000,41.910000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<37.859500,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<39.439800,-1.535000,26.600200>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<39.439800,-1.535000,22.549700>}
box{<0,0,-0.350000><4.050500,0.035000,0.350000> rotate<0,-90.000000,0> translate<39.439800,-1.535000,22.549700> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<35.560000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<39.439800,-1.535000,26.600200>}
box{<0,0,-0.350000><5.486866,0.035000,0.350000> rotate<0,44.997030,0> translate<35.560000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<37.859500,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.399500,-1.535000,55.880000>}
box{<0,0,-0.350000><3.592102,0.035000,0.350000> rotate<0,44.997030,0> translate<37.859500,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.640000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.640000,-1.535000,32.779500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,-90.000000,0> translate<40.640000,-1.535000,32.779500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<32.693100,-1.535000,43.747500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.640000,-1.535000,35.800500>}
box{<0,0,-0.350000><11.238684,0.035000,0.350000> rotate<0,44.997391,0> translate<32.693100,-1.535000,43.747500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.640000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.640000,-1.535000,35.800500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,90.000000,0> translate<40.640000,-1.535000,35.800500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<38.405800,-1.535000,49.460200>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.757000,-1.535000,49.460200>}
box{<0,0,-0.350000><2.351200,0.035000,0.350000> rotate<0,0.000000,0> translate<38.405800,-1.535000,49.460200> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.640000,-1.535000,32.779500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.880500,-1.535000,32.779500>}
box{<0,0,-0.350000><0.240500,0.035000,0.350000> rotate<0,0.000000,0> translate<40.640000,-1.535000,32.779500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<38.340500,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.880500,-1.535000,48.260000>}
box{<0,0,-0.350000><3.592102,0.035000,0.350000> rotate<0,-44.997030,0> translate<38.340500,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<38.469100,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.009100,-1.535000,6.350000>}
box{<0,0,-0.350000><3.592102,0.035000,0.350000> rotate<0,-44.997030,0> translate<38.469100,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.757000,-1.535000,49.460200>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.067400,-1.535000,49.770600>}
box{<0,0,-0.350000><0.438972,0.035000,0.350000> rotate<0,-44.997030,0> translate<40.757000,-1.535000,49.460200> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.665800,-1.535000,26.425800>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.665800,-1.535000,22.237900>}
box{<0,0,-0.350000><4.187900,0.035000,0.350000> rotate<0,-90.000000,0> translate<41.665800,-1.535000,22.237900> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.910000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.910000,-1.535000,44.209500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,-90.000000,0> translate<41.910000,-1.535000,44.209500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.399500,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.910000,-1.535000,55.880000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<40.399500,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.910000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.910000,0.000000,57.390500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,90.000000,0> translate<41.910000,0.000000,57.390500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.830000,0.000000,57.390500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.910100,0.000000,62.470600>}
box{<0,0,-0.350000><7.184346,0.035000,0.350000> rotate<0,-44.997030,0> translate<36.830000,0.000000,57.390500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<32.427800,-1.535000,52.507300>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.106800,-1.535000,52.507300>}
box{<0,0,-0.350000><9.679000,0.035000,0.350000> rotate<0,0.000000,0> translate<32.427800,-1.535000,52.507300> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.665800,-1.535000,22.237900>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.554900,-1.535000,21.348800>}
box{<0,0,-0.350000><1.257377,0.035000,0.350000> rotate<0,44.997030,0> translate<41.665800,-1.535000,22.237900> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<36.481100,-1.535000,23.781100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.772100,-1.535000,17.490100>}
box{<0,0,-0.350000><8.896818,0.035000,0.350000> rotate<0,44.997030,0> translate<36.481100,-1.535000,23.781100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<39.439800,-1.535000,22.549700>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.939500,-1.535000,19.050000>}
box{<0,0,-0.350000><4.949323,0.035000,0.350000> rotate<0,44.997030,0> translate<39.439800,-1.535000,22.549700> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.910000,-1.535000,44.209500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.939500,-1.535000,43.180000>}
box{<0,0,-0.350000><1.455933,0.035000,0.350000> rotate<0,44.997030,0> translate<41.910000,-1.535000,44.209500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.106800,-1.535000,52.507300>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.939500,-1.535000,53.340000>}
box{<0,0,-0.350000><1.177616,0.035000,0.350000> rotate<0,-44.997030,0> translate<42.106800,-1.535000,52.507300> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.009100,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,-1.535000,6.350000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<41.009100,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,-1.535000,17.490100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,-1.535000,13.970000>}
box{<0,0,-0.350000><3.520100,0.035000,0.350000> rotate<0,-90.000000,0> translate<43.180000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.772100,-1.535000,17.490100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,-1.535000,17.490100>}
box{<0,0,-0.350000><0.407900,0.035000,0.350000> rotate<0,0.000000,0> translate<42.772100,-1.535000,17.490100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.665800,-1.535000,26.425800>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,-1.535000,27.940000>}
box{<0,0,-0.350000><2.141402,0.035000,0.350000> rotate<0,-44.997030,0> translate<41.665800,-1.535000,26.425800> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.880500,-1.535000,32.779500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,-1.535000,30.480000>}
box{<0,0,-0.350000><3.251984,0.035000,0.350000> rotate<0,44.997030,0> translate<40.880500,-1.535000,32.779500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.910000,0.000000,57.390500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,0.000000,58.660500>}
box{<0,0,-0.350000><1.796051,0.035000,0.350000> rotate<0,-44.997030,0> translate<41.910000,0.000000,57.390500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,0.000000,58.660500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,0.000000,60.960000>}
box{<0,0,-0.350000><2.299500,0.035000,0.350000> rotate<0,90.000000,0> translate<43.180000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.939500,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.694800,-1.535000,19.050000>}
box{<0,0,-0.350000><0.755300,0.035000,0.350000> rotate<0,0.000000,0> translate<42.939500,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.694800,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<44.450000,-1.535000,19.050000>}
box{<0,0,-0.350000><0.755200,0.035000,0.350000> rotate<0,0.000000,0> translate<43.694800,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.939500,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<44.450000,-1.535000,43.180000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<42.939500,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.939500,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<44.450000,-1.535000,53.340000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<42.939500,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.380600,-1.535000,25.400000>}
box{<0,0,-0.350000><2.200600,0.035000,0.350000> rotate<0,0.000000,0> translate<43.180000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<31.525000,0.000000,16.243400>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.576800,0.000000,16.243400>}
box{<0,0,-0.350000><14.051800,0.035000,0.350000> rotate<0,0.000000,0> translate<31.525000,0.000000,16.243400> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.720000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.720000,0.000000,56.909500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,-90.000000,0> translate<45.720000,0.000000,56.909500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.720000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.720000,-1.535000,59.449500>}
box{<0,0,-0.350000><1.029500,0.035000,0.350000> rotate<0,90.000000,0> translate<45.720000,-1.535000,59.449500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.720000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.720000,-1.535000,59.449500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,-90.000000,0> translate<45.720000,-1.535000,59.449500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<44.450000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.960500,-1.535000,19.050000>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<44.450000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.720000,0.000000,56.909500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.964400,0.000000,56.665100>}
box{<0,0,-0.350000><0.345634,0.035000,0.350000> rotate<0,44.997030,0> translate<45.720000,0.000000,56.909500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.964400,0.000000,39.366100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.964400,0.000000,56.665100>}
box{<0,0,-0.350000><17.299000,0.035000,0.350000> rotate<0,90.000000,0> translate<45.964400,0.000000,56.665100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.089100,-1.535000,50.174400>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.089100,-1.535000,50.800000>}
box{<0,0,-0.350000><0.625600,0.035000,0.350000> rotate<0,90.000000,0> translate<46.089100,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.720000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.089100,-1.535000,58.420000>}
box{<0,0,-0.350000><0.369100,0.035000,0.350000> rotate<0,0.000000,0> translate<45.720000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.067400,-1.535000,49.770600>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.203200,-1.535000,49.770600>}
box{<0,0,-0.350000><5.135800,0.035000,0.350000> rotate<0,0.000000,0> translate<41.067400,-1.535000,49.770600> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.203200,-1.535000,49.770600>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.348000,-1.535000,49.915400>}
box{<0,0,-0.350000><0.204778,0.035000,0.350000> rotate<0,-44.997030,0> translate<46.203200,-1.535000,49.770600> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.089100,-1.535000,50.174400>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.348000,-1.535000,49.915500>}
box{<0,0,-0.350000><0.366140,0.035000,0.350000> rotate<0,44.997030,0> translate<46.089100,-1.535000,50.174400> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.348000,-1.535000,49.915400>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.348000,-1.535000,49.915500>}
box{<0,0,-0.350000><0.000100,0.035000,0.350000> rotate<0,90.000000,0> translate<46.348000,-1.535000,49.915500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.910100,0.000000,62.470600>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.367400,0.000000,62.470600>}
box{<0,0,-0.350000><4.457300,0.035000,0.350000> rotate<0,0.000000,0> translate<41.910100,0.000000,62.470600> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.749500,-1.535000,31.509500>}
box{<0,0,-0.350000><5.048035,0.035000,0.350000> rotate<0,-44.997030,0> translate<43.180000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.132400,-1.535000,6.350000>}
box{<0,0,-0.350000><4.952400,0.035000,0.350000> rotate<0,0.000000,0> translate<43.180000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.367400,0.000000,62.470600>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.143900,0.000000,60.694100>}
box{<0,0,-0.350000><2.512350,0.035000,0.350000> rotate<0,44.997030,0> translate<46.367400,0.000000,62.470600> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,22.860000>}
box{<0,0,-0.350000><5.080000,0.035000,0.350000> rotate<0,0.000000,0> translate<43.180000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.749500,-1.535000,31.509500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,31.509500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,0.000000,0> translate<46.749500,-1.535000,31.509500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,31.509500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,-90.000000,0> translate<48.260000,-1.535000,31.509500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<44.450000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,43.180000>}
box{<0,0,-0.350000><3.810000,0.035000,0.350000> rotate<0,0.000000,0> translate<44.450000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,45.720000>}
box{<0,0,-0.350000><2.540000,0.035000,0.350000> rotate<0,90.000000,0> translate<48.260000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<40.880500,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,48.260000>}
box{<0,0,-0.350000><7.379500,0.035000,0.350000> rotate<0,0.000000,0> translate<40.880500,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.089100,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,50.800000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<46.089100,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<44.450000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,53.340000>}
box{<0,0,-0.350000><3.810000,0.035000,0.350000> rotate<0,0.000000,0> translate<44.450000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<41.910000,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,55.880000>}
box{<0,0,-0.350000><6.350000,0.035000,0.350000> rotate<0,0.000000,0> translate<41.910000,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<46.089100,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,58.420000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<46.089100,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.576800,0.000000,16.243400>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<49.060500,0.000000,12.759700>}
box{<0,0,-0.350000><4.926696,0.035000,0.350000> rotate<0,44.997030,0> translate<45.576800,0.000000,16.243400> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<49.060500,-1.535000,12.759700>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<49.120200,-1.535000,12.700000>}
box{<0,0,-0.350000><0.084429,0.035000,0.350000> rotate<0,44.997030,0> translate<49.060500,-1.535000,12.759700> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.130900,-1.535000,50.800000>}
box{<0,0,-0.350000><1.870900,0.035000,0.350000> rotate<0,0.000000,0> translate<48.260000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.430900,-1.535000,43.180000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<48.260000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.430900,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.430900,-1.535000,45.043400>}
box{<0,0,-0.350000><5.756600,0.035000,0.350000> rotate<0,-90.000000,0> translate<50.430900,-1.535000,45.043400> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.130900,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.430900,-1.535000,50.800000>}
box{<0,0,-0.350000><0.300000,0.035000,0.350000> rotate<0,0.000000,0> translate<50.130900,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.430900,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.430900,-1.535000,60.350400>}
box{<0,0,-0.350000><9.550400,0.035000,0.350000> rotate<0,90.000000,0> translate<50.430900,-1.535000,60.350400> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.260000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.800000,-1.535000,22.860000>}
box{<0,0,-0.350000><2.540000,0.035000,0.350000> rotate<0,0.000000,0> translate<48.260000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.964400,0.000000,39.366100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.800000,0.000000,34.530500>}
box{<0,0,-0.350000><6.838571,0.035000,0.350000> rotate<0,44.997030,0> translate<45.964400,0.000000,39.366100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.800000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.800000,0.000000,34.530500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,90.000000,0> translate<50.800000,0.000000,34.530500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.430900,-1.535000,60.350400>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.800000,-1.535000,60.719500>}
box{<0,0,-0.350000><0.521986,0.035000,0.350000> rotate<0,-44.997030,0> translate<50.430900,-1.535000,60.350400> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.800000,-1.535000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.800000,-1.535000,60.719500>}
box{<0,0,-0.350000><1.510500,0.035000,0.350000> rotate<0,-90.000000,0> translate<50.800000,-1.535000,60.719500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.143900,0.000000,60.694100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<51.804100,0.000000,60.694100>}
box{<0,0,-0.350000><3.660200,0.035000,0.350000> rotate<0,0.000000,0> translate<48.143900,0.000000,60.694100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<48.132400,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<51.942400,-1.535000,10.160000>}
box{<0,0,-0.350000><5.388154,0.035000,0.350000> rotate<0,-44.997030,0> translate<48.132400,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<42.554900,-1.535000,21.348800>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<51.994700,-1.535000,21.348800>}
box{<0,0,-0.350000><9.439800,0.035000,0.350000> rotate<0,0.000000,0> translate<42.554900,-1.535000,21.348800> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.960500,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<52.235900,-1.535000,19.050000>}
box{<0,0,-0.350000><6.275400,0.035000,0.350000> rotate<0,0.000000,0> translate<45.960500,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<45.380600,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<52.359700,-1.535000,32.379100>}
box{<0,0,-0.350000><9.869938,0.035000,0.350000> rotate<0,-44.997030,0> translate<45.380600,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<52.359700,-1.535000,41.251200>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<52.359700,-1.535000,32.379100>}
box{<0,0,-0.350000><8.872100,0.035000,0.350000> rotate<0,-90.000000,0> translate<52.359700,-1.535000,32.379100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.430900,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<52.359700,-1.535000,41.251200>}
box{<0,0,-0.350000><2.727735,0.035000,0.350000> rotate<0,44.997030,0> translate<50.430900,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<43.180000,-1.535000,17.490100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.216000,-1.535000,17.490100>}
box{<0,0,-0.350000><10.036000,0.035000,0.350000> rotate<0,0.000000,0> translate<43.180000,-1.535000,17.490100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.340000,-1.535000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.340000,-1.535000,51.169100>}
box{<0,0,-0.350000><11.060900,0.035000,0.350000> rotate<0,-90.000000,0> translate<53.340000,-1.535000,51.169100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<51.804100,0.000000,60.694100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.340000,0.000000,62.230000>}
box{<0,0,-0.350000><2.172091,0.035000,0.350000> rotate<0,-44.997030,0> translate<51.804100,0.000000,60.694100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.216000,-1.535000,17.490100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.505900,-1.535000,17.780000>}
box{<0,0,-0.350000><0.409981,0.035000,0.350000> rotate<0,-44.997030,0> translate<53.216000,-1.535000,17.490100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<52.235900,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.505900,-1.535000,20.320000>}
box{<0,0,-0.350000><1.796051,0.035000,0.350000> rotate<0,-44.997030,0> translate<52.235900,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<51.994700,-1.535000,21.348800>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.505900,-1.535000,22.860000>}
box{<0,0,-0.350000><2.137160,0.035000,0.350000> rotate<0,-44.997030,0> translate<51.994700,-1.535000,21.348800> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.340000,-1.535000,51.169100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.709100,-1.535000,50.800000>}
box{<0,0,-0.350000><0.521986,0.035000,0.350000> rotate<0,44.997030,0> translate<53.340000,-1.535000,51.169100> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<24.068400,-1.535000,63.807500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.902000,-1.535000,63.807500>}
box{<0,0,-0.350000><29.833600,0.035000,0.350000> rotate<0,0.000000,0> translate<24.068400,-1.535000,63.807500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<51.942400,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<55.880000,-1.535000,10.160000>}
box{<0,0,-0.350000><3.937600,0.035000,0.350000> rotate<0,0.000000,0> translate<51.942400,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<49.120200,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<55.880000,-1.535000,12.700000>}
box{<0,0,-0.350000><6.759800,0.035000,0.350000> rotate<0,0.000000,0> translate<49.120200,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.505900,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<55.880000,-1.535000,17.780000>}
box{<0,0,-0.350000><2.374100,0.035000,0.350000> rotate<0,0.000000,0> translate<53.505900,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.505900,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<55.880000,-1.535000,20.320000>}
box{<0,0,-0.350000><2.374100,0.035000,0.350000> rotate<0,0.000000,0> translate<53.505900,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.505900,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<55.880000,-1.535000,22.860000>}
box{<0,0,-0.350000><2.374100,0.035000,0.350000> rotate<0,0.000000,0> translate<53.505900,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.709100,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<55.880000,-1.535000,50.800000>}
box{<0,0,-0.350000><2.170900,0.035000,0.350000> rotate<0,0.000000,0> translate<53.709100,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<55.880000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<58.254100,-1.535000,7.620000>}
box{<0,0,-0.350000><2.374100,0.035000,0.350000> rotate<0,0.000000,0> translate<55.880000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<55.880000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<58.254100,-1.535000,15.240000>}
box{<0,0,-0.350000><2.374100,0.035000,0.350000> rotate<0,0.000000,0> translate<55.880000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<58.254100,-1.535000,37.220200>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<58.254100,-1.535000,15.240000>}
box{<0,0,-0.350000><21.980200,0.035000,0.350000> rotate<0,-90.000000,0> translate<58.254100,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<50.430900,-1.535000,45.043400>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<58.254100,-1.535000,37.220200>}
box{<0,0,-0.350000><11.063676,0.035000,0.350000> rotate<0,44.997030,0> translate<50.430900,-1.535000,45.043400> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<58.254100,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<59.454200,-1.535000,8.820100>}
box{<0,0,-0.350000><1.697198,0.035000,0.350000> rotate<0,-44.997030,0> translate<58.254100,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<53.902000,-1.535000,63.807500>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<59.454200,-1.535000,58.255300>}
box{<0,0,-0.350000><7.851997,0.035000,0.350000> rotate<0,44.997030,0> translate<53.902000,-1.535000,63.807500> }
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<59.454200,-1.535000,8.820100>}
cylinder{<0,0,0><0,0.035000,0>0.350000 translate<59.454200,-1.535000,58.255300>}
box{<0,0,-0.350000><49.435200,0.035000,0.350000> rotate<0,90.000000,0> translate<59.454200,-1.535000,58.255300> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
texture{col_pol}
}
#end
union{
cylinder{<21.590000,0.038000,45.720000><21.590000,-1.538000,45.720000>0.406400}
cylinder{<24.130000,0.038000,45.720000><24.130000,-1.538000,45.720000>0.406400}
cylinder{<11.430000,0.038000,44.450000><11.430000,-1.538000,44.450000>0.406400}
cylinder{<6.350000,0.038000,44.450000><6.350000,-1.538000,44.450000>0.406400}
cylinder{<43.180000,0.038000,60.960000><43.180000,-1.538000,60.960000>0.406400}
cylinder{<45.720000,0.038000,60.960000><45.720000,-1.538000,60.960000>0.406400}
cylinder{<50.800000,0.038000,62.230000><50.800000,-1.538000,62.230000>0.406400}
cylinder{<53.340000,0.038000,62.230000><53.340000,-1.538000,62.230000>0.406400}
cylinder{<40.640000,0.038000,34.290000><40.640000,-1.538000,34.290000>0.406400}
cylinder{<38.100000,0.038000,34.290000><38.100000,-1.538000,34.290000>0.406400}
cylinder{<12.700000,0.038000,60.960000><12.700000,-1.538000,60.960000>0.406400}
cylinder{<12.700000,0.038000,63.500000><12.700000,-1.538000,63.500000>0.406400}
cylinder{<15.240000,0.038000,60.960000><15.240000,-1.538000,60.960000>0.406400}
cylinder{<15.240000,0.038000,63.500000><15.240000,-1.538000,63.500000>0.406400}
cylinder{<12.700000,0.038000,34.290000><12.700000,-1.538000,34.290000>0.406400}
cylinder{<7.620000,0.038000,34.290000><7.620000,-1.538000,34.290000>0.406400}
cylinder{<16.510000,0.038000,55.880000><16.510000,-1.538000,55.880000>0.406400}
cylinder{<16.510000,0.038000,45.720000><16.510000,-1.538000,45.720000>0.406400}
cylinder{<2.540000,0.038000,50.800000><2.540000,-1.538000,50.800000>0.406400}
cylinder{<12.700000,0.038000,50.800000><12.700000,-1.538000,50.800000>0.406400}
cylinder{<35.560000,0.038000,30.480000><35.560000,-1.538000,30.480000>0.406400}
cylinder{<35.560000,0.038000,27.940000><35.560000,-1.538000,27.940000>0.406400}
cylinder{<35.560000,0.038000,25.400000><35.560000,-1.538000,25.400000>0.406400}
cylinder{<35.560000,0.038000,22.860000><35.560000,-1.538000,22.860000>0.406400}
cylinder{<43.180000,0.038000,22.860000><43.180000,-1.538000,22.860000>0.406400}
cylinder{<43.180000,0.038000,25.400000><43.180000,-1.538000,25.400000>0.406400}
cylinder{<43.180000,0.038000,27.940000><43.180000,-1.538000,27.940000>0.406400}
cylinder{<43.180000,0.038000,30.480000><43.180000,-1.538000,30.480000>0.406400}
cylinder{<48.260000,0.038000,58.420000><48.260000,-1.538000,58.420000>0.406400}
cylinder{<48.260000,0.038000,55.880000><48.260000,-1.538000,55.880000>0.406400}
cylinder{<48.260000,0.038000,53.340000><48.260000,-1.538000,53.340000>0.406400}
cylinder{<48.260000,0.038000,50.800000><48.260000,-1.538000,50.800000>0.406400}
cylinder{<48.260000,0.038000,48.260000><48.260000,-1.538000,48.260000>0.406400}
cylinder{<48.260000,0.038000,45.720000><48.260000,-1.538000,45.720000>0.406400}
cylinder{<48.260000,0.038000,43.180000><48.260000,-1.538000,43.180000>0.406400}
cylinder{<55.880000,0.038000,43.180000><55.880000,-1.538000,43.180000>0.406400}
cylinder{<55.880000,0.038000,45.720000><55.880000,-1.538000,45.720000>0.406400}
cylinder{<55.880000,0.038000,48.260000><55.880000,-1.538000,48.260000>0.406400}
cylinder{<55.880000,0.038000,50.800000><55.880000,-1.538000,50.800000>0.406400}
cylinder{<55.880000,0.038000,53.340000><55.880000,-1.538000,53.340000>0.406400}
cylinder{<55.880000,0.038000,55.880000><55.880000,-1.538000,55.880000>0.406400}
cylinder{<55.880000,0.038000,58.420000><55.880000,-1.538000,58.420000>0.406400}
cylinder{<35.560000,0.038000,13.970000><35.560000,-1.538000,13.970000>0.406400}
cylinder{<35.560000,0.038000,11.430000><35.560000,-1.538000,11.430000>0.406400}
cylinder{<35.560000,0.038000,8.890000><35.560000,-1.538000,8.890000>0.406400}
cylinder{<35.560000,0.038000,6.350000><35.560000,-1.538000,6.350000>0.406400}
cylinder{<43.180000,0.038000,6.350000><43.180000,-1.538000,6.350000>0.406400}
cylinder{<43.180000,0.038000,8.890000><43.180000,-1.538000,8.890000>0.406400}
cylinder{<43.180000,0.038000,11.430000><43.180000,-1.538000,11.430000>0.406400}
cylinder{<43.180000,0.038000,13.970000><43.180000,-1.538000,13.970000>0.406400}
cylinder{<8.890000,0.038000,26.670000><8.890000,-1.538000,26.670000>0.406400}
cylinder{<8.890000,0.038000,24.130000><8.890000,-1.538000,24.130000>0.406400}
cylinder{<8.890000,0.038000,21.590000><8.890000,-1.538000,21.590000>0.406400}
cylinder{<8.890000,0.038000,19.050000><8.890000,-1.538000,19.050000>0.406400}
cylinder{<8.890000,0.038000,16.510000><8.890000,-1.538000,16.510000>0.406400}
cylinder{<8.890000,0.038000,13.970000><8.890000,-1.538000,13.970000>0.406400}
cylinder{<8.890000,0.038000,11.430000><8.890000,-1.538000,11.430000>0.406400}
cylinder{<8.890000,0.038000,8.890000><8.890000,-1.538000,8.890000>0.406400}
cylinder{<8.890000,0.038000,6.350000><8.890000,-1.538000,6.350000>0.406400}
cylinder{<8.890000,0.038000,3.810000><8.890000,-1.538000,3.810000>0.406400}
cylinder{<16.510000,0.038000,3.810000><16.510000,-1.538000,3.810000>0.406400}
cylinder{<16.510000,0.038000,6.350000><16.510000,-1.538000,6.350000>0.406400}
cylinder{<16.510000,0.038000,8.890000><16.510000,-1.538000,8.890000>0.406400}
cylinder{<16.510000,0.038000,11.430000><16.510000,-1.538000,11.430000>0.406400}
cylinder{<16.510000,0.038000,13.970000><16.510000,-1.538000,13.970000>0.406400}
cylinder{<16.510000,0.038000,16.510000><16.510000,-1.538000,16.510000>0.406400}
cylinder{<16.510000,0.038000,19.050000><16.510000,-1.538000,19.050000>0.406400}
cylinder{<16.510000,0.038000,21.590000><16.510000,-1.538000,21.590000>0.406400}
cylinder{<16.510000,0.038000,24.130000><16.510000,-1.538000,24.130000>0.406400}
cylinder{<16.510000,0.038000,26.670000><16.510000,-1.538000,26.670000>0.406400}
cylinder{<55.880000,0.038000,22.860000><55.880000,-1.538000,22.860000>0.508000}
cylinder{<55.880000,0.038000,20.320000><55.880000,-1.538000,20.320000>0.508000}
cylinder{<55.880000,0.038000,17.780000><55.880000,-1.538000,17.780000>0.508000}
cylinder{<55.880000,0.038000,15.240000><55.880000,-1.538000,15.240000>0.508000}
cylinder{<55.880000,0.038000,12.700000><55.880000,-1.538000,12.700000>0.508000}
cylinder{<55.880000,0.038000,10.160000><55.880000,-1.538000,10.160000>0.508000}
cylinder{<55.880000,0.038000,7.620000><55.880000,-1.538000,7.620000>0.508000}
cylinder{<8.890000,0.038000,55.880000><8.890000,-1.538000,55.880000>0.508000}
cylinder{<8.890000,0.038000,58.420000><8.890000,-1.538000,58.420000>0.508000}
cylinder{<8.890000,0.038000,60.960000><8.890000,-1.538000,60.960000>0.508000}
cylinder{<20.320000,0.038000,59.690000><20.320000,-1.538000,59.690000>0.406400}
cylinder{<20.320000,0.038000,62.230000><20.320000,-1.538000,62.230000>0.406400}
cylinder{<20.320000,0.038000,64.770000><20.320000,-1.538000,64.770000>0.406400}
cylinder{<39.370000,0.038000,41.910000><39.370000,-1.538000,41.910000>0.406400}
cylinder{<29.210000,0.038000,41.910000><29.210000,-1.538000,41.910000>0.406400}
cylinder{<44.450000,0.038000,19.050000><44.450000,-1.538000,19.050000>0.406400}
cylinder{<34.290000,0.038000,19.050000><34.290000,-1.538000,19.050000>0.406400}
cylinder{<29.210000,0.038000,35.560000><29.210000,-1.538000,35.560000>0.406400}
cylinder{<29.210000,0.038000,25.400000><29.210000,-1.538000,25.400000>0.406400}
cylinder{<36.830000,0.038000,55.880000><36.830000,-1.538000,55.880000>0.406400}
cylinder{<36.830000,0.038000,45.720000><36.830000,-1.538000,45.720000>0.406400}
cylinder{<48.260000,0.038000,22.860000><48.260000,-1.538000,22.860000>0.406400}
cylinder{<48.260000,0.038000,33.020000><48.260000,-1.538000,33.020000>0.406400}
cylinder{<50.800000,0.038000,33.020000><50.800000,-1.538000,33.020000>0.406400}
cylinder{<50.800000,0.038000,22.860000><50.800000,-1.538000,22.860000>0.406400}
cylinder{<12.700000,0.038000,48.260000><12.700000,-1.538000,48.260000>0.406400}
cylinder{<2.540000,0.038000,48.260000><2.540000,-1.538000,48.260000>0.406400}
cylinder{<44.450000,0.038000,53.340000><44.450000,-1.538000,53.340000>0.406400}
cylinder{<44.450000,0.038000,43.180000><44.450000,-1.538000,43.180000>0.406400}
cylinder{<41.910000,0.038000,45.720000><41.910000,-1.538000,45.720000>0.406400}
cylinder{<41.910000,0.038000,55.880000><41.910000,-1.538000,55.880000>0.406400}
cylinder{<35.560000,0.038000,58.420000><35.560000,-1.538000,58.420000>0.406400}
cylinder{<45.720000,0.038000,58.420000><45.720000,-1.538000,58.420000>0.406400}
cylinder{<21.590000,0.038000,21.590000><21.590000,-1.538000,21.590000>0.406400}
cylinder{<21.590000,0.038000,31.750000><21.590000,-1.538000,31.750000>0.406400}
cylinder{<29.210000,0.038000,55.880000><29.210000,-1.538000,55.880000>0.406400}
cylinder{<19.050000,0.038000,55.880000><19.050000,-1.538000,55.880000>0.406400}
cylinder{<7.620000,0.038000,30.480000><7.620000,-1.538000,30.480000>0.406400}
cylinder{<17.780000,0.038000,30.480000><17.780000,-1.538000,30.480000>0.406400}
//Holes(fast)/Vias
cylinder{<23.797200,0.038000,23.971200><23.797200,-1.538000,23.971200>0.350000 }
cylinder{<49.060500,0.038000,12.759700><49.060500,-1.538000,12.759700>0.350000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,46.990000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,44.450000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,44.704000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.273000,0.000000,44.704000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,44.704000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.447000,0.000000,44.704000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<25.019000,0.000000,46.736000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.701000,0.000000,46.736000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<25.019000,0.000000,44.704000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.701000,0.000000,44.704000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,45.720000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.241000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.114000,0.000000,45.720000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.114000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.114000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.114000,0.000000,46.482000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<23.114000,0.000000,46.482000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.114000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.114000,0.000000,44.958000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<23.114000,0.000000,44.958000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.606000,0.000000,46.482000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.606000,0.000000,45.720000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<22.606000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.606000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.606000,0.000000,44.958000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<22.606000,0.000000,44.958000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,45.720000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.479000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,45.720000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.098000,0.000000,45.720000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.194800,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.194800,0.000000,44.450000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<9.194800,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.194800,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.194800,0.000000,45.085000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<9.194800,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.194800,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,44.450000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<9.194800,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.559800,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.559800,0.000000,44.450000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<8.559800,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.559800,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<8.559800,0.000000,45.085000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<8.559800,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.559800,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,44.450000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<7.366000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,45.720000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.573000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,45.974000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,45.974000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.461000,0.000000,45.974000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,43.180000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.207000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,42.926000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.461000,0.000000,42.926000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<5.461000,0.000000,43.180000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<5.461000,0.000000,45.720000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<12.319000,0.000000,45.720000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<12.319000,0.000000,43.180000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,62.230000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.291000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,59.690000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.291000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,59.944000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.863000,0.000000,59.944000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,59.944000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.037000,0.000000,59.944000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.609000,0.000000,61.976000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<42.291000,0.000000,61.976000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.609000,0.000000,59.944000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<42.291000,0.000000,59.944000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.212000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,60.960000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.831000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.831000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,60.960000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.704000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.704000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.704000,0.000000,61.722000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<44.704000,0.000000,61.722000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.704000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.704000,0.000000,60.198000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<44.704000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.196000,0.000000,61.722000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.196000,0.000000,60.960000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<44.196000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.196000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.196000,0.000000,60.198000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<44.196000,0.000000,60.198000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,60.960000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.069000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.688000,0.000000,60.960000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.688000,0.000000,60.960000> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,63.500000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.911000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,60.960000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.911000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,63.246000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.483000,0.000000,61.214000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.483000,0.000000,61.214000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,63.246000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,61.214000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.657000,0.000000,61.214000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<54.229000,0.000000,63.246000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<49.911000,0.000000,63.246000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<54.229000,0.000000,61.214000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<49.911000,0.000000,61.214000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.832000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,62.230000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.451000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.324000,0.000000,62.230000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.324000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.324000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.324000,0.000000,62.992000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<52.324000,0.000000,62.992000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.324000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.324000,0.000000,61.468000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<52.324000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.816000,0.000000,62.992000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.816000,0.000000,62.230000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<51.816000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.816000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.816000,0.000000,61.468000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<51.816000,0.000000,61.468000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.689000,0.000000,62.230000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.689000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.689000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.308000,0.000000,62.230000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.308000,0.000000,62.230000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,33.020000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.211000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,35.560000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.211000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,35.306000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.957000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,35.306000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.783000,0.000000,35.306000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<37.211000,0.000000,33.274000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<41.529000,0.000000,33.274000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<37.211000,0.000000,35.306000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<41.529000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,34.290000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.608000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,34.290000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.989000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.116000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.116000,0.000000,33.528000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<39.116000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.116000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.116000,0.000000,35.052000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<39.116000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.624000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.624000,0.000000,34.290000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<39.624000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.624000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.624000,0.000000,35.052000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<39.624000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,34.290000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.624000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.132000,0.000000,34.290000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.751000,0.000000,34.290000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,64.389000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.430000,0.000000,64.389000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,64.389000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,60.071000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.970000,0.000000,60.071000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,64.643000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,64.643000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.684000,0.000000,64.643000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,59.817000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,59.817000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.684000,0.000000,59.817000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<11.684000,0.000000,64.389000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<11.684000,0.000000,60.071000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.716000,0.000000,64.389000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.716000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,62.992000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,62.611000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,62.484000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,62.484000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,62.484000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.938000,0.000000,62.484000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.938000,0.000000,62.484000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,62.484000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.462000,0.000000,62.484000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.700000,0.000000,62.484000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.938000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,61.976000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.938000,0.000000,61.976000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.462000,0.000000,61.976000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.700000,0.000000,61.976000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,61.849000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,61.849000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,61.849000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,61.468000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,61.468000> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,64.389000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.970000,0.000000,64.389000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,64.389000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,60.071000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.510000,0.000000,60.071000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,64.643000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,64.643000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.224000,0.000000,64.643000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,59.817000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,59.817000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.224000,0.000000,59.817000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.224000,0.000000,64.389000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.224000,0.000000,60.071000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<16.256000,0.000000,64.389000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<16.256000,0.000000,60.071000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,62.992000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,62.611000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,62.484000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,62.484000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,62.484000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.478000,0.000000,62.484000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<14.478000,0.000000,62.484000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,62.484000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.002000,0.000000,62.484000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<15.240000,0.000000,62.484000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.478000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,61.976000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<14.478000,0.000000,61.976000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.002000,0.000000,61.976000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<15.240000,0.000000,61.976000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,61.849000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,61.849000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,61.849000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,61.468000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,61.468000> }
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<10.464800,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<10.464800,0.000000,34.290000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<10.464800,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<10.464800,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<10.464800,0.000000,34.925000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<10.464800,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.464800,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,34.290000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<10.464800,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.829800,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.829800,0.000000,34.290000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<9.829800,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.829800,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<9.829800,0.000000,34.925000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,90.000000,0> translate<9.829800,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.829800,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,34.290000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<8.636000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,0.000000,35.560000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.843000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,0.000000,35.814000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,33.020000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.477000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,32.766000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,0.000000,32.766000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<6.731000,0.000000,33.020000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<6.731000,0.000000,35.560000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.589000,0.000000,35.560000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.589000,0.000000,33.020000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<16.510000,-1.536000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<16.510000,-1.536000,54.991000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.510000,-1.536000,54.991000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<16.510000,-1.536000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<16.510000,-1.536000,46.609000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<16.510000,-1.536000,46.609000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,-1.536000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,-1.536000,50.800000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.510000,-1.536000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,-1.536000,51.816000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,-1.536000,51.816000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.875000,-1.536000,51.816000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,-1.536000,51.816000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,-1.536000,50.800000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<15.875000,-1.536000,51.816000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,-1.536000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,-1.536000,52.324000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.510000,-1.536000,52.324000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,-1.536000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,-1.536000,51.816000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<16.510000,-1.536000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,-1.536000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,-1.536000,50.800000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.510000,-1.536000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,-1.536000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,-1.536000,50.800000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.875000,-1.536000,50.800000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<17.272000,-1.536000,52.832000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<17.272000,-1.536000,48.768000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<15.748000,-1.536000,48.768000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<15.748000,-1.536000,52.832000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,-1.536000,53.086000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,53.086000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.748000,-1.536000,53.086000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,-1.536000,48.514000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,-1.536000,48.514000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.748000,-1.536000,48.514000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,-1.536000,52.832000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.526000,-1.536000,52.832000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,-1.536000,48.768000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,-1.536000,52.832000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.494000,-1.536000,52.832000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-90.000000,0> translate<16.510000,-1.536000,49.149000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.510000,-1.536000,54.038500>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.510000,-1.536000,47.561500>}
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<2.540000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<3.429000,0.000000,50.800000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<2.540000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<12.700000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<11.811000,0.000000,50.800000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<11.811000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,50.800000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.620000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.604000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,50.800000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,32.003271,0> translate<6.604000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,50.800000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.096000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,50.165000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-32.003271,0> translate<6.604000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,50.800000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.620000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,51.435000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.620000,0.000000,51.435000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<5.588000,0.000000,50.038000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<9.652000,0.000000,50.038000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<9.652000,0.000000,51.562000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<5.588000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,51.562000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,50.038000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.334000,0.000000,50.038000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,50.038000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.906000,0.000000,51.562000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.906000,0.000000,51.562000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.652000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.588000,0.000000,49.784000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.588000,0.000000,49.784000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.652000,0.000000,51.816000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.588000,0.000000,51.816000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.588000,0.000000,51.816000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-180.000000,0> translate<9.271000,0.000000,50.800000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<4.381500,0.000000,50.800000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<10.858500,0.000000,50.800000>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,31.750000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.291000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,21.590000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.449000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,21.590000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.449000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,31.750000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.386000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,31.750000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.449000,0.000000,31.750000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<39.370000,0.000000,31.750000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,59.690000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.991000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,41.910000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.149000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,41.910000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.149000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,59.690000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.086000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,59.690000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.149000,0.000000,59.690000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<52.070000,0.000000,59.690000>}
//IC3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,15.240000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.830000,0.000000,15.240000> }
object{ARC(0.635000,0.152400,180.000000,360.000000,0.036000) translate<39.370000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,15.240000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.830000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,5.080000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.830000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,5.080000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.910000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,15.240000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.005000,0.000000,15.240000> }
//IC4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,27.940000>}
box{<0,0,-0.076200><25.400000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.621000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,2.540000>}
box{<0,0,-0.076200><25.400000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.779000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,2.540000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.779000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,27.940000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.716000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,27.940000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.779000,0.000000,27.940000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<12.700000,0.000000,27.940000>}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,10.795000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<56.515000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,9.525000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,8.890000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.515000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,8.890000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,9.525000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,10.795000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,11.430000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,14.605000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,13.970000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.515000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,13.970000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,14.605000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,13.335000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<56.515000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,12.065000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,11.430000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.515000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,11.430000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,12.065000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,13.335000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,13.970000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,18.415000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<56.515000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,17.145000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,16.510000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.515000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,16.510000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,17.145000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,18.415000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,19.050000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,16.510000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<56.515000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,15.875000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,15.875000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,22.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,21.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.515000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,21.590000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,22.225000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,20.955000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<56.515000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,19.685000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,19.050000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.515000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,19.050000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,19.685000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,20.955000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,21.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,24.130000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,24.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<56.515000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,23.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,23.495000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.515000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,6.350000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,8.890000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<56.515000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,8.255000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,8.255000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,8.255000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,10.160000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,12.700000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,15.240000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,17.780000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,20.320000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,22.860000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,7.620000>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,57.150000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.985000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,57.150000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,54.610000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.445000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,54.610000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,59.690000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.985000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,59.690000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,57.150000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.445000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,62.230000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.985000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,62.230000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,59.690000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.445000,0.000000,59.690000> }
box{<-0.381000,0,-0.254000><0.381000,0.036000,0.254000> rotate<0,-90.000000,0> translate<4.191000,0.000000,55.880000>}
box{<-0.381000,0,-0.254000><0.381000,0.036000,0.254000> rotate<0,-90.000000,0> translate<4.191000,0.000000,58.420000>}
box{<-0.381000,0,-0.254000><0.381000,0.036000,0.254000> rotate<0,-90.000000,0> translate<4.191000,0.000000,60.960000>}
box{<-0.381000,0,-0.508000><0.381000,0.036000,0.508000> rotate<0,-90.000000,0> translate<7.493000,0.000000,55.880000>}
box{<-0.381000,0,-0.508000><0.381000,0.036000,0.508000> rotate<0,-90.000000,0> translate<7.493000,0.000000,58.420000>}
box{<-0.381000,0,-0.508000><0.381000,0.036000,0.508000> rotate<0,-90.000000,0> translate<7.493000,0.000000,60.960000>}
//Q1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.669000,0.000000,64.324500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.669000,0.000000,60.135500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,-90.000000,0> translate<18.669000,0.000000,60.135500> }
object{ARC(2.666991,0.127000,295.208327,424.791673,0.036000) translate<20.320000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,61.094100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,63.365900>}
box{<0,0,-0.063500><2.271800,0.036000,0.063500> rotate<0,90.000000,0> translate<20.193000,0.000000,63.365900> }
object{ARC(2.667022,0.127000,64.790232,92.727786,0.036000) translate<20.319925,0.000000,62.230000>}
object{ARC(2.667031,0.127000,92.731367,115.210130,0.036000) translate<20.320094,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,63.634100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,64.894000>}
box{<0,0,-0.063500><1.259900,0.036000,0.063500> rotate<0,90.000000,0> translate<20.193000,0.000000,64.894000> }
object{ARC(2.667034,0.127000,115.210338,128.248866,0.036000) translate<20.320103,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,63.365900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,63.634100>}
box{<0,0,-0.063500><0.268200,0.036000,0.063500> rotate<0,90.000000,0> translate<20.193000,0.000000,63.634100> }
object{ARC(2.667031,0.127000,244.789870,267.268633,0.036000) translate<20.320094,0.000000,62.230000>}
object{ARC(2.667022,0.127000,267.272214,295.209768,0.036000) translate<20.319925,0.000000,62.230000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,59.566000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,60.825900>}
box{<0,0,-0.063500><1.259900,0.036000,0.063500> rotate<0,90.000000,0> translate<20.193000,0.000000,60.825900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,60.825900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,61.094100>}
box{<0,0,-0.063500><0.268200,0.036000,0.063500> rotate<0,90.000000,0> translate<20.193000,0.000000,61.094100> }
object{ARC(2.667034,0.127000,231.751101,245.360544,0.036000) translate<20.320106,0.000000,62.230000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.210000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<30.226000,0.000000,41.910000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<29.210000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.370000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.354000,0.000000,41.910000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<38.354000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<37.211000,0.000000,41.021000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<37.211000,0.000000,42.799000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<31.369000,0.000000,42.799000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<31.369000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,41.021000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.465000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,40.767000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.830000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,40.767000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.703000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,43.053000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.830000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,43.053000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.703000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,40.767000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.750000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,40.894000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.877000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,43.053000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<31.750000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,42.926000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.877000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.369000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,40.767000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.369000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.369000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,43.053000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.369000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,41.021000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.115000,0.000000,41.021000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<30.683200,0.000000,41.910000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<37.896800,0.000000,41.910000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<34.290000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.306000,0.000000,19.050000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<34.290000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.434000,0.000000,19.050000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<43.434000,0.000000,19.050000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<42.291000,0.000000,18.161000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<42.291000,0.000000,19.939000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<36.449000,0.000000,19.939000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<36.449000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,18.161000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.545000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,17.907000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,17.907000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.783000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,20.193000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,20.193000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,20.193000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,20.193000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.783000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,17.907000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.830000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,18.034000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,20.193000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.830000,0.000000,20.193000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,20.066000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,17.907000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.449000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,20.193000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,20.193000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.449000,0.000000,20.193000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,18.161000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.195000,0.000000,18.161000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<35.763200,0.000000,19.050000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<42.976800,0.000000,19.050000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.210000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.210000,0.000000,26.416000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<29.210000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.210000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.210000,0.000000,34.544000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<29.210000,0.000000,34.544000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.099000,0.000000,33.401000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<28.321000,0.000000,33.401000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<28.321000,0.000000,27.559000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.099000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.099000,0.000000,33.655000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.321000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.353000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.226000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.067000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.067000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.067000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.194000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.067000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<28.067000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<30.226000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,32.893000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.226000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.194000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.067000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.067000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.194000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.194000,0.000000,32.893000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.194000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.353000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.067000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.067000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.067000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.099000,0.000000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.321000,0.000000,27.305000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<29.210000,0.000000,26.873200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<29.210000,0.000000,34.086800>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.830000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.830000,0.000000,46.736000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<36.830000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.830000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.830000,0.000000,54.864000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<36.830000,0.000000,54.864000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<37.719000,0.000000,53.721000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<35.941000,0.000000,53.721000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<35.941000,0.000000,47.879000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<37.719000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,53.975000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,0.000000,53.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,53.721000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,53.340000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.973000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,53.213000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,53.340000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.846000,0.000000,53.213000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,53.721000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,53.340000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.687000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,0.000000,53.213000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,53.340000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<35.687000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,48.260000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<37.846000,0.000000,48.387000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,53.213000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.846000,0.000000,53.213000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,0.000000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,48.260000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.687000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,0.000000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.814000,0.000000,53.213000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.814000,0.000000,53.213000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,48.260000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.973000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.687000,0.000000,48.260000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.687000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,47.625000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,0.000000,47.625000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<36.830000,0.000000,47.193200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<36.830000,0.000000,54.406800>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,0.000000,32.004000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<48.260000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,0.000000,23.876000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<48.260000,0.000000,23.876000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<47.371000,0.000000,25.019000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<49.149000,0.000000,25.019000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<49.149000,0.000000,30.861000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<47.371000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,24.765000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.371000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.117000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<47.117000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.403000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<49.276000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,30.480000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<47.117000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.244000,0.000000,25.527000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.244000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,0.000000,30.480000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.276000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,25.527000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.276000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.117000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.403000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.403000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,31.115000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.371000,0.000000,31.115000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<48.260000,0.000000,31.546800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<48.260000,0.000000,24.333200>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,23.876000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<50.800000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,32.004000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<50.800000,0.000000,32.004000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<51.689000,0.000000,30.861000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<49.911000,0.000000,30.861000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<49.911000,0.000000,25.019000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<51.689000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.689000,0.000000,31.115000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.911000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.943000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,30.480000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.816000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.657000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,30.480000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<49.657000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<51.816000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,30.353000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.816000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.657000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,30.353000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.784000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.943000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.657000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.689000,0.000000,24.765000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.911000,0.000000,24.765000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<50.800000,0.000000,24.333200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<50.800000,0.000000,31.546800>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<2.540000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<3.556000,0.000000,48.260000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<2.540000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<12.700000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<11.684000,0.000000,48.260000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<11.684000,0.000000,48.260000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<10.541000,0.000000,47.371000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<10.541000,0.000000,49.149000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<4.699000,0.000000,49.149000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<4.699000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,49.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,47.371000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.795000,0.000000,47.371000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,47.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,47.117000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,47.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,47.244000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,47.117000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<10.033000,0.000000,47.244000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,49.403000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,49.403000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,49.276000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,49.403000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.033000,0.000000,49.276000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,47.244000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.080000,0.000000,47.117000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.080000,0.000000,47.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,47.244000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,47.244000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.207000,0.000000,47.244000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,49.276000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.080000,0.000000,49.403000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<5.080000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,49.276000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,49.276000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.207000,0.000000,49.276000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.699000,0.000000,47.117000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.080000,0.000000,47.117000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.699000,0.000000,47.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.699000,0.000000,49.403000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.080000,0.000000,49.403000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.699000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,49.149000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,47.371000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.445000,0.000000,47.371000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<4.013200,0.000000,48.260000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<11.226800,0.000000,48.260000>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,44.196000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<44.450000,0.000000,44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,52.324000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<44.450000,0.000000,52.324000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<45.339000,0.000000,51.181000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<43.561000,0.000000,51.181000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<43.561000,0.000000,45.339000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<45.339000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,51.435000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.561000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,51.181000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,50.800000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.593000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,50.673000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,50.800000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.466000,0.000000,50.673000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,51.181000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,50.800000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.307000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.434000,0.000000,50.673000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,50.800000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.307000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,45.847000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,45.720000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<45.466000,0.000000,45.847000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,45.847000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,50.673000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<45.466000,0.000000,50.673000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.434000,0.000000,45.847000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,45.720000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.307000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.434000,0.000000,45.847000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.434000,0.000000,50.673000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.434000,0.000000,50.673000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,45.720000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<45.593000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,45.720000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.307000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,45.085000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.561000,0.000000,45.085000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<44.450000,0.000000,44.653200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<44.450000,0.000000,51.866800>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,54.864000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,54.864000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,46.736000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<41.910000,0.000000,46.736000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.021000,0.000000,47.879000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<42.799000,0.000000,47.879000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<42.799000,0.000000,53.721000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.021000,0.000000,53.721000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,47.625000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,47.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,48.260000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.767000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,48.260000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.767000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,48.260000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.053000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,48.260000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<42.926000,0.000000,48.387000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,53.213000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,53.340000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<40.767000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,53.213000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,48.387000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.894000,0.000000,48.387000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,53.213000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,53.340000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.926000,0.000000,53.213000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,53.213000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,48.387000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.926000,0.000000,48.387000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,53.721000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,53.340000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.767000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,53.721000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,53.340000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.053000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,53.975000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,53.975000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,54.406800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,47.193200>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.720000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.704000,0.000000,58.420000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<44.704000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<36.576000,0.000000,58.420000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<35.560000,0.000000,58.420000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<37.719000,0.000000,59.309000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<37.719000,0.000000,57.531000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<43.561000,0.000000,57.531000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<43.561000,0.000000,59.309000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,57.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,59.309000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.465000,0.000000,59.309000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,59.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,59.563000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.719000,0.000000,59.563000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,59.563000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<38.100000,0.000000,59.563000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.719000,0.000000,57.277000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,57.277000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.719000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,57.404000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,57.277000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.100000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,59.563000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.053000,0.000000,59.436000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,59.436000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.227000,0.000000,59.436000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,57.404000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,57.277000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<43.053000,0.000000,57.404000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,57.404000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,57.404000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.227000,0.000000,57.404000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,59.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,59.563000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.180000,0.000000,59.563000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,57.277000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,57.277000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.180000,0.000000,57.277000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,57.531000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,59.309000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.815000,0.000000,59.309000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<44.246800,0.000000,58.420000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<37.033200,0.000000,58.420000>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,30.734000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.590000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,22.606000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<21.590000,0.000000,22.606000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.701000,0.000000,23.749000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<22.479000,0.000000,23.749000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<22.479000,0.000000,29.591000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.701000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,23.495000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.447000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.447000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,24.130000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.733000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,24.257000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,24.130000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.606000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.447000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.574000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.606000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,24.257000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.606000,0.000000,24.257000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.447000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.733000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,29.845000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,0.000000,29.845000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.590000,0.000000,30.276800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.590000,0.000000,23.063200>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.050000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<20.066000,0.000000,55.880000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<19.050000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<29.210000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<28.194000,0.000000,55.880000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<28.194000,0.000000,55.880000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<27.051000,0.000000,54.991000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<27.051000,0.000000,56.769000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<21.209000,0.000000,56.769000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<21.209000,0.000000,54.991000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.305000,0.000000,56.769000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.305000,0.000000,54.991000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.305000,0.000000,54.991000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,54.737000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,54.737000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.670000,0.000000,54.737000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,54.737000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<26.543000,0.000000,54.864000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,57.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,57.023000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.670000,0.000000,57.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,57.023000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.543000,0.000000,56.896000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,54.737000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.590000,0.000000,54.737000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,54.864000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.717000,0.000000,54.864000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,57.023000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<21.590000,0.000000,57.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,56.896000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.717000,0.000000,56.896000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.209000,0.000000,54.737000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,54.737000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.209000,0.000000,54.737000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.209000,0.000000,57.023000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,57.023000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.209000,0.000000,57.023000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,56.769000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,54.991000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.955000,0.000000,54.991000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<20.523200,0.000000,55.880000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<27.736800,0.000000,55.880000>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.780000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.764000,0.000000,30.480000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<16.764000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<8.636000,0.000000,30.480000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<7.620000,0.000000,30.480000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<9.779000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<9.779000,0.000000,29.591000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<15.621000,0.000000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<15.621000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.525000,0.000000,31.369000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.525000,0.000000,31.369000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.779000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,31.623000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<10.160000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.779000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,29.337000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.160000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,31.623000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.113000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,31.496000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.287000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,29.337000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<15.113000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,29.464000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.287000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.240000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.240000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,31.369000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.875000,0.000000,31.369000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<16.306800,0.000000,30.480000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<9.093200,0.000000,30.480000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  PKD(-30.950000,0,-33.890000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//IC3	PIC12F683P	DIL8
