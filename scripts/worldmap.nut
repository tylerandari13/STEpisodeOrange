local presets = {
	orangeisland = function() {
		Orange1.fade_color(Orange1.get_color_red(), Orange1.get_color_green(), Orange1.get_color_blue(), fade, time)
		Orange2.fade_color(Orange2.get_color_red(), Orange2.get_color_green(), Orange2.get_color_blue(), fade, time)
	}
}

function set_fade(objects, fade, time = 1) {

	display("This works.")

	//if(type(objects) == "string") objects = presets[objects]
	foreach(object in presets[objects]) {
		object.fade_color(object.get_color_red(), object.get_color_green(), object.get_color_blue(), fade, time)
	}
}