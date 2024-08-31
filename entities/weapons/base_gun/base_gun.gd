class_name BaseGun
extends Weapon


@onready var bullet_scene: PackedScene = preload("res://entities/projectiles/base_bullet.tscn")
@onready var cooldown_timer: Timer = $CooldownTimer
@onready var orientation_component: OrientationComponent = $OrientationComponent


func start_shooting() -> void:
	@warning_ignore("return_value_discarded")
	cooldown_timer.timeout.connect(start_shooting)
	cooldown_timer.start()
	spawn_bullet(bullet_scene, orientation_component.orientation, 400)


func stop_shooting() -> void:
	@warning_ignore("return_value_discarded")
	cooldown_timer.timeout.disconnect(start_shooting)


func _process(_delta: float) -> void:
	rotation = orientation_component.orientation.angle()
	scale.y = -1 if abs(rotation) > PI / 2 else 1
