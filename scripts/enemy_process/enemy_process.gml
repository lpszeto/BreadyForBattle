// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function check_facing() 
{
	var _facing = sign(xp-x);
	if _facing !=0 facing = _facing;
}

function check_for_player(){
	///@desc check if player is close enough to chase
	
	var _dis = distance_to_object(oPlayer);
	
	if ((_dis <= alert_dis) or alert) and _dis > attack_dis
	{
		
		alert = true;
	
		if calc_path_timer-- <= 0 
		{
			
			calc_path_timer = calc_path_delay;
			if x == xp and y == yp var _type = 0; else var _type = 1;
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, oPlayer.x, oPlayer.y, _type);
	
			if _found_player 
			{
				path_start(path, move_spd, path_action_stop, false);	
			}
		}
	}
	else 
	{
		if _dis <= attack_dis 
		{
			path_end();
		}
	}
}

function enemy_anim(){
	// You can write your code in this editor
	switch (state) 
	{
		case states.IDLE:
			sprite_index = s_idle;
		break;
	
		case states.MOVE:
			sprite_index = s_walk;
		break;
	
		case states.ATTACK:
			sprite_index = s_attack;
		break;
	
		case states.DEAD:
	
		break;
	
	}
	xp = x;
	yp = x;
}