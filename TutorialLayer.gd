extends CanvasLayer

signal press
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


	


func _on_Tutorial_boo():
	connect('press',get_parent(),'lets_go')
	emit_signal("press")
