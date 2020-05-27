extends Node2D

signal new
export (PackedScene) var Asteroid
export (PackedScene) var BigAsteroid
export (PackedScene) var Satellite
var playerpos = 1280


func _process(delta):
	if $Space2.position.y<$Space1.position.y:
		if $Player2.position.y <= $Space2.position.y:
			$Space1.position.y -= 3392*2
	if $Space1.position.y<$Space2.position.y:
		if $Player2.position.y <= $Space1.position.y:
			$Space2.position.y -= 3392*2
			
	if $Player2.position.y < playerpos:
		spawn_things(playerpos-3000)
		playerpos -=3000
	$CanvasLayer/Score.text = 'score: '+str(Global.vol_stats['score'])+'\nhighscore: '+str(Global.stats['highscore'])
	if Global.vol_stats['score'] > Global.stats['highscore']:
		Global.stats['highscore'] = Global.vol_stats['score']
	$CanvasLayer/Health.value = Global.stats['health']
func spawn_things(y):
	for i in range(30):
		var obstacle = [Asteroid,Satellite,BigAsteroid][randi() % 3].instance()
		add_child(obstacle)
		obstacle.position = Vector2(rand_range(0,2048),rand_range(y,y-3000))
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.load()
	
func new_game():
	emit_signal("new")
	$CanvasLayer/Button.disabled = true
	$CanvasLayer/Button.hide()
	$CanvasLayer/Exit.hide()
	$CanvasLayer/Exit.disabled = true
	$Space1.position = Vector2(1020,-2000)
	$Space2.position = Vector2(1020,-5392)
	playerpos=1280
	Global.stats['score']=0
	Global.stats['health']=1000
	$Player2.set_physics_process(true)
	$Player2.position = Vector2(1024,1208)
	$Player2/Sprite.show()
	$Player2/fire.show()
	$Player2/AnimatedSprite.playing = false
	$Player2/AnimatedSprite.hide()
	$Player2/AnimatedSprite.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_pressed():
	new_game()


func _on_Button2_pressed():
	$CanvasLayer/Button2.hide()
	$CanvasLayer/Button2.disabled = true
	$CanvasLayer/Tutorial.hide()
	$CanvasLayer/Label.hide()
	new_game()


func _on_Exit_pressed():
	get_tree().change_scene("res://TitleScreen.tscn")
