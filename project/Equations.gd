extends Node2D

@onready var ligning = $Ligningen
@onready var player = $"../Player"

var speed : int = 50
var db : SQLite
var rng = RandomNumberGenerator.new()
var score = storage.Score
var RandomEquation
var RandomEquationAnswer
# Called when the node enters the scene tree for the first time.
func _ready():
	db = SQLite.new()
	db.path="user://Database.db"
	db.open_db()
	
	if int(score) <= 2500:
		var Type1Equations : Array = db.select_rows("Equations", "EquationType = 1", ["Equation"])
		var RNGNumberEquationType1 = rng.randf_range(0, Type1Equations.size())
		RandomEquation = Type1Equations[RNGNumberEquationType1]
		
		var Type1EquationsAnswer = db.select_rows("Equations", "EquationType = 1", ["Answer"])
		RandomEquationAnswer = Type1EquationsAnswer[RNGNumberEquationType1]
		storage.ActiveAnswer.append(RandomEquationAnswer)

	elif int(score) > 2500 && int(score) <= 5000:
		var Type2Equations : Array = db.select_rows("Equations", "EquationType = 2", ["Equation"])
		var RNGNumberEquationType2 = rng.randf_range(0, Type2Equations.size())
		RandomEquation = Type2Equations[RNGNumberEquationType2]
		
		var Type2EquationsAnswer = db.select_rows("Equations", "EquationType = 2", ["Answer"])
		RandomEquationAnswer = Type2EquationsAnswer[RNGNumberEquationType2]
		storage.ActiveAnswer.append(RandomEquationAnswer)
		
	elif int(score) >= 5000:
		var Type3Equations : Array = db.select_rows("Equations", "EquationType > 2", ["Equation"])
		var RNGNumberEquationType3 = rng.randf_range(0, Type3Equations.size())
		RandomEquation = Type3Equations[RNGNumberEquationType3]
		
		var Type3EquationsAnswer = db.select_rows("Equations", "EquationType > 2", ["Answer"])
		RandomEquationAnswer = Type3EquationsAnswer[RNGNumberEquationType3]
		storage.ActiveAnswer.append(RandomEquationAnswer)
		
	var StringEquation : String = RandomEquation["Equation"]
	$Equation.text = StringEquation
	db.close_db()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = (player.position - position).normalized()
	position += direction*speed*delta
	

func _on_hitbox_body_entered(body):
	if body.is_in_group("player") and body.has_method("take_damage"):
		body.take_damage()
		storage.ActiveAnswer.erase(RandomEquationAnswer)
		storage.ActiveEquation.erase(self)
		queue_free()
		
