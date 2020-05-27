extends Label


#func _ready():
#	text = 'SCORE BOARD \n\nScore: '+str(Global.vol_stats['score'])+'\nCoins collected: '+str(Global.vol_stats['coins_collected'])+'\nDiamonds collected: '+str(Global.vol_stats['diamonds_collected'])+'\nTotal gained: '+str(Global.vol_stats['score']+Global.vol_stats['coins_collected']*10+Global.vol_stats['diamonds_collected']*100)


func _on_ScoreBoard_visibility_changed():
	text = 'SCORE BOARD \n\nScore: '+str(Global.vol_stats['score'])+'\nCoins collected: '+str(Global.vol_stats['coins_collected'])+'\nDiamonds collected: '+str(Global.vol_stats['diamonds_collected'])+'\nTotal gained: '+str(Global.vol_stats['score']+Global.vol_stats['coins_collected']*10+Global.vol_stats['diamonds_collected']*100)
