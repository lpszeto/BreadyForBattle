// If the player bumps into me, then play the break animation

sprite_index = jar_break;
if !tellPlayer {
	tellPlayer = true;
	oPlayer.jar_break_bool = true;
	
	if oPlayer.numSpreads % 2 == 0 {
		oPlayer.spriteLColor = spriteColor;
	} else {
		oPlayer.spriteRColor = spriteColor;
	}
}
destroy_me = true; // This seems to delay the instance_destroy until the animation is over