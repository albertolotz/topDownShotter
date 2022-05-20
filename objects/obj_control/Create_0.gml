/// @description controlador do jogo
// You can write your code in this editor


prev_bg = "";
novo_bg = "";
level = 1;
player_vidas = 30;
player_vidas_max = 30;

function inicia_jogo(){
	var _x = irandom_range(0+100, room_width - 100);
	var _y = irandom_range(0+100, room_height - 100);
	
	
	if !instance_exists(obj_player) var player=instance_create_layer(_x,_y,"Player",obj_player);
	if !instance_exists(obj_screenshake) instance_create_layer(-1,-1,"Control",obj_screenshake);
	
	gera_inimigos(player);	

};

function gera_inimigos(_player){
	repeat(level){
		var _x_inimigo = irandom_range(0+100, room_width - 100);
		var _y_inimigo = irandom_range(0+100, room_height - 100);
		var inimigo = instance_create_layer(_x_inimigo+100,_y_inimigo+100,"Inimigos",obj_inimigo02); 
		var distancia = point_distance(inimigo.x, inimigo.y,_player.x, _player.y);
		if distancia < 200 instance_destroy(inimigo,false);
	};
};

function tamanho_aleatorio_room(){
 var novo_width = irandom_range(1280,4560);
 var novo_height = irandom_range(720,3120);
 if(novo_width) < 1280 novo_width = 1280;
 if(novo_height) < 720 novo_height = 720;
 
 room_width = novo_width;
 room_height = novo_height;
};

function muda_bg(){
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	
	do
	{
		novo_bg = choose(spr_bg1, spr_bg2, spr_bg3);
	}
	until(novo_bg != prev_bg)
	prev_bg = novo_bg;
	
	layer_background_sprite(back_id, novo_bg);
};

function bussula_direction(){
 if(instance_exists(obj_player) && (instance_exists(obj_inimigo02))){
	with(obj_player){
		var proximo_alvo = instance_nearest(x,y,obj_inimigo02);
		return point_direction(x,y,proximo_alvo.x, proximo_alvo.y);
	};
 }else{
	return 0;
 };
};


