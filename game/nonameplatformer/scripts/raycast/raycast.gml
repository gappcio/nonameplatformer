function raycast(x1, y1, x2, y2, obj, omit) {
	
	var xx = 0, yy = 0;
	
	var rayList = ds_list_create();
	var _rayList = ds_list_create();
	
	var ray = collision_line_list(x1, y1, x2, y2, obj, true, true, rayList, true);
/*
	var i = 0, j = 0, del = [];
	
	repeat(array_length(omit)) {
		
		repeat(ds_list_size(rayList)) {
			
			if (object_get_parent(rayList[| i]) == omit[@ j])
				array_push(del, i);
			i++;
			
		}
		
		j++;
	}
	
	i = 0;
	
	repeat(array_length(del)) {
		
		ds_list_delete(rayList, del[@ i]);
		
		i++;
	}
	*/
	var empty = [noone, -1, -1];
	
	var _obj = 0;
	
	if (ray > 0) {
	
		if (rayList[| 0] != noone) {
		
			xx = x2 - x1;
			yy = y2 - y1;
			
			var limit = 20;
			var it = 0;
	
			while ((abs(xx) >= 1) || (abs(yy) >= 1)) && (it < limit) {
	
				xx *= .5;
				yy *= .5;
				
				var _ray = collision_line_list(x1, y1, x2 - xx, y2 - yy, obj, true, true, _rayList, true);
		
				if (_ray > 0) {
				
					if (_rayList[| 0] != noone) {
		
						rayList[| 0] = _rayList[| 0];
						x2 -= xx;
						y2 -= yy;
						_obj = _rayList[| 0];
		
					} 
				
				}
				
				it++;
	
			}
		
		}
	
	} else {
		
		ds_list_destroy(rayList);
		ds_list_destroy(_rayList);
		return empty;
			
	}
	
	ds_list_destroy(rayList);
	ds_list_destroy(_rayList);
	
	return [_obj, x2 - xx, y2 - (yy * 2)];

}