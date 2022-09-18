extends Area2D

var nos = Vector2.ZERO
var look_ves = Vector2.ZERO
var player = null
var speed = 5

func _ready():
	
	look_ves = player.position - global_position
	
	pass

func _physics_process(delta):
	
	nos = Vector2.ZERO
	nos = nos.move_toward(look_ves, delta)
	nos = nos.normalized()* speed
	position += nos
	
	pass


func _on_boo_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
	pass # Replace with function body.
