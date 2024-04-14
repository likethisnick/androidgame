extends Button

var config = ConfigFile.new()
var config_file = "user://heroConfig.cfg"
var score_data = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var err = config.load("user://heroConfig.cfg")
	for save in config.get_sections():
		var heroId = config.get_value(save, "heroId")
		var bought = config.get_value(save, "bought")
		if heroId == 1 && bought == true:
			$".".set_disabled(true)
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _pressed():
	var gold = GoldenScript.returnGold()
	if GoldenScript.cutGold(500):
		var config = ConfigFile.new()
		var config_file = "user://heroConfig.cfg"
		config.set_value("save", "heroId", 1)
		config.set_value("save", "bought", true)
		config.save("user://heroConfig.cfg")
		$".".set_disabled(true)
	else:
		print("not enough gold")
