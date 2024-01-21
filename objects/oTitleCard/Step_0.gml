/// @description Insert description here
// You can write your code in this editor
if pulseCooldown <= 0 {
	pulseCooldown = 120
	image_xscale = .5;
	image_yscale = .5;
} else if pulseCooldown == 105 {
	image_xscale = .525;
	image_yscale = .525;
} else if pulseCooldown == 90 {
	image_xscale = .55;
	image_yscale = .55;
} else if pulseCooldown == 75 {
	image_xscale = .575;
	image_yscale = .575;
} else if pulseCooldown == 60 {
	image_xscale = .6;
	image_yscale = .6;
} else if pulseCooldown == 45 {
	image_xscale = .575;
	image_yscale = .575;
} else if pulseCooldown == 30 {
	image_xscale = .55;
	image_yscale = .55;
} else if pulseCooldown == 15 {
	image_xscale = .525;
	image_yscale = .525;
} 

pulseCooldown -=1;


