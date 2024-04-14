extends Timer

var seconds_passed = 0
var newSecond = 0
var my_label = ""


func _ready():
	var saveInfo = {}
	var config = ConfigFile.new()

# Load data from a file.
	var err = config.load("user://timePlayed.cfg")

	# If the file didn't load, ignore it.
	if err != OK:
		return
	# Iterate over all sections.
	for save in config.get_sections():
		# Fetch the data for each section.
		var var1 = config.get_value(save, "var_1")
		saveInfo["var_1"] = var1

	# Set the initial text of the label
	newSecond =  int(saveInfo["var_1"])
	seconds_passed = newSecond
	# Start the timer that calls the _process function every second
	$".".start(30)
	 # Connect the timer's timeout signal to the _on_Timer_timeout function
	
func _process(delta):
	# This function is called every frame
	seconds_passed += delta

	if newSecond < int(seconds_passed):
		newSecond = int(seconds_passed)
		_changeValue(newSecond)
		if newSecond%10 == 0:
			saveIntoFile(newSecond)
		
func _changeValue(newSecond):
	my_label = $"../Control/VBoxContainer/LabelVariable"
	# Set the initial text of the label
	my_label.text = str(newSecond)

func saveIntoFile(newSecond):
	var config = ConfigFile.new()
	# Store some values.
	config.set_value("save", "var_1", newSecond)
	# Save it to a file (overwrite if already exists).
	config.save("user://timePlayed.cfg")
