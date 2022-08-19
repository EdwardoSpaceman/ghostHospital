extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (NodePath) var ghost
# Called when the node enters the scene tree for the first time.
func _ready():
	self.play("wave")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade" and Global.level == 1:
		get_tree().change_scene("res://room1.tscn")
		Global.level  = 2
	if anim_name == "fade" and Global.level == 2:
		self.play("wave")
