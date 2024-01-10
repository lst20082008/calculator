extends SkillBase

@export var damage: int

# Called when the node enters the scene tree for the first time.
func _ready():
	print("skill1!!!!")
	$Sprite2D.position = targetPos
	$Area2D.position = targetPos
	await get_tree().create_timer(0.1).timeout
	var enemies = $Area2D.get_overlapping_bodies()
	print(enemies)
	for e in enemies:
		e.take_damage(damage)
		print("hit")
		print(e)
	await get_tree().create_timer(1).timeout
	queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
