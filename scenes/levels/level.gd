extends Node2D

# preloads the scene 
var lazer_scene: PackedScene = preload("res://scenes/Projectiles/lazer.tscn")
var grenade_scene: PackedScene = preload("res://scenes/Projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body):
	print("player has entered gate")
	print(body)

func _on_player_lazer(pos):
	# create an instance of the lazer scene
	var lazer = lazer_scene.instantiate()
	# update lazer position
	lazer.position = pos
	# add the lazer instance to a node2d and put lazer into current scene
	$Projectiles.add_child(lazer)

func _on_player_grenade(pos):
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	$Projectiles.add_child(grenade)
