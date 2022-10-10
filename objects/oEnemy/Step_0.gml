if (instance_exists(oplayer))
{
	move_towards_point(oplayer.x,oplayer.y,spd);
	if
	(firingdelay<1)
	{newBullet=instance_create_layer(x,y,"bullet",obullet1);
	newBullet.direction=oEnemy.direction;newBullet.speed=25firingdelay=400; 
	} 
	firingdelay= firingdelay-1;
}	

vsp = vsp + grv;



//Horizontal collistion 

if (place_meeting(x+hsp,y,owall))
{
	while (!place_meeting(x+sign(hsp),y,owall))
	{
		x = x + sign(hsp);
		
	}
	hsp = -hsp;
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
	sprite_index = ejump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index=1; else image_index = 0;
}
else 
{
	image_speed=1;
	if (hsp == 0)
	{
	    sprite_index = eidle;
	}
	else
	{
		sprite_index = enemy_walking;
	}
}

if (hsp != 0) image_xscale = sign(hsp);


if (hp<0) 
{
	with (Object_Score) global.thescore=global.thescore+10;
}

