extends KinematicBody2D

onready var booted = preload("res://boo.tscn")

var player = null
var nos = Vector2.ZERO
var speed = 200

func _process(delta):
	nos = move_and_slide(nos)
	pass

func _physics_process(delta):
	nos = Vector2.ZERO
	
	if player != null:
		nos = position.direction_to(player.position) * speed
	else:
		nos = Vector2.ZERO
	pass

func _on_Area2D_body_entered(body):
	if body != self:
		player = body
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	player = null
	pass # Replace with function body.

func fire():
	var boloted = booted.instance()
	boloted.position = get_global_position()
	boloted.player = player
	get_parent().add_child(boloted)
	$Timer.set_wait_time(1)
	pass

func _on_Timer_timeout():
	if player != null:
		fire()
	pass # Replace with function body.
