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
func _process(delta):
	if Global.stats['acceleration'] == 70:
		$ColorRect/PriceLabel.text ='2000 coins'
		$ColorRect/Description.text = 'Why have one engine when you can have two?\n This upgrade moderately increases your acceleration.\n\nacceleration:70'
		$ColorRect/Title.text = 'double engine'
	if Global.stats['acceleration'] == 100:
		$ColorRect/PriceLabel.text ='4000 coins'
		$ColorRect/Description.text = 'Replaced the two small engines with  huge booster.\nWith marvelous engineering and rocket science comes immense power\n\nacceleration:100'
		$ColorRect/Title.text = 'Turbo Booster'
	if Global.stats['acceleration'] == 200:
		$ColorRect/PriceLabel.text ='10000 coins'
		$ColorRect/Description.text = 'Added even more engines.\nWe were too concerned to know if we could, that we did not consider if we should.\n\nacceleration: 200'
		$ColorRect/Title.text = 'triple booster'
	if Global.stats['acceleration'] == 500:
		$ColorRect/PriceLabel.text ='maxed'
		$ColorRect/Description.text = 'State-of-the-art technology in rocket engines.\nDubbed the inferno, this beast melts the of the launching pad to travel through space and beyond.\n\nacceleration: 500'
		$ColorRect/Title.text = 'Inferno'

func _on_UpgradeButton_pressed():
	if Global.stats['acceleration'] == 50:
		if Global.stats['coins']>350:
			Global.stats['acceleration'] = 70
			Global.stats['coins'] -=350
	elif Global.stats['acceleration'] == 70:
		if Global.stats['coins']>2000:
			Global.stats['acceleration'] = 100
			Global.stats['coins'] -=2000
	elif Global.stats['acceleration'] == 100:
		if Global.stats['coins']>4000:
			Global.stats['acceleration'] = 200
			Global.stats['coins'] -=4000
	elif Global.stats['acceleration'] == 200:
		if Global.stats['coins']>10000:
			Global.stats['acceleration'] = 500
			Global.stats['coins'] -=10000
