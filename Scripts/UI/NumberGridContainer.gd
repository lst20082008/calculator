class_name NumberGridContainer
extends BaseClickableGridContainer

func _ready():
	_clear()

func _init_item(newButton: Button, data: int):
	newButton.text = str(data)
