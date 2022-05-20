/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_aviso_1);
draw_set_color(c_yellow);
draw_text(10,5, "Vida: ");
pc = (obj_control.player_vidas / obj_control.player_vidas_max) * 100;
draw_healthbar(60, 10, 150, 20, pc, c_black, c_red, c_lime, 0, true, true)
draw_text(10,25, "Zona : " + string(obj_control.level));

draw_set_font(fnt_aviso_2);
draw_set_color(c_orange);
draw_text(20,45, "FORMAS DE VIDA");

draw_set_font(fnt_aviso_1);
draw_set_color(c_yellow);

draw_text(10,65, "Queem: " + string(inimigos02_vivos));
draw_text(10,85, "Astron macho: " + string(inimigos01_vivos));
draw_text(10,105, "Astron femea: " + string(inimigosFemea_vivos));
draw_text(10,125, "Ovos: " + string(inimigos_ovos));


draw_set_font(-1);
draw_set_color(-1);

