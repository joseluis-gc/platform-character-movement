/// @description Controlling the players state

#region Set up controls for the player
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
up_release = keyboard_check_released(vk_up);
#endregion

#region State Machine
switch (state) {
#region Move State
	case player.moving:
	
	if(xspeed == 0){
		sprite_index = s_idle;
	}else{
		sprite_index = s_run;
	}
	
	//Check if player is on the ground
	if (!place_meeting(x, y + 1, o_solid)) {
		yspeed += gravity_acceleration;
		
		//player is not touching the ground
		sprite_index = s_jump;
		image_index = (yspeed > 0);
		
		
		//jump height while holding button
		if(up_release and yspeed < -6){
			yspeed = -3;
		}
		
	}
	else {
		yspeed = 0;
		
		//jump while in the ground
		if(up){
			yspeed = jump_height;
		}
		
		
	}
	//Change direction of sprite.
	if (xspeed != 0) {
		image_xscale = sign(xspeed);
	}
	//Check for moving left or right
	if (right or left) {
		xspeed += (right - left) * acceleration;
		xspeed = clamp(xspeed, -max_speed, max_speed);
	}
	else {
		apply_friction(acceleration);
	}
	
	move(o_solid);
	
	//ledge grab
	var falling = y -yprevious > 0;
	var wasntwall = !position_meeting(x+grab_width*image_xscale, yprevious, o_solid);
	var iswall = position_meeting(x+grab_width*image_xscale,yprevious,o_solid);
	
	if(falling and wasntwall and iswall){
		xspeed = 0;
		yspeed = 0;
		
		//move to ledge
		while(place_meeting(x + image_xscale, y, o_solid)){
			x += image_xscale;
		}
		
		//check position vertical
		while(position_meeting(x+grab_width*image_xscale,y-1,o_solid)){
			y-=1;
		}
		
		//change sprite
		sprite_index = s_grab;
		state = player.ledge_grab;
		
		//play sound
		
		
	}
	
	
	break;
#endregion
#region Ledge Grab state
	case player.ledge_grab:
		if(up){
			state = player.moving;
			yspeed = jump_height;
		}
		if(down){
			state = player.moving;
		}
		
	break;
#endregion
#region Door state
	case player.door:
	
	break;
#endregion
#region Hurt state
	case player.hurt:
	
	break;
#endregion
#region Death state
	case player.death:
	
	break;
#endregion
}
#endregion
