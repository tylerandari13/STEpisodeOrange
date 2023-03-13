function enter_secret(Sector, Decal, SpawnPoint = "main", time = 0.9) {
	Tux.use_scripting_controller(true)
	wait(0.2)
	Decal.set_action("splash")
	wait(time)
	Tux.use_scripting_controller(false)
	Level.spawn(Sector, SpawnPoint)
}