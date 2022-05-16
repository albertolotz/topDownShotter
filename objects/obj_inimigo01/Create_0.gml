/// @description Insert description here
// You can write your code in this editor
randomize();

inimigo_muda_direcao_tempo = room_speed * random_range(4, 10);
inimigo_muda_direcao_contador = 0;
distancia_gatilho_persegue_player = 200;
inimigo_vidas_max = 2;
inimigo_vidas = 2;


function inimigo_se_movimenta(){

	if(inimigo_muda_direcao_contador <= 0){
		inimigo_muda_direcao_contador = inimigo_muda_direcao_tempo;
		speed =  random(2);
		direction = irandom(359);
		image_angle = direction;
	}
	inimigo_muda_direcao_contador --;
	persegue_player();
	if(place_meeting(x,y,obj_inimigo01)) direction = 90;
};

function mantendo_inimigos_na_room(){
	if(x - sprite_width/2 < 0 || x + sprite_width/2 > room_width ) hspeed *=-1;
	if(y - sprite_height/2 < 0 || y + sprite_height/2 > room_height ) vspeed *=-1;
	image_angle = direction;
};

function persegue_player(){
	if(instance_exists(obj_player)){
		var distancia_inimigo_player = point_distance(x, y, obj_player.x,obj_player.y);
		var direcao_inimigo_player = point_direction(x, y,  obj_player.x,obj_player.y);
	
		if (distancia_inimigo_player <= distancia_gatilho_persegue_player){
				direction = direcao_inimigo_player;
		};
	};
};

function registro_danos(){
	if(instance_exists(obj_tiro_player)){
		tiro_player = place_meeting(x,y,obj_tiro_player);
		tiro_player_que_acertou = instance_place(x,y,obj_tiro_player);
	
		if(tiro_player){
			instance_destroy(tiro_player_que_acertou);
			inimigo_vidas --;
		};
		inimigo_pode_morrer();
	};
};

function inimigo_pode_morrer(){
	if(inimigo_vidas <= 0){
		instance_destroy();
		explode_inimigo();
		vestigio_inimigo();
	};
};

function explode_inimigo(){
	var qtd_pedacos = irandom_range(4,10);
	repeat(qtd_pedacos){
		instance_create_layer(x,y,"Inimigos",obj_inimigo_pedacos);
	};
};

function vestigio_inimigo(){
	var vestigio = instance_create_layer(x,y,"Inimigos",obj_inimigo_vestigio);
	vestigio.image_angle = irandom(359);
};


