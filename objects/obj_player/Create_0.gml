/// @description Insert description here
// You can write your code in this editor

velocidade_player = 5;
velocidade_vertical_player = 0;
velocidade_horizontal_player = 0;

tiro_player_velocidade = 6;
tiro_player_espera = room_speed * 0.2;
tiro_player_espera_contador = room_speed;

player_atirando_frame_tempo = room_speed * 0.2;
player_atirando_frame_tempo_contador = 0;

player_invencivel_tempo = room_speed * 3;
player_invencivel_tempo_contador = 0;

player_pode_piscar = false;

level_reinicia_tempo = room_speed * 3;
level_reinicia_contador = level_reinicia_tempo;


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
	
	//ficando dentro da room
	var desconto_largura_sprite = sprite_width/2;
	var desconto_altura_sprite = sprite_height/2;
	x=clamp(x,desconto_largura_sprite, room_width-desconto_largura_sprite);
	y=clamp(y,desconto_altura_sprite, room_height-desconto_altura_sprite);
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
	if(sprite_index!=spr_player){
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

function player_perde_vida(){

	colisao = instance_place(x,y,obj_inimigo_pai);
	
	if(player_invencivel_tempo_contador>=0) player_invencivel_tempo_contador --;
	if(player_invencivel_tempo_contador <= 0){
		if(colisao != noone){
			obj_control.player_vidas -= colisao.dano_inimigo;
			global.tremer = 20;
			player_invencivel_tempo_contador = player_invencivel_tempo;
			player_pode_piscar = true;
		};
	};
	
	if(obj_control.player_vidas < 0){
		instance_destroy();
		var vw = camera_get_view_width(view_camera[0]) / 2;
		var vh = camera_get_view_height(view_camera[0]) / 2;
		camera_set_view_pos(view_camera[0], x - vw, y - vh);
		
		layer_sequence_create("Gameover",x,y,sq_gameover);
	};
};

function player_brilhando(){
	if(player_pode_piscar){
		image_alpha *= 0.95;
		if(image_alpha<=0.2) image_alpha = 1;
		
		if(player_invencivel_tempo_contador<=0){
			player_pode_piscar=false;
			image_alpha=1;
		};
	};
};

function consulta_inimigos_vivos(inimigo){
	if(instance_exists(inimigo)){
		var qtd_inimigos = instance_number(inimigo);
	
	
	if (qtd_inimigos = undefined){
		return 0;
	}else{
		return qtd_inimigos
	};
	}else{return 0};
};

function passa_level(){
		if(consulta_inimigos_vivos(obj_inimigo02) == 0 || obj_control.level > obj_control.level + 1){
			level_reinicia_contador --;
			if(level_reinicia_contador <=0){
				obj_control.level ++;
				room_restart();
				level_reinicia_contador = level_reinicia_tempo;
			};
		};
};

