class_name GamePlayManager
extends Node

@export var enemies: Array[PackedScene]
@export var hp: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	generate_enemy()
	pass # Replace with function body.

func generate_enemy():
	var i = randi_range(0, enemies.size() - 1)
	var new_enemy = enemies[i].instantiate()
	var pos1 = $GeneratedPlace.get_point_position(0)
	var pos2 = $GeneratedPlace.get_point_position(1)
	var x = randf_range(pos1.x, pos2.x)
	var y = randf_range(pos1.y, pos2.y)
	new_enemy.position = Vector2(x, y)
	get_tree().current_scene.find_child("Enemies").add_child(new_enemy)
	pass

func get_target_y():
	print($WallPos.get_global_position()[1])
	return $WallPos.get_global_position()[1]

func get_damage(d):
	hp = hp - d
	if hp <= 0:
		defeated()

func defeated():
	print("defeated")

func victory():
	print("victory")

func find_skill_pos(strategy: Strategy.Strategy):
	match strategy:
		Strategy.Strategy.MostNear:
			var enemies = get_tree().current_scene.find_child("Enemies").get_children()
			var retval = null
			for enemyNode in enemies:
				if retval == null:
					retval = enemyNode.position
				else:
					if enemyNode.position.y > retval.y:
						retval = enemyNode.position
			return retval
		_:
			return Vector2(0, 0)
