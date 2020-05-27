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
	if Global.stats['Fuel'] == 30:
		$ColorRect/PriceLabel.text = '2000 coins'
		$ColorRect/Description.text = 'More refined than gasoline.\nThis extremely pure and volatile substance releases enormous amount of energy\n\nEnergy density: 20'
		$ColorRect/Title.text = 'kerosene'
	if Global.stats['Fuel'] == 50:
		$ColorRect/PriceLabel.text = '4000 coins'
		$ColorRect/Description.text = 'Did somebody say explosion?\nThis unstable fuel can ignite spontaneously just by touching it. Explosive power guaranteed\n\nenergy density: 50'
		$ColorRect/Title.text = 'nitroglycerine'
	if Global.stats['Fuel'] == 60:
		$ColorRect/PriceLabel.text = '10000 coins'
		$ColorRect/Description.text = 'This is probably not a good idea.\nPacked with the power of a tactical nuke, this could destroy an entire city!\n\nEnergy density: 100'
		$ColorRect/Title.text = 'nuclear power'
	if Global.stats['Fuel'] == 80:
		$ColorRect/PriceLabel.text = 'maxed'
		$ColorRect/Description.text = 'the literal sun in fuel form.\nengineerss were too preoccupied if they could, that they did not consider if they should.\n\nenergy density: 150'
		$ColorRect/Title.text = 'solar plasma'

func _on_UpgradeButton_pressed():
	if Global.stats['Fuel'] == 20:
		if Global.stats['coins'] > 350:
			Global.stats['Fuel'] = 30
			Global.stats['coins'] -= 350
	elif Global.stats['Fuel'] == 30:
		if Global.stats['coins'] > 2000:
			Global.stats['Fuel'] = 50
			Global.stats['coins'] -= 2000
	elif Global.stats['Fuel'] == 50:
		if Global.stats['coins'] > 4000:
			Global.stats['Fuel'] = 60
			Global.stats['coins'] -= 4000
	elif Global.stats['Fuel'] == 60:
		if Global.stats['coins'] > 10000:
			Global.stats['Fuel'] = 80
			Global.stats['coins'] -= 10000
