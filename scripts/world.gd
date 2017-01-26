extends Node2D

var cell_pk = preload("../node-scenes/cell.tscn")
var food_pk = preload("../node-scenes/food.tscn")

func _ready():
	
	randomize()
	
	for i in range(20):
		var cell = cell_pk.instance()
		add_child(cell)
		cell.dna_o.rand_dna()
	
	set_process(true)

func _process(delta):
	print(get_child_count())
	
	if 1 == randi()%100:
		var food = food_pk.instance()
		add_child(food)
		food.set_pos(Vector2(rand_range(0, get_viewport().get_rect().size.x), rand_range(0, get_viewport().get_rect().size.y)))
	
	if 1 == randi()%1000:
		var cell = cell_pk.instance()
		add_child(cell)
		cell.dna_o.rand_dna()
		cell.set_pos(Vector2(rand_range(0, get_viewport().get_rect().size.x), rand_range(0, get_viewport().get_rect().size.y)))
