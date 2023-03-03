import("scripts/datastore.nut")
import("scripts/time.nut")

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

function lap_2(time = 60, music = "") {
	time = time + 1
	if(!music == "") play_music(music)
	while(true) {
		if (get_data_exists("Lap2Complete") && get_data("Lap2Complete")) {
			clear_data("Lap2Complete")
			wait(60)
		}
		if (time < 1) {
			Text.set_front_fill_color(1, 0.3, 0.3, 1)
			Text.set_back_fill_color(0.9, 0, 0, 1)
			Text.set_text("Lap 2   Times Up!")

			play_sound("sounds/phone.wav")
			play_sound("sounds/phone.wav")
			play_sound("sounds/phone.wav")
	
			wait(2)
			break
		}
		time = time - 1
		Text.set_text("Lap 2   " + time.tostring())
		//Text.set_text("Lap 2   " + number_to_time_string(time))
		//Text.set_text("Lap 2   " + (time / 60).tointeger().tostring())
		wait(1)
	}
	while(true) {
		Tux.kill(false)
		wait(0.01)
	}
}