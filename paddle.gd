extends RigidBody2D

var paddle_speed: float = 500

var movement: Vector2 = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
	movement = Vector2.ZERO

	if (Input.is_key_pressed(KEY_W)) == true:
		movement = Vector2.UP
	elif (Input.is_key_pressed(KEY_S)) == true:
		movement = Vector2.DOWN

	linear_velocity = movement * paddle_speed
