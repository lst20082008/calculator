extends SkillBase

@export var damage: int
@export var speed: float

var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	print("skill2!!!!")
	direction = (targetPos - position).normalized()
	look_at(direction)
	await get_tree().create_timer(5.0).timeout
	queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position + delta * speed * direction
	pass


func _on_area_2d_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
	pass # Replace with function body.
