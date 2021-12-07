// ----------------- //
function hurt() {
	
	other.anger -= damage;
	
	knockback(other, 1);
	if (other.has_present) {
		other.has_present = false;
		var present = instance_create_depth(other.x, other.y, -y, obj_present);
		knockback(present, -1);
	}

}

function knockback(object, dir) {
	
	var dt = delta_time / 1000000;
	
	var magnitude = power(hspeed * hspeed + vspeed * vspeed, 0.5)
	
	object.hspeed = knockback_speed * dir * hspeed * dt / magnitude;
	object.vspeed = knockback_speed * dir * vspeed * dt / magnitude;
	
	object.is_knockbacked = true;
	
}

// ----------------- //
function main(){
	hurt();
	instance_destroy();
}

main();