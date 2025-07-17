extends Node

var score: int = 0

@onready var coins: Node = %Coins
@onready var gui: Control = %GUI
@onready var score_label: Label = gui.get_node("%ScoreLabel")


func _ready() -> void:
	for coin: Node in coins.get_children():
		coin.coin_collected.connect(_on_coin_collected)


func increment_score(amount: int) -> void:
	score += amount
	score_label.text = str(score)


func _on_coin_collected() -> void:
	increment_score(1)
