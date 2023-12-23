extends BaseClickableGridContainer

class_name NumberGridContainer

func _ready():
	_clear()

func _init_item(newButton: Button, data: int):
	newButton.text = str(data)
