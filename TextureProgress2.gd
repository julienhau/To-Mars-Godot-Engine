extends TextureProgress

func _ready():
	max_value = Global.stats['Fuel']
	value = max_value
	set_process(false)

func _process(delta):
	value = get_node('../../../Player/Fuel').time_left
