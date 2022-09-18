extends KinematicBody2D

var nos = Vector2()
var lab = 50

func _process(delta):
	nos =move_and_slide(nos,Vector2.UP)
	pass

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		nos.x = 10000 * delta
	
	elif Input.is_action_pressed("ui_left"):
		nos.x = -10000 * delta
	else:
		nos.x =0
	
	if Input.is_action_pressed("ui_down"):
		nos.y = 10000 * delta
	
	elif Input.is_action_pressed("ui_up"):
		nos.y = -10000 * delta
	else:
		nos.y = 0
	
	pass




func _on_Area2D_area_entered(area):
	if area.is_in_group("boo"):
		lab -= 1
	get_node("Area2D/CanvasLayer/Label").text = str(lab)
	if lab == 0:
		queue_free()
	pass # Replace with function body.
