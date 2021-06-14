extends KinematicBody2D
onready var animation = $AnimatedSprite



func _on_Area2D_body_entered(body):
	animation.play("default")
