extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if int(storage.Score) > storage.Highscore:
		$ScoreReached.text = "YOU GOT A NEW HIGHSCORE OF " + storage.Score 
		storage.Highscore = int(storage.Score)
	else:
		$ScoreReached.text = "Score: " + storage.Score



func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Mainmenu.tscn")

func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://Maingame.tscn")
