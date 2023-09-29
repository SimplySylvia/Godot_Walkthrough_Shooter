extends CharacterBody2D

signal lazer
signal grenade

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
		lazer.emit()
		can_lazer = false
		$Timer.start()

	# throw grenade 
	if Input.is_action_pressed("secondary action") and can_grenade:
		grenade.emit()
		can_grenade = false
		$GrenadeReloadTimer.start()


# signal from timer for when it completed
func _on_timer_timeout():
	can_lazer = true

# signal from timer for when it completed
func _on_grenade_reload_timer_timeout():
	can_grenade = true
