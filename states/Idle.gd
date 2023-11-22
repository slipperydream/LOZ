extends State
class_name Idle

func enter():
	pass
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(_delta):
	pass
	
func physics_update(delta):
	#player.sprite.play("idle")
	var dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if dir != Vector2.ZERO:
		Transitioned.emit(self, "move")
		
	if Input.is_action_just_pressed("roll"):
		Transitioned.emit(self, "roll")
	
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "attack")
