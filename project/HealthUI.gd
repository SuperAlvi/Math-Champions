extends CanvasLayer

var hearts = 5
var maxHearts = 5
@onready var player = get_parent().get_node("Player")
@onready var healthEmpty = $HealthUIEmpty
@onready var healthFull = $HealthUIFull

func _ready():
	if player != null:
		player.damage_taken.connect(change_texture)
	storage.PlayerHealth = 5
	hearts = storage.PlayerHealth

func change_texture(value):
	hearts = value
	if hearts >= 0:
		if hearts <= maxHearts:
			healthFull.size.x = hearts * 64
