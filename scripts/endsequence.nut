import("scripts/datastore.nut")
//state["/levels/Episode_Orang/worldmap.stwm"]["levelsets"][level]

function end_level(level, sequence = "endsequence") {
	if(get_data_exists("Lap2") && get_data("Lap2") == true) {
		if(!("OrangeLevels" in state)) state.OrangeLevels <- {}
	}
	Tux.trigger_sequence(sequence)
}

