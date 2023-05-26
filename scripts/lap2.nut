import("scripts/datastore.nut")
import("scripts/util.nut")

function enter_bowl(objectthing1, objectthing2, time = 0.7) {
	set_data("MadeItToLap2", true)

	Tux.deactivate()
	Tux.set_ghost_mode(true)
	Tux.set_visible(false)

	objectthing1.fade_out(time - 0.1)
	objectthing2.fade_out(time - 0.1)

	Text.set_font("big")
	Text.set_centered(false)
	Text.set_anchor_point(ANCHOR_TOP)
	Text.set_pos(0, 200.0358)
	Text.set_text("Lap 2    ")
	Text.grow_in(0.3)

	wait(time)

	Level.spawn("main", "main")

	Tux.set_ghost_mode(false)
}

function exit_bowl() {
	//display(get_data("MadeItToLap2"))
	if(get_data_exists("MadeItToLap2") && get_data("MadeItToLap2") == true) {
		clear_data("MadeItToLap2")

		Tux.activate()
		Tux.set_visible(true)
		return true
	} else return false
}

function lap_2(Grumbel, waittime = 2, speed = 2.5, music = "") {
	if(music != "" && music != null) play_music(music)
	wait(waittime)
	while(true) {
		Grumbel.set_pos(move_towards(Grumbel.get_pos_x(), Tux.get_x(), speed), move_towards(Grumbel.get_pos_y(), Tux.get_y(), speed))
		//display(Grumbel.get_pos_x().tostring() + " : " + Grumbel.get_pos_y().tostring())

		wait(0.01)
	}
}

function lap_2_old(time = 60, music = "") {
	//print("[WARNING] : \"lap_2(time, music)\" is depricated. \"Use lap_2(Grumbel)\" instead.")
	error_message("\"lap_2(time, music)\" is depricated. \"Use lap_2(Grumbel)\" instead.")
	//
	set_data("Lap2_Time", time + 1)
	if(!music == "") play_music(music)
	while(true) {
		if (get_data_exists("Lap2Complete") && get_data("Lap2Complete")) {
			clear_data("Lap2Complete")
			clear_data("Lap2_Time")
			wait(60)
		}
		if (get_data("Lap2_Time") < 1) {
			Text.set_front_fill_color(1, 0.3, 0.3, 1)
			Text.set_back_fill_color(0.9, 0, 0, 1)
			Text.set_text("Lap 2   Times Up!")

			play_sound("sounds/phone.wav")
			play_sound("sounds/phone.wav")
			play_sound("sounds/phone.wav")
	
			wait(2)
			break
		}
		set_data("Lap2_Time", get_data("Lap2_Time") - 1)
		Text.set_text("Lap 2   " + number_to_time_string(get_data("Lap2_Time")))
		wait(1)
	}
	clear_data("Lap2_Time")
	while(true) {
		Tux.kill(false)
		wait(0.01)
	}
}