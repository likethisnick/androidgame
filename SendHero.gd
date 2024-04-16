extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _pressed():
	if GlobalTimer.getCountdown() <= 0 && !GlobalTimer.easyCampaignDone:
		GlobalTimer.addCountdown(100)
		
	get_tree().change_scene_to_file("res://campaign_node.tscn")
	
