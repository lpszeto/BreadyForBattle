/// @description Insert description here
// You can write your code in this editor
hp = 30;
state = states.IDLE;
image_xscale = oPlayer.image_xscale;
image_yscale = oPlayer.image_yscale
xp = x;
yp = y;
facing = 1;
alert = false;
alert_dis = 100;
attack_dis = 18;
path = path_add();
move_spd = 1; 
calc_path_delay = 30;
calc_path_timer = irandom(60);
