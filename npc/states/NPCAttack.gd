extends State
class_name NPCAttack

@export var npc : NPC

func enter():
	pass
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(_delta):
	pass
	
func physics_update(delta):	
	var distance = player.global_position - enemy.global_position
	if distance.length() < enemy.attack_distance:
		pass
	
	
