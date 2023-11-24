extends State
class_name NPCTalking

@export var npc : NPC
var is_done_talking : bool = false

func enter():
	npc.velocity = Vector2.ZERO
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(_delta):
	pass
	
func physics_update(delta):
	if is_done_talking:
		Transitioned.emit(self, "idle")
		
		

