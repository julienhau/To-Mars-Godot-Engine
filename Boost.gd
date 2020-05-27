extends Area2D

func _ready():
	add_user_signal('boos')

func _process(delta):
	if Global.stats['acceleration']==1000 and Global.stats['max_speed']==1000:
		monitoring = false
	else:
		monitoring = true


func _on_Boost_body_entered(body):
	hide()
	var prev_acc = Global.stats['acceleration']
	var prev_spd = Global.stats['max_speed']
	Global.stats['acceleration']=1000
	Global.stats['max_speed']=1000
	yield(get_tree().create_timer(2),"timeout")
	Global.stats['acceleration']=prev_acc
	Global.stats['max_speed']=prev_spd
	Global.vol_stats['boosts'] +=1
	queue_free()
	
