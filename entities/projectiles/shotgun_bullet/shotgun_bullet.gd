class_name ShotgunBullet
extends StaticBody2D


@onready var orientation_component: OrientationComponent = $OrientationComponent
@onready var veloctiy_component: VeloctiyComponent = $VeloctiyComponent

const RANGE: float = 80
var distance_traveled: float = 0


func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(veloctiy_component.velocity * delta)
	rotation = orientation_component.orientation.angle()
	distance_traveled += veloctiy_component.velocity.length() * delta

	if abs(rotation) > PI / 2:
		scale.y = -1

	if collision || distance_traveled > RANGE:
		queue_free()
