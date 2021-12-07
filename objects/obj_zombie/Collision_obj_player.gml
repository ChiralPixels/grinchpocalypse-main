
//---------------------//
function knock_present() {
	// 
	if (other.has_present) {	
		other.has_present = false;
		has_present = true;
		// other.drop_present();
		// knockback the other
	}
}

//---------------------//
function main(){
	knock_present();
}

main();