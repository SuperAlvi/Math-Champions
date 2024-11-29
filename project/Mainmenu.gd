extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Maingame.tscn")


func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Tutorial.tscn")


func _on_inventar_pressed():
	get_tree().change_scene_to_file("res://Inventory.tscn")


func _on_leaderboard_pressed():
	get_tree().change_scene_to_file("res://Leaderboard.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_log_out_pressed():
	storage.Username = ""
	storage.Highscore = 0
	get_tree().change_scene_to_file("res://Login.tscn")
