
extends Node2D

onready var cell_pk = get_parent().cell_pk

onready var dna_o = get_node("dna")
onready var dna = dna_o.dna
var health
var food

var rot = 0

func _ready():
	set_process(true)
	hide()
	

func _process(delta):
	
	#live
	if food > 0:
		food -= 1
	elif health > 0:
		health -= 1
	else:
		queue_free()
#	
	#movement
	bounds()

	rot += rand_range(-dna["movement"]["rotation"], dna["movement"]["rotation"])
	
	var move = Vector2(1, 0).rotated(deg2rad(rot))

	move *= dna["movement"]["speed"]
	
	translate(move * delta * 50)
	
	#appearance
	set_rotd(rot)
	set_scale(Vector2(dna["appearance"]["size"], dna["appearance"]["size"]))
	
	var c = dna["appearance"]["colour"]
	c.a = health/dna["utility"]["health"]
	get_node("Polygon2D").set_color(c)
	
	#clone
	if 1 == randi()%1000:
		print("a new cell is born :p")
		reproduce()
	

func reproduce():
	var cell = cell_pk.instance()
	get_parent().add_child(cell)
	cell.dna_o.copy_dna(dna)
	cell.dna_o.mutate(1)
	cell.set_pos(get_pos())

func bounds():
		
	var pos = get_pos()
	var rect = get_item_rect().size
	
	if pos.x < -rect.x:
		pos.x = get_viewport().get_rect().size.x + rect.x
	if pos.x > get_viewport().get_rect().size.x + rect.x:
		pos.x = 0
	if pos.y < -rect.y:
		pos.y = get_viewport().get_rect().size.y + rect.y
	if pos.y > get_viewport().get_rect().size.y + rect.y:
		pos.y = 0
	
	set_pos(pos)
	
