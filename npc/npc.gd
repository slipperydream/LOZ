extends CharacterBody2D

class_name NPC

signal died
signal hit

@export var speed : int = 15
@export var move_direction : Vector2 = Vector2.ZERO
@export var max_follow_distance : int = 50
@export var awareness_distance : int = 30
@export var attack_distance : int = 5
@export var sprite_sheet : Texture2D
@export var hframes : int = 4
@export var vframes : int = 7

@onready var health = $HealthComponent
@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer
@onready var player = get_tree().get_first_node_in_group("player")
@onready var screen_size : Vector2 = get_viewport_rect().size

func _ready():
	if sprite_sheet:
		sprite.texture = sprite_sheet
	sprite.hframes = hframes
	sprite.vframes = vframes
	

func _physics_process(delta):
	global_position.x = clamp(global_position.x, 16, screen_size.x-16)
	global_position.y = clamp(global_position.y, 16, screen_size.y-16)
	move_and_slide()
		

func _on_health_component_killed(_source):
	emit_signal("died")

func _on_health_component_hit():
	if health.invulnerable:
		return
	else:
		# play damage animation
		pass



