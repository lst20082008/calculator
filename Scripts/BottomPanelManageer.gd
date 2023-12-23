extends PanelContainer

@export var cc:CharacterGridContainer
@export var nc:NumberGridContainer
@export var oc:OperatorGridContainer
@export var character_lists: Array[Character]

var selected_number: int
var selected_number_index: int

var selected_operator

# Called when the node enters the scene tree for the first time.
func _ready():
	cc.selected_changed.connect(_character_changed)
	nc.selected_changed.connect(_number_changed)
	oc.selected_changed.connect(_operator_changed)
	
	selected_number = -1
	selected_operator = null

func _character_changed(character: Character, _idx: int):
	print(character)

func _number_changed(num: int, idx: int):
	var newNum: int
	if selected_operator == null:
		selected_number = num
		selected_number_index = idx
	else:
		match selected_operator:
			'+':
				newNum = selected_number + num
				print("%d + %d" % [selected_number, num])
			'-':
				newNum = selected_number - num
				if newNum < 0:
					newNum = 0
				print("%d - %d" % [selected_number, num])
			'x':
				newNum = selected_number * num
				print("%d x %d" % [selected_number, num])
		print("time to delete old num")
		print("and to update new num")
		nc._erase(selected_number_index)
		nc._update(idx, newNum)
		selected_number = newNum
		selected_number_index = idx
	print(num)

func _operator_changed(operator: String, _idx: int):
	if operator == 'C':
		print("pressed C!")
		selected_operator = null
		pass
	else:
		if selected_number == -1:
			return
		selected_operator = operator
	print(operator)




func Test_GenCharacter():
	cc._clear()
	for i in range(randi_range(2, 6)):
		cc._add(character_lists[randi_range(0, character_lists.size() - 1)])
	pass # Replace with function body.


func Test_GenNumbers():
	nc._clear()
	for i in range(randi_range(3, 9)):
		nc._add(randi_range(1, 9))
	pass # Replace with function body.
