extends KinematicBody2D


onready var sprite = $AnimatedSprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var horizontal_str = Input.get_action_strength("right") - Input.get_action_strength("left")
	var vertical_str = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if(horizontal_str < 0):
		sprite.flip_h = true
	if(horizontal_str > 0):
		sprite.flip_h = false
		
	if(horizontal_str != 0 || vertical_str != 0 ):
		sprite.animation = "run"
	else:
		sprite.animation = "idle"
	move_and_collide(Vector2(horizontal_str,vertical_str))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


