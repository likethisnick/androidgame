extends VBoxContainer

var heroes_Data = []

# Called when the node enters the scene tree for the first time.
func _ready():
	readHeroes()
	for hero in heroes_Data:
		var button = Button.new()
		button.text = str(hero[0] + " " + hero[2] +"dmg \n" + "items: " + hero[3])
		button.icon = ResourceLoader.load(hero[1])
		button.connect("pressed", _on_button_pressed.bind())
		add_child(button)
	

# Function to handle button presses
func _on_button_pressed():
	# сделать глобальную переменную в которй указать текущего бойца для открытия его инвентаря
	get_tree().change_scene_to_file("res://inventory_node.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func readHeroes():
	var i=0
	var list1 = []
	var config = ConfigFile.new()
	var config_file = "user://heroConfig.cfg"
	var err = config.load("user://heroConfig.cfg")
	for hero in config.get_sections():
		var heroId = config.get_value(hero, "heroName")
		var heroPic = config.get_value(hero, "texture")
		var flatDamage = config.get_value(hero, "flatDamage")
		var items = config.get_value(hero, "items")
		var list = [heroId, heroPic, flatDamage, items]
		heroes_Data.append(list)
		i += 1
