/// @description Setup Inimigo02
// You can write your code in this editor

// Inherit the parent event
event_inherited();

inimigo_muda_direcao_tempo = room_speed * random_range(4, 10);
inimigo_muda_direcao_contador = 0;
distancia_gatilho_persegue_player = 200;
inimigo_vidas = 5;
shake_perde_vida_inimigo = 10;
shake_mata_inimigo = 100;
pode_perseguir_player = false;
velocidade_maxima_persegue_player = 2;
pedacos_inimigo_min = 20;
pedacos_inimigo_max = 30;
cor_impacto_tiro = c_lime;
escala_inicial_impacto_tiro = 2;
dano_inimigo = 10;
// variaveis especiais
tempo_espera_botar_ovo = room_speed * irandom_range(3,6);
tempo_espera_botar_ovo_contador = 0;

function botar_ovo(){
	if(tempo_espera_botar_ovo_contador >= tempo_espera_botar_ovo){
		instance_create_layer(x,y,"Inimigos",obj_inimigo_ovo);
		tempo_espera_botar_ovo_contador = 0;
	};
	tempo_espera_botar_ovo_contador ++;
};
