extends Area2D

signal coin_collected

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	self.body_entered.connect(_on_body_entered)


func _on_body_entered(_body: Node2D) -> void:
	animation_player.play("pickup")
	coin_collected.emit()
