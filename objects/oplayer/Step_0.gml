
if (hascontrol)
//player input 
{ 
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_jump = keyboard_check_pressed(vk_space);
	key_s = keyboard_check(ord("S"));
}
else
{
	key_right= 0 
	key_left = 0
	key_jump = 0
}
	
// Calculating movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,owall)) && (key_jump)
{
	vsp = -10;
}

//Horizontal collistion 

if (place_meeting(x+hsp,y,owall))
{
	while (!place_meeting(x+sign(hsp),y,owall))
	{
		x = x + sign(hsp);
		
	}
	hsp = 0;
}
x = x + hsp;	

//Vertical collistion 

if (place_meeting(x,y+vsp,owall))
{
	while (!place_meeting(x,y+sign(vsp),owall))
	{
		y = y + sign(vsp);
		
	}
	vsp = 0;
	
	
	
	
}
y = y + vsp;

//Animation 
if (!place_meeting(x,y+1,owall))
{
	sprite_index = jump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index=1; else image_index = 0;
}
else 
{
	image_speed=1;
	if (hsp == 0)
	{
	    sprite_index = idle;
	}
	else
	{
		sprite_index = sprite1;
	}
}

if (hsp != 0) image_xscale = sign(hsp)*1.10;

if(key_s)
{
		sprite_index = shoot;
		walksp=0 
		grv=100
}
else 
walksp=2.5
grv=0.5


//Shoot
if key_right
{
   x +=0;
   direction=0
};
   
if key_left  
{
   x -=0;
   direction=180
};

//Shooting
if(key_s) && (firingdelay<1)
{
    newBullet=instance_create_layer(x,y,"bullet",obullet);
    newBullet.direction=oplayer.direction;
	newBullet.speed=25;
	firingdelay=50; 
}
firingdelay= firingdelay-1;


