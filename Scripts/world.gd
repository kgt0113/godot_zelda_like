extends Node2D

@onready var heart_container = $CanvasLayer/HeartsContainer
@onready var player =$TileMap/Player

func _ready():
	heart_container.set_max_hearts(player.max_health)
	heart_container.update_hearts(player.current_health)
	player.health_changed.connect(heart_container.update_hearts)


func _on_inventory_gui_closed():
	get_tree().paused = false

func _on_inventory_gui_opened():
	get_tree().paused = true

