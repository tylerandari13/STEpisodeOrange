//function lerp(a, b, t) return a + (b - a) * t

function new_thread(funnction, name = "") {
	//local name = funnction.tostring()
	if(name == "") {
		name = funnction.tostring()
	}
	sector[name] <- newthread(funnction)
	//sector[name].call(...)
	return sector[name]
}

function number_to_time_string(seconds) {
	local minutes = (seconds / 60).tointeger()
	local hours = (minutes / 60).tointeger()
	local days = (hours / 24).tointeger()
	seconds = (seconds % 60).tointeger()

	if(seconds.tostring().len() < 2)
		seconds = "0" + seconds.tostring()
	if(minutes.tostring().len() < 2)
		minutes = "0" + minutes.tostring()
	if(seconds.tostring().len() < 2)
		hours = "0" + hours.tostring()
	if(seconds.tostring().len() < 2)
		days = "0" + days.tostring()

	if(days.tointeger() > 0)
		return days.tostring() + " : " + hours.tostring() + " : " + minutes.tostring() + " : " + seconds.tostring()
	if(hours.tointeger() > 0)
		return hours.tostring() + " : " + minutes.tostring() + " : " + seconds.tostring()
	if(minutes.tointeger() > 0)
		return minutes.tostring() + " : " + seconds.tostring()
	return seconds.tostring()
}

function hold_camera_on(object, scripted = true, offsetx = 0, offsety = 0, sectrodimensions = [35, 100]) {
	while(true) {
		local posx = 0
		local posy = 0
		//if("get_pos_x" in object) posx = object.get_pos_x() + (Camera.get_x() / 2); else posx = object.get_x()  + (Camera.get_x() / 2)
		//if("get_pos_y" in object) posy = object.get_pos_y() + (Camera.get_y() / 2); else posy = object.get_y()  + (Camera.get_y() / 2)
		if(scripted) {
			posx = object.get_pos_x() + (Camera.get_x() / 2) + offsetx
			posy = object.get_pos_y() + (Camera.get_y() / 2) + offsety
		} else {
			posx = object.get_x()  + (Camera.get_x() / 2) + offsetx
			posy = object.get_y()  + (Camera.get_y() / 2) + offsety
		}
		display(posx.tostring() + " " + posy.tostring())

		if(posx < 0) posx = 0
		if(posy < 0) posy = 0
		display(posx.tostring() + " " + posy.tostring())
		
		if(posx + Camera.get_x() > sectrodimensions[0] * 32) posx = sectrodimensions[0] - Camera.get_x()
		if(posy + Camera.get_y() > sectrodimensions[1] * 32) posx = sectrodimensions[1] - Camera.get_y()

		Camera.set_pos(posx, posy)
		display(posx.tostring() + " " + posy.tostring())
		break
		wait(0.01)
	}
}

function move_towards(a, b, distance = 1) {
    if(distance == 0) return a
    if(a > b) return a - distance
    if(a < b) return a + distance
    return a
}

function error_message(message) {
	new_thread(function(massage) {
		throw(massage)
	}, message).call(message)
}

/*
function move_towards(a, b, distance = 1) {
    local vector = b - a
    local length = vector * vector
    local unitVector = vector / length
    return a + unitVector * distance
}
*/
//function move_towards(a, b, distance = 1) return a + ((b - a)^2 / (b - a)^2) + ((b - a)^2 / (b - a)^2) * distance

