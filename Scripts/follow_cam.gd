extends Camera2D

@export var tilemap : TileMap 

func _ready():
#	pass
	var map_rect = tilemap.get_used_rect()
	var tile_size = tilemap.cell_quadrant_size
	var world_size_in_pixels = map_rect.size * tile_size
	var half_screen_size = tilemap.get_used_rect().size / 2.0

	limit_right = world_size_in_pixels.x - 48
	limit_bottom =  world_size_in_pixels.y + 32
