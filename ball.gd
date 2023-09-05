extends CharacterBody2D

class_name Ball

var initial_speed: float = 20.0

var speed_multiplayer: float = 1.04

var ball_speed: float = initial_speed

var isPlaying: bool = false

var initial_position: Vector2 = Vector2(576, 325)


func _process(_delta):
	if Input.is_key_pressed(KEY_SPACE) && isPlaying != true:
		isPlaying = true
		Singletons.isPlaying.emit(true)
		start_ball()


func _physics_process(delta):
	if isPlaying == true:
		var collison = move_and_collide(velocity * ball_speed * delta)
		if collison:
			velocity = velocity.bounce(collison.get_normal()) * speed_multiplayer


func start_ball():
	randomize()
	velocity.x = [-1, 1][randi() % 2] * initial_speed
	velocity.y = [-.8, .8][randi() % 2] * initial_speed


func _on_visible_on_screen_notifier_2d_screen_exited():
	position = initial_position
	isPlaying = false
	Singletons.isPlaying.emit(false)
	Singletons.ball_exited.emit()


func _on_left_area_area_entered(_area):
	Utils.increaseScore(true)


func _on_right_area_area_entered(_area):
	Utils.increaseScore(false)
