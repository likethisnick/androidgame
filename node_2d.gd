extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var my_label = $Control/VBoxContainer/LabelVariable
	my_label.text = str(GoldenScript.returnGold());
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
