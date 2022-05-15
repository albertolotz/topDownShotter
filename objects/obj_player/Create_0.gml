/// @description Insert description here
// You can write your code in this editor

velocidade_player = 5;
velocidade_vertical_player = 0;
velocidade_horizontal_player = 0;


function movimentacao_player(){
	var left, right, up, down;

	left = keyboard_check(vk_left);
	right = keyboard_check(vk_right);
	up = keyboard_check(vk_up);
	down = keyboard_check(vk_down);

	velocidade_vertical_player = (down - up) * velocidade_player;
	velocidade_horizontal_player = (right - left) * velocidade_player;
	
	
	y += velocidade_vertical_player
	x += velocidade_horizontal_player;
};

function persegue_objeto(objeto){
	if(objeto=="Mouse") image_angle = point_direction(x,y, mouse_x, mouse_y);
}
