class_name Utils

static var playerOne: int = 0
static var playerTwo: int = 0

static var hasPlayerOneMissedTheBall: bool = false


static func increaseScore(playerMissed: bool) -> void:
	hasPlayerOneMissedTheBall = playerMissed
	if hasPlayerOneMissedTheBall == true:
		playerTwo = playerTwo + 1
	elif hasPlayerOneMissedTheBall == false:
		playerOne = playerOne + 1


static func resetScore() -> void:
	playerOne = 0
	playerTwo = 0
	hasPlayerOneMissedTheBall = false
