extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



#func _ready():
#	text = 'Wallet: '+str(Global.stats['coins'])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ScoreBoard_visibility_changed():
	text = 'Wallet: '+str(Global.stats['coins'])
