/// @description controlador do jogo
// You can write your code in this editor

randomize();


function inicia_jogo(){
	var _x = irandom_range(0+100, room_width - 100);
	var _y = irandom_range(0+100, room_height - 100);
	
	
	if !instance_exists(obj_player) var player=instance_create_layer(_x,_y,"Player",obj_player);
	if !instance_exists(obj_screenshake) instance_create_layer(-1,-1,"Control",obj_screenshake);
	
	gera_inimigos(player);	

};

function gera_inimigos(_player){
	var numero_inimigos = irandom_range(3,6);
	repeat(numero_inimigos){
		var _x_inimigo = irandom_range(0+100, room_width - 100);
		var _y_inimigo = irandom_range(0+100, room_height - 100);
		var inimigo = instance_create_layer(_x_inimigo+100,_y_inimigo+100,"Inimigos",obj_inimigo02); 
		var distancia = point_distance(inimigo.x, inimigo.y,_player.x, _player.y);
		if distancia < 200 instance_destroy(inimigo,false);
	};
};
