extends PanelContainer

@export var sc:SkillGridContainer
@export var nc:NumberGridContainer
@export var oc:OperatorGridContainer
@export var skill_lists: Array[Skill]

var selected_number: int
var selected_number_index: int

var selected_operator

# Called when the node enters the scene tree for the first time.
func _ready():
	sc.item_clicked.connect(_skill_changed)
	nc.item_clicked.connect(_number_changed)
	oc.item_clicked.connect(_operator_changed)
	selected_number = -1
	selected_operator = null

func _skill_changed(skill: Skill, _idx: int):
	if selected_number == -1:
		return
	if selected_number != skill.sp:
		return
	sc._erase(_idx)
	nc._erase(selected_number_index)
	selected_number = -1
	selected_number_index = -1
	var skillObject = skill.skillObject.instantiate()
	skillObject.skill = skill
	skillObject.targetPos = get_tree().current_scene.find_child("GamePlayManager").find_skill_pos(skill.skillStrategy)
	skillObject.position = get_tree().current_scene.find_child("GamePlayManager").get_target_pos()
	get_tree().current_scene.add_child(skillObject)

func _number_changed(num: int, idx: int):
	var newNum: int
	if idx == selected_number_index:
		return
	if selected_operator == null:
		selected_number = num
		selected_number_index = idx
	else:
		match selected_operator:
			'+':
				newNum = selected_number + num
			'-':
				newNum = selected_number - num
				if newNum < 0:
					newNum = 0
			'x':
				newNum = selected_number * num
		nc._erase(selected_number_index)
		nc._update(idx, newNum)
		selected_number = -1
		selected_number_index = -1
		selected_operator = null

func _operator_changed(operator: String, _idx: int):
	if operator == 'C':
		selected_operator = null
		pass
	else:
		if selected_number == -1:
			return
		selected_operator = operator




func Test_GenCharacter():
	sc._clear()
	for i in range(randi_range(2, 6)):
		sc._add(skill_lists[randi_range(0, skill_lists.size() - 1)])
	pass # Replace with function body.


func Test_GenNumbers():
	nc._clear()
	for i in range(randi_range(3, 9)):
		nc._add(randi_range(1, 9))
	pass # Replace with function body.
