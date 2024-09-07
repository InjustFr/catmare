class_name BulletMovementComponent
extends Node


@export var orientation_component: OrientationComponent
@export var velocity_component: VeloctiyComponent

@export var speed: float = 0


func _ready() -> void:
	velocity_component.velocity = orientation_component.orientation * speed

func _process(_delta: float) -> void:
	velocity_component.velocity = orientation_component.orientation * speed
