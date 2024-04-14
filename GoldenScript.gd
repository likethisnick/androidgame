extends Node

var score_data = {}
var config = ConfigFile.new()
var config_file = "user://goldConfig.cfg"
var totalGold = 0;

func _ready():
	
	var err = config.load("user://goldConfig.cfg")
	if err != OK:
		config.set_value("save", "totalGold", 1000)
		config.save("user://goldConfig.cfg")
		totalGold = 1000
		return

	for save in config.get_sections():
		var goldInFile = config.get_value(save, "totalGold")
		totalGold = goldInFile

func _process(delta):
	pass

func returnGold():
	return int(totalGold)

func addGold(amount):
	totalGold += amount
	saveInFileGold()

func cutGold(amount):
	if totalGold < amount:
		return false
	else:
		totalGold -= amount
		saveInFileGold()
		return true

func saveInFileGold():
	var err = config.load("user://goldConfig.cfg")
	if err != OK:
		return
	config.set_value("save", "totalGold", totalGold)
	config.save("user://goldConfig.cfg")

func showGold():
	print(totalGold)
