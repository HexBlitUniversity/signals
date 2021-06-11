extends Node2D

onready var player = $player
onready var key = $key4
onready var door = $door
export var keys = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	key.connect("onKeyPickup",self,"_on_key_picked_up")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_key_picked_up():
	keys += 1
	door.unlock_door()
