extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Global.stats['max_speed'] == 200:
		$Nose.set_texture(flamenose)
	if Global.stats['max_speed'] == 250:
		$Nose.set_texture(finnose)
	if Global.stats['max_speed'] == 300:
		$Nose.set_texture(drillnose)
	if Global.stats['max_speed'] == 400:
		$Nose.set_texture(forcenose)
		
	
	if Global.stats['max_health'] == 100:
		$Hull.set_texture(platedhull)
	if Global.stats['max_health'] == 300:
		$Hull.set_texture(steelhull)
	if Global.stats['max_health'] == 500:
		$Hull.set_texture(carbonhull)
	if Global.stats['max_health'] == 1000:
		$Hull.set_texture(goldhull)
		
	if Global.stats['acceleration'] == 70:
		$Engine.set_texture(doubleengine)
		$Sprite/basic.hide()
		$Sprite/double.show()
		$Sprite2/basic.hide()
		$Sprite2/double.show()
	if Global.stats['acceleration'] == 100:
		$Engine.set_texture(bigengine)
		$Sprite/double.hide()
		$Sprite/big.show()
		$Sprite2/double.hide()
		$Sprite2/big.show()
	if Global.stats['acceleration'] == 200:
		$Engine.set_texture(doublebig)
		$Sprite/big.hide()
		$Sprite/doublebig.show()
		$Sprite2/big.hide()
		$Sprite2/doublebig.show()
	if Global.stats['acceleration'] == 500:
		$Engine.set_texture(finalengine)
		$Sprite/doublebig.hide()
		$Sprite/final.show()
		$Sprite2/doublebig.hide()
		$Sprite2/final.show()
		

