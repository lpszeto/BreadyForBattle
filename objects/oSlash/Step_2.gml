/// @description Insert description here
// You can write your code in this editor

if oPlayer.attackStart {
	show_debug_message("ATTACK HAS STARTED");
	var _hitByAttackNow = ds_list_create();
	var _hits = instance_place_list(x,y,oEnemy,_hitByAttackNow,false);
	if _hits > 0 {
		for (var i = 0; i < _hits; i++) {
			//If this instance has not yet been hit by this attack
			var _hitID = _hitByAttackNow[| i];
			if (ds_list_find_index(oPlayer.hitByAttack,_hitID) == -1) {
				ds_list_add(oPlayer.hitByAttack,_hitID);
				show_debug_message(_hitID);
				with (_hitID) {
					hp -= 10;
				}
			}	
		}
	}
	ds_list_destroy(_hitByAttackNow);
}


