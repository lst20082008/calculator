extends Node

@export var enemies: Array[PackedScene]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	Generate_Enemy()
	pass # Replace with function body.

func Generate_Enemy():
	var i = randi_range(0, enemies.size() - 1)
	var new_enemy = enemies[i].instantiate()
	var pos1 = $GeneratedPlace.get_point_position(0)
	var pos2 = $GeneratedPlace.get_point_position(1)
	var x = randf_range(pos1.x, pos2.x)
	var y = randf_range(pos1.y, pos2.y)
	new_enemy.position = Vector2(x, y)
	get_tree().current_scene.add_child(new_enemy)
	pass
