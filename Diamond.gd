extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_user_signal('dia')


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Diamond_body_entered(body):
	hide()
	if Global.stats['effect']==1:
		$CoinSound.playing=true
		yield(get_tree().create_timer(0.8),"timeout")
	Global.stats['coins']+=100
	Global.vol_stats['diamonds_collected']+=1
	queue_free()
