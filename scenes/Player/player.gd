extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# get input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	# lazer shooting input 
	if Input.is_action_pressed("primary action"):
		print("shoot lazer")

	# throw grenade 
	if Input.is_action_pressed("secondary action"):
		print("throw grenade")
