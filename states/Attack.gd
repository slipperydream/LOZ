extends State
class_name Attack


func enter():
	player.sprites.play("attack")
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(_delta):
	pass
	
func physics_update(delta):	
	if Input.is_action_just_pressed("roll"):
		Transitioned.emit(self, "roll")

	
	if player.is_on_floor():
		Transitioned.emit(self, "idle")
			
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right") or Input.is_action_just_pressed("move_up") or Input.is_action_just_pressed("move_down"):
		Transitioned.emit(self, "move")
		
	for index in player.get_slide_collision_count():
		var collision = player.get_slide_collision(index)
		var body = collision.get_collider()
	
	
