extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (NodePath) var anim_ghost

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node(anim_ghost).play_backwards("fade")
