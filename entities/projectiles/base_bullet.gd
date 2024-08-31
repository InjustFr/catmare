class_name BaseBullet
extends StaticBody2D

var speed: float = 0
var orientation = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var velocity = orientation * speed
	var collision = move_and_collide(velocity * delta)

	if abs(rotation) > PI / 2:
		scale.y = -1

	if collision:
		queue_free()
