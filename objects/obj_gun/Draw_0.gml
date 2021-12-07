
function rotate() {
	
	var quadrant = 0;
	var adj = dir_x;
	var opp = -dir_y;
	
	if (adj < 0 && opp > 0) {
		quadrant = 1;
	}
	else if (adj < 0 && opp <= 0) {
		quadrant = 2;
	}
	else if (adj > 0 && opp < 0) {
		quadrant = 3;
	}
	
	var angle = 3 * pi / 2 + pi / 4;
    if (adj != 0) {
        var angle = arctan(abs(opp) / abs(adj));
        if (quadrant == 2) {
            angle += pi;
        }
        if (quadrant == 1) {
            angle = pi - angle;
        }
        if (quadrant == 3) {
            angle = 2 * pi - angle;
        }
    }
    else if (opp > 0) {
        angle = pi / 2;
    }
    else if (opp < 0) {
        angle = 3 * pi / 2;
    }
	
	if (adj < 0) {
		image_yscale = -1;
	}
	else {
		image_yscale = 1;
	}
	
	image_angle = 180 * angle / pi;
}

function main() {
	rotate();
	draw_self();
}

if (is_active){	
	main();
}