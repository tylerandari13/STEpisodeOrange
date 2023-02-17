/*

HOW TO USE
==========

To make an enemy place a scripted object in the editor and give it a name.

To give an enemy certain behaviors you must make a thread.
The Function under the Thread initialization, The enemy as the first parameter in the call function,
and all the other paramaters after the enemy variable.

EXAMPLE:
::newthread(Function).call(Enemy, ...);


*/

/*
function Template(Enemy, Params = []) {
	while(true) {

		wait(0.001);
	};
};
*/
/*
Distance the enemy will move (in pixels)
*/
function OscillatingEnemy(Enemy, Distance, Time = 0.001) {
	local x = Enemy.get_pos_x();
	local a = 0;
	while(true) {
		Enemy.set_pos(x + (cos(a) * Distance), Enemy.get_pos_y());
		a = a + 1;
		//if(a > 360) a = 0;
		wait(Time);
	};
};


//reverse compatibility
function InitEnemy(Enemy, Function, Params) {
	::newthread(Function).call(Enemy, Params);
};
