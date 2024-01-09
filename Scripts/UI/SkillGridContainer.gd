class_name SkillGridContainer
extends BaseClickableGridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	_clear()

func _init_item(newButton: Button, data: Skill):
	newButton.find_child("SPLabel").text = str(data.sp)
	newButton.icon = data.img
