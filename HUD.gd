extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_start():
	$FuelBar.max_value = Global.stats['Fuel']
	$FuelBar.value = $FuelBar.max_value
	$FuelBar.set_process(true)
	
func _process(delta):
	$VSlider.value = int(1200 - get_node('../../Player').global_position.y)
	
