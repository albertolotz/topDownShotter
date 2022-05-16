/// @description Insert description here
// You can write your code in this editor

speed = random_range(3,8);
direction = irandom(359);
image_angle = direction;
image_alpha = 1;

/*
*** forma complicada da fazer .... minha versão

tempo_explosao = room_speed*1;
tempo_explosao_contador = 0;

tempo_destruicao = room_speed*1;
tempo_destruicao_contador = 0;

function explosao(){
	if(tempo_explosao_contador <= tempo_explosao){
		speed *= 0.9;
		tempo_explosao_contador ++;
	};
};

function destroe_pedacos(){
	image_alpha -= (room_speed/tempo_destruicao) / 100;
	tempo_destruicao_contador ++;
	if(tempo_destruicao_contador >= tempo_destruicao){
		instance_destroy();
	};
};
*/
