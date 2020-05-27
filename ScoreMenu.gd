extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NextButton_pressed():
	if Global.stats['music']==1:
		GlobalAudioStreamPlayer.playing = true
	$ScoreBoard.hide()
	$ScoreBoard/NextButton.disabled = true
	get_node('../MainMusic').playing = false
	get_node('../Player/Camera2D').current=false
	get_node('../Upgrade/UpgradeCamera').current = true
	
