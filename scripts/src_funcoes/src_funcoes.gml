// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function inimigo_se_move(inimigo, deve_perseguir_player){	
	if(inimigo_muda_direcao_contador <= 0){
		inimigo_muda_direcao_contador = inimigo_muda_direcao_tempo;
		inimigo.speed =  random(2);
		inimigo.direction = irandom(359);
		inimigo.image_angle = inimigo.direction;
	}
	inimigo_muda_direcao_contador --;
	if(deve_perseguir_player) persegue_player(obj_player,inimigo);
};

function persegue_player(_player, _inimigo){
	if(instance_exists(_player)){
		var distancia_inimigo_player = point_distance(_inimigo.x, _inimigo.y, _player.x,_player.y);
		var direcao_inimigo_player = point_direction(_inimigo.x, _inimigo.y,  _player.x,_player.y);
	
		if (distancia_inimigo_player <= distancia_gatilho_persegue_player){
				_inimigo.direction = direcao_inimigo_player;
		};
	};
};

function mantendo_obj_na_room(_objeto){
	with(_objeto){
		if(x - sprite_width/2 < 0 || x + sprite_width/2 > room_width ) hspeed *=-1;
		if(y - sprite_height/2 < 0 || y + sprite_height/2 > room_height ) vspeed *=-1;
		image_angle = direction;
	};
};

