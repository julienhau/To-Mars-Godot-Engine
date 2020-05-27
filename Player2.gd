extends KinematicBody2D


var velocity = Vector2()
var max_rotation = PI/3
var min_rotation = -PI/3
var speed = 200
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("New Anim")
	set_physics_process(false)
	Global.stats['health'] = 1000

func _physics_process(delta):
	print(speed)
	var acceleration = 5
	rotation = Input.get_accelerometer().x *(PI/24)
	if rotation >= max_rotation:
		rotation = max_rotation
	if rotation <= min_rotation:
		rotation = min_rotation
	if rotation < 0.6 *(PI/24) and rotation >-0.6* (PI/24):
		rotation = 0
	speed += acceleration* delta
	velocity = Vector2(0, -speed).rotated(rotation)

	if Global.stats['effect'] == 1:
		if $EngineSound.playing ==false:
			$EngineSound.playing = true
	
	velocity = move_and_slide(velocity)
	position.x = clamp(position.x, 25, 2023)
	if Global.stats['health']<=0:
		explode()
		set_physics_process(false)
	Global.vol_stats['score'] = int((1210-global_position.y))
	

func explode():
	$AnimatedSprite.show()
	$AnimatedSprite.play('default')
	$BoomSound.playing = true
	$Sprite.hide()
	$fire.hide()
	yield(get_tree().create_timer(3.46),'timeout')
	$BoomSound.playing = false
	$EngineSound.playing = false
	get_node('../CanvasLayer/Button').show()
	get_node('../CanvasLayer/Button').disabled = false
	get_node('../CanvasLayer/Exit').show()
	get_node('../CanvasLayer/Exit').disabled = false
	Global.save()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
