extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Global.stats['max_health'] == 100:
		$ColorRect/PriceLabel.text = '2000 coins'
		$ColorRect/Description.text = 'Reinforced the overall structure with steel plates.\nIn theory, it should add some strength\n\nDamage reduction: 70'
		$ColorRect/Title.text = 'steel plated hull'
	if Global.stats['max_health'] == 300:
		$ColorRect/PriceLabel.text = '4000 coins'
		$ColorRect/Description.text = 'Made the entire hull out of steel.\nProvides much more resistance against impacts. Should withstand airplane collisions.\n\nDamage reduction: 250'
		$ColorRect/Title.text = 'steel hull'
	if Global.stats['max_health'] == 500:
		$ColorRect/PriceLabel.text = '10000 coins'
		$ColorRect/Description.text = 'The future of space travel, today!\nThis hull made of carbon nanotube can withstand any type of collisions, while being very light.\n\ndamage reduction: 500'
		$ColorRect/Title.text = 'carbon nanotube hull'
	if Global.stats['max_health'] == 1000:
		$ColorRect/PriceLabel.text = 'maxed'
		$ColorRect/Description.text = 'The ultimate hull in all of its glory.\nIn theory, this should not be feasible. But it works!\n\nDamage reduction: 1000'
		$ColorRect/Title.text = 'Gold hull'

func _on_UpgradeButton_pressed():
	if Global.stats['max_health']==30:
		if Global.stats['coins'] > 350:
			Global.stats['max_health']=100
			Global.stats['coins'] -=350
	elif Global.stats['max_health']==100:
		if Global.stats['coins'] > 2000:
			Global.stats['max_health']=300
			Global.stats['coins'] -=2000
	elif Global.stats['max_health']==300:
		if Global.stats['coins'] > 4000:
			Global.stats['max_health']=500
			Global.stats['coins'] -=4000
	elif Global.stats['max_health']==500:
		if Global.stats['coins'] > 10000:
			Global.stats['max_health']=1000
			Global.stats['coins'] -=10000
