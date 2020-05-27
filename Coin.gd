extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2(rand_range(-10,10),rand_range(-10,10))


func _on_Coin_body_entered(body):
	hide()
	if Global.stats['effect']==1:
		$CoinSound.playing=true
		yield(get_tree().create_timer(0.8),"timeout")
	queue_free()
	Global.stats['coins'] += 10
	Global.vol_stats['coins_collected'] += 1
	
