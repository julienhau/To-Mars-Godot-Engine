extends Control
var flamenose = preload('res://rocket assets/graphics/rocket/flame nose.png')
var finnose = preload('res://rocket assets/graphics/rocket/fin nose.png')
var drillnose = preload('res://rocket assets/graphics/rocket/drill nose.png')
var forcenose = preload('res://rocket assets/graphics/rocket/force nose.png')
var platedhull = preload('res://rocket assets/graphics/rocket/plated hull.png')
var steelhull = preload('res://rocket assets/graphics/rocket/Steel hull.png')
var carbonhull = preload('res://rocket assets/graphics/rocket/carbon hull.png')
var goldhull = preload('res://rocket assets/graphics/rocket/gold hull.png')
var doubleengine = preload('res://rocket assets/graphics/rocket/double engine.png')
var bigengine = preload('res://rocket assets/graphics/rocket/big engine.png')
var doublebig = preload('res://rocket assets/graphics/rocket/big double engine.png')
var finalengine = preload('res://rocket assets/graphics/rocket/final engine.png')

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.current_animation = 'New Anim'
	
	if Global.stats['max_speed'] == 200:
		$Player/Nose.set_texture(flamenose)
	if Global.stats['max_speed'] == 250:
		$Player/Nose.set_texture(finnose)
	if Global.stats['max_speed'] == 300:
		$Player/Nose.set_texture(drillnose)
	if Global.stats['max_speed'] == 400:
		$Player/Nose.set_texture(forcenose)
		
	
	if Global.stats['max_health'] == 100:
		$Player/Hull.set_texture(platedhull)
	if Global.stats['max_health'] == 300:
		$Player/Hull.set_texture(steelhull)
	if Global.stats['max_health'] == 500:
		$Player/Hull.set_texture(carbonhull)
	if Global.stats['max_health'] == 1000:
		$Player/Hull.set_texture(goldhull)
		
	if Global.stats['acceleration'] == 70:
		$Player/Engine.set_texture(doubleengine)
	if Global.stats['acceleration'] == 100:
		$Player/Engine.set_texture(bigengine)
	if Global.stats['acceleration'] == 200:
		$Player/Engine.set_texture(doublebig)
	if Global.stats['acceleration'] == 500:
		$Player/Engine.set_texture(finalengine)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$Label2.show()
	$Line.show()
	$Label.show()
	$ColorRect2.show()
	$Player/Sprite.hide()
	$Button.show()
	$Button.disabled=false


func _on_Button_pressed():
	get_tree().change_scene("res://TitleScreen.tscn")
