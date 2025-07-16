extends Area2D

const DEATH_JUMP_VELOCITY: float = -150.0

@onready var timer: Timer = $Timer


func _ready() -> void:
	if timer == null:
		push_error("'Timer' was not found on '%s'" % self.name)

	self.body_entered.connect(_on_body_entered)
	timer.timeout.connect(_on_timer_timeout)


func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	Engine.time_scale = 0.5

	if body is CharacterBody2D and self.get_parent().name == "Slime":
		body.velocity.y = DEATH_JUMP_VELOCITY

	var collider: CollisionShape2D = body.get_node("CollisionShape2D")
	if collider == null:
		push_error("'CollisionShape2D' was not found on '%s'" % body.name)
	collider.queue_free()

	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
