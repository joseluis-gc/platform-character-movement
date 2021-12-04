// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move(){

	var collision_object = argument0;

	//Horizontal Collisions
	if (place_meeting(x + xspeed, y, collision_object)) {
		while (!place_meeting(x + sign(xspeed),y, collision_object)) {
			x += sign(xspeed);
		}
		xspeed = 0;
	}

	x += xspeed;



	//Vertical 

	if (place_meeting(x, y+yspeed, collision_object)) {
		while (!place_meeting(x,y+sign(yspeed), collision_object)) {
			y += sign(yspeed);
		}
		yspeed = 0;
	}
	


	y += yspeed;

}

