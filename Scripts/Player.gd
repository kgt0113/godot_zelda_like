extends CharacterBody2D


@onready var animations = $AnimationPlayer
@onready var blink_effect = $effect
@onready var hurt_box = $hurt_box
@onready var hurt_timer = $hurtTimer

@onready var current_health:int = max_health;
signal health_changed

@export var max_health: int = 3;
@export var speed : int = 55   

@export var knockback_power : int = 500

@export var inventory : Inventory

var is_hurt: bool = false

func _ready():
	blink_effect.play("RESET")

func handle_input():
	var move_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = move_direction * speed

func updateAnimation() :
	if velocity.length() == 0 :
		if animations.is_playing() :
			animations.stop()
	else :
		var direction = "down"
		if velocity.x < 0: direction = "left"
		elif velocity.x > 0 : direction = "right"
		elif velocity.y < 0 : direction = "up"
	
		animations.play("walk_" + direction)

func _physics_process(delta):
	handle_input()
	move_and_slide()
	updateAnimation()
	if !is_hurt :
		for area in hurt_box.get_overlapping_areas():
			if area.name == "hitbox":
				hurt_by_enemy(area)

func hurt_by_enemy(area):
	current_health -= 1
	if current_health < 0:
		current_health = max_health

	health_changed.emit(current_health)
	is_hurt = true
	knockback(area.get_parent().velocity)
	blink_effect.play("heart_blink")
	hurt_timer.start()
	await hurt_timer.timeout
	blink_effect.play("RESET")
	is_hurt = false

func _on_hurt_box_area_entered(area): 
	if area.has_method("collect"):
		area.collect(inventory)
		

func knockback(enemy_velocity: Vector2):
	var knoback_direction = (enemy_velocity - velocity).normalized() * knockback_power
	velocity = knoback_direction
	move_and_slide()

func _on_hurt_box_area_exited(area): pass
