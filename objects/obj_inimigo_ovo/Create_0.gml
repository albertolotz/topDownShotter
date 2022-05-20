/// @description Insert description here
// You can write your code in this editor

function gera_inimigo(){
	var inimigo_obj = obj_inimigo01; // macho
	
	chance_criar_femea = obj_control.level * 7;
	
	var inimigo_sexo = random(99);
	
	if(inimigo_sexo < chance_criar_femea) inimigo_obj = obj_inimigo_femea;
	
	if(image_index >= image_number -1) instance_change(inimigo_obj,true);
};


