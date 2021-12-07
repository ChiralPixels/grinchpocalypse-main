function main() {
	if (!is_targetable) {	
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 0.5);
	}
	else {
		draw_self();
	}
}

main();