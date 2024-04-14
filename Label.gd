extends Node

# Declare a variable to hold the reference to the Label node
var my_label 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#var saveInfo = {}
	#var config = ConfigFile.new()
#	
#
## Load data from a file.
	#var err = config.load("user://timePlayed.cfg")
#
	## If the file didn't load, ignore it.
	#if err != OK:
		#return
#
## Iterate over all sections.
	#for save in config.get_sections():
		## Fetch the data for each section.
		#var var1 = config.get_value(save, "var_1")
		#saveInfo["var_1"] = var1
	#my_label = $"."
#
	#Set the initial text of the label
	#my_label.text =  str(saveInfo["var_1"])
	
# Function to change the text of the label
func change_label_text(new_text):
	my_label.text = new_text
