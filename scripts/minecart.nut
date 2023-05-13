import("scripts/util.nut")
local was_small = Tux.get_bonus() == "none"

function minecart(object, tilemap, sector = "main", spawnpoint = "main", speed = 5, dir = false) {
	if(tilemap.get_tile_id(0, 0) != 69) {
		tilemap.change(0, 0, 69)
		tilemap.set_solid(true)
		local originpos = [object.get_pos_x(), object.get_pos_y()]
		Level.spawn(sector, spawnpoint)
		object.enable_gravity(true)
		Camera.set_mode("manual")
		if(was_small) Tux.set_bonus("grow")
		new_thread(hold_camera_on, "minecartthread").call(object)
		while(true) {
			//Camera.set_pos(object.get_pos_x() - (Camera.get_screen_width() / 2), object.get_pos_y() - (Camera.get_screen_height() / 2))
			if(dir) {
				object.move(speed * -1, 0)
			} else {
				object.move(speed, 0)
			}
			if(Tux.get_velocity_y() < 0 && object.get_velocity_y() == 0) {
				object.set_velocity(object.get_velocity_x(), Tux.get_velocity_y())
			} 
			if(Tux.get_action().find("duck")) {
				dismount(object, originpos, tilemap)
				break
			}

			if(Tux.get_velocity_x() < 0) {
				dir = true
			} else if(Tux.get_velocity_x() > 0) {
				dir = false
			}
			wait(0.01)
		}
		Camera.set_mode("normal")
	}
}

function dismount(object, originpos, tilemap) {
	if(was_small) Tux.kill(false)
	sector["minecartthread"] <- null
	tilemap.change(0, 0, 0)
	tilemap.set_solid(false)
	Tux.set_pos(object.get_pos_x(), object.get_pos_y() - 70)
	object.enable_gravity(false)
	object.set_pos(originpos[0], originpos[1])
	object.set_velocity(0, 0)
	Camera.set_mode("normal")
	//Tux.do_scripting_controller(true)
	//Tux.use_scripting_controller("down", false)
	//Tux.do_scripting_controller(false)
}