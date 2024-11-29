extends Node2D

var Equation = preload("res://Equations.tscn")
var db : SQLite
var rng = RandomNumberGenerator.new()

func _ready():
	db = SQLite.new()
	db.path="user://Database.db"
	storage.Score = "0"
	$Scores.text = "Score: " + storage.Score + "\n" + "Highscore: " + str(storage.Highscore)

func _input(event):
	if event.is_action_pressed("Enter"):
		for n in range(storage.ActiveEquation.size()):
			var Answer : String = $AnswerInput.text.strip_edges()
			var Comparison : String = storage.ActiveAnswer[n]["Answer"].strip_edges()
			if Answer == Comparison:
				$CorrectSound.play()
				storage.ActiveEquation[n].queue_free()
				storage.ActiveAnswer.erase(storage.ActiveAnswer[n])
				storage.ActiveEquation.erase(storage.ActiveEquation[n])
				$AnswerInput.text = ""
				storage.Score = str(int(storage.Score) + 100)
				$Scores.text = "Score: " + storage.Score + "\n" + "Highscore: " + str(storage.Highscore)
				break
			elif n == storage.ActiveEquation.size()-1:
				$AnswerInput.text = ""
				$IncorrectSound.play()


func _on_spawn_timer_timeout():
	var EquationSpawn = Equation.instantiate()
	get_node("Player/Path2D/PathFollow2D").progress_ratio = randf()
	EquationSpawn.global_position = get_node("Player/Path2D/PathFollow2D").global_position
	add_child(EquationSpawn)
	storage.ActiveEquation.append(EquationSpawn)


func _on_quit_pressed():
	storage.Score = "0"
	get_tree().change_scene_to_file("res://Mainmenu.tscn")
