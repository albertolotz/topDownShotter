/// @description Insert description here
// You can write your code in this editor

movimentacao_player();

persegue("Mouse");

move_camera();

player_atira();

player_perde_vida();

player_brilhando();

passa_level();



inimigos02_vivos = consulta_inimigos_vivos(obj_inimigo02);
inimigos01_vivos = consulta_inimigos_vivos(obj_inimigo01);
inimigosFemea_vivos = consulta_inimigos_vivos(obj_inimigo_femea);
inimigos_ovos = consulta_inimigos_vivos(obj_inimigo_ovo);


