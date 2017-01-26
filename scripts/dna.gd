extends Node2D

var dna = {
	
	"movement" : {
		"speed"    : 0,
		"rotation" : 0
	},
	
	"appearance" : {
		"size" : 0,
		"colour" : 0
	},
	
	"utility" : {
		"health" : 0,
		"food" : 0
	}

}

func rand_dna():
	dna["movement"]["speed"] = rand_range(1, 10)
	dna["movement"]["rotation"] = rand_range(0, 20)
	
	dna["appearance"]["size"] = rand_range(0, 2)
	dna["appearance"]["colour"] = Color(randf(1), randf(1), randf(1))
	
	dna["utility"]["health"] = ceil(rand_range(100, 1000))
	dna["utility"]["food"] = ceil(rand_range(100, 1000))
	
	update_parent()

func update_parent():
	var par = get_parent()
	par.health = dna["utility"]["health"]
	par.food = dna["utility"]["food"]
	par.show()

func copy_dna(_dna):
	dna["movement"]["speed"] = _dna["movement"]["speed"]
	dna["movement"]["rotation"] = _dna["movement"]["rotation"]
	
	dna["appearance"]["size"] = _dna["appearance"]["size"]
	dna["appearance"]["colour"] = _dna["appearance"]["colour"]
	
	dna["utility"]["health"] = _dna["utility"]["health"]
	dna["utility"]["food"] = _dna["utility"]["food"]

func mutate(chance):
	
	if chance == randi()%chance:
		dna["movement"]["speed"] *= rand_range(0.5, 1.5)
	if chance == randi()%chance:
		dna["movement"]["rotation"] *= rand_range(0.5, 1.5)
	
	if chance == randi()%chance:
		dna["appearance"]["size"] *= rand_range(0.5, 1.5)
	if chance == randi()%chance:
		dna["appearance"]["colour"].r *= rand_range(0.5, 1.5)
	if chance == randi()%chance:
		dna["appearance"]["colour"].g *= rand_range(0.5, 1.5)
	if chance == randi()%chance:
		dna["appearance"]["colour"].b *= rand_range(0.5, 1.5)
	
	update_parent()
	
