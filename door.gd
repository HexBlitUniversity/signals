extends KinematicBody2D

onready var doorSprite = $AnimatedSprite
onready var doorWall = $CollisionShape2D

export var isUnlocked = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if(isUnlocked):
		unlock_door()
 pass

func animate_unlock_door():

	
	doorSprite.play("Unlock")
	yield(doorSprite,"animation_finished")
	doorSprite.animation = "default"
	doorSprite.frame = 1
	

func unlock_door():	
	set_deferred("isUnlocked",true)	
	doorWall.set_deferred("disabled",true)
	
	if(doorSprite.frame != 1):
		animate_unlock_door()
	
 
	
	
