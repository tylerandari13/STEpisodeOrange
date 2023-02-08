/*

HOW TO USE
==========

To make an enemy place a scripted object in the editor and give it a name.

To give an enemy certain behaviors you must use the InitEnemy function.
EXAMPLE:
InitEnemy(Enemy, Function, Params = [values, whatnot])

*/

/*

*/
function Template(Enemy, Params = []) {
	while(true) {

		wait(0.001);
	};
};

/*
Distance the enemy will move (in pixels)
*/
function OscillatingEnemy(Enemy, Params) {
	local x = Enemy.get_pos_x();
	local ϕ = 0;
	while(true) {
		Enemy.set_velocity(x + (sin(ϕ) * Params[0]), Enemy.get_pos_y());
		ϕ = ϕ + 1;
		if(ϕ > 360) ϕ = 0;
		wait(0.001);
	};
};

function InitEnemy(Enemy, Function, Params) {
	::newthread(Function).call(Enemy, Params);
};
