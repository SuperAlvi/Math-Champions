extends Control

var db: SQLite

var tableName : String = "Accounts"

func _ready():
	db = SQLite.new()
	db.path="user://Database.db"

func _on_opret_pressed():
	db.open_db()
	var dict : Dictionary = Dictionary()
	dict["Username"] = $Username.text
	dict["Password"] = $Password.text
	dict["Highscore"] = 0
	dict["Skin"] = "🦠"
	
	db.query_with_bindings("SELECT Username FROM Accounts WHERE Username = ?;", [$Username.text])
	var user = db.query_result
	
	if $Password.text == $ConfirmPassword.text and !user and $Username.text != "":
		db.insert_row(tableName, dict)
		get_tree().change_scene_to_file("res://Login.tscn")
	elif user:
		$SystemMessage.text = "Username is already taken"
		$Username.text = ""
	else:
		$SystemMessage.text = "You did not insert the same passwords"
		$Password.text = ""
		print("You did not insert the same password twice")
	db.close_db()
