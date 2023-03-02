function Move(thing, x, y, speed = 1, time = 0.01, latency = 3) {

	x = thing.get_pos_x() + x
	y = thing.get_pos_y() + y

	local newx = 0
	local newy = 0
	while(true) {
		if(thing.get_pos_x() > x){
			newx = speed * -1
		} else if(thing.get_pos_x() < x){
			newx = speed
		} else if(thing.get_pos_x() == x){
			newx = 0
		}

		if(thing.get_pos_y() > y){
			newy = speed * -1
		} else if(thing.get_pos_y() < y){
			newy = speed
		} else if(thing.get_pos_y() == y){
			newy = 0
		}

		thing.move(newx, newy)

		if(thing.get_pos_x() < x + latency && thing.get_pos_x() > x - latency && thing.get_pos_y() < y + latency && thing.get_pos_y() > y - latency) {
			thing.set_pos(x, y)
			break
		}
		wait(time)
	}
}

function MoveTo(thing, x, y, speed = 1, time = 0.01, latency = 3) {
	local newx = 0
	local newy = 0
	while(true) {
		if(thing.get_pos_x() > x){
			newx = speed * -1
		} else if(thing.get_pos_x() < x){
			newx = speed
		} else if(thing.get_pos_x() == x){
			newx = 0
		}

		if(thing.get_pos_y() > y){
			newy = speed * -1
		} else if(thing.get_pos_y() < y){
			newy = speed
		} else if(thing.get_pos_y() == y){
			newy = 0
		}

		thing.move(newx, newy)

		if(thing.get_pos_x() < x + latency && thing.get_pos_x() > x - latency && thing.get_pos_y() < y + latency && thing.get_pos_y() > y - latency) {
			thing.set_pos(x, y)
			break
		}
		wait(time)
	}
}

/*
[
	[thing, x, y, speed = 1],
	[thing2, x, y, speed = 1]
]
*/

function MoveToBulk(things, time = 0.01, latency = 3) {
	local finished = array(things.len(), false)
	local running = true
	while(running){
		foreach(i, thing in things) {
			if (finished[i] == false) {
				local newx = 0
				local newy = 0
				if(thing[0].get_pos_x() > thing[1]){
					newx = thing[3] * -1
				} else if(thing[0].get_pos_x() < thing[1]){
					newx = thing[3]
				} else if(thing[0].get_pos_x() == thing[1]){
					newx = 0
				}

				if(thing[0].get_pos_y() > thing[2]){
					newy = thing[3] * -1
				} else if(thing[0].get_pos_y() < thing[2]){
					newy = thing[3]
				} else if(thing[0].get_pos_y() == thing[2]){
					newy = 0
				}

				if(thing[0].get_pos_x() < newx + latency && thing[0].get_pos_x() > newx - latency && thing[0].get_pos_y() < newy + latency && thing[0].get_pos_y() > newy - latency) {
					thing[0].set_pos(newx, newy)
					finished[i] = true
				}

				thing[0].move(newx, newy)
				
				wait(time)
			}
		}	
		if(!array.find(false)) {
			running = false
			foreach(i, thing in things) {
				thing[0].move(newx, newy)
				wait(time)
			}
		}
	}
}