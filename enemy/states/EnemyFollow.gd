extends State
class_name EnemyFollow

@export var enemy : Enemy

var move_direction : Vector2

func enter():
	pass
	
func exit():
	pass
	
func handle_input(event):
	pass 
	
func update(_delta):
	pass
	
func physics_update(delta):
	var move_direction = (enemy.position - player.position)
	if move_direction.length() > enemy.max_follow_distance:
		Transitioned.emit(self, "idle")
	elif move_direction.length() > enemy.awareness_distance:
		enemy.velocity = move_direction.normalized() * enemy.speed
	else:
		Transitioned.emit(self, "idle")
	if move_direction.length() < enemy.attack_distance:
		Transitioned.emit(self, "attack")
		
		

