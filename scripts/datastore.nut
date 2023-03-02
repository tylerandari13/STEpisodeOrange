local prefix = "Episode_Orange_Data_"

//if(!(prefix in state)) state[prefix] <- {}

function set_data(index, value) {
	Level[prefix + index.tostring()] <- value
	return value
}

function get_data(index) {
	return Level[prefix + index.tostring()]
}

function clear_data(index) {
	Level[prefix + index.tostring()] <- null
}

function set_global_data(index, value) {
	state[prefix + index.tostring()] <- value
	return value
}

function get_global_data(index) {
	return state[prefix + index.tostring()]
}

function clear_global_data(index) {
	state[prefix][index.tostring()] <- null
}

function get_data_exists(index) {
	return (prefix + index.tostring() in Level)
}

function get_global_data_exists(index) {
	return (prefix + index.tostring() in state)
}