class_name BaseBullet
extends StaticBody2D


@onready var orientation_component: OrientationComponent = $OrientationComponent
@onready var veloctiy_component: VeloctiyComponent = $VeloctiyComponent


func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(veloctiy_component.velocity * delta)
	rotation = orientation_component.orientation.angle()

	if abs(rotation) > PI / 2:
		scale.y = -1

	if collision:
		queue_free()
