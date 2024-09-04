class_name CatBat
extends Weapon


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var orientation_component: OrientationComponent = $OrientationComponent


func _process(_delta: float) -> void:
	scale.x = -1 if abs(orientation_component.orientation.angle()) > PI/2 else 1

func start_shooting() -> void:
	if animation_player.is_playing():
		return

	animation_player.play("attack")


func stop_shooting() -> void:
	pass
