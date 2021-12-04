/// @description Initialize Player Variables

max_speed = 4;
xspeed = 0;
yspeed = 0;
acceleration = 1;
gravity_acceleration = .5;
jump_height = -9;
grab_width = 18;

enum player {
	moving,
	ledge_grab,
	door,
	hurt,
	death
}

state = player.moving;