extends BaseClickableGridContainer

class_name OperatorGridContainer

func _ready():
	_clear()
	_add('+')
	_add('-')
	_add('x')
	_add('C')

func _init_item(newButton: Button, data: String):
	print("bind data")
	print(data)
	newButton.text = data
