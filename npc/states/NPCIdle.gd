extends State
class_name NPCIdle

@export var npc : NPC

var move_direction : Vector2 = Vector2.ZERO
var wander_time : float = 0

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
	if enemy:
		enemy.velocity = move_direction * enemy.speed
		
	var distance = player.global_position - enemy.global_position
	if distance.length() < enemy.max_follow_distance:
		Transitioned.emit(self, "Follow")

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)	
