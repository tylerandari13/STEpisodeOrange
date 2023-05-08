import("scripts/util.nut")

function minecart(object, holdobject, speed = 5, dir = false) {
	local originpos = [object.get_pos_x(), object.get_pos_y()]
	sector.in_minecart <- true
	new_thread(hold_player_at_spawnpoint, "minecartthread").call("sector3", "KeepAt1", in_minecart.weakref())
	Camera.set_mode("manual")
	while(in_minecart == true) {
		Camera.set_pos(object.get_pos_x() - (Camera.get_screen_width() / 2), object.get_pos_y() - (Camera.get_screen_height() / 2))
		//Camera.set_pos(Tux.get_x() - (Camera.get_screen_width() / 2), Tux.get_y() - (Camera.get_screen_height() / 2))
		if(dir) {
			object.move(speed * -1, 0)
		} else {
			object.move(speed, 0)
		}
		if(Tux.get_velocity_y() < 0 && object.get_velocity_y() == 0) {
			object.set_velocity(object.get_velocity_x(), Tux.get_velocity_y())
		} else if(Tux.get_velocity_y() < 0 && object.get_velocity_y() != 0) {
			//dismount(object, originpos)
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

function dismount(object, originpos) {
	sector.in_minecart = false
	sector["minecartthread"] <- null
	Tux.set_pos(object.get_pos_x(), object.get_pos_y() - 96)
	object.set_pos(originpos[0], originpos[1])
	object.set_velocity(0, 0)
	Camera.set_mode("normal")
}