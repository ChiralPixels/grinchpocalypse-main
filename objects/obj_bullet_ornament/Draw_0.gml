
function spin_rotate() {
	image_angle += spin_magnitude;
}

// ----------------- //
function main() {
	spin_rotate();
	image_index = bullet_index;
	draw_self();
}

main();
