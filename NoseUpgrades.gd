extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Global.stats['max_speed']==200:
		$ColorRect/PriceLabel.text = '2000 coins'#price2
		$ColorRect/Description.text = 'Added cool flame designs.\nLogically, it should not have any impact on the performance, but it works.\n\nDrag reduction: 50\nstyle:100'
		$ColorRect/Title.text = 'Flaming nose'
	if Global.stats['max_speed']==250:
		$ColorRect/PriceLabel.text = '4000 coins'#price3
		$ColorRect/Description.text = 'Four small fins are added.\nintended to provide a more aerodynamic design, thus reducing drag.\n\nDrag reduction:100'
		$ColorRect/Title.text = 'Aerodynamic nose'
	if Global.stats['max_speed']==300:
		$ColorRect/PriceLabel.text = '10000 coins'#price4
		$ColorRect/Description.text = 'The nose was replaced by a drill.\nPierces through the air, the sky, and beyond. At least, that is the intended purpose.\n\nDrag reduction: 150'
		$ColorRect/Title.text = 'Drill nose'
	if Global.stats['max_speed']==400:
		$ColorRect/PriceLabel.text = 'maxed'
		$ColorRect/Description.text = 'A force field surrounds the nose.\nGives the ability that any collision has a random chance of not causing any damage.\n\nDrag reduction:250'
		$ColorRect/Title.text = 'Sci-fi nose'

func _on_UpgradeButton_pressed():
	if Global.stats['max_speed'] == 150:
		if Global.stats['coins'] > 350:#price1
			Global.stats['max_speed']=200
			Global.stats['coins'] -= 350#price1
	elif Global.stats['max_speed'] == 200:
		if Global.stats['coins'] >2000:#price2
			Global.stats['max_speed']=250
			Global.stats['coins'] -=2000#price2
	elif Global.stats['max_speed'] == 250:
		if Global.stats['coins'] >4000:#price3
			Global.stats['max_speed']=300
			Global.stats['coins'] -=4000#price3
	elif Global.stats['max_speed'] == 300:
		if Global.stats['coins'] >10000:#price4
			Global.stats['max_speed']=400
			Global.stats['coins'] -=10000#price4
