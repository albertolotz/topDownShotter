/// @description Insert description here
// You can write your code in this editor

escala_tamanho_tiro_x = 3;
escala_tamanho_tiro_y = escala_tamanho_tiro_x;

tiro_player_auto_destroe = room_speed * 6;



function regride_tamanho_tiro(){
	escala_tamanho_tiro_x = lerp(escala_tamanho_tiro_x, 1, 0.1);
	escala_tamanho_tiro_y = escala_tamanho_tiro_x;
};

function efeito_brilho_tiro(){
	draw_self();
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(spr_efeito_tiro, image_index, x, y, escala_tamanho_tiro_x, escala_tamanho_tiro_y, image_angle, c_red, 0.7);
	gpu_set_blendmode(bm_normal);
};

function auto_destroe_tiro(){
	tiro_player_auto_destroe --;
	if(tiro_player_auto_destroe <=0) instance_destroy();
};

