extends Control

var queue = preload("res://resource_queue.gd").new()
func update_percent(new_percent):
	$Tween.interpolate_property($ProgressBar,'value',$ProgressBar.value, new_percent,0)
	$Tween.start()
	
	


# Called when the node enters the scene tree for the first time.
func _ready():
	queue.start()
	queue.queue_resource("res://Main.tscn",true)

func _process(delta):
#	if queue.is_ready("res://Main.tscn"):
#		var scene=queue.get_resource("res://Main.tscn").instance()
#		get_node("/root").add_child(scene)
#		yield(get_tree().create_timer(5),"timeout")
#		queue_free()
#	else:
	var progress = queue.get_progress("res://Main.tscn")
	print(progress)
	update_percent(progress*100)
	if progress == 1:
		set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tween_tween_all_completed():
	if queue.is_ready("res://Main.tscn"):
		var scene=queue.get_resource("res://Main.tscn").instance()
		get_node("/root").add_child(scene)
		queue_free()
		
