extends Control

var db: SQLite

var tableName = "Accounts"

func _ready():
	# must have file extension (.db) for the copy to work
	const DatabasePathRes = "res://Database.db"
	const DatabasePath = "user://Database.db"

# Check if file exists, move it to user path if not 
	if !FileAccess.file_exists(DatabasePath):
		var src_file = FileAccess.open(DatabasePathRes, FileAccess.READ)
		var dst_file = FileAccess.open(DatabasePath, FileAccess.WRITE)
		dst_file.store_buffer(src_file.get_buffer(src_file.get_length()))
		dst_file.close()
		src_file.close()

# connect to db 
	db = SQLite.new()
	db.path = DatabasePath
	db.open_db()

func _on_login_pressed():
	db.open_db()
	
	db.query_with_bindings("SELECT Username FROM Accounts WHERE Username = ?;", [$Panel/GridContainer/Username.text])
	var user = db.query_result
	db.query_with_bindings("SELECT Password FROM Accounts WHERE Password = ?;", [$Panel/GridContainer/Password.text])
	var code = db.query_result
	
	if user and code:
		storage.Username = $Panel/GridContainer/Username.text
		storage.Highscore = db.select_rows("Accounts", "Username = '" + storage.Username + "'", ["Highscore"])[0]["Highscore"]	
		get_tree().change_scene_to_file("res://Mainmenu.tscn")
	else:
		$Panel/GridContainer/Username.text = "Wrong password or username"

func _on_CreateAccount_pressed():
	get_tree().change_scene_to_file("res://CreateAccount.tscn")
