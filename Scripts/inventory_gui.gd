extends Control

var is_open: bool = false

signal opened
signal closed

@onready var inventory : Inventory = preload("res://inventory/inventory.tres")
@onready var slots : Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	inventory.updated.connect(update)
	update()

func update():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i]) 


func open():
	visible = true
	is_open = true
	opened.emit()

func close():
	visible = false
	is_open = false
	closed.emit()
