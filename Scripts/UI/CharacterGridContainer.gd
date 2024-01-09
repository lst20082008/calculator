class_name CharacterGridContainer
extends BaseClickableGridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	_clear()

func _init_item(newButton: Button, data: Character):
	newButton.find_child("HPLabel").text = str(data.hp)
	newButton.find_child("ATKLabel").text = str(data.attack)
	newButton.find_child("MOVLabel").text = str(data.move_distance)
	newButton.find_child("SPLabel").text = str(data.sp)
	newButton.icon = data.img
