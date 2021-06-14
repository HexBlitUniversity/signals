extends KinematicBody2D

onready var sprite = $AnimatedSprite
export var attackType = 1
var isAttacking = false

var enemy = null

func _input(event):
	
	if(event.is_action_pressed("attack")):
		isAttacking = true
		match(attackType):	
			1:
				sprite.animation = "attackOne"								
				attackType = 2
				
			2: 
				sprite.animation = "attack2"
				attackType = 1
			
		yield(sprite,"animation_finished")
		if(enemy):
			enemy.queue_free()
			
		sprite.animation = "idle"

func _physics_process(_delta):
	var horizontal_str = Input.get_action_strength("right") - Input.get_action_strength("left")
	var vertical_str = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if(horizontal_str < 0):
		sprite.flip_h = true
	if(horizontal_str > 0):
		sprite.flip_h = false
	
	if(sprite.animation != "attacking"):
		if(horizontal_str != 0 || vertical_str != 0 ):			
			sprite.animation = "run"
			isAttacking = false
		else:
			if(sprite.is_playing() and sprite.animation != "run"):
				yield(sprite,"animation_finished")
				isAttacking = false
				
			sprite.animation = "idle"
			
		move_and_collide(Vector2(horizontal_str,vertical_str))
	



func _on_attackZone_body_entered(body):
	if("slime" in body.name):
		enemy = body


func _on_attackZone_body_exited(body):
	enemy = null
