extends AnimatedSprite


func _ready():
	play()

func _on_AnimatedSprite_animation_finished():
	play('default')
