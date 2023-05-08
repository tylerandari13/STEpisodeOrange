function camera_ease_back() {
	Camera.scroll_to(Tux.get_x() - (Camera.get_screen_width() / 2), Tux.get_y() - (Camera.get_screen_height() / 2), 0.5)
	wait(0.5)
	Camera.set_mode("normal")
}