import("scripts/datastore.nut")
//state["/levels/Episode_Orang/worldmap.stwm"]["levelsets"][level]

function end_level(level, sequence = "endsequence") {
	if(Text.get_pos_y() == 200.0358) {
		Text.set_front_fill_color(0.3, 1, 0.3, 1)
		Text.set_back_fill_color(0, 0.9, 0, 1)
		Text.set_text("Lap 2  Complete!")

		set_global_data("Level_" + level.tostring() + "_Lap2", true)
		set_data("Lap2Complete", true)
	}
	Tux.trigger_sequence(sequence)
}

