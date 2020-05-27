extends Control

signal boo

func _ready():
	Global.stats['tutorial'] +=1
	yield(get_tree().create_timer(5),"timeout")
	$FingerLabel.show()
	$AnimatedSprite.show()
	yield(get_tree().create_timer(5),"timeout")
	$Phone.show()
	$PhoneLabel.show()
	$PhoneAnim.play("Phone")
	yield(get_tree().create_timer(5),"timeout")
	$EndLabel.show()
	$NinePatchRect.show()
	$EndAnim.play("End")
	yield(get_tree().create_timer(5),"timeout")
	$SliderLabel.show()
	yield(get_tree().create_timer(5),"timeout")
	$BarLabel.show()
	yield(get_tree().create_timer(5),"timeout")
	$FinalLabel.show()
	$Button.show()
	$Button.disabled = false

func _on_Button_pressed():
	emit_signal('boo')
	queue_free()
