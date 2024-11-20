extends CharacterBody2D

@export var speed: float = 200.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
		play_animation(input_vector)
	else:
		animation_player.play("Idle")
	
	velocity = input_vector * speed
	move_and_slide()

func play_animation(input_vector: Vector2):
	if abs(input_vector.x) > abs(input_vector.y):
		animation_player.play("Walk")
