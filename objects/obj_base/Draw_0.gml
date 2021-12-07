
// ----------------- //
function get_level() {
	level = floor( num_presents / presents_per_level );
	image_index = level;
}

// ----------------- //
function main() {
	get_level();
	draw_self();
}

main();