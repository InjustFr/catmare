class_name GrenadeLauncherBullet
extends RigidBody2D


@onready var orientation_component: OrientationComponent = $OrientationComponent
@onready var veloctiy_component: VeloctiyComponent = $VeloctiyComponent


func _ready() -> void:
	@warning_ignore("return_value_discarded")
	body_entered.connect(_on_collision)
	call_deferred("_set_initial_velocity")


func _physics_process(_delta: float) -> void:
	orientation_component.orientation = linear_velocity.normalized()
	rotation = orientation_component.orientation.angle()

	if abs(rotation) > PI / 2:
		scale.y = -1


func _on_collision(_body: Node2D) -> void:
	queue_free()


func _set_initial_velocity() -> void:
	linear_velocity = veloctiy_component.velocity
