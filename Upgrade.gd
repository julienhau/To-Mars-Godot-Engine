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
var kerosene = preload('res://rocket assets/graphics/rocket/download-removebg-preview.png')
var nitro = preload('res://rocket assets/graphics/rocket/nitro.png')
var nuclear = preload('res://rocket assets/graphics/rocket/nuclear.png')
var solar = preload('res://rocket assets/graphics/rocket/solar.png')

export (PackedScene) var NoseUpgrades 
export (PackedScene) var HullUpgrades 
export (PackedScene) var EngineUpgrades
export (PackedScene) var FuelUpgrades
var active_scene

func _ready():
	active_scene = NoseUpgrades.instance()
#	if GlobalAudioStreamPlayer.playing == false:
#		GlobalAudioStreamPlayer.playing = true

func _process(delta):
	if Global.stats['max_speed'] == 200:
		$RocketParts/Nose.set_texture(flamenose)
	if Global.stats['max_speed'] == 250:
		$RocketParts/Nose.set_texture(finnose)
	if Global.stats['max_speed'] == 300:
		$RocketParts/Nose.set_texture(drillnose)
	if Global.stats['max_speed'] == 400:
		$RocketParts/Nose.set_texture(forcenose)
	
	if Global.stats['max_health'] == 100:
		$RocketParts/Hull.set_texture(platedhull)
	if Global.stats['max_health'] == 300:
		$RocketParts/Hull.set_texture(steelhull)
	if Global.stats['max_health'] == 500:
		$RocketParts/Hull.set_texture(carbonhull)
	if Global.stats['max_health'] == 1000:
		$RocketParts/Hull.set_texture(goldhull)
		
	if Global.stats['acceleration'] == 70:
		$RocketParts/Engine.set_texture(doubleengine)
	if Global.stats['acceleration'] == 100:
		$RocketParts/Engine.set_texture(bigengine)
	if Global.stats['acceleration'] == 200:
		$RocketParts/Engine.set_texture(doublebig)
	if Global.stats['acceleration'] == 500:
		$RocketParts/Engine.set_texture(finalengine)
	
	if Global.stats['Fuel']==30:
		$RocketParts/Fuel.set_texture(kerosene)
	if Global.stats['Fuel']==50:
		$RocketParts/Fuel.set_texture(nitro)
	if Global.stats['Fuel']==60:
		$RocketParts/Fuel.set_texture(nuclear)
	if Global.stats['Fuel']==80:
		$RocketParts/Fuel.set_texture(solar)

func _on_NoseButton_pressed():
	active_scene.queue_free()
	active_scene = NoseUpgrades.instance()
	add_child(active_scene)
	active_scene.rect_position = Vector2()
	
	
	
func _on_HullButton_pressed():
	active_scene.queue_free()
	active_scene = HullUpgrades.instance()
	add_child(active_scene)
	active_scene.rect_position = Vector2()


func _on_EngineButton_pressed():
	active_scene.queue_free()
	active_scene = EngineUpgrades.instance()
	add_child(active_scene)
	active_scene.rect_position = Vector2()


func _on_ContinueButton_pressed():
	#get_tree().change_scene("res://Main.tscn")
	$UpgradeCamera.current = false
	get_node('../Player/Camera2D').current = true
	GlobalAudioStreamPlayer.playing = false
	get_node('../CanvasLayer/HUD/TextureProgress').max_value = Global.stats['max_health']
	get_node('../CanvasLayer/HUD/FuelBar').set_process(false)
	get_node('../CanvasLayer/HUD/FuelBar').value=Global.stats['Fuel']
	get_node('../CanvasLayer/HUD').show()
	get_parent().continue_game()
	


func _on_FuelButton_pressed():
	active_scene.queue_free()
	active_scene = FuelUpgrades.instance()
	add_child(active_scene)
	active_scene.rect_position = Vector2()


func _on_Button_pressed():
	#get_tree().change_scene("res://Options.tscn")
	$UpgradeCamera.current = false
	get_node('../Options/OptionsCamera').current = true
