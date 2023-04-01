import("scripts/datastore.nut")

function switch_character(char, spawnpoint = "main", sector = "main", spawnx = 0, spawny = 0, sectordimensions = [100, 35]) {
	//PLACEHOLDER TEXT HERE
	    //E
	//PLACEHOLDER TEXT HERE
	set_data("current_character", char[0])

	//local cameraxoffset = -960
	//local camerayoffset = -509
	local turnoffset = 25
	local doublejumps = 5
	local maxstill = 5
	local jumpheight = 600

	local jumpsleft = doublejumps
	local stillframes = 0
	local currentturnoffset = turnoffset
	local canjump = true
	local isalreadysmall = false
	local mounted = true
	

	Level.spawn(sector, spawnpoint)

	wait(0.01)

	local keephimat = [Tux.get_x(), Tux.get_y()]
	if((" " + Tux.get_action()).find("small")) {
		isalreadysmall = true
		Tux.add_bonus("grow")
	}

	char[1].set_action("ride-right")
	char[2].set_action("right")

	char[2].set_pos(spawnx, spawny)


	//local top = 0

	while(true) {

		if(Tux.get_ghost_mode()) {
			char[2].set_velocity(Tux.get_velocity_x(), Tux.get_velocity_y())
		} else {
			char[2].set_velocity(Tux.get_velocity_x(), char[2].get_velocity_y())
		}
		char[2].set_solid(!Tux.get_ghost_mode())
		char[2].enable_gravity(!Tux.get_ghost_mode())

		if((" " + Tux.get_action()).find("small") && !isalreadysmall) {
			Tux.set_pos(keephimat[0], keephimat[1] + 32)
		} else if(!(" " + Tux.get_action()).find("small") && isalreadysmall) {
			Tux.set_pos(keephimat[0], keephimat[1] - 32)
		} else {
			Tux.set_pos(keephimat[0], keephimat[1] + 1)
		}

		Camera.set_pos((char[1].get_pos_x() + currentturnoffset) - (Camera.get_screen_width() / 2), char[1].get_pos_y() - (Camera.get_screen_height() / 2))

		if(char[2].get_velocity_x() > 0) {
			char[1].set_action("ride-right")
			char[2].set_action("right")
			//char[1].set_pos(char[2].get_pos_x(), char[2].get_pos_y())
		} else if(char[2].get_velocity_x() < 0) {
			char[1].set_action("ride-left")
			char[2].set_action("left")
			//char[1].set_pos(char[2].get_pos_x() + turnoffset, char[2].get_pos_y())
		} else {
			//char[1].set_pos(char[2].get_pos_x(), char[2].get_pos_y())
		}

		if(char[1].get_action().find("left")) {
			char[1].set_pos(char[2].get_pos_x() + turnoffset, char[2].get_pos_y())
			currentturnoffset = 0
		}
		else if(char[1].get_action().find("right")) {
			char[1].set_pos(char[2].get_pos_x(), char[2].get_pos_y())
			currentturnoffset = 32
		}

		//if(Tux.get_velocity_y() == -505 || Tux.get_velocity_y() == -565) {
		if(Tux.get_velocity_y() < 0) {
		//if(Tux.get_action().find("jump")) {
			if(canjump) {
				canjump = false
				char[2].set_velocity(char[2].get_velocity_x(), jumpheight * -1)
			} else if(jumpsleft > 0) {
				jumpsleft = jumpsleft - 1
				char[2].set_velocity(char[2].get_velocity_x(), jumpheight * -1)
			}
		} else if(char[2].get_velocity_y() == 0) {
			canjump = true
			jumpsleft = doublejumps
		}

		//display(stillframes.tostring() + " : " + jumpsleft.tostring())

		//if(Tux.get_velocity_y() < top) top = Tux.get_velocity_y()
		//display(top)

		wait(0.01)
	}
}