class_name WeaponContainer
extends Node2D

@export var weapon: Weapon
@export var orientation_component: OrientationComponent


func _unhandled_input(event: InputEvent) -> void:
	if not weapon:
		return

	if event.is_action_pressed("shoot"):
		weapon.start_shooting()

		return

	if event.is_action_released("shoot"):
		weapon.stop_shooting()


func _process(_delta: float) -> void:
	var matching_components: Array[Node] = weapon.find_children("*", "OrientationComponent")
	if matching_components.size():
		var weapon_orientation_component: OrientationComponent = matching_components[0]
		weapon_orientation_component.orientation = orientation_component.orientation
