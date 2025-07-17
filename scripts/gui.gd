extends Control

@onready var score_label: Label = $ScoreLabel


func update_score(score: int) -> void:
	score_label.text = str(score)
