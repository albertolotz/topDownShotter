/// @description Insert description here
// You can write your code in this editor
randomize();

inimigo_muda_direcao_tempo = room_speed * random_range(4, 10);
inimigo_muda_direcao_contador = 0;


function inimigo_se_movimenta(){
	if(inimigo_muda_direcao_contador <= 0){
		inimigo_muda_direcao_contador = inimigo_muda_direcao_tempo;
		speed =  random(2);
		direction = irandom(359);
		image_angle = direction;
	}
	inimigo_muda_direcao_contador --;
};

function mantendo_inimigos_na_room(){
	if(x - sprite_width/2 < 0 || x + sprite_width/2 > room_width ) hspeed *=-1;
	if(y - sprite_height/2 < 0 || y + sprite_height/2 > room_height ) vspeed *=-1;
	image_angle = direction;
};




