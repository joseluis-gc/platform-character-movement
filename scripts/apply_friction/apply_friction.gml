// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_friction(){

	var amount = argument0;
	
	if(xspeed != 0){
		if(abs(xspeed) -  amount > 0){
			xspeed -= amount * image_xscale;
		}else{
			xspeed = 0;
		}
	}

}