/// @description Insert description here
// You can write your code in this editor

velocidade_player = 5;
velocidade_vertical_player = 0;
velocidade_horizontal_player = 0;

tiro_player_velocidade = 6;
tiro_player_espera = room_speed * 0.2;
tiro_player_espera_contador = room_speed;

player_atirando_frame_tempo = room_speed * 0.4;
player_atirando_frame_tempo_contador = 0;



function movimentacao_player(){
	var left, right, up, down, player_em_movimento;

	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	up = keyboard_check(ord("W"));
	down = keyboard_check(ord("S"));

	velocidade_vertical_player = (down - up) * velocidade_player;
	velocidade_horizontal_player = (right - left) * velocidade_player;
	
	y += velocidade_vertical_player
	x += velocidade_horizontal_player;
	
	player_em_movimento = velocidade_horizontal_player + velocidade_vertical_player;
	if(player_em_movimento == 0) image_index = 1;
};

function alvo_direcao(objeto){
	if(objeto=="Mouse") return point_direction(x,y, mouse_x, mouse_y);
}

function persegue(objeto){
	if(objeto=="Mouse") image_angle =  point_direction(x,y, mouse_x, mouse_y);
}

function move_camera(){
	var camera_atual = view_camera[0];
	var borda_horizontal = camera_get_view_width(camera_atual) * 0.2;
	var borda_vertical = camera_get_view_height(camera_atual) * 0.2;
	
	camera_set_view_border(camera_atual, borda_horizontal ,borda_vertical);
	camera_set_view_target(camera_atual, id);
}

function aplica_frame_player_atirando(){
	sprite_index = spr_player_atirando;
	player_atirando_frame_tempo_contador = player_atirando_frame_tempo;
};

function aplica_frame_player_andando(){
	if(!sprite_index=spr_player){
		player_atirando_frame_tempo_contador --
		if(player_atirando_frame_tempo_contador<=0) sprite_index = spr_player;
	};
};

function player_atira(){
	var tiro_player_direcao = alvo_direcao("Mouse");
	var btn_direito_mouse = mouse_check_button(mb_right);
	
	if(btn_direito_mouse && tiro_player_espera_contador <= 0){
		tiro_player_espera_contador = tiro_player_espera;
		aplica_frame_player_atirando();		
		var tiro_player = instance_create_layer(x,y,"Tiros",obj_tiro_player);
			tiro_player.speed = tiro_player_velocidade;
			tiro_player.image_angle = tiro_player_direcao;
			tiro_player.direction =tiro_player_direcao;
	};
	
	tiro_player_espera_contador --;
	aplica_frame_player_andando();
};


