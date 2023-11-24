extends State
class_name NPCIdle

@export var npc : NPC

var move_direction : Vector2 = Vector2.ZERO
var wander_time : float = 0

func enter():
	move_direction = npc.move_direction
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
		set_movement_animation()

func randomize_wander():
	randomize()
	move_direction = get_move_dir(move_direction)
	wander_time = randf_range(1.5,3)
	var speed_backup = npc.speed
	npc.speed = 0
	await get_tree().create_timer(0.5).timeout
	npc.speed = speed_backup	

func get_move_dir(dir):
	var rand_dir = randi_range(0,2)
	if dir == Vector2.LEFT:
		match rand_dir:
			0:
				return Vector2.RIGHT
			1:
				return Vector2.UP
			2:
				return Vector2.DOWN
	elif dir == Vector2.RIGHT:
		match rand_dir:
			0:
				return Vector2.LEFT
			1:
				return Vector2.UP
			2:
				return Vector2.DOWN
	elif dir == Vector2.DOWN:
		match rand_dir:
			0:
				return Vector2.LEFT
			1:
				return Vector2.RIGHT
			2:
				return Vector2.UP
	else:
		match rand_dir:
			0:
				return Vector2.LEFT
			1:
				return Vector2.RIGHT
			2:
				return Vector2.DOWN
		
func set_movement_animation():
	match move_direction:
		Vector2.LEFT:
			npc.animation.play("move_left")
		Vector2.RIGHT:
			npc.animation.play("move_right")
		Vector2.UP:
			npc.animation.play("move_up")
		Vector2.DOWN:
			npc.animation.play("move_down")
		Vector2.ZERO:
			npc.animation.play("idle")
		
