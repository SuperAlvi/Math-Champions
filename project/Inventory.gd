extends Control

var db: SQLite

func _ready():
	db = SQLite.new()
	db.path="user://Database.db"
	db.open_db()
	$SkinRequirement.visible = false


func _on_tilbage_pressed():
	get_tree().change_scene_to_file("res://Mainmenu.tscn")


func _on_bakterie_pressed():
	db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🦠"} ) 
	$SkinRequirement.visible = true
	$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 0 points"

func _on_ant_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 1000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🐜"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 1.000 points"
	elif storage.Highscore < 1000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 1.000 points"

func _on_larve_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 2000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🐛"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 2.000 points"
	elif storage.Highscore < 2000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 2.000 points"

func _on_sommerfugl_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 3000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🦋"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 3.000 points"
	elif storage.Highscore < 3000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 3.000 points"

func _on_kylling_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 4000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🐤"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 4.000 points"
	elif storage.Highscore < 4000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 4.000 points"

func _on_due_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 5000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🕊"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 5.000 points"
	elif storage.Highscore < 5000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 5.000 points"

func _on_and_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 6000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🦆"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 6.000 points"
	elif storage.Highscore < 6000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 6.000 points"

func _on_pingvin_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 7000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🐧"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 7.000 points"
	elif storage.Highscore < 7000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 7.000 points"

func _on_abe_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 8000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🐒"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 8.000 points"
	elif storage.Highscore < 8000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 8.000 points"

func _on_gorilla_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 9000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🦍"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 9.000 points"
	elif storage.Highscore < 9000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 9.000 points"

func _on_ko_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 10000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🐄"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 10.000 points"
	elif storage.Highscore < 10000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 10.000 points"


func _on_næsehorn_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 25000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🦏"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 25.000 points"
	elif storage.Highscore < 25000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 25.000 points"

func _on_elefant_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 50000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🐘"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 50.000 points"
	elif storage.Highscore < 50000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 50.000 points"

func _on_hval_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 100000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🐋"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 100.000 points"
	elif storage.Highscore < 100000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 100.000 points"

func _on_t_rex_pressed():
	$SkinRequirement.visible = true
	if storage.Highscore >= 200000:
		db.update_rows("Accounts", "Username = '" + storage.Username + "'", {"Skin" : "🦖"} )
		$SkinRequirement/Requirement.text = "Skin Changed!\nRequirement: Highscore > 200.000 points"
	elif storage.Highscore < 200000:
		$SkinRequirement/Requirement.text = "Skin Locked!\nRequirement: Highscore > 200.000 points"
