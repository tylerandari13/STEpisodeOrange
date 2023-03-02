//DIRECTIONS:  0 = left, 1 = down, 2 = up, 3 = right
//data = [object, direction, time]
//function PipeSameSector(platform1, platform2, sector, spawnpoint, sound = "sounds/warp.wav", direction1 = 1, direction2 = 1, time1 = 1, time2 = 0.533333) {
function PipeSameSector(entrancedata, exitdata, sector, spawnpoint, sound = "sounds/warp.wav") {

	Tux.deactivate()
	Tux.activate()

	Tux.use_scripting_controller(true)
	play_sound(sound)
	entrancedata[0].goto_node(1)
	exitdata[0].goto_node(1)
	wait(entrancedata[2])
	play_sound(sound)
	Level.spawn(sector, spawnpoint)
	entrancedata[0].goto_node(0)
	exitdata[0].goto_node(0)
	wait(exitdata[2])
	Tux.use_scripting_controller(false)
}

function PipeDifferentSector() {
 //???
}