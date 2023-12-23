extends GridContainer

class_name BaseClickableGridContainer

@export var grid_num: int
@export var buttonType: PackedScene

signal selected_changed(current_selected_data, current_selected_index)

var selected_n: int
var data_list: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	_clear()

func _button_n_pressed(n):
	if selected_n != n:
		selected_n = n
		selected_changed.emit(_get_selected_data(), n)

func _clear():
	data_list = []
	for child in get_children():
		remove_child(child)
	selected_n = -1
	for i in range(grid_num):
		data_list.append(null)
		var newButton = Button.new()
		newButton.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		newButton.size_flags_vertical = Control.SIZE_EXPAND_FILL
		newButton.pressed.connect(func(): _button_n_pressed(i))
		add_child(newButton)

func _add(data):
	var i = _find_empty_place()
	if i == -1:
		return false
	data_list[i] = data
	var newButton = buttonType.instantiate()
	var oldButton = _get_item(i)
	newButton.pressed.connect(func(): _button_n_pressed(i))
	_init_item(newButton, data)
	oldButton.add_sibling(newButton)
	remove_child(oldButton)
	return true

func _erase(index):
	if index >= grid_num:
		return false
	data_list[index] = null
	var newButton = Button.new()
	var oldButton = _get_item(index)
	newButton.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	newButton.size_flags_vertical = Control.SIZE_EXPAND_FILL
	newButton.pressed.connect(func(): _button_n_pressed(index))
	oldButton.add_sibling(newButton)
	remove_child(oldButton)	
	return true

func _update(index, data):
	if index >= grid_num:
		return false
	data_list[index] = data
	_init_item(_get_item(index), data)
	pass

func _find_empty_place():
	for i in range(grid_num):
		if data_list[i] == null:
			return i
	return -1

func _get_selected_data():
	if selected_n >= grid_num || selected_n == -1:
		return null
	return data_list[selected_n]

func _get_item(i: int):
	if i >= grid_num || i <= -1:
		return null
	return get_children()[i]

func _init_item(newButton, data):
	pass
