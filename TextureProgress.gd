extends TextureProgress

func _ready():
	max_value = Global.stats['max_health']

# Called when the node enters the scene tree for the first time.
func _process(delta):
	
	value = Global.stats['health']

