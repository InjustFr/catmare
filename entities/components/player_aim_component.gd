class_name PlayerAimComponent
extends Node


@export var orientation_component: OrientationComponent
@export var player: Player


func _process(_delta: float) -> void:
	orientation_component.orientation = player.get_local_mouse_position().normalized()
