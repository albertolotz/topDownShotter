/// @description Insert description here
// You can write your code in this editor
randomize();

inimigo_muda_direcao_tempo = room_speed * random_range(4, 10);
inimigo_muda_direcao_contador = 0;
distancia_gatilho_persegue_player = 200;
inimigo_vidas = 1;
inimigo_sexo = "macho"
shake_perde_vida_inimigo = 5;
shake_mata_inimigo = 30;
pode_perseguir_player = true;
velocidade_maxima_persegue_player = 2;
pedacos_inimigo_min = 4;
pedacos_inimigo_max = 10;
velocidade_pedacos_min = 0.5;
velocidade_pedacos_max = 0.9;
cor_impacto_tiro = c_red;
escala_inicial_impacto_tiro = 1;
dano_inimigo = 5;
pedacos_gera_dano = true;


function inimigo_se_movimenta(){
	if(inimigo_muda_direcao_contador <= 0){
		inimigo_muda_direcao_contador = inimigo_muda_direcao_tempo;
		speed =  random(velocidade_maxima_persegue_player);
		direction = irandom(359);
		image_angle = direction;
	}
	inimigo_muda_direcao_contador --;
	
	gerencia_colisao();
	persegue_player();
	
};

function gerencia_colisao(){
	var colisao_com = instance_place(x,y,all);
	
	if(colisao_com !=noone){
		var sexo_meu = sprite_get_name(sprite_index);
		var sexo_colisao = sprite_get_name(colisao_com.sprite_index);
		
		if(sexo_meu == sexo_colisao){
			direction = direction + 180;
			speed = 2;
		};
	};
};

function mantendo_inimigos_na_room(){
	if(x - sprite_width/2 < 0 || x + sprite_width/2 > room_width ) hspeed *=-1;
	if(y - sprite_height/2 < 0 || y + sprite_height/2 > room_height ) vspeed *=-1;
	image_angle = direction;
};

function persegue_player(){
	if(pode_perseguir_player){
		if(instance_exists(obj_player)){
			var distancia_inimigo_player = point_distance(x, y, obj_player.x,obj_player.y);
			var direcao_inimigo_player = point_direction(x, y,  obj_player.x,obj_player.y);
	
			if (distancia_inimigo_player <= distancia_gatilho_persegue_player){
					direction = direcao_inimigo_player;
			};
		};
	};
};

function registro_danos(){
	if(instance_exists(obj_tiro_player)){
		tiro_player = place_meeting(x,y,obj_tiro_player);
		tiro_player_que_acertou = instance_place(x,y,obj_tiro_player);
	
		if(tiro_player){
			instance_destroy(tiro_player_que_acertou);
			impacto_tiro();
			global.tremer = shake_perde_vida_inimigo;
			inimigo_vidas --;
		};
		inimigo_pode_morrer();
	};
	
	if(pedacos_gera_dano){
		if(instance_exists(obj_inimigo_pedacos)){
			var pedaco_matador = place_meeting(x,y,obj_inimigo_pedacos);
			var pedaco_que_matou = instance_place(x,y,obj_inimigo_pedacos);
			if(pedaco_matador){
				inimigo_vidas --;
				global.tremer = shake_perde_vida_inimigo;
				instance_destroy(pedaco_que_matou);
			};
		};
		inimigo_pode_morrer();
	};
};

function inimigo_pode_morrer(){
	if(inimigo_vidas <= 0){
		instance_destroy();
		explode_inimigo();
		global.tremer = shake_mata_inimigo;
		vestigio_inimigo();
	};
};

function explode_inimigo(){
	var qtd_pedacos = irandom_range(pedacos_inimigo_min,pedacos_inimigo_max);
	repeat(qtd_pedacos){
		instance_create_layer(x,y,"Inimigos",obj_inimigo_pedacos);
		obj_inimigo_pedacos.speed = random_range(velocidade_pedacos_min, velocidade_pedacos_max);
	};
};

function vestigio_inimigo(){
	var vestigio = instance_create_layer(x,y,"Inimigos",obj_inimigo_vestigio);
	vestigio.image_angle = irandom(359);
};

function impacto_tiro(){
	 var impacto_tiro = instance_create_layer(x,y,"Tiros",obj_impacto_tiro);
	 impacto_tiro.image_xscale = escala_inicial_impacto_tiro;
	 impacto_tiro.image_yscale = impacto_tiro.image_xscale
	 impacto_tiro.image_blend = cor_impacto_tiro;
};


function acasalando(){
	encontro = instance_place(x,y,obj_inimigo_pai);
	if(encontro != noone){
		var sexo_meu = inimigo_sexo;
		var sexo_colisao = encontro.inimigo_sexo;
		if(sexo_meu != sexo_colisao){
			instance_create_layer(x,y,"Inimigos", obj_inimigo02);
			instance_destroy(encontro);
			instance_destroy(self.id);
		};
	};
};

