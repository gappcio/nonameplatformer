camMinX = 0;
camMinY = 0;
camMaxX = room_width - (camWidth);
camMaxY = room_height - (camHeight);

if (following == noone) {
	
	following = id;
	
}

view_set_camera(MAIN_VIEWPORT, camera);