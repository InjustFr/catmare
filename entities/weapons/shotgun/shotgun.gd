class_name Shotgun
extends Weapon


@onready var bullet_scene: PackedScene = preload("res://entities/projectiles/shotgun_bullet/shotgun_bullet.tscn")
@onready var cooldown_timer: Timer = $CooldownTimer
@onready var orientation_component: OrientationComponent = $OrientationComponent

const SPREAD: float = 30
const NB_BULLETS: int = 5


func start_shooting() -> void:
	if not cooldown_timer.is_stopped():
		return

	if not cooldown_timer.timeout.is_connected(start_shooting):
		@warning_ignore("return_value_discarded")
		cooldown_timer.timeout.connect(start_shooting)

	cooldown_timer.start()

	for i: int in NB_BULLETS:
		var spread_angle: float = i * SPREAD / (NB_BULLETS - 1) - SPREAD / 2
		spawn_bullet(bullet_scene, orientation_component.orientation.rotated(deg_to_rad(spread_angle)))


func stop_shooting() -> void:
	if cooldown_timer.timeout.is_connected(start_shooting):
		@warning_ignore("return_value_discarded")
		cooldown_timer.timeout.disconnect(start_shooting)


func _process(_delta: float) -> void:
	rotation = orientation_component.orientation.angle()
	scale.y = -1 if abs(rotation) > PI / 2 else 1
