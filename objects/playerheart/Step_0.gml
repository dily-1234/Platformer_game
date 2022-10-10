if (Objectlives).lp<=75 sprite_index= Half_heart
if (Objectlives).lp<=0 sprite_index= Empty_heart 

//Updata destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//Update object postion
x += (xTo - x) / 10;
y += (yTo - y) / 10;

x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y,view_h_half,room_height-view_h_half);

//Update camera view 
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

