function lerp(a, b, t) return a + (b - a) * t

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

function hold_player_at(x, y, on = true) {
	while(on == true) {
		if(Tux.get_bonus() == "none") {
			Tux.set_pos(x, y + 33)
		} else {
			Tux.set_pos(x, y + 1)
		}
		wait(0.01)
	}
}

function hold_player_at_spawnpoint(sector, spawnpoint, on = true) {
	while(on == true) {
		Level.spawn(sector, spawnpoint)
		wait(0.01)
	}
}