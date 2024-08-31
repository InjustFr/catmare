class_name PlayerInputComponent
extends Node


@export var player: Player
@export var velocity_component: VeloctiyComponent
@export var jump_speed: float = 0
@export var speed: float = 0

func _physics_process(delta: float) -> void:
	if not player.is_on_floor():
		velocity_component.velocity += player.get_gravity() * 2 * delta

	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
		velocity_component.velocity.y = jump_speed

	var direction: float = Input.get_axis("left", "right")
	if direction:
		velocity_component.velocity.x = direction * speed
	else:
		velocity_component.velocity.x = move_toward(velocity_component.velocity.x, 0, speed)
