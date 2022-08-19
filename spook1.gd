extends KinematicBody

var direction = Vector3.ZERO
export (NodePath) var graphics
var rotating = false
var mouse_pos = Vector2.ZERO
export (NodePath) var Cam
export (NodePath) var Door1
var at_door1 = "not"
export (NodePath) var anim_ghost

func _process(delta):

	if Input.is_action_pressed("ui_right"):
		direction.z -=1
		get_node(graphics).rotation_degrees.y -=10
		if get_node(graphics).rotation_degrees.y <0:
			get_node(graphics).rotation_degrees.y = 0
	if Input.is_action_pressed("ui_left"):
		direction.z +=1
		get_node(graphics).rotation_degrees.y +=10
		if get_node(graphics).rotation_degrees.y > 180:
			get_node(graphics).rotation_degrees.y = 180
			
	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		direction.z = 0

	move_and_slide(direction,Vector3.UP)
	if Input.is_action_just_released("ui_up") and at_door1 == "yes":
		print("the door opens!")
		get_node(anim_ghost).play("fade")
func _on_door1_mouse_entered():
	print("door1")
	get_node(Door1).play("open")
	at_door1 = "yes"


func _on_door1_mouse_exited():
	print("door1")
	get_node(Door1).play("close")
	at_door1 = "not"


func _on_door1_body_entered(body):
	if body == self and at_door1 == "yes":
		print("go inside door1")
		
