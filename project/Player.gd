extends StaticBody2D

var health = 5
var db : SQLite
signal damage_taken(value)

func _ready():
	storage.PlayerHealth = health
	db = SQLite.new()
	db.path="user://Database.db"
	db.open_db()
	var PlayerSkin : Array = db.select_rows("Accounts", "Username = '" + storage.Username + "'", ["Skin"])
	var PSkin = PlayerSkin[0]["Skin"]
	$PlayerSkin.text = PSkin
	db.close_db()
	
	

func take_damage():
	db.open_db()
	storage.PlayerHealth -= 1
	health = storage.PlayerHealth
	$TakeDamageSound.play()
	emit_signal("damage_taken", health)
	print(storage.PlayerHealth)
	if storage.PlayerHealth <= 0:
		if storage.Highscore < int(storage.Score):
			db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Highscore" : int(storage.Score)} )
			db.query_with_bindings("SELECT Username FROM Leaderboard WHERE Username = ?;", [storage.Username])
			var user = db.query_result
			if user:
				db.update_rows("Leaderboard", "Username = '" + storage.Username + "'", {"Highscore" : int(storage.Score)})
				db.query("SELECT Username, Highscore FROM Leaderboard ORDER BY Highscore DESC;")
				db.close_db()
				get_tree().change_scene_to_file("res://Gameover.tscn")
			elif !user:
				db.insert_row("Leaderboard", {"Username" : storage.Username, "Highscore" : int(storage.Score)})
				db.query("SELECT Username, Highscore FROM Leaderboard ORDER BY Highscore DESC;")
				db.close_db()
				get_tree().change_scene_to_file("res://Gameover.tscn")
		else:
			db.close_db()
			get_tree().change_scene_to_file("res://Gameover.tscn")
			
