/*

HOW TO USE
==========

To make an enemy place a scripted object in the editor and give it a name.

To give an enemy certain behaviors you must start a coroutine with the enemy function.
EXAMPLE:
local testenemy = ::newthread(Enemy.Template)
local testenemystatus = testenemy.call(enemy) //this doesnt need to be in a variable if you dont care what happens to the enemy after execution

Or if you want to keep things compact:
::newthread(Enemy.Template).call(enemy)

*/

/*

*/
function Template(Enemy, Params) {
	while(true) {

		wait(0.001)
	}
}

/*
Distance the enemy will move (in pixels)
*/
function OscillatingEnemy(Enemy, Params = [3 * 32]) {
	local x = Enemy.get_pos_x()
	local ϕ = 0
	while(true) {
		Enemy.set_pos(x + (sin(ϕ) * Params[0]), Enemy.get_pos_y())
		ϕ = ϕ + 1
		if(ϕ > 360) ϕ = 0
		wait(0.001)
	}
}

function InitEnemy(Enemy, Function, Params = []) {
	::newthread(Function).call(Enemy, Params)
}