extends Node

"""
project setting -> 

Rendering -> Textures -> canvas textures -> default texture filter = linear

	Window -> 
	viewport WIdth = 240
	viewport height = 135
	advanced setting = true
	resizable = true

	window width override = 1920
	window height override = 1080

	strecth = mode = canvas_itmes
	stretch = aspec - expand


Player Sprite setting

Node tree
	characterbody -> ordering ysort = true, z index = 1
		sprited2d
		animated 2d

intput texture in sprite2d node 
animation hframes = 4;
animation vframes = 7f;

collision = layer - rendering
collsion = mask - item interact



# pixel perfect
canvasItem = Texture filter = nearest
repeat = inherit


### Player script
1. get movement direction from input
2. set velocity to movent direction * speed * TIme.deltatime
3. moveplayer

### Key Mapping
project setting -> Input Map
show build-in actions = true
find "ui_left" + button click and type A ok button

### Tilemap
World node
	tilemap node - set the layer
		in tilemap set player node
	click tilemap -> see middle bottom click TileSet
	and drag && drop 

inspector -> tilemap property
	canvasItem -> ordering ysort enable = true
	layers -> find want layer -> ysort enable = true
	z index = 1
	
	
tilemap collision 
in inspector tileset click -> physics layer add elemnet
and mid bottom -> tile set click
	


"""
