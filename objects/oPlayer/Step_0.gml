//get inputs
rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));
attackKey = mouse_check_button(mb_left);




//player movement 
#region
	//get the direction
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	
	//dash mechanic
	if (keyboard_check_pressed(vk_space) and canDash) {
	    moveSpd = dashSpd;
		canDash = false;
		alarm[0] = 20;
		moveDir = point_direction(0,0,_horizKey,_vertKey);
	
		//get x and y speed
		// Also handles diagonal movement clamping
		var _spd = 0;	
		var _inputlevel = point_distance(0,0,_horizKey,_vertKey);
		_inputlevel = clamp(_inputlevel, 0 , 1 );
		_spd = moveSpd * _inputlevel;
	
		xspd = lengthdir_x( _spd, moveDir);
		yspd = lengthdir_y( _spd, moveDir);
	} else {
		moveDir = point_direction(0,0,_horizKey,_vertKey);
	
		//get x and y speed
		// Also handles diagonal movement clamping
		var _spd = 0;	
		var _inputlevel = point_distance(0,0,_horizKey,_vertKey);
		_inputlevel = clamp(_inputlevel, 0 , 1 );
		_spd = moveSpd * _inputlevel;
	
		xspd = lengthdir_x( _spd, moveDir);
		yspd = lengthdir_y( _spd, moveDir);
	}
	// wall collisions 
	if place_meeting(x+xspd,y,oWall) or place_meeting(x+xspd,y,oEnemy) {
		xspd = 0;
	}
	if place_meeting(x,y+yspd,oWall) or place_meeting(x,y+yspd,oEnemy) {
		yspd = 0;
	}
	//stationary during attack
	if cooldown > 0 {
		xspd /= 2;
		yspd /= 2;
	}
	//move the player
	x += xspd;
	y += yspd;
	
	x=clamp(x, sprite_width/2, room_width-sprite_width/2);
	y=clamp(y, sprite_height, room_height);
	
	//depth
	depth = 1-bbox_bottom;
	
#endregion

//sprite control
#region
	//player aiming
	centerY = y + centerYOffset;
	
	//aim
	aimDir = point_direction( x, centerY, mouse_x, mouse_y );
	
	//make sure player is facing direction
	face = round( (aimDir-45)/90 )
	if face >= 4 { face = 0; }
	
	//animate
	if xspd == 0 and yspd == 0 and cooldown <= 0 {
		currentSprite = sprite;
	} else if cooldown <= 0 {
		currentSprite = spriteWalk;
	}
	//attack animation
	if cooldown > 0 {
		cooldown -= 1;
	}
	
	//set the player sprite
	attackStart = false;
	if cooldown <= 0 {
		attackFace = face;
		ds_list_clear(hitByAttack);
		if attackKey {
			attackStart = true;
			currentSprite = spriteAttack;
			mask_index = sprite[3];
			sprite_index = currentSprite[attackFace];
			image_index = 0;
		
			// Cooldown prevents animations from occuring until value reaches 0
			cooldown = 24;
		} else {
			mask_index = sprite[3];
			sprite_index = currentSprite[face];
			
		}
	}
	
#endregion

if /*mouse_check_button_pressed(mb_right) ||*/ jar_break_bool{ 
	numSpreads += 1;
	//spreadOn = !spreadOn;
	jar_break_bool = false;
}

if (keyboard_check_pressed(ord("R"))) {
    var newObj = instance_create_layer(x+100, y+centerYOffset, "Instances", oStrawJam);
	newObj.image_xscale = 1;
	newObj.image_yscale = 1;
}

