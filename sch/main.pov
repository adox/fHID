//POVRay-File created by 3d41.ulp v20110101
//C:/Documents and Settings/SunBright/Moje dokumenty/eagle/LCD Switch/main.brd
//2012-07-03 12:07:07

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
#local cam_y = 316;
#local cam_z = -116;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
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

#local lgt1_pos_x = 37;
#local lgt1_pos_y = 56;
#local lgt1_pos_z = 26;
#local lgt1_intense = 0.771875;
#local lgt2_pos_x = -37;
#local lgt2_pos_y = 56;
#local lgt2_pos_z = 26;
#local lgt2_intense = 0.771875;
#local lgt3_pos_x = 37;
#local lgt3_pos_y = 56;
#local lgt3_pos_z = -18;
#local lgt3_intense = 0.771875;
#local lgt4_pos_x = -37;
#local lgt4_pos_y = 56;
#local lgt4_pos_z = -18;
#local lgt4_intense = 0.771875;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 99.060200;
#declare pcb_y_size = 50.790000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(97);
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
	//translate<-49.530100,0,-25.395000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro MAIN(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><99.060200,0.000000>
<99.060200,0.000000><99.060200,50.790000>
<99.060200,50.790000><0.000000,50.790000>
<0.000000,50.790000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<95.250000,1,3.810000><95.250000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<95.250000,1,46.990000><95.250000,-5,46.990000>1.600000 texture{col_hls}}
cylinder{<3.810000,1,46.990000><3.810000,-5,46.990000>1.600000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<40.640000,0.000000,31.750000>}#end		//ceramic disc capacitator C1 100n C050-025X075
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_50MM_76MM("100n",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<20.320000,0.000000,22.860000>}#end		//ceramic disc capacitator C2 100n C050-025X075
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO35_076MM_H("1N4148",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<77.470000,0.000000,34.290000>}#end		//Diode DO35 7mm hor. D1 1N4148 DO35-7
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_DIS_DO35_076MM_H("1N4148",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<58.420000,0.000000,34.290000>}#end		//Diode DO35 7mm hor. D2 1N4148 DO35-7
#ifndef(pack_D3) #declare global_pack_D3=yes; object {DIODE_DIS_DO41_102MM_H("1N4004",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.590000,0.000000,36.830000>}#end		//Diode DO35 10mm hor. D3 1N4004 DO41-10
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {TR_TO220_3_V("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.590000,0.000000,31.750000>}#end		//TO220 vertical straight leads IC1  78XXS
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_DIS_DIP18("PIC16F628P","MICROCHIP",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<44.450000,0.000000,19.050000>translate<0,3.000000,0> }#end		//DIP18 IC2 PIC16F628P DIL18
#ifndef(pack_IC2) object{SOCKET_DIP18()rotate<0,0.000000,0> rotate<0,0,0> translate<44.450000,0.000000,19.050000>}#end					//IC-Sockel 18Pin IC2 PIC16F628P
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<54.610000,0.000000,31.750000>}#end		//Discrete Resistor 0,3W 10MM Grid R2 10k 0207/10
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<52.070000,0.000000,31.750000>}#end		//Discrete Resistor 0,3W 10MM Grid R3 10k 0207/10
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO92_L("BC547",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<82.550000,0.000000,24.130000>}#end		//TO92 straight vertical T1 BC547 TO92-CBE
#ifndef(pack_T2) #declare global_pack_T2=yes; object {TR_TO92_L("BC547",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<64.770000,0.000000,24.130000>}#end		//TO92 straight vertical T2 BC547 TO92-CBE
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<40.640000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<40.640000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<17.780000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<22.860000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<34.290000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<34.290000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<77.470000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<77.470000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<58.420000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<58.420000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<26.670000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.117600,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<16.510000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<21.590000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<19.050000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<24.130000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<34.290000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<36.830000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<39.370000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<41.910000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<44.450000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<46.990000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<49.530000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<52.070000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<54.610000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<54.610000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<52.070000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<49.530000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<46.990000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<44.450000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<41.910000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<39.370000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<36.830000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<34.290000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<87.630000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<85.090000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<68.580000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<66.040000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<24.130000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<26.670000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<67.310000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<64.770000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<78.740000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<76.200000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<90.170000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<87.630000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<82.550000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<85.090000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<87.630000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<90.170000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<92.710000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<92.710000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<90.170000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<87.630000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<85.090000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<82.550000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<63.500000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<66.040000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<68.580000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<71.120000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<73.660000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<73.660000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<71.120000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<68.580000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<66.040000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<63.500000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<7.620000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<12.700000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<10.160000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<54.610000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<54.610000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<52.070000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<52.070000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<82.550000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<80.010000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<85.090000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<64.770000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<62.230000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<67.310000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.430000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<13.970000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<16.510000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<19.050000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<24.130000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<26.670000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<29.210000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<31.750000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<34.290000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<36.830000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<39.370000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<41.910000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<46.990000,0,8.890000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<81.280000,0,27.940000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<59.690000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<78.740000,0,26.670000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<81.280000,0,26.670000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<96.520000,0,34.290000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<96.520000,0,31.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<31.750000,0,20.320000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<58.420000,0,6.350000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<30.480000,0,25.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<25.400000,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<25.400000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<29.210000,0,6.350000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<50.800000,0,31.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<49.530000,0,38.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<78.740000,0,33.020000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<58.420000,0,26.670000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<13.970000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<20.320000,0,26.670000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<20.320000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<7.620000,0,17.780000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<10.160000,0,3.810000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<68.580000,0,19.050000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,1,0) translate<72.390000,0,10.160000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<5.080000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<5.080000,0.000000,15.240000>}
box{<0,0,-0.250000><6.350000,0.035000,0.250000> rotate<0,90.000000,0> translate<5.080000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<5.080000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<5.080000,-1.535000,17.780000>}
box{<0,0,-0.250000><10.160000,0.035000,0.250000> rotate<0,90.000000,0> translate<5.080000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<5.080000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<6.350000,-1.535000,19.050000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<5.080000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<5.080000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<7.620000,-1.535000,7.620000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,0.000000,0> translate<5.080000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<5.080000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<7.620000,0.000000,17.780000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,-44.997030,0> translate<5.080000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<8.890000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<8.890000,-1.535000,8.890000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,-90.000000,0> translate<8.890000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<7.620000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<8.890000,-1.535000,13.970000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,0.000000,0> translate<7.620000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<8.890000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<8.890000,0.000000,17.780000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,-90.000000,0> translate<8.890000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<6.350000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<8.890000,0.000000,21.590000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<6.350000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<5.080000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<10.160000,0.000000,3.810000>}
box{<0,0,-0.250000><7.184205,0.035000,0.250000> rotate<0,44.997030,0> translate<5.080000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<7.620000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<10.160000,-1.535000,5.080000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<7.620000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<8.890000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<11.430000,-1.535000,6.350000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<8.890000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<11.430000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<11.430000,-1.535000,8.890000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,-90.000000,0> translate<11.430000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<8.890000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<12.700000,0.000000,13.970000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,44.997030,0> translate<8.890000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<11.430000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<12.700000,-1.535000,13.970000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,0.000000,0> translate<11.430000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<13.970000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<13.970000,-1.535000,8.890000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,-90.000000,0> translate<13.970000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<6.350000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<13.970000,0.000000,31.750000>}
box{<0,0,-0.250000><10.776307,0.035000,0.250000> rotate<0,-44.997030,0> translate<6.350000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<13.970000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<15.240000,0.000000,12.700000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<13.970000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<15.240000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<15.240000,0.000000,12.700000>}
box{<0,0,-0.250000><6.350000,0.035000,0.250000> rotate<0,-90.000000,0> translate<15.240000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<10.160000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<15.240000,0.000000,19.050000>}
box{<0,0,-0.250000><7.184205,0.035000,0.250000> rotate<0,44.997030,0> translate<10.160000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<16.510000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<16.510000,-1.535000,36.830000>}
box{<0,0,-0.250000><7.620000,0.035000,0.250000> rotate<0,90.000000,0> translate<16.510000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<17.780000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<19.050000,0.000000,24.130000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<17.780000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<19.050000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<19.050000,0.000000,24.130000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,-90.000000,0> translate<19.050000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<16.510000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<19.050000,-1.535000,29.210000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,0.000000,0> translate<16.510000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<16.510000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<20.320000,-1.535000,12.700000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,-44.997030,0> translate<16.510000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<20.320000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<20.320000,0.000000,26.670000>}
box{<0,0,-0.250000><13.970000,0.035000,0.250000> rotate<0,90.000000,0> translate<20.320000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<11.430000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,-1.535000,6.350000>}
box{<0,0,-0.250000><10.160000,0.035000,0.250000> rotate<0,0.000000,0> translate<11.430000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<19.050000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,-1.535000,6.350000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<19.050000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,-1.535000,10.160000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,90.000000,0> translate<21.590000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,0.000000,24.130000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,-90.000000,0> translate<21.590000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,-1.535000,29.210000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,-90.000000,0> translate<21.590000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<22.860000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<22.860000,0.000000,13.970000>}
box{<0,0,-0.250000><8.890000,0.035000,0.250000> rotate<0,-90.000000,0> translate<22.860000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<22.860000,0.000000,22.860000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<21.590000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,-1.535000,6.350000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,0.000000,0> translate<21.590000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<13.970000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,0.000000,31.750000>}
box{<0,0,-0.250000><10.160000,0.035000,0.250000> rotate<0,0.000000,0> translate<13.970000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,-1.535000,31.750000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,0.000000,0> translate<21.590000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,0.000000,31.750000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,90.000000,0> translate<24.130000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,-1.535000,44.450000>}
box{<0,0,-0.250000><12.700000,0.035000,0.250000> rotate<0,90.000000,0> translate<24.130000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,-1.535000,45.720000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,90.000000,0> translate<24.130000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<25.400000,-1.535000,7.620000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<24.130000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<25.400000,-1.535000,7.620000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<24.130000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<22.860000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<25.400000,0.000000,11.430000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<22.860000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<21.590000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<25.400000,-1.535000,13.970000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,-44.997030,0> translate<21.590000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<25.400000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<25.400000,0.000000,20.320000>}
box{<0,0,-0.250000><6.350000,0.035000,0.250000> rotate<0,90.000000,0> translate<25.400000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<25.400000,-1.535000,46.990000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<24.130000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<25.400000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<26.670000,-1.535000,8.890000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<25.400000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<26.670000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<26.670000,-1.535000,8.890000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,-90.000000,0> translate<26.670000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<25.400000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<26.670000,-1.535000,11.430000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,0.000000,0> translate<25.400000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<26.670000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<26.670000,-1.535000,44.450000>}
box{<0,0,-0.250000><7.620000,0.035000,0.250000> rotate<0,90.000000,0> translate<26.670000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<29.210000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<29.210000,0.000000,3.810000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,-90.000000,0> translate<29.210000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<29.210000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<29.210000,-1.535000,6.350000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,-90.000000,0> translate<29.210000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<26.670000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<29.210000,-1.535000,8.890000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,0.000000,0> translate<26.670000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<10.160000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<30.480000,-1.535000,5.080000>}
box{<0,0,-0.250000><20.320000,0.035000,0.250000> rotate<0,0.000000,0> translate<10.160000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<30.480000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<30.480000,0.000000,11.430000>}
box{<0,0,-0.250000><11.430000,0.035000,0.250000> rotate<0,-90.000000,0> translate<30.480000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<25.400000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<30.480000,0.000000,25.400000>}
box{<0,0,-0.250000><7.184205,0.035000,0.250000> rotate<0,-44.997030,0> translate<25.400000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<29.210000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<31.750000,-1.535000,8.890000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,0.000000,0> translate<29.210000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<31.750000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<31.750000,0.000000,20.320000>}
box{<0,0,-0.250000><6.350000,0.035000,0.250000> rotate<0,90.000000,0> translate<31.750000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<31.750000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<33.020000,0.000000,12.700000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<31.750000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<6.350000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<33.020000,-1.535000,19.050000>}
box{<0,0,-0.250000><26.670000,0.035000,0.250000> rotate<0,0.000000,0> translate<6.350000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<30.480000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,-1.535000,8.890000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,-44.997030,0> translate<30.480000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,-1.535000,15.240000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,90.000000,0> translate<34.290000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<7.620000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,-1.535000,17.780000>}
box{<0,0,-0.250000><26.670000,0.035000,0.250000> rotate<0,0.000000,0> translate<7.620000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<33.020000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,-1.535000,20.320000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<33.020000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<31.750000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,-1.535000,22.860000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,-44.997030,0> translate<31.750000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<30.480000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,0.000000,26.670000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,-44.997030,0> translate<30.480000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,-1.535000,31.750000>}
box{<0,0,-0.250000><10.160000,0.035000,0.250000> rotate<0,0.000000,0> translate<24.130000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<35.560000,-1.535000,19.050000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<34.290000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,-1.535000,11.430000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,0.000000,0> translate<34.290000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,-1.535000,15.240000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,90.000000,0> translate<36.830000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,-1.535000,20.320000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,0.000000,0> translate<34.290000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,-1.535000,22.860000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,90.000000,0> translate<36.830000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<24.130000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,0.000000,29.210000>}
box{<0,0,-0.250000><12.700000,0.035000,0.250000> rotate<0,0.000000,0> translate<24.130000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,0.000000,29.210000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,-90.000000,0> translate<36.830000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,0.000000,34.290000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,0.000000,0> translate<34.290000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<38.100000,-1.535000,12.700000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,0.000000,0> translate<36.830000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<38.100000,-1.535000,31.750000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,0.000000,0> translate<34.290000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<39.370000,-1.535000,8.890000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<36.830000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<39.370000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<39.370000,-1.535000,22.860000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,-90.000000,0> translate<39.370000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<30.480000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<39.370000,-1.535000,25.400000>}
box{<0,0,-0.250000><8.890000,0.035000,0.250000> rotate<0,0.000000,0> translate<30.480000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<40.640000,-1.535000,5.080000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,44.997030,0> translate<36.830000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<38.100000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<40.640000,-1.535000,29.210000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<38.100000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<36.830000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<40.640000,0.000000,34.290000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,0.000000,0> translate<36.830000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<38.100000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<41.910000,-1.535000,8.890000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,44.997030,0> translate<38.100000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<41.910000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<41.910000,-1.535000,22.860000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,-90.000000,0> translate<41.910000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<20.320000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<41.910000,-1.535000,26.670000>}
box{<0,0,-0.250000><21.590000,0.035000,0.250000> rotate<0,0.000000,0> translate<20.320000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,15.240000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,90.000000,0> translate<44.450000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,16.510000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,90.000000,0> translate<44.450000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,22.860000>}
box{<0,0,-0.250000><10.160000,0.035000,0.250000> rotate<0,-90.000000,0> translate<44.450000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,33.020000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,-90.000000,0> translate<44.450000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<40.640000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,34.290000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,0.000000,0> translate<40.640000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<45.720000,-1.535000,10.160000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<44.450000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<45.720000,-1.535000,17.780000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<44.450000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<46.990000,-1.535000,6.350000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<44.450000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<45.720000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<46.990000,-1.535000,8.890000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<45.720000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<46.990000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<46.990000,-1.535000,15.240000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,90.000000,0> translate<46.990000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<35.560000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<46.990000,-1.535000,19.050000>}
box{<0,0,-0.250000><11.430000,0.035000,0.250000> rotate<0,0.000000,0> translate<35.560000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<46.990000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<46.990000,-1.535000,22.860000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,90.000000,0> translate<46.990000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<30.480000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<48.260000,0.000000,11.430000>}
box{<0,0,-0.250000><17.780000,0.035000,0.250000> rotate<0,0.000000,0> translate<30.480000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,0.000000,5.080000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,-90.000000,0> translate<49.530000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<48.260000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,0.000000,10.160000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<48.260000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,-1.535000,22.860000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,90.000000,0> translate<49.530000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<34.290000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,0.000000,26.670000>}
box{<0,0,-0.250000><15.240000,0.035000,0.250000> rotate<0,0.000000,0> translate<34.290000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,0.000000,26.670000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,-90.000000,0> translate<49.530000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,0.000000,33.020000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,-90.000000,0> translate<49.530000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<26.670000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,-1.535000,36.830000>}
box{<0,0,-0.250000><22.860000,0.035000,0.250000> rotate<0,0.000000,0> translate<26.670000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<50.800000,0.000000,31.750000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<49.530000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<52.070000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<52.070000,-1.535000,22.860000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,-90.000000,0> translate<52.070000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<52.070000,0.000000,30.480000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,-44.997030,0> translate<49.530000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<52.070000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<52.070000,0.000000,30.480000>}
box{<0,0,-0.250000><6.350000,0.035000,0.250000> rotate<0,-90.000000,0> translate<52.070000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<50.800000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<52.070000,-1.535000,31.750000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,0.000000,0> translate<50.800000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<52.070000,-1.535000,34.290000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<49.530000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<53.340000,-1.535000,41.910000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,-44.997030,0> translate<49.530000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<54.610000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<54.610000,-1.535000,22.860000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,-90.000000,0> translate<54.610000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<54.610000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<54.610000,0.000000,40.640000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,90.000000,0> translate<54.610000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<46.990000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<55.880000,-1.535000,6.350000>}
box{<0,0,-0.250000><8.890000,0.035000,0.250000> rotate<0,0.000000,0> translate<46.990000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<52.070000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<55.880000,-1.535000,27.940000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,44.997030,0> translate<52.070000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<55.880000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<55.880000,0.000000,29.210000>}
box{<0,0,-0.250000><6.350000,0.035000,0.250000> rotate<0,-90.000000,0> translate<55.880000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<44.450000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<55.880000,-1.535000,33.020000>}
box{<0,0,-0.250000><11.430000,0.035000,0.250000> rotate<0,0.000000,0> translate<44.450000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<40.640000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<57.150000,-1.535000,5.080000>}
box{<0,0,-0.250000><16.510000,0.035000,0.250000> rotate<0,0.000000,0> translate<40.640000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<57.150000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,-1.535000,6.350000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<57.150000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<55.880000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,-1.535000,8.890000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,-44.997030,0> translate<55.880000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<33.020000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,0.000000,12.700000>}
box{<0,0,-0.250000><25.400000,0.035000,0.250000> rotate<0,0.000000,0> translate<33.020000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,0.000000,12.700000>}
box{<0,0,-0.250000><6.350000,0.035000,0.250000> rotate<0,90.000000,0> translate<58.420000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<55.880000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,0.000000,26.670000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<55.880000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<55.880000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,-1.535000,30.480000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<55.880000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<55.880000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,0.000000,38.100000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,-44.997030,0> translate<55.880000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<59.690000,0.000000,5.080000>}
box{<0,0,-0.250000><10.160000,0.035000,0.250000> rotate<0,0.000000,0> translate<49.530000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<59.690000,-1.535000,8.890000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,0.000000,0> translate<58.420000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<59.690000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<59.690000,0.000000,8.890000>}
box{<0,0,-0.250000><20.320000,0.035000,0.250000> rotate<0,-90.000000,0> translate<59.690000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<59.690000,-1.535000,26.670000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,0.000000,0> translate<58.420000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<59.690000,0.000000,29.210000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<58.420000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<10.160000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<60.960000,-1.535000,3.810000>}
box{<0,0,-0.250000><50.800000,0.035000,0.250000> rotate<0,0.000000,0> translate<10.160000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<59.690000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<60.960000,0.000000,6.350000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<59.690000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<60.960000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<60.960000,0.000000,10.160000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,90.000000,0> translate<60.960000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<59.690000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<62.230000,-1.535000,24.130000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<59.690000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<63.500000,-1.535000,30.480000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,0.000000,0> translate<58.420000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<58.420000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<63.500000,-1.535000,38.100000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,0.000000,0> translate<58.420000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<60.960000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<64.770000,-1.535000,7.620000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,-44.997030,0> translate<60.960000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<60.960000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<64.770000,0.000000,13.970000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,-44.997030,0> translate<60.960000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<64.770000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<64.770000,0.000000,24.130000>}
box{<0,0,-0.250000><10.160000,0.035000,0.250000> rotate<0,90.000000,0> translate<64.770000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<55.880000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<66.040000,-1.535000,27.940000>}
box{<0,0,-0.250000><10.160000,0.035000,0.250000> rotate<0,0.000000,0> translate<55.880000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<63.500000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<66.040000,-1.535000,33.020000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,-44.997030,0> translate<63.500000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<66.040000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<66.040000,-1.535000,44.450000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,-90.000000,0> translate<66.040000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<25.400000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<66.040000,-1.535000,46.990000>}
box{<0,0,-0.250000><40.640000,0.035000,0.250000> rotate<0,0.000000,0> translate<25.400000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<67.310000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<67.310000,-1.535000,7.620000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,-90.000000,0> translate<67.310000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<45.720000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<67.310000,-1.535000,10.160000>}
box{<0,0,-0.250000><21.590000,0.035000,0.250000> rotate<0,0.000000,0> translate<45.720000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<67.310000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<67.310000,0.000000,24.130000>}
box{<0,0,-0.250000><10.160000,0.035000,0.250000> rotate<0,90.000000,0> translate<67.310000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<53.340000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<67.310000,-1.535000,41.910000>}
box{<0,0,-0.250000><13.970000,0.035000,0.250000> rotate<0,0.000000,0> translate<53.340000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<49.530000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<68.580000,-1.535000,19.050000>}
box{<0,0,-0.250000><19.050000,0.035000,0.250000> rotate<0,0.000000,0> translate<49.530000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<66.040000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<68.580000,-1.535000,30.480000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,-44.997030,0> translate<66.040000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<67.310000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<68.580000,-1.535000,43.180000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<67.310000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<68.580000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<68.580000,-1.535000,43.180000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,-90.000000,0> translate<68.580000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<29.210000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<69.850000,0.000000,3.810000>}
box{<0,0,-0.250000><40.640000,0.035000,0.250000> rotate<0,0.000000,0> translate<29.210000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<67.310000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<69.850000,-1.535000,5.080000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<67.310000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<45.720000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<69.850000,-1.535000,17.780000>}
box{<0,0,-0.250000><24.130000,0.035000,0.250000> rotate<0,0.000000,0> translate<45.720000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<67.310000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<69.850000,-1.535000,21.590000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<67.310000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<69.850000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<69.850000,-1.535000,21.590000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,90.000000,0> translate<69.850000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<69.850000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<71.120000,0.000000,5.080000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<69.850000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<67.310000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<71.120000,0.000000,10.160000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,44.997030,0> translate<67.310000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<71.120000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<71.120000,0.000000,10.160000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,90.000000,0> translate<71.120000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<68.580000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<72.390000,0.000000,15.240000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,44.997030,0> translate<68.580000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<72.390000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<72.390000,0.000000,15.240000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,90.000000,0> translate<72.390000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<72.390000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<74.930000,-1.535000,7.620000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<72.390000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<71.120000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<74.930000,-1.535000,26.670000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,44.997030,0> translate<71.120000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<66.040000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<74.930000,-1.535000,33.020000>}
box{<0,0,-0.250000><8.890000,0.035000,0.250000> rotate<0,0.000000,0> translate<66.040000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<74.930000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<76.200000,-1.535000,7.620000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,0.000000,0> translate<74.930000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<77.470000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<77.470000,0.000000,27.940000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,-90.000000,0> translate<77.470000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<74.930000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<77.470000,-1.535000,30.480000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<74.930000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<77.470000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<77.470000,0.000000,34.290000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,-90.000000,0> translate<77.470000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<69.850000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<78.740000,-1.535000,5.080000>}
box{<0,0,-0.250000><8.890000,0.035000,0.250000> rotate<0,0.000000,0> translate<69.850000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<78.740000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<78.740000,-1.535000,7.620000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,90.000000,0> translate<78.740000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<74.930000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<78.740000,-1.535000,26.670000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,0.000000,0> translate<74.930000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<77.470000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<78.740000,0.000000,33.020000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<77.470000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<80.010000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<80.010000,-1.535000,24.130000>}
box{<0,0,-0.250000><8.890000,0.035000,0.250000> rotate<0,-90.000000,0> translate<80.010000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<78.740000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<80.010000,-1.535000,33.020000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,0.000000,0> translate<78.740000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<78.740000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<81.280000,-1.535000,10.160000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,-44.997030,0> translate<78.740000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<78.740000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<81.280000,0.000000,26.670000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,0.000000,0> translate<78.740000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<77.470000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<81.280000,0.000000,27.940000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,0.000000,0> translate<77.470000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<82.550000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<82.550000,0.000000,24.130000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,-90.000000,0> translate<82.550000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<81.280000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<82.550000,-1.535000,27.940000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,0.000000,0> translate<81.280000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<82.550000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<82.550000,-1.535000,30.480000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,90.000000,0> translate<82.550000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<77.470000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<82.550000,-1.535000,38.100000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,0.000000,0> translate<77.470000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<66.040000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<82.550000,-1.535000,46.990000>}
box{<0,0,-0.250000><16.510000,0.035000,0.250000> rotate<0,0.000000,0> translate<66.040000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<69.850000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<83.820000,-1.535000,21.590000>}
box{<0,0,-0.250000><13.970000,0.035000,0.250000> rotate<0,0.000000,0> translate<69.850000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<83.820000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<85.090000,-1.535000,22.860000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<83.820000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<85.090000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<85.090000,-1.535000,22.860000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,-90.000000,0> translate<85.090000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<82.550000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<85.090000,0.000000,27.940000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,-44.997030,0> translate<82.550000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<82.550000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<85.090000,-1.535000,44.450000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<82.550000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<81.280000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<86.360000,-1.535000,26.670000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,0.000000,0> translate<81.280000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<87.630000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<87.630000,-1.535000,6.350000>}
box{<0,0,-0.250000><1.270000,0.035000,0.250000> rotate<0,-90.000000,0> translate<87.630000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<86.360000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<87.630000,-1.535000,27.940000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<86.360000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<87.630000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<88.900000,-1.535000,5.080000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<87.630000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<87.630000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<88.900000,-1.535000,43.180000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<87.630000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<90.170000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<90.170000,-1.535000,7.620000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,-90.000000,0> translate<90.170000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<81.280000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<90.170000,-1.535000,10.160000>}
box{<0,0,-0.250000><8.890000,0.035000,0.250000> rotate<0,0.000000,0> translate<81.280000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<87.630000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<90.170000,-1.535000,30.480000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,-44.997030,0> translate<87.630000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<87.630000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<90.170000,-1.535000,33.020000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,-44.997030,0> translate<87.630000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<88.900000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<91.440000,-1.535000,5.080000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,0.000000,0> translate<88.900000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<46.990000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<91.440000,-1.535000,11.430000>}
box{<0,0,-0.250000><44.450000,0.035000,0.250000> rotate<0,0.000000,0> translate<46.990000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<91.440000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<92.710000,-1.535000,6.350000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,-44.997030,0> translate<91.440000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<91.440000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<92.710000,-1.535000,10.160000>}
box{<0,0,-0.250000><1.796051,0.035000,0.250000> rotate<0,44.997030,0> translate<91.440000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<92.710000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<92.710000,-1.535000,10.160000>}
box{<0,0,-0.250000><3.810000,0.035000,0.250000> rotate<0,90.000000,0> translate<92.710000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<87.630000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<92.710000,-1.535000,27.940000>}
box{<0,0,-0.250000><5.080000,0.035000,0.250000> rotate<0,0.000000,0> translate<87.630000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<54.610000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<95.250000,0.000000,40.640000>}
box{<0,0,-0.250000><40.640000,0.035000,0.250000> rotate<0,0.000000,0> translate<54.610000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<92.710000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<96.520000,-1.535000,31.750000>}
box{<0,0,-0.250000><5.388154,0.035000,0.250000> rotate<0,-44.997030,0> translate<92.710000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<52.070000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<96.520000,-1.535000,34.290000>}
box{<0,0,-0.250000><44.450000,0.035000,0.250000> rotate<0,0.000000,0> translate<52.070000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<96.520000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<96.520000,0.000000,34.290000>}
box{<0,0,-0.250000><2.540000,0.035000,0.250000> rotate<0,90.000000,0> translate<96.520000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<85.090000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<97.790000,0.000000,27.940000>}
box{<0,0,-0.250000><12.700000,0.035000,0.250000> rotate<0,0.000000,0> translate<85.090000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<97.790000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<97.790000,0.000000,27.940000>}
box{<0,0,-0.250000><10.160000,0.035000,0.250000> rotate<0,-90.000000,0> translate<97.790000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<90.170000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<97.790000,-1.535000,33.020000>}
box{<0,0,-0.250000><7.620000,0.035000,0.250000> rotate<0,0.000000,0> translate<90.170000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<97.790000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<97.790000,-1.535000,33.020000>}
box{<0,0,-0.250000><10.160000,0.035000,0.250000> rotate<0,-90.000000,0> translate<97.790000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<95.250000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<97.790000,0.000000,38.100000>}
box{<0,0,-0.250000><3.592102,0.035000,0.250000> rotate<0,44.997030,0> translate<95.250000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<88.900000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.250000 translate<97.790000,-1.535000,43.180000>}
box{<0,0,-0.250000><8.890000,0.035000,0.250000> rotate<0,0.000000,0> translate<88.900000,-1.535000,43.180000> }
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
cylinder{<40.640000,0.038000,34.290000><40.640000,-1.538000,34.290000>0.406400}
cylinder{<40.640000,0.038000,29.210000><40.640000,-1.538000,29.210000>0.406400}
cylinder{<17.780000,0.038000,22.860000><17.780000,-1.538000,22.860000>0.406400}
cylinder{<22.860000,0.038000,22.860000><22.860000,-1.538000,22.860000>0.406400}
cylinder{<34.290000,0.038000,34.290000><34.290000,-1.538000,34.290000>0.406400}
cylinder{<34.290000,0.038000,31.750000><34.290000,-1.538000,31.750000>0.406400}
cylinder{<77.470000,0.038000,38.100000><77.470000,-1.538000,38.100000>0.406400}
cylinder{<77.470000,0.038000,30.480000><77.470000,-1.538000,30.480000>0.406400}
cylinder{<58.420000,0.038000,38.100000><58.420000,-1.538000,38.100000>0.406400}
cylinder{<58.420000,0.038000,30.480000><58.420000,-1.538000,30.480000>0.406400}
cylinder{<26.670000,0.038000,36.830000><26.670000,-1.538000,36.830000>0.558800}
cylinder{<16.510000,0.038000,36.830000><16.510000,-1.538000,36.830000>0.558800}
cylinder{<21.590000,0.038000,29.210000><21.590000,-1.538000,29.210000>0.508000}
cylinder{<19.050000,0.038000,29.210000><19.050000,-1.538000,29.210000>0.508000}
cylinder{<24.130000,0.038000,29.210000><24.130000,-1.538000,29.210000>0.508000}
cylinder{<34.290000,0.038000,15.240000><34.290000,-1.538000,15.240000>0.406400}
cylinder{<36.830000,0.038000,15.240000><36.830000,-1.538000,15.240000>0.406400}
cylinder{<39.370000,0.038000,15.240000><39.370000,-1.538000,15.240000>0.406400}
cylinder{<41.910000,0.038000,15.240000><41.910000,-1.538000,15.240000>0.406400}
cylinder{<44.450000,0.038000,15.240000><44.450000,-1.538000,15.240000>0.406400}
cylinder{<46.990000,0.038000,15.240000><46.990000,-1.538000,15.240000>0.406400}
cylinder{<49.530000,0.038000,15.240000><49.530000,-1.538000,15.240000>0.406400}
cylinder{<52.070000,0.038000,15.240000><52.070000,-1.538000,15.240000>0.406400}
cylinder{<54.610000,0.038000,15.240000><54.610000,-1.538000,15.240000>0.406400}
cylinder{<54.610000,0.038000,22.860000><54.610000,-1.538000,22.860000>0.406400}
cylinder{<52.070000,0.038000,22.860000><52.070000,-1.538000,22.860000>0.406400}
cylinder{<49.530000,0.038000,22.860000><49.530000,-1.538000,22.860000>0.406400}
cylinder{<46.990000,0.038000,22.860000><46.990000,-1.538000,22.860000>0.406400}
cylinder{<44.450000,0.038000,22.860000><44.450000,-1.538000,22.860000>0.406400}
cylinder{<41.910000,0.038000,22.860000><41.910000,-1.538000,22.860000>0.406400}
cylinder{<39.370000,0.038000,22.860000><39.370000,-1.538000,22.860000>0.406400}
cylinder{<36.830000,0.038000,22.860000><36.830000,-1.538000,22.860000>0.406400}
cylinder{<34.290000,0.038000,22.860000><34.290000,-1.538000,22.860000>0.406400}
cylinder{<87.630000,0.038000,44.450000><87.630000,-1.538000,44.450000>0.508000}
cylinder{<85.090000,0.038000,44.450000><85.090000,-1.538000,44.450000>0.508000}
cylinder{<68.580000,0.038000,44.450000><68.580000,-1.538000,44.450000>0.508000}
cylinder{<66.040000,0.038000,44.450000><66.040000,-1.538000,44.450000>0.508000}
cylinder{<24.130000,0.038000,44.450000><24.130000,-1.538000,44.450000>0.508000}
cylinder{<26.670000,0.038000,44.450000><26.670000,-1.538000,44.450000>0.508000}
cylinder{<67.310000,0.038000,7.620000><67.310000,-1.538000,7.620000>0.508000}
cylinder{<64.770000,0.038000,7.620000><64.770000,-1.538000,7.620000>0.508000}
cylinder{<78.740000,0.038000,7.620000><78.740000,-1.538000,7.620000>0.508000}
cylinder{<76.200000,0.038000,7.620000><76.200000,-1.538000,7.620000>0.508000}
cylinder{<90.170000,0.038000,7.620000><90.170000,-1.538000,7.620000>0.508000}
cylinder{<87.630000,0.038000,7.620000><87.630000,-1.538000,7.620000>0.508000}
cylinder{<82.550000,0.038000,30.480000><82.550000,-1.538000,30.480000>0.500000}
cylinder{<85.090000,0.038000,30.480000><85.090000,-1.538000,30.480000>0.500000}
cylinder{<87.630000,0.038000,30.480000><87.630000,-1.538000,30.480000>0.500000}
cylinder{<90.170000,0.038000,30.480000><90.170000,-1.538000,30.480000>0.500000}
cylinder{<92.710000,0.038000,30.480000><92.710000,-1.538000,30.480000>0.500000}
cylinder{<92.710000,0.038000,38.100000><92.710000,-1.538000,38.100000>0.500000}
cylinder{<90.170000,0.038000,38.100000><90.170000,-1.538000,38.100000>0.500000}
cylinder{<87.630000,0.038000,38.100000><87.630000,-1.538000,38.100000>0.500000}
cylinder{<85.090000,0.038000,38.100000><85.090000,-1.538000,38.100000>0.500000}
cylinder{<82.550000,0.038000,38.100000><82.550000,-1.538000,38.100000>0.500000}
cylinder{<63.500000,0.038000,30.480000><63.500000,-1.538000,30.480000>0.500000}
cylinder{<66.040000,0.038000,30.480000><66.040000,-1.538000,30.480000>0.500000}
cylinder{<68.580000,0.038000,30.480000><68.580000,-1.538000,30.480000>0.500000}
cylinder{<71.120000,0.038000,30.480000><71.120000,-1.538000,30.480000>0.500000}
cylinder{<73.660000,0.038000,30.480000><73.660000,-1.538000,30.480000>0.500000}
cylinder{<73.660000,0.038000,38.100000><73.660000,-1.538000,38.100000>0.500000}
cylinder{<71.120000,0.038000,38.100000><71.120000,-1.538000,38.100000>0.500000}
cylinder{<68.580000,0.038000,38.100000><68.580000,-1.538000,38.100000>0.500000}
cylinder{<66.040000,0.038000,38.100000><66.040000,-1.538000,38.100000>0.500000}
cylinder{<63.500000,0.038000,38.100000><63.500000,-1.538000,38.100000>0.500000}
cylinder{<7.620000,0.038000,13.970000><7.620000,-1.538000,13.970000>0.660400}
cylinder{<12.700000,0.038000,13.970000><12.700000,-1.538000,13.970000>0.660400}
cylinder{<10.160000,0.038000,24.130000><10.160000,-1.538000,24.130000>0.660400}
cylinder{<54.610000,0.038000,26.670000><54.610000,-1.538000,26.670000>0.406400}
cylinder{<54.610000,0.038000,36.830000><54.610000,-1.538000,36.830000>0.406400}
cylinder{<52.070000,0.038000,26.670000><52.070000,-1.538000,26.670000>0.406400}
cylinder{<52.070000,0.038000,36.830000><52.070000,-1.538000,36.830000>0.406400}
cylinder{<82.550000,0.038000,24.130000><82.550000,-1.538000,24.130000>0.406400}
cylinder{<80.010000,0.038000,24.130000><80.010000,-1.538000,24.130000>0.406400}
cylinder{<85.090000,0.038000,24.130000><85.090000,-1.538000,24.130000>0.406400}
cylinder{<64.770000,0.038000,24.130000><64.770000,-1.538000,24.130000>0.406400}
cylinder{<62.230000,0.038000,24.130000><62.230000,-1.538000,24.130000>0.406400}
cylinder{<67.310000,0.038000,24.130000><67.310000,-1.538000,24.130000>0.406400}
cylinder{<8.890000,0.038000,8.890000><8.890000,-1.538000,8.890000>0.508000}
cylinder{<11.430000,0.038000,8.890000><11.430000,-1.538000,8.890000>0.508000}
cylinder{<13.970000,0.038000,8.890000><13.970000,-1.538000,8.890000>0.508000}
cylinder{<16.510000,0.038000,8.890000><16.510000,-1.538000,8.890000>0.508000}
cylinder{<19.050000,0.038000,8.890000><19.050000,-1.538000,8.890000>0.508000}
cylinder{<21.590000,0.038000,8.890000><21.590000,-1.538000,8.890000>0.508000}
cylinder{<24.130000,0.038000,8.890000><24.130000,-1.538000,8.890000>0.508000}
cylinder{<26.670000,0.038000,8.890000><26.670000,-1.538000,8.890000>0.508000}
cylinder{<29.210000,0.038000,8.890000><29.210000,-1.538000,8.890000>0.508000}
cylinder{<31.750000,0.038000,8.890000><31.750000,-1.538000,8.890000>0.508000}
cylinder{<34.290000,0.038000,8.890000><34.290000,-1.538000,8.890000>0.508000}
cylinder{<36.830000,0.038000,8.890000><36.830000,-1.538000,8.890000>0.508000}
cylinder{<39.370000,0.038000,8.890000><39.370000,-1.538000,8.890000>0.508000}
cylinder{<41.910000,0.038000,8.890000><41.910000,-1.538000,8.890000>0.508000}
cylinder{<44.450000,0.038000,8.890000><44.450000,-1.538000,8.890000>0.508000}
cylinder{<46.990000,0.038000,8.890000><46.990000,-1.538000,8.890000>0.508000}
//Holes(fast)/Vias
cylinder{<81.280000,0.038000,27.940000><81.280000,-1.538000,27.940000>0.304800 }
cylinder{<59.690000,0.038000,8.890000><59.690000,-1.538000,8.890000>0.304800 }
cylinder{<78.740000,0.038000,26.670000><78.740000,-1.538000,26.670000>0.304800 }
cylinder{<81.280000,0.038000,26.670000><81.280000,-1.538000,26.670000>0.304800 }
cylinder{<96.520000,0.038000,34.290000><96.520000,-1.538000,34.290000>0.304800 }
cylinder{<96.520000,0.038000,31.750000><96.520000,-1.538000,31.750000>0.304800 }
cylinder{<31.750000,0.038000,20.320000><31.750000,-1.538000,20.320000>0.304800 }
cylinder{<58.420000,0.038000,6.350000><58.420000,-1.538000,6.350000>0.304800 }
cylinder{<30.480000,0.038000,25.400000><30.480000,-1.538000,25.400000>0.304800 }
cylinder{<25.400000,0.038000,13.970000><25.400000,-1.538000,13.970000>0.304800 }
cylinder{<25.400000,0.038000,11.430000><25.400000,-1.538000,11.430000>0.304800 }
cylinder{<29.210000,0.038000,6.350000><29.210000,-1.538000,6.350000>0.304800 }
cylinder{<50.800000,0.038000,31.750000><50.800000,-1.538000,31.750000>0.304800 }
cylinder{<49.530000,0.038000,38.100000><49.530000,-1.538000,38.100000>0.304800 }
cylinder{<78.740000,0.038000,33.020000><78.740000,-1.538000,33.020000>0.304800 }
cylinder{<58.420000,0.038000,26.670000><58.420000,-1.538000,26.670000>0.304800 }
cylinder{<13.970000,0.038000,11.430000><13.970000,-1.538000,11.430000>0.304800 }
cylinder{<20.320000,0.038000,26.670000><20.320000,-1.538000,26.670000>0.304800 }
cylinder{<20.320000,0.038000,12.700000><20.320000,-1.538000,12.700000>0.304800 }
cylinder{<7.620000,0.038000,17.780000><7.620000,-1.538000,17.780000>0.304800 }
cylinder{<10.160000,0.038000,3.810000><10.160000,-1.538000,3.810000>0.304800 }
cylinder{<68.580000,0.038000,19.050000><68.580000,-1.538000,19.050000>0.304800 }
cylinder{<72.390000,0.038000,10.160000><72.390000,-1.538000,10.160000>0.304800 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.275000,0.000000,32.054800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.640000,0.000000,32.054800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<40.640000,0.000000,32.054800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.640000,0.000000,32.054800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.005000,0.000000,32.054800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<40.005000,0.000000,32.054800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,32.054800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,33.274000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<40.640000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.275000,0.000000,31.419800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.640000,0.000000,31.419800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<40.640000,0.000000,31.419800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.640000,0.000000,31.419800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.005000,0.000000,31.419800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<40.005000,0.000000,31.419800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,31.419800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,30.226000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.640000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,35.433000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,35.433000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.624000,0.000000,35.433000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,28.321000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.370000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,28.067000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.624000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,35.179000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.910000,0.000000,35.179000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<41.656000,0.000000,28.321000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<39.624000,0.000000,28.321000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<39.624000,0.000000,35.179000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<41.656000,0.000000,35.179000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.015200,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.015200,0.000000,22.860000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<20.015200,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.015200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.015200,0.000000,22.225000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<20.015200,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.015200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,22.860000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<18.796000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.650200,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.650200,0.000000,22.860000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<20.650200,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.650200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<20.650200,0.000000,22.225000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<20.650200,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.650200,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.844000,0.000000,22.860000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<20.650200,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,21.844000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.637000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.749000,0.000000,21.590000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,23.876000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.003000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.749000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,24.130000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,24.130000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.749000,0.000000,23.876000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.749000,0.000000,21.844000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<16.891000,0.000000,21.844000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<16.891000,0.000000,23.876000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,35.306000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.290000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,35.687000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.909000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,33.782000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.290000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,33.782000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.020000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,33.274000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,33.274000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.020000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,33.782000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.560000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,33.782000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.290000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,31.369000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.290000,0.000000,31.369000> }
difference{
cylinder{<34.290000,0,33.020000><34.290000,0.036000,33.020000>3.505200 translate<0,0.000000,0>}
cylinder{<34.290000,-0.1,33.020000><34.290000,0.135000,33.020000>3.352800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<34.290000,0.000000,32.512000>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<77.470000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<77.470000,0.000000,37.211000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<77.470000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<77.470000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<77.470000,0.000000,31.369000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<77.470000,0.000000,31.369000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,34.290000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<77.470000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,35.306000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.835000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,34.290000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<77.470000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,35.814000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<77.470000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,35.306000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<76.835000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.835000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,34.290000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.835000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<77.470000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.105000,0.000000,34.290000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<77.470000,0.000000,34.290000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<76.708000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.708000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.232000,0.000000,36.576000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.708000,0.000000,36.576000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<78.232000,0.000000,36.322000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<76.708000,0.000000,32.258000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<78.232000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.486000,0.000000,36.322000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<78.486000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.708000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<78.232000,0.000000,32.004000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<76.708000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<76.454000,0.000000,36.322000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<76.454000,0.000000,36.322000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-90.000000,0> translate<77.470000,0.000000,32.639000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-90.000000,0> translate<77.470000,0.000000,36.893500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-90.000000,0> translate<77.470000,0.000000,31.686500>}
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<58.420000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<58.420000,0.000000,37.211000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<58.420000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<58.420000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<58.420000,0.000000,31.369000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<58.420000,0.000000,31.369000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,34.290000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.420000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,35.306000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,34.290000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<58.420000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,35.814000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.420000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,35.306000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<57.785000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,34.290000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.420000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,34.290000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<58.420000,0.000000,34.290000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<57.658000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,36.576000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.658000,0.000000,36.576000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<59.182000,0.000000,36.322000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<57.658000,0.000000,32.258000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<59.182000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.436000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.436000,0.000000,36.322000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.436000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.658000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.182000,0.000000,32.004000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.658000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.404000,0.000000,36.322000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.404000,0.000000,36.322000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-90.000000,0> translate<58.420000,0.000000,32.639000>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-90.000000,0> translate<58.420000,0.000000,36.893500>}
box{<-0.317500,0,-0.254000><0.317500,0.036000,0.254000> rotate<0,-90.000000,0> translate<58.420000,0.000000,31.686500>}
//D3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,35.560000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.558000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,38.100000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.622000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.622000,0.000000,38.100000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.558000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,35.560000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.558000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<26.670000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<25.654000,0.000000,36.830000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,0.000000,0> translate<25.654000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<16.510000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.381000 translate<17.526000,0.000000,36.830000>}
box{<0,0,-0.381000><1.016000,0.036000,0.381000> rotate<0,0.000000,0> translate<16.510000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,36.830000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.955000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,36.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.606000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,36.830000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,32.003271,0> translate<21.590000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.114000,0.000000,36.830000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.590000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,37.465000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-32.003271,0> translate<21.590000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,36.830000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.590000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,36.195000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.590000,0.000000,36.195000> }
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-0.000000,0> translate<20.193000,0.000000,36.830000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-0.000000,0> translate<24.574500,0.000000,36.830000>}
box{<-0.952500,0,-0.381000><0.952500,0.036000,0.381000> rotate<0,-0.000000,0> translate<18.605500,0.000000,36.830000>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,27.686000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.416000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.764000,0.000000,27.432000>}
box{<0,0,-0.076200><9.652000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.764000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.764000,0.000000,27.432000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<16.510000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,27.686000>}
box{<0,0,-0.076200><2.921000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.670000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,30.607000>}
box{<0,0,-0.076200><2.921000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.510000,0.000000,30.607000> }
difference{
cylinder{<16.967200,0,28.041600><16.967200,0.036000,28.041600>0.254000 translate<0,0.000000,0>}
cylinder{<16.967200,-0.1,28.041600><16.967200,0.135000,28.041600>0.254000 translate<0,0.000000,0>}}
box{<-0.952500,0,-0.635000><0.952500,0.036000,0.635000> rotate<0,-0.000000,0> translate<17.208500,0.000000,31.115000>}
box{<-0.889000,0,-0.381000><0.889000,0.036000,0.381000> rotate<0,-0.000000,0> translate<19.050000,0.000000,31.369000>}
box{<-0.381000,0,-0.635000><0.381000,0.036000,0.635000> rotate<0,-0.000000,0> translate<20.320000,0.000000,31.115000>}
box{<-0.889000,0,-0.381000><0.889000,0.036000,0.381000> rotate<0,-0.000000,0> translate<21.590000,0.000000,31.369000>}
box{<-0.381000,0,-0.635000><0.381000,0.036000,0.635000> rotate<0,-0.000000,0> translate<22.860000,0.000000,31.115000>}
box{<-0.889000,0,-0.381000><0.889000,0.036000,0.381000> rotate<0,-0.000000,0> translate<24.130000,0.000000,31.369000>}
box{<-0.952500,0,-0.635000><0.952500,0.036000,0.635000> rotate<0,-0.000000,0> translate<25.971500,0.000000,31.115000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-0.000000,0> translate<19.050000,0.000000,30.734000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-0.000000,0> translate<21.590000,0.000000,30.734000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-0.000000,0> translate<24.130000,0.000000,30.734000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,16.510000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,16.510000> }
object{ARC(0.635000,0.152400,270.000000,450.000000,0.036000) translate<33.020000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,16.510000>}
box{<0,0,-0.076200><22.860000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.020000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,21.590000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.880000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.880000,0.000000,21.590000>}
box{<0,0,-0.076200><22.860000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.020000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,19.685000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,19.685000> }
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,45.720000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.820000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,45.720000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.820000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,43.180000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.820000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,46.355000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<83.820000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<83.820000,0.000000,46.355000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<83.820000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,43.180000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<88.900000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<88.900000,0.000000,45.720000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<88.900000,0.000000,45.720000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<87.630000,0.000000,44.450000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<85.090000,0.000000,44.450000>}
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,45.720000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<64.770000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,45.720000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.770000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,43.180000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.770000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,46.355000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<64.770000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,46.355000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<64.770000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,43.180000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.850000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<69.850000,0.000000,45.720000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<69.850000,0.000000,45.720000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<68.580000,0.000000,44.450000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<66.040000,0.000000,44.450000>}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,43.180000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.940000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,43.180000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,45.720000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,42.545000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.940000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,42.545000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,45.720000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.860000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,43.180000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.860000,0.000000,43.180000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<24.130000,0.000000,44.450000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<26.670000,0.000000,44.450000>}
//J4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,8.890000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.500000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,8.890000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.500000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,6.350000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.500000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,9.525000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<63.500000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.500000,0.000000,9.525000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<63.500000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,6.350000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.580000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.580000,0.000000,8.890000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<68.580000,0.000000,8.890000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<67.310000,0.000000,7.620000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<64.770000,0.000000,7.620000>}
//J5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,8.890000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.930000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,8.890000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<74.930000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,6.350000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<74.930000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,9.525000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<74.930000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.930000,0.000000,9.525000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<74.930000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,6.350000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.010000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<80.010000,0.000000,8.890000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<80.010000,0.000000,8.890000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<78.740000,0.000000,7.620000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<76.200000,0.000000,7.620000>}
//J6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.360000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.360000,0.000000,8.890000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<86.360000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.360000,0.000000,8.890000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<86.360000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.360000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,6.350000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<86.360000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.360000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.360000,0.000000,9.525000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<86.360000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<86.360000,0.000000,9.525000>}
box{<0,0,-0.076200><5.080000,0.036000,0.076200> rotate<0,0.000000,0> translate<86.360000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,6.350000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<91.440000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<91.440000,0.000000,8.890000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,-90.000000,0> translate<91.440000,0.000000,8.890000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<90.170000,0.000000,7.620000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<87.630000,0.000000,7.620000>}
//K1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.730000,0.000000,38.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.530000,0.000000,38.690000>}
box{<0,0,-0.101600><13.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<80.730000,0.000000,38.690000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.530000,0.000000,38.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.530000,0.000000,29.890000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<94.530000,0.000000,29.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<94.530000,0.000000,29.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.730000,0.000000,29.890000>}
box{<0,0,-0.101600><13.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<80.730000,0.000000,29.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.730000,0.000000,29.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<80.730000,0.000000,38.690000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<80.730000,0.000000,38.690000> }
box{<-0.635000,0,-2.540000><0.635000,0.036000,2.540000> rotate<0,-0.000000,0> translate<81.915000,0.000000,34.290000>}
//K2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.680000,0.000000,38.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.480000,0.000000,38.690000>}
box{<0,0,-0.101600><13.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<61.680000,0.000000,38.690000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.480000,0.000000,38.690000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.480000,0.000000,29.890000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<75.480000,0.000000,29.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<75.480000,0.000000,29.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.680000,0.000000,29.890000>}
box{<0,0,-0.101600><13.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<61.680000,0.000000,29.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.680000,0.000000,29.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<61.680000,0.000000,38.690000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<61.680000,0.000000,38.690000> }
box{<-0.635000,0,-2.540000><0.635000,0.036000,2.540000> rotate<0,-0.000000,0> translate<62.865000,0.000000,34.290000>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,20.701000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.779000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,20.701000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.779000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,19.431000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.541000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,18.923000>}
box{<0,0,-0.076200><0.813197,0.036000,0.076200> rotate<0,38.657257,0> translate<10.541000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,18.669000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.176000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,18.669000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.541000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,17.399000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.541000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,17.399000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.779000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,18.669000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.779000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,18.669000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.144000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,18.923000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.144000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.779000,0.000000,19.431000>}
box{<0,0,-0.076200><0.813197,0.036000,0.076200> rotate<0,-38.657257,0> translate<9.144000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,24.130000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.636000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.732000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,24.130000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.684000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.128000,0.000000,17.018000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,-44.997030,0> translate<8.128000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,17.018000>}
box{<0,0,-0.076200><0.718420,0.036000,0.076200> rotate<0,44.997030,0> translate<11.684000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,19.050000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.239000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,0.000000,19.050000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.573000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.382000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.128000,0.000000,21.082000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<8.128000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.938000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,21.082000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<11.938000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,21.463000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,21.971000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.160000,0.000000,21.971000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,13.970000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.303000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.303000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,13.970000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.017000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,13.970000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.223000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.588000,0.000000,13.970000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.588000,0.000000,13.970000> }
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<14.732000,0.000000,14.351000>}
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<14.732000,0.000000,23.749000>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<5.588000,0.000000,23.749000>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<5.588000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.732000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.097000,0.000000,13.970000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.097000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,14.351000>}
box{<0,0,-0.076200><9.398000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.113000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.588000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,24.130000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.588000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,23.749000>}
box{<0,0,-0.076200><9.398000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.207000,0.000000,23.749000> }
difference{
cylinder{<10.160000,0,19.050000><10.160000,0.036000,19.050000>2.108200 translate<0,0.000000,0>}
cylinder{<10.160000,-0.1,19.050000><10.160000,0.135000,19.050000>1.955800 translate<0,0.000000,0>}}
difference{
cylinder{<10.160000,0,19.050000><10.160000,0.036000,19.050000>2.997200 translate<0,0.000000,0>}
cylinder{<10.160000,-0.1,19.050000><10.160000,0.135000,19.050000>2.844800 translate<0,0.000000,0>}}
box{<-0.508000,0,-0.190500><0.508000,0.036000,0.190500> rotate<0,-0.000000,0> translate<10.160000,0.000000,24.320500>}
box{<-0.508000,0,-0.889000><0.508000,0.036000,0.889000> rotate<0,-0.000000,0> translate<12.700000,0.000000,14.478000>}
box{<-1.587500,0,-0.508000><1.587500,0.036000,0.508000> rotate<0,-0.000000,0> translate<13.144500,0.000000,15.875000>}
box{<-0.762000,0,-1.333500><0.762000,0.036000,1.333500> rotate<0,-0.000000,0> translate<13.970000,0.000000,17.716500>}
box{<-0.762000,0,-1.333500><0.762000,0.036000,1.333500> rotate<0,-0.000000,0> translate<6.350000,0.000000,17.716500>}
box{<-1.587500,0,-0.508000><1.587500,0.036000,0.508000> rotate<0,-0.000000,0> translate<7.175500,0.000000,15.875000>}
box{<-0.508000,0,-0.889000><0.508000,0.036000,0.889000> rotate<0,-0.000000,0> translate<7.620000,0.000000,14.478000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.610000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.610000,0.000000,35.814000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<54.610000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.610000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.610000,0.000000,27.686000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<54.610000,0.000000,27.686000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<53.721000,0.000000,28.829000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<55.499000,0.000000,28.829000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<55.499000,0.000000,34.671000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<53.721000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,28.575000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.721000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.467000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.467000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,0.000000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.753000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,0.000000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<55.626000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,34.290000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<53.467000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,29.337000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.594000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,0.000000,34.290000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.626000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,29.337000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.626000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.467000,0.000000,34.290000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.467000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.753000,0.000000,34.290000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.753000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,34.925000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.721000,0.000000,34.925000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<54.610000,0.000000,35.356800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<54.610000,0.000000,28.143200>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,35.814000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<52.070000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<52.070000,0.000000,27.686000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<52.070000,0.000000,27.686000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<51.181000,0.000000,28.829000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<52.959000,0.000000,28.829000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<52.959000,0.000000,34.671000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<51.181000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,28.575000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.181000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.927000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.927000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,29.210000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.213000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,29.210000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<53.086000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,34.290000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<50.927000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,29.337000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.054000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,34.290000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.086000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,29.337000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.086000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.927000,0.000000,34.290000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.927000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.213000,0.000000,34.290000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.213000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,34.925000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.181000,0.000000,34.925000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<52.070000,0.000000,35.356800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<52.070000,0.000000,28.143200>}
//T1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.455000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<84.645000,0.000000,22.479000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,0.000000,0> translate<80.455000,0.000000,22.479000> }
object{ARC(2.666994,0.127000,25.208500,154.791500,0.036000) translate<82.550000,0.000000,24.129991>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.686000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.414000,0.000000,24.003000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,0.000000,0> translate<81.414000,0.000000,24.003000> }
object{ARC(2.667019,0.127000,154.790209,182.727809,0.036000) translate<82.549997,0.000000,24.129928>}
object{ARC(2.667025,0.127000,182.731349,205.210149,0.036000) translate<82.549997,0.000000,24.130091>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.146000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<79.886000,0.000000,24.003000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,0.000000,0> translate<79.886000,0.000000,24.003000> }
object{ARC(2.667041,0.127000,205.210352,218.248852,0.036000) translate<82.549506,0.000000,24.130106>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.414000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.146000,0.000000,24.003000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,0.000000,0> translate<81.146000,0.000000,24.003000> }
object{ARC(2.667025,0.127000,334.789851,357.268651,0.036000) translate<82.550003,0.000000,24.130091>}
object{ARC(2.667019,0.127000,357.272191,385.209791,0.036000) translate<82.550003,0.000000,24.129928>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<85.214000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.954000,0.000000,24.003000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,0.000000,0> translate<83.954000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.954000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.686000,0.000000,24.003000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,0.000000,0> translate<83.686000,0.000000,24.003000> }
object{ARC(2.667044,0.127000,321.751123,335.360523,0.036000) translate<82.550494,0.000000,24.130109>}
//T2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.675000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.865000,0.000000,22.479000>}
box{<0,0,-0.063500><4.190000,0.036000,0.063500> rotate<0,0.000000,0> translate<62.675000,0.000000,22.479000> }
object{ARC(2.666994,0.127000,25.208500,154.791500,0.036000) translate<64.770000,0.000000,24.129991>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.906000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.634000,0.000000,24.003000>}
box{<0,0,-0.063500><2.272000,0.036000,0.063500> rotate<0,0.000000,0> translate<63.634000,0.000000,24.003000> }
object{ARC(2.667019,0.127000,154.790209,182.727809,0.036000) translate<64.769997,0.000000,24.129928>}
object{ARC(2.667025,0.127000,182.731349,205.210149,0.036000) translate<64.769997,0.000000,24.130091>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.366000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.106000,0.000000,24.003000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,0.000000,0> translate<62.106000,0.000000,24.003000> }
object{ARC(2.667041,0.127000,205.210352,218.248852,0.036000) translate<64.769506,0.000000,24.130106>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.634000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.366000,0.000000,24.003000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,0.000000,0> translate<63.366000,0.000000,24.003000> }
object{ARC(2.667025,0.127000,334.789851,357.268651,0.036000) translate<64.770003,0.000000,24.130091>}
object{ARC(2.667019,0.127000,357.272191,385.209791,0.036000) translate<64.770003,0.000000,24.129928>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.434000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.174000,0.000000,24.003000>}
box{<0,0,-0.063500><1.260000,0.036000,0.063500> rotate<0,0.000000,0> translate<66.174000,0.000000,24.003000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.174000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.906000,0.000000,24.003000>}
box{<0,0,-0.063500><0.268000,0.036000,0.063500> rotate<0,0.000000,0> translate<65.906000,0.000000,24.003000> }
object{ARC(2.667044,0.127000,321.751123,335.360523,0.036000) translate<64.770494,0.000000,24.130109>}
//U$1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.495000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.765000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.495000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.765000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.400000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.765000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.400000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.765000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.765000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.320000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,10.160000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.320000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.225000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.955000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.225000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.860000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.225000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.860000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.225000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.225000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.225000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.955000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.320000,0.000000,8.255000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.320000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.495000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.860000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.860000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.860000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.495000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.860000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.765000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.495000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.495000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.875000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.875000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.780000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.145000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.780000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.145000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.780000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.415000,0.000000,10.160000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.780000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.415000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.685000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.415000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.685000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.320000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.685000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.320000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.685000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.685000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.685000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.415000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.415000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.415000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.780000,0.000000,8.255000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.780000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.700000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.335000,0.000000,10.160000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<12.700000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.335000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.605000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.335000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.605000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.240000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<14.605000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.240000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.605000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<14.605000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.605000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.335000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.335000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.335000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.700000,0.000000,8.255000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<12.700000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.875000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.240000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<15.240000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.240000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.875000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<15.240000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.875000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.875000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.255000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.525000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.255000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.525000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.160000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<9.525000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.160000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.525000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<9.525000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.160000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.795000,0.000000,10.160000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<10.160000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.795000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.065000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.795000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.065000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.700000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<12.065000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.700000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.065000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<12.065000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.065000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.795000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.795000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.795000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.160000,0.000000,8.255000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<10.160000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.620000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.620000,0.000000,8.255000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.620000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.255000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.620000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<7.620000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.620000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.255000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<7.620000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.525000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.255000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.255000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.275000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.545000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.275000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.545000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.180000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<42.545000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.180000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.545000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<42.545000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.100000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.735000,0.000000,10.160000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<38.100000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.735000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.005000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.735000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.005000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.640000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<40.005000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.640000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.005000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<40.005000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.005000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.735000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.735000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.735000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.100000,0.000000,8.255000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<38.100000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.275000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.640000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<40.640000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.640000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.275000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<40.640000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.545000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.275000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.275000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.655000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.925000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.655000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.925000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.560000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<34.925000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.560000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.925000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.925000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.560000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.195000,0.000000,10.160000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.560000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.195000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.465000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.195000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.465000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.100000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<37.465000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.100000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.465000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<37.465000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.465000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.195000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.195000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.195000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.560000,0.000000,8.255000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<35.560000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.480000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.115000,0.000000,10.160000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<30.480000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.115000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.385000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.115000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.385000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<32.385000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.385000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.385000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.385000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.115000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<31.115000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.115000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.480000,0.000000,8.255000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<30.480000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.655000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<33.020000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.020000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.655000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<33.020000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.925000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.655000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.655000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.035000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.305000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.035000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.305000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.940000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<27.305000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.940000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.305000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.305000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.940000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.575000,0.000000,10.160000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.940000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.575000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.845000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.575000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.845000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.480000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<29.845000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.480000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.845000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.845000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.845000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.575000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.575000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.575000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.940000,0.000000,8.255000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<27.940000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.035000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.400000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<25.400000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.400000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.035000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<25.400000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.305000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.035000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.035000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.815000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.180000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<43.180000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.815000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.085000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.815000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.085000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.720000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<45.085000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.720000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.085000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<45.085000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.085000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.815000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.815000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.180000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.815000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<43.180000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.355000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.720000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<45.720000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.355000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.625000,0.000000,10.160000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<46.355000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.625000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.260000,0.000000,9.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<47.625000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.260000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.260000,0.000000,8.255000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<48.260000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.260000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.625000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<47.625000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.625000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.355000,0.000000,7.620000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<46.355000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.720000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.355000,0.000000,7.620000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<45.720000,0.000000,8.255000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<24.130000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<21.590000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<19.050000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<16.510000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<13.970000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<11.430000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<8.890000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<41.910000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<39.370000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.830000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<34.290000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<31.750000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<29.210000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<26.670000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<44.450000,0.000000,8.890000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<46.990000,0.000000,8.890000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MAIN(-49.530100,0,-25.395000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//C3	100u	E2,5-7
//J1		10X02MTA
//J2		10X02MTA
//J3		10X02MTA
//J4		10X02MTA
//J5		10X02MTA
//J6		10X02MTA
//K1	TF2--5V	TF2
//K2	TF2--5V	TF2
//R1		CA9V
//U$1	LCD_BL_16X2	HEADER_16
