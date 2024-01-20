/// @description Insert description here
// You can write your code in this editor


//x = oPlayer.x;
//y = oPlayer.y;

image_xscale = oPlayer.image_xscale/2;
image_yscale = oPlayer.image_yscale/2;

if oPlayer.attackStart {
	image_alpha = 1;
	cooldown = 24;
	sprite_index = slashSprite[oPlayer.face];
	if oPlayer.face == 0 {
		image_index = oPlayer.image_index;
		x = oPlayer.x + oPlayer.sprite_width/2;
		y = oPlayer.y + oPlayer.centerYOffset;// + oPlayer.sprite_height/4;
		hitCounted = true;
	} else if oPlayer.face == 1 {
		image_index = oPlayer.image_index;
		x = oPlayer.x - oPlayer.sprite_width/2;
		y = oPlayer.y + oPlayer.centerYOffset;// + oPlayer.sprite_height/4;
	} else if oPlayer.face == 2 {
		image_index = oPlayer.image_index;
		x = oPlayer.x - oPlayer.sprite_width/2;
		y = oPlayer.y + oPlayer.centerYOffset + oPlayer.sprite_height/2;
	} else {
		image_index = oPlayer.image_index;
		x = oPlayer.x + oPlayer.sprite_width/2;
		y = oPlayer.y + oPlayer.centerYOffset + oPlayer.sprite_height/2;
	}
	var _hitByAttackNow = ds_list_create();
	var _hits = instance_place_list(x,y,oEnemy,_hitByAttackNow,false);
	if _hits > 0 {
		for (var i = 0; i < _hits; i++) {
			//If this instance has not yet been hit by this attack
			var _hitID = _hitByAttackNow[| i];
			if (ds_list_find_index(oPlayer.hitByAttack,_hitID) == -1) {
				ds_list_add(oPlayer.hitByAttack,_hitID);
				show_debug_message(oPlayer.hitByAttack);
				with (_hitID) {
					hp -= 10;
				}
			}	
		}
	}
	ds_list_destroy(_hitByAttackNow);
} 


cooldown -= 1;
if cooldown <= 0 {
	image_alpha = 0;
	hitCounted = false;
}

