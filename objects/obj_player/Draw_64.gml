draw_set_colour(c_black);
var hp_text = "HP: " + string(hp);
draw_text_transformed( 0, 0, hp_text, 1.5, 1.5, 0);

draw_set_colour(c_black);
var ammo_text = "AMMO: " + string(primary_weapon.ammo);
draw_text_transformed( 200, 0, ammo_text, 1.5, 1.5, 0);

draw_set_colour(c_black);
score = 0;
for (i = 0; i < instance_number(obj_base); i += 1) {
	score += instance_find(obj_base, i).num_presents;
}
var score_text = "SCORE: " + string(score);
draw_text_transformed( 400, 0, score_text, 1.5, 1.5, 0);
