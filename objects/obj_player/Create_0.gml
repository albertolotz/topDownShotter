/// @description Insert description here
// You can write your code in this editor

velocidade_player = 5;
velocidade_vertical_player = 0;
velocidade_horizontal_player = 0;


function movimentacao_player(){
	var left, right, up, down, player_em_movimento;

	left = keyboard_check(vk_left);
	right = keyboard_check(vk_right);
	up = keyboard_check(vk_up);
	down = keyboard_check(vk_down);

	velocidade_vertical_player = (down - up) * velocidade_player;
	velocidade_horizontal_player = (right - left) * velocidade_player;
	
	y += velocidade_vertical_player
	x += velocidade_horizontal_player;
	
	player_em_movimento = velocidade_horizontal_player + velocidade_vertical_player;
	if(player_em_movimento == 0) image_index = 1;
};

function persegue_objeto(objeto){
	if(objeto=="Mouse") image_angle = point_direction(x,y, mouse_x, mouse_y);
}

function move_camera(){
	var camera_atual = view_camera[0];
	var borda_horizontal = camera_get_view_width(camera_atual) * 0.2;
	var borda_vertical = camera_get_view_height(camera_atual) * 0.2;
	
	camera_set_view_border(camera_atual, borda_horizontal ,borda_vertical);
	camera_set_view_target(camera_atual, id);
}
