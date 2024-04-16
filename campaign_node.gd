extends Node2D

@onready var progressBar = $CNCampaignPB

func _ready():
	pass
	
func _process(delta):
	progressBar.value = GlobalTimer.countdown
	if progressBar.value <= 0:
		$CNRedeemButton.visible = GlobalTimer.easyCampaignDone
