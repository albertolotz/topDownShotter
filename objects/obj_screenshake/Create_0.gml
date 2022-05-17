/// @description Insert description here
// You can write your code in this editor

global.tremer = 0;

function screenshake(){
	if(room_speed * global.tremer > 0){
		view_xport[0] = irandom_range(-global.tremer, global.tremer);
		view_yport[0] = irandom_range(-global.tremer, global.tremer);
		global.tremer *= 0.95;
	};
};
