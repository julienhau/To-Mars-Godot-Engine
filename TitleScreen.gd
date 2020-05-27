extends Control

var word = ''

func _ready():
	if Global.stats['music']==1:
		$TitleMusic.playing = true
	if Global.stats['music']==0:
		$TitleMusic.playing = false

func _on_NewGameButton_pressed():
	get_tree().change_scene("res://LoadingBar.tscn")



func _on_QuitButton_pressed():
	get_tree().quit()
	



func _on_LoadButton_pressed():
	Global.load()
	get_tree().change_scene("res://LoadingBar.tscn")


func _on_AboutButton_pressed():
	get_tree().change_scene("res://About.tscn")


func _on_T_pressed():
	word +='T'
	if word == 'SMART':
		get_tree().change_scene("res://EndlessMode.tscn")


func _on_O_pressed():
	word +='O'


func _on_M_pressed():
	word +='M'


func _on_A_pressed():
	word +='A'


func _on_R_pressed():
	word +='R'


func _on_S_pressed():
	word +='S'
	
