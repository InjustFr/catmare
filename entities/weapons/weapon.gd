class_name Weapon
extends Node2D


@export var bullet_spawn_point: Marker2D
@export var shooter: Node2D


func spawn_bullet(projectile_scene: PackedScene, orientation: Vector2) -> void:
	var projectile: Node2D = projectile_scene.instantiate();
	shooter.get_parent().add_child(projectile)
	projectile.global_position = bullet_spawn_point.global_position

	var projectile_orientation_component: OrientationComponent = Utils.get_component("OrientationComponent", projectile)
	projectile_orientation_component.orientation = orientation


func start_shooting() -> void:
	pass


func stop_shooting() -> void:
	pass
