function cameo(object, time = 10) {
	local oldcampos = [object.get_pos_x(), object.get_pos_y()]
	Tux.set_visible(false)
	local oldx = Tux.get_x()

	while(time > 0) {
		time = time - 0.01
		local newy = Tux.get_y()
		if (Tux.get_x() > oldx) object.set_action("right")
		else if (Tux.get_x() < oldx) object.set_action("left")
		if(("funni" + Tux.get_action()).find("small") == null) newy = newy + 32
		object.set_pos(Tux.get_x(), newy)

		//display(("funni" + Tux.get_action()).find("small"))

		oldx = Tux.get_x()
		wait(0.01)
	}
	object.set_pos(oldcampos[0], oldcampos[1])
	Tux.set_visible(true)
}