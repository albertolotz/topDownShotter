/// @description Setup Inimigo02
// You can write your code in this editor

// Inherit the parent event
event_inherited();

inimigo_muda_direcao_tempo = room_speed * random_range(4, 10);
inimigo_muda_direcao_contador = 0;
distancia_gatilho_persegue_player = 200;
inimigo_vidas = 10;
shake_perde_vida_inimigo = 10;
shake_mata_inimigo = 100;
pode_perseguir_player = false;
velocidade_maxima_persegue_player = 2;
pedacos_inimigo_min = 20;
pedacos_inimigo_max = 30;
cor_impacto_tiro = c_lime;
escala_inicial_impacto_tiro = 2;

// variaveis especiais

function botar_ovo(){
	
};
