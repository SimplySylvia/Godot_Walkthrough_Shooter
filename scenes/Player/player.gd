extends CharacterBody2D

signal lazer(pos)
signal grenade(pos)

var can_lazer: bool = true
var can_grenade: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# get input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	# lazer shooting input 
	if Input.is_action_pressed("primary action") and can_lazer:
		#randomly select a marker for the lazer starting position
		var lazer_markers = $LazerStartPositions.get_children()
		var selected_lazer = lazer_markers[randi() % lazer_markers.size()]
		can_lazer = false
		$Timer.start()
		#emit the position we selected
		lazer.emit(selected_lazer.global_position)

	# throw grenade 
	if Input.is_action_pressed("secondary action") and can_grenade:
		var grenade_markers = $GrenadeStartPositions.get_children()
		var selected_grenade = grenade_markers[randi() % grenade_markers.size()]
		can_grenade = false
		$GrenadeReloadTimer.start()
		grenade.emit(selected_grenade.global_position)


# signal from timer for when it completed
func _on_timer_timeout():
	can_lazer = true

# signal from timer for when it completed
func _on_grenade_reload_timer_timeout():
	can_grenade = true
