extends CharacterBody2D

class_name Enemy

@export var hp:int = 100
@export var move_speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2.UP * -1 * move_speed
	move_and_slide()
	pass
