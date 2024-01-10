class_name Enemy
extends CharacterBody2D

@export var hp:int = 100
@export var move_speed = 100
@export var attack_range = 10
@export var damage = 50
@export var attack_cd = 2
@export var move_rate = 1

var canAttack:bool = true
var targetY:int
var timer:Timer
var game_play_manager:GamePlayManager

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")
	# setup timer
	timer = Timer.new()
	timer.wait_time = attack_cd
	timer.one_shot = true
	timer.connect("timeout", func(): canAttack = true)
	add_child(timer)
	
	# we need to get targetY here
	game_play_manager = get_tree().current_scene.find_child("GamePlayManager")
	targetY = game_play_manager.get_target_y()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_global_position()[1] + attack_range) >= targetY:
		if canAttack:
			# attack here
			# $AnimatedSprite2D.play("attack")
			# damage hp
			game_play_manager.get_damage(damage)
			canAttack = false
			timer.start()
			pass
	else:
		velocity = Vector2.UP * -1 * move_speed * move_rate
		move_and_slide()
		pass

func take_damage(d):
	hp = hp - d
	if hp <= 0:
		queue_free()
