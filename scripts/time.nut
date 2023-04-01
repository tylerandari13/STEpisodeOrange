function number_to_time_string(seconds) {
	local minutes = (seconds / 60).tointeger()
	local hours = (minutes / 60).tointeger()
	local days = (hours / 24).tointeger()
	seconds = (seconds % 60).tointeger()

	//display("FUNNY DATA: " + seconds.tostring().len().tostring() + " : " + type(seconds.tostring().len()) + " : " + seconds.tostring() + " : " + type(seconds.tostring())

	if(seconds.tostring().len() < 2) {
		seconds = "0" + seconds.tostring()
	}
	if(minutes.tostring().len() < 2) {
		minutes = "0" + minutes.tostring()
	}
	if(seconds.tostring().len() < 2) {
		hours = "0" + hours.tostring()
	}
	if(seconds.tostring().len() < 2) {
		days = "0" + days.tostring()
	}

	if(days.tointeger() > 0) {
		return days.tostring() + " : " + hours.tostring() + " : " + minutes.tostring() + " : " + seconds.tostring()
	}
	if(hours.tointeger() > 0) {
		return hours.tostring() + " : " + minutes.tostring() + " : " + seconds.tostring()
	}
	if(minutes.tointeger() > 0) {
		return minutes.tostring() + " : " + seconds.tostring()
	}
	return seconds.tostring()
}