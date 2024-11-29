extends Node2D

var Username : String
var Score : String
var ActiveEquation : Array
var ActiveAnswer : Array
var Highscore : int
var PlayerHealth : int
var Skind : Array

func _ready():
	Username = storage.Username
	Score = storage.Score
	ActiveEquation = storage.ActiveEquation
	ActiveAnswer = storage.ActiveAnswer
	Highscore = storage.Highscore
	PlayerHealth = storage.PlayerHealth
	Skind = storage.Skind
