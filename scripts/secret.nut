import("scripts/datastore.nut")

function change_sector(Sector, Decal, SpawnPoint = "main", time = 0.9) {
	Tux.use_scripting_controller(true)
	play_sound("sounds/orange/splash" + ((rand() % 2) + 1).tostring() + ".wav")
	wait(0.2)
	Decal.set_action("default")
	Decal.set_action("splash")
	wait(time)
	Tux.use_scripting_controller(false)
	Level.spawn(Sector, SpawnPoint)
}

function enter_secret(Sector, Decal, Wind = null, SpawnPoint = "main", time = 0.9) {
	if(get_data_exists("SecretAreaComplete") && get_data("SecretAreaComplete")) {
		clear_data("SecretAreaComplete")
		local oldx = Tux.get_x()
		if(Wind != null) {
			Tux.set_pos(Tux.get_x(), Tux.get_y() - 16)
			Wind.start()
			while(true) {
				if(oldx != Tux.get_x()) {
					Wind.stop()
					break
				}
				wait(0.1)
			}
		}
	} else {
		change_sector(Sector, Decal, SpawnPoint, time)
	}
}

function secret_area(Sector, SpawnPoint = "main", y = 35 * 32) {
	while(true) {
		if(Tux.get_y() > y - 32) {
			Level.spawn(Sector, SpawnPoint)
		}
		wait(0.01)
	}
}

function exit_secret(Sector, Decal, SpawnPoint = "main", time = 0.9) {
	set_data("SecretAreaComplete", true)
	change_sector(Sector, Decal, SpawnPoint, time)
}