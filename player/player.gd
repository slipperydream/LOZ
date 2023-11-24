extends CharacterBody2D

class_name Playerd

signal died
signal hit

@export var speed : int = 50

@onready var health = $HealthComponent
@onready var sprite = $Sprite2D
@onready var animation = $AnimationPlayer
@onready var screen_size : Vector2 = get_viewport_rect().size

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()

func _on_health_component_killed(_source):
	emit_signal("died")

func _on_health_component_hit():
	if health.invulnerable:
		return
	else:
		scale.x *= 0.33

func _on_pickup_area_entered(area):
#	if area is Item:
#		$AnimationPlayer.play("pickup")
	pass

