extends State
class_name Move

var direction : Vector2

func enter():
	pass
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(_delta):
	pass
	
func physics_update(delta):
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction.is_zero_approx():
		Transitioned.emit(self, "idle")
		player.velocity = player.velocity.move_toward(Vector2.ZERO, player.speed)	
	else:	
		player.velocity = direction * player.speed 
		print(player.velocity)
	set_movement_animation()
		
	if Input.is_action_just_pressed("roll"):
		Transitioned.emit(self, "roll")
		
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "attack")
		
func set_movement_animation():
	match direction:
		Vector2.LEFT:
			player.animation.play("move_left")
		Vector2.RIGHT:
			player.animation.play("move_right")
		Vector2.UP:
			player.animation.play("move_up")
		Vector2.DOWN:
			player.animation.play("move_down")
		Vector2.ZERO:
			player.animation.play("idle")		

