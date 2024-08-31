class_name Player
extends CharacterBody2D


@onready var line_2d: Line2D = $Line2D
@onready var veloctiy_component: VeloctiyComponent = $VeloctiyComponent
@onready var orientation_component: OrientationComponent = $OrientationComponent


func _physics_process(_delta: float) -> void:
	velocity = veloctiy_component.velocity

	@warning_ignore("return_value_discarded")
	move_and_slide()

	line_2d.rotation = orientation_component.orientation.angle()
