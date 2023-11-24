extends State

class_name Roll

func enter():
	player.velocity.y = player.roll_velocity
	player.sprites.play("roll")
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(_delta):
	pass
	
func physics_update(delta):	
	if Input.is_action_just_pressed("roll"):
		#player.sprite.play("swing")
		pass
	
	if Input.is_action_just_pressed("attack"):
		player.velocity.y = -1 * player.jump_velocity/2
		#player.sprite.play("swing")
	
			
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		Transitioned.emit(self, "walk")
		
	for index in player.get_slide_collision_count():
		var collision = player.get_slide_collision(index)
		var body = collision.get_collider()
		
	
	
