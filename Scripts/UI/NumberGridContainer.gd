extends BaseClickableGridContainer

class_name NumberGridContainer

func _ready():
	_clear()
	_add(5)
	_add(2)
	_add(3)

func _init_item(newButton: Button, data: int):
	newButton.text = str(data)
