class_name HurtboxComponent
extends Area2D


@export var health_component: HealthComponent


func _ready() -> void:
	@warning_ignore("return_value_discarded")
	area_entered.connect(_area_entered)


func _area_entered(area: Area2D) -> void:
	if area is DamageComponent:
		health_component.current_health -= (area as DamageComponent).damage
