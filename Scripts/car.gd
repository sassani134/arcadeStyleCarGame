extends RigidBody3D

@onready var car_mesh = $CarMesh
@onready var body_mesh = $CarMesh/raceFuture
@onready var ground_ray = $CarMesh/RayCast3D
@onready var right_wheel = $CarMesh/raceFuture/wheel_frontRight
@onready var left_wheel = $CarMesh/raceFuture/wheel_frontLeft

# Where to place the car mesh relative to the sphere
var sphere_offset = Vector3.DOWN
# Engine power
var acceleration = 35.0
# Turn amount, in degrees
var steering = 18.0
# How quickly the car turns
var turn_speed = 4.0
# Below this speed, the car doesn't turn
var turn_stop_limit = 0.75

# Variables for input values
var speed_input = 0
var turn_input = 0

func _physics_process(delta):
	car_mesh.position = position + sphere_offset
	if ground_ray.is_colliding():
		apply_central_force(-car_mesh.global_transform.basis.z * speed_input)

func _process(delta):
	print(ground_ray.is_colliding())
	if not ground_ray.is_colliding():
		return
	speed_input = Input.get_axis("brake","accelerate") * acceleration
	turn_input = Input.get_axis("steer_right", "steer_left") * deg_to_rad(steering)
	right_wheel.rotation.y = turn_input
	left_wheel.rotation.y = turn_input
	
