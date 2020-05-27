extends Node

var stats = {'health':100, 
'max_health':30, 
'Fuel':20,
'max_speed': 150,
'acceleration': 50,
'coins':0,
'music':1,
'effect':1,
'tutorial':0,
'highscore':0
}

var vol_stats = {
	'coins_collected': 0,
	'score':0,
	'diamonds_collected':0,
	'balloons':0,
	'birds':0,
	'airplanes':0,
	'helicopters':0,
	'satellites':0,
	'boosts':0
}


const FILE_NAME = "user://game-data3.json"


func save():
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(stats))
	file.close()

func load():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			stats = data
		else:
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")
