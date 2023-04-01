function trigger_black(object, amount =  110) {
	//Tux.set_visible(false)
	while(true) {
		object.set_pos(Tux.get_x() + (Tux.get_velocity_x() / amount), Tux.get_y() + (Tux.get_velocity_y() / amount))
		object.set_action(Tux.get_action())
		wait(0.01)
	}
}