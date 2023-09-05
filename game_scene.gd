extends Node2D

@onready var player_one_score = $PlayerOneScore
@onready var player_two_score = $PlayerTwoScore


# Called when the node enters the scene tree for the first time.
func _ready():
	Singletons.ball_exited.connect(scoreUpdate)


func scoreUpdate() -> void:
	player_one_score.text = str(Utils.playerOne)
	player_two_score.text = str(Utils.playerTwo)
