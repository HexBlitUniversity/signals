extends Node2D

onready var player = $player
onready var key = $key4
onready var door = $door
onready var doorThree = $door3

var deadSlime = 0


func _ready():
	key.connect("onKeyPickup",self,"_on_key_picked_up")
	

func _process(_delta):
	var slimeone = get_node_or_null("slime")
	var slimetwo = get_node_or_null("slime2")
	var slimethree = get_node_or_null("slime3")
	
	if(not slimeone and not slimetwo and not slimethree):
		doorThree.unlock_door()
 
func _on_key_picked_up():
	door.unlock_door()


func _on_gameOver_body_entered(body):
	if("player" in body.name):
		get_tree().change_scene("res://gameover.tscn")
