class_name HealthComponent
extends Node


@export var max_health: int = 0
var current_health: int = max_health:
	set(value):
		current_health -= value
		if current_health <= 0:
			died.emit()


signal died
