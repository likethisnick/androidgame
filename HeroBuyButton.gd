extends Button

var heroName = "Vitalya"
var config = ConfigFile.new()
var config_file = "user://heroConfig.cfg"
var score_data = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var err = config.load("user://heroConfig.cfg")
	for save in config.get_sections():
		var configHeroName = config.get_value(save, "heroName")
		if configHeroName == heroName:
			$".".set_disabled(true)

func _process(delta):
	pass
	
func _pressed():
	var gold = GoldenScript.returnGold()
	if GoldenScript.cutGold(500):
		var config = ConfigFile.new()
		var config_file = "user://heroConfig.cfg"
		config.set_value("Hero1", "heroName", "Vitalya")
		config.set_value("Hero1", "texture", "res://lico.png")
		config.set_value("Hero1", "flatDamage", "15")
		config.set_value("Hero1", "items", "")
		config.save("user://heroConfig.cfg")
		$".".set_disabled(true)
	else:
		print("not enough gold")
