extends CharacterBody2D

const SPEED: float = 150.0
const JUMP_VELOCITY: float = -300.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction: float = Input.get_axis("move_left", "move_right")

	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
	else:
		if velocity.y < 0:
			sprite.play("jump_up")
		else:
			sprite.play("jump_down")

	if not direction == 0:
		if direction < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false

		if self.has_node("CollisionShape2D"):
			velocity.x = direction * SPEED
		else:
			velocity.x = 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
