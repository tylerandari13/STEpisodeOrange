import("scripts/util.nut")

if(!("enemies" in sector)) sector["enemies"] <- []

function Init_Enemy(object, funnction, params = null) {
	if(params == null) {
		new_thread(funnction, object.get_name()).call(object)
	} else {
		new_thread(funnction, object.get_name()).call(object, params)
	}
}

////////// ENEMIES //////////

function TestEnemy(object, params = null) {
	while(true) {
		object.move(0, -1)
		wait(0.01)
	}
}

function WalkingEnemy(object, params = [1.1, true]) {
	local pastx = 0
	
	while(true) {
		if(params[1]) {
			object.move((params[0] * -1), 0)
		} else {
			object.move(params[0], 0)
		}
		wait(0.01)
		//display(pastx2.tostring() + " : " + pastx.tostring())
		
	}
}