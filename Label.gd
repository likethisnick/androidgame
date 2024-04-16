extends Node

# Declare a variable to hold the reference to the Label node
var my_label 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

	
# Function to change the text of the label
func change_label_text(new_text):
	my_label.text = new_text
