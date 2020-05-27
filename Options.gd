extends Control



	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.stats['music'] ==0:
		$NinePatchRect/MusicButton.pressed = false
	if Global.stats['music'] ==1:
		$NinePatchRect/MusicButton.pressed = true
	if Global.stats['effect'] ==0:
		$NinePatchRect/EffectButton.pressed = false
	if Global.stats['effect'] ==1:
		$NinePatchRect/EffectButton.pressed = true
		
func _process(delta):
	if $NinePatchRect/MusicButton.pressed == false:
		Global.stats['music'] =0
	if $NinePatchRect/MusicButton.pressed == true:
		Global.stats['music']=1
	if $NinePatchRect/EffectButton.pressed == false:
		Global.stats['effect'] =0
	if $NinePatchRect/EffectButton.pressed == true:
		Global.stats['effect']=1

func _on_Button_pressed():
	#get_tree().change_scene("res://Upgrade.tscn")
	$OptionsCamera.current = false
	$GameSaved.hide()
	if Global.stats['music'] == 1:
		GlobalAudioStreamPlayer.playing = true
	if Global.stats['music'] == 0:
		GlobalAudioStreamPlayer.playing = false
	get_node('../Upgrade/UpgradeCamera').current=true




func _on_SaveButton_pressed():
	Global.save()
	$GameSaved.show()
	



func _on_MenuButton_pressed():
	GlobalAudioStreamPlayer.playing = false
	get_tree().change_scene("res://TitleScreen.tscn")
	get_parent().queue_free()
	
