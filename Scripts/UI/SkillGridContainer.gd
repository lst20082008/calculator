extends BaseClickableGridContainer

class_name SkillGridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	_clear()

func _init_item(newButton: Button, data: Skill):
	newButton.find_child("SPLabel").text = str(data.sp)
	newButton.icon = data.img
