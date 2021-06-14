extends KinematicBody2D

 
signal onKeyPickup


func _on_Area2D_body_entered(body):
	emit_signal("onKeyPickup")
	self.queue_free()
