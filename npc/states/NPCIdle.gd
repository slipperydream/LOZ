extends State
class_name NPCIdle

@export var npc : NPC

var move_direction : Vector2 = Vector2.ZERO
var wander_time : float = 0
var is_talking : bool = false

func enter():
	randomize_wander()
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(delta):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()
	
func physics_update(delta):
	if npc:
		npc.velocity = move_direction * npc.speed
	if is_talking:
		Transitioned.emit(self, "talking")

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)	
