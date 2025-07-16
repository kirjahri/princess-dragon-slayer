extends Node

var score: int = 0

@onready var coins: Node = %Coins
@onready var score_label: Label = %ScoreLabel


func _ready() -> void:
	if coins == null:
		push_error("'Coins' was not found on '%s'" % self.name)

	for coin: Node in coins.get_children():
		coin.coin_collected.connect(_on_coin_collected)


func increment_score(amount: int) -> void:
	var new_score_label: String

	score += amount

	if not score == 1:
		new_score_label = "You collected %d coins." % score
	else:
		new_score_label = "You collected 1 coin."

	score_label.text = new_score_label


func _on_coin_collected() -> void:
	increment_score(1)
