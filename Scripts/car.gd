extends RigidBody3D

@onready var car_mesh = $CarMesh
@onready var body_mesh = $CarMesh/raceFuture
@onready var ground_ray = $CarMesh/RayCast3D
@onready var right_wheel = $CarMesh/raceFuture/wheel_frontRight
@onready var left_wheel = $CarMesh/raceFuture/wheel_frontLeft

