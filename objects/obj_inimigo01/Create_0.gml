/// @description setup inimigo01
// You can write your code in this editor

// Inherit the parent event
event_inherited();

inimigo_muda_direcao_tempo = room_speed * random_range(4, 10);
inimigo_muda_direcao_contador = 0;
distancia_gatilho_persegue_player = 200;
inimigo_vidas = 1;
shake_perde_vida_inimigo = 5;
shake_mata_inimigo = 30;
pode_perseguir_player = true;
velocidade_maxima_persegue_player = 2;
pedacos_inimigo_min = 4;
pedacos_inimigo_max = 14;
cor_impacto_tiro = c_red;
escala_inicial_impacto_tiro = 1;




