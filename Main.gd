extends Node2D


export (PackedScene) var Tutorial
export (PackedScene) var Obstacle
export (PackedScene) var Bird
export (PackedScene) var Airplane
export (PackedScene) var Helicopter
export (PackedScene) var Satellite
export (PackedScene) var HugeAsteroid
export (PackedScene) var Asteroid
export (PackedScene) var BigAsteroid
export (PackedScene) var Coin
export (PackedScene) var Diamond
export (PackedScene) var Boost
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.stats['music']==1:
		$MainMusic.playing = true
	if Global.stats['music']==0:
		$MainMusic.playing = false
	new_game()
	
	
func new_game():
	randomize()
	spawn_things()
	$Player.position = Vector2(1030,1215)
	$Player.velocity = Vector2()
	$Player.rotation_degrees = 0
	$Player/AnimatedSprite.hide()
	$Player/AnimatedSprite.frame = 0
	$Player/PlayerSprite.show()
	Global.stats['health'] = Global.stats['max_health']
	$Player.set_physics_process(true)
	$Player.set_process(false)
	$Player/PlayerSprite/Sprite.hide()
	Global.vol_stats['coins_collected']=0
	Global.vol_stats['diamonds_collected']=0
	Global.vol_stats['score']=0
	if Global.stats['tutorial'] == 0:
		var tutorial = Tutorial.instance()
		add_child(tutorial)
		$Player.set_physics_process(false)

func lets_go():
	$Player.set_physics_process(true)
	
func continue_game():
	if Global.stats['music']==1:
		$MainMusic.playing = true
	if Global.stats['music']==0:
		$MainMusic.playing = false
	randomize()
	new_spawn_things()
	$Player.position = Vector2(1030,1215)
	$Player.velocity = Vector2()
	$Player.rotation_degrees = 0
	$Player/AnimatedSprite.hide()
	$Player/AnimatedSprite.stop()
	$Player/AnimatedSprite.frame = 0
	$Player/PlayerSprite.show()
	$Player/CollisionShape2D.disabled = false
	$Player.set_collision_layer_bit(1,true)
	Global.stats['health'] = Global.stats['max_health']
	$Player.set_physics_process(true)
	$Player.set_process(false)
	$Player/PlayerSprite/Sprite.hide()
	Global.vol_stats['coins_collected']=0
	Global.vol_stats['diamonds_collected']=0
	Global.vol_stats['score']=0
	Global.vol_stats['balloons'] = 0
	Global.vol_stats['birds'] =0
	Global.vol_stats['airplanes'] = 0
	Global.vol_stats['helicopters'] = 0
	Global.vol_stats['satellites'] = 0
	Global.vol_stats['boosts'] =0

	
	
func game_over():
	Global.save()
	$ScoreMenu/ScoreBoard.show()
	$ScoreMenu/ScoreBoard/NextButton.disabled = false
	$CanvasLayer/HUD.hide()
	
	
func spawn_things():
	for i in range(300):
		var obstacle = Obstacle.instance()
		add_child(obstacle)
		obstacle.position = Vector2(rand_range(0,2048), rand_range(700, -1500))
	for i in range(50):
		var coin = Coin.instance()
		add_child(coin)
		coin.position = Vector2(rand_range(0,2048), rand_range(700, -3000))
	for i in range(30):
		var diamond = Diamond.instance()
		add_child(diamond)
		diamond.position = Vector2(rand_range(0,2048), rand_range(-3000,-15000 ))
	for i in range(80):
		var bird = Bird.instance()
		add_child(bird)
		bird.position = Vector2(rand_range(10,2038), rand_range(-1500,-3000))
	for i in range(30):
		var airplane = Airplane.instance()
		add_child(airplane)
		airplane.position = Vector2(rand_range(10,2038), rand_range(-3000,-5000))
	for i in range(30):
		var helicopter = Helicopter.instance()
		add_child(helicopter)
		helicopter.position = Vector2(rand_range(10,2038), rand_range(-3000,-5000))
	for i in range(120):
		var satellite = Satellite.instance()
		add_child(satellite)
		satellite.position= Vector2(rand_range(10,2038), rand_range(-5500,-10000))
	for i in range(200):
		var asteroid = Asteroid.instance()
		add_child(asteroid)
		asteroid.position = Vector2(rand_range(0,2048), rand_range(-10000, -15000))
	for i in range(70):
		var bigasteroid = BigAsteroid.instance()
		add_child(bigasteroid)
		bigasteroid.position = Vector2(rand_range(0,2048), rand_range(-15000, -20000))
	for i in range(18):
		var boost = Boost.instance()
		add_child(boost)
		boost.position = Vector2(rand_range(0,2048), rand_range(700, -25000))
	for i in range(40):
		var hugeasteroid = HugeAsteroid.instance()
		add_child(hugeasteroid)
		hugeasteroid.position =Vector2(rand_range(0,2048), rand_range(-20000, -25000))

func new_spawn_things():
	for i in range(Global.vol_stats['balloons']):
		var obstacle = Obstacle.instance()
		add_child(obstacle)
		obstacle.position = Vector2(rand_range(0,2048), rand_range(700, -1500))
	for i in range(Global.vol_stats['coins_collected']):
		var coin = Coin.instance()
		add_child(coin)
		coin.position = Vector2(rand_range(0,2048), rand_range(700, -3000))
	for i in range(Global.vol_stats['diamonds_collected']):
		var diamond = Diamond.instance()
		add_child(diamond)
		diamond.position = Vector2(rand_range(0,2048), rand_range(-3000,-15000 ))
	for i in range(Global.vol_stats['birds']):
		var bird = Bird.instance()
		add_child(bird)
		bird.position = Vector2(rand_range(10,2038), rand_range(-1500,-3000))
	for i in range(Global.vol_stats['airplanes']):
		var airplane = Airplane.instance()
		add_child(airplane)
		airplane.position = Vector2(rand_range(10,2038), rand_range(-3000,-5000))
	for i in range(Global.vol_stats['helicopters']):
		var helicopter = Helicopter.instance()
		add_child(helicopter)
		helicopter.position = Vector2(rand_range(10,2038), rand_range(-3000,-5000))
	for i in range(Global.vol_stats['satellites']):
		var satellite = Satellite.instance()
		add_child(satellite)
		satellite.position= Vector2(rand_range(10,2038), rand_range(-5500,-10000))
	for child in get_children():
		if child.has_user_signal('ast'):
			child.position = Vector2(rand_range(0,2048), rand_range(-10000, -15000))
	for child in get_children():
		if child.has_user_signal('big'):
			child.position = Vector2(rand_range(0,2048), rand_range(-15000, -20000))
	for i in range(Global.vol_stats['boosts']):
		var boost = Boost.instance()
		add_child(boost)
		boost.position = Vector2(rand_range(0,2048), rand_range(700, -25000))
	for child in get_children():
		if child.has_user_signal('hug'):
			child.position =Vector2(rand_range(0,2048), rand_range(-20000, -25000))
	for child in get_children():
		if child.has_user_signal('dia'):
			child.position =Vector2(rand_range(0,2048), rand_range(-3000,-15000))
	for child in get_children():
		if child.has_user_signal('boos'):
			child.position =Vector2(rand_range(0,2048), rand_range(700, -25000))

func _process(delta):
	if $Player.global_position.y < -25000:
		ending()

func ending():
	get_tree().change_scene('res://Ending.tscn')
	queue_free()



