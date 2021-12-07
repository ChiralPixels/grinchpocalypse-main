
//---------------------//
function grab_present() {
	if (!has_present && !is_knockbacked && other.is_targetable) {
		has_present = true;
		grabbing_present = true;
		image_index = 0;
		instance_destroy(other);
	}
}

//---------------------//
function main(){
	grab_present();
}

main();