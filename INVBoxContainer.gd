extends VBoxContainer

var items = [
	{ "texture": "res://sword.jpg", "name": "sword", "cost": 10000}, 
	{ "texture": "res://bow.jpg", "name": "bow", "cost": 100000}
]

# Called when the node enters the scene tree for the first time.
func _ready():
	open_Inventory()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open_Inventory():
	for item in items:
		var item_row = HBoxContainer.new()

		var item_image = TextureRect.new()
		item_image.texture = load(item.texture)
		item_row.add_child(item_image)

		var item_name = Label.new()
		item_name.text = str(item.name)
		item_row.add_child(item_name)
		
		var cost = Label.new()
		cost.text = str(item.cost)
		item_row.add_child(cost)
		
		var buyButton = Button.new()
		buyButton.text = "Buy"
		buyButton.size_flags_horizontal = Control.SIZE_EXPAND + Control.SIZE_SHRINK_END
		item_row.add_child(buyButton)

		add_child(item_row)

func close_inventory():
	for item in get_children():
		item.queue_free()
