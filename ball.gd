extends CharacterBody2D

class_name Ball

var initial_speed: float = 20.0

var speed_multiplayer: float = 1.02

var ball_speed: float = initial_speed


func _ready():
	start_ball()


func _physics_process(delta):
	var collison = move_and_collide(velocity * ball_speed * delta)

	if collison:
		velocity = velocity.bounce(collison.get_normal()) * speed_multiplayer


func start_ball():
	randomize()
	velocity.x = [-1, 1][randi() % 2] * initial_speed
	velocity.y = [-.8, .8][randi() % 2] * initial_speed
