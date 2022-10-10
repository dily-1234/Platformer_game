// Move to the next room

with (oplayer)
{
	if (hascontrol) 
	{
		hascontrol = false;
		SlideTransiton(TRANS_MODE.GOTO,room01)
	}
}
