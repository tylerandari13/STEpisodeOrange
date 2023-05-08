local squares = []

//                                                  [0][1][2][3]
//                                                   x  y  w  h
function draw_square(editmap, infomap, dimensions = [0, 0, 2, 2]) {
	for(local x = 0; x < (dimensions[2] + 1); x += 1) {
		for(local y = 0; y < (dimensions[3] + 1); y += 1) {
			//editmap.change(x, y)

			local tempx = 1
			local tempy = 2

			if(x == 0) {
				tempx = 0
			} else if(x == dimensions[2]) {
				tempx = 2
			}

			if(y == 0) {
				tempy = 1
			} else if(y == dimensions[3]) {
				tempy = 3
			}

			editmap.change(x + dimensions[0], y + dimensions[1], infomap.get_tile_id(tempx, tempy))
			//if(waits)
			//wait(0.01)
			//display(x.tostring() + " : " + y.tostring() + " :: " + (infomap.get_tile_id(tempx, tempy)).tostring() + " : " + tempx.tostring() + " : " + tempy.tostring())
		}
		wait(0.01)
	}
	squares.push(dimensions)
}

function remove_square(editmap, square) {
	for(local x = 0; x < (squares[square][2] + 1); x += 1) {
		for(local y = 0; y < (squares[square][3] + 1); y += 1) {
			editmap.change(x + squares[square][0], y + squares[square][1], 0)
			//wait(0.01)
		}
		wait(0.01)
	}
	squares.remove(square)
}

//[0][1][2][3]
// x  y  w  h
/*
function on_camera(dimensions) {
	local l1 = {}
	l1.x <- dimensions[0]
	l1.y <- dimensions[1]
	local l2 = {}
	l2.x <- dimensions[0] + dimensions[2]
	l2.y <- dimensions[1] + dimensions[3]
	local r1 = {}
	r1.x <- Camera.get_x()
	r1.y <- Camera.get_y()
	local r2 = {}
	r2.x <- Camera.get_x() + Camera.get_screen_width()
	r2.y <- Camera.get_y() + Camera.get_screen_height()

    // if rectangle has area 0, no overlap
    if (l1.x == r1.x || l1.y == r1.y || r2.x == l2.x || l2.y == r2.y)
        return false
   
    // If one rectangle is on left side of other
    if (l1.x > r2.x || l2.x > r1.x)
        return false
 
    // If one rectangle is above other
    if (r1.y > l2.y || r2.y > l1.y)
        return false
 
    return true
}
*/

function on_camera(dimensions) {
	//display("[" + dimensions[0].tostring() + ", " + dimensions[1].tostring() + ", " + dimensions[2].tostring() + ", " + dimensions[3].tostring() + "]")
    // if rectangle has area 0, no overlap
    if (dimensions[0] * 32 == (dimensions[1] + dimensions[3]) * 32 || dimensions[1] * 32 == (dimensions[2] + dimensions[3]) * 32 || (Camera.get_x() + Camera.get_screen_width()) == Camera.get_x() || Camera.get_y() == (Camera.get_y() + Camera.get_screen_height()))
        return false
   
    // If one rectangle is on left side of other
    if (dimensions[0] * 32 > (Camera.get_x() + Camera.get_screen_width()) || Camera.get_x() > (dimensions[1] + dimensions[3]))
        return false
 
    // If one rectangle is above other
    if ((dimensions[2] + dimensions[4]) * 32 > Camera.get_y() || (Camera.get_y() + Camera.get_screen_height()) > dimensions[1])
        return false
 
    return true
}


function infinite(editmap, infomap, sectordimensions = [100, 35]) {
	draw_square(editmap, infomap, [(sectordimensions[0] / 2) - 10, (sectordimensions[1] / 2) + 1, 20, 5])

	while(true) {
		foreach(i, v in squares) {
			//display(i.tostring() + " : " + type(i).tostring() + " :: " + v.tostring() + " : " + type(v).tostring())
			if(!on_camera(v)) {
				remove_square(editmap, i)
			}
			wait(0.01)
		}
		wait(0.01)
	}
}
