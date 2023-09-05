extends RigidBody2D

var paddle_speed: float = 500

var movement: Vector2 = Vector2.ZERO

var reset: bool = false
var initial_position: Vector2 = Vector2(1115, 290)
var isPlaying: bool = false


func _ready():
	Singletons.ball_exited.connect(ball_exited)
	Singletons.isPlaying.connect(isGamePlaying)


# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
	if isPlaying == true:
		movement = Vector2.ZERO

		if (Input.is_key_pressed(KEY_UP)) == true:
			movement = Vector2.UP
		elif (Input.is_key_pressed(KEY_DOWN)) == true:
			movement = Vector2.DOWN

		linear_velocity = movement * paddle_speed


func _integrate_forces(state: PhysicsDirectBodyState2D):
	if reset:
		state.transform.origin = initial_position
		state.linear_velocity = Vector2.ZERO
		reset = false
		isPlaying = false


func ball_exited() -> void:
	reset = true


func isGamePlaying(playing: bool) -> void:
	isPlaying = playing
