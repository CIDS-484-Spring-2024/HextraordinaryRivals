extends TileMapLayer

# code modified from https://www.youtube.com/watch?v=1y57hJo1ONQ&list=PLd_56bdSJ-tS4-q1gczTdKJhqMep3Ij_w

const AIR_1 = preload("res://Assets/Tokens/TokenSprites/Air1.png")
const AIR_2 = preload("res://Assets/Tokens/TokenSprites/Air2.png")
const AIR_3 = preload("res://Assets/Tokens/TokenSprites/Air3.png")
const AIR_4 = preload("res://Assets/Tokens/TokenSprites/Air4.png")
const EARTH_1 = preload("res://Assets/Tokens/TokenSprites/Earth1.png")
const EARTH_2 = preload("res://Assets/Tokens/TokenSprites/Earth2.png")
const EARTH_3 = preload("res://Assets/Tokens/TokenSprites/Earth3.png")
const EARTH_4 = preload("res://Assets/Tokens/TokenSprites/Earth4.png")
const FIRE_1 = preload("res://Assets/Tokens/TokenSprites/Fire1.png")
const FIRE_2 = preload("res://Assets/Tokens/TokenSprites/Fire2.png")
const FIRE_3 = preload("res://Assets/Tokens/TokenSprites/Fire3.png")
const FIRE_4 = preload("res://Assets/Tokens/TokenSprites/Fire4.png")
const WATER_1 = preload("res://Assets/Tokens/TokenSprites/Water1.png")
const WATER_2 = preload("res://Assets/Tokens/TokenSprites/Water2.png")
const WATER_3 = preload("res://Assets/Tokens/TokenSprites/Water3.png")
const WATER_4 = preload("res://Assets/Tokens/TokenSprites/Water4.png")

				   #A1,    A1,    A2,    A3,    F1,     F1,     F2,     F3
const START_HEX = [[5,4], [5,6], [3,3], [3,7], [16,4], [16,6], [17,7], [17,3]]

@onready var tokens: Node2D = $Tokens

const TOKEN_PLACEHOLD = preload("res://Pages/token_placehold.tscn")
const CELL_WIDTH = 31

#player turns in a looped array (not actually looped, the iterator jumps back)
var turnOrder: Array 
#the "iterator" that determines whose turn it is
var turn: int
#is a hex open or does it have a token on it
var isOpen : bool

#all possible movements for individual piece types
var moves = []
#all possible attack locations for individual piece types
var attacks = []
#checks if any one token wishes to pass their turn
var skip : bool
#health each token possesses
var health : int
#speed/how many hexes a token can move (may be redundant with moves[]???)
var speed : int
#each token needs an element type
var element : String
#how much damage an attack does
var damage : int
#vulnerability and resistance to other elements (+1/-1 damage) 2 element array
var vulnRes : Array
#when a token goes in turn order/modifier for random turn order
var initiative : int


#instatiate each token type here, by [i][j] for hard coded cells 
#TODO: no hardcoding will be used later
#5,4 & 5,6 are Air1s; 16,4 & 16,6 are Fire1s
#3,3 is Air2; 17,7 is Fire2
#3,7 is Air3; 17,3 is Fire3

func _ready():
	for i in START_HEX:
		var holder = TOKEN_PLACEHOLD.instantiate()
		tokens.add_child(holder)
		holder.global_position = Vector2(i[0] * CELL_WIDTH, i[1] * CELL_WIDTH)
		
		match(i):
			[5,4]: holder.texture = AIR_1
			[5,6]: holder.texture = AIR_1
			[3,3]: holder.texture = AIR_2
			[3,7]: holder.texture = AIR_3
			[16,4]: holder.texture = FIRE_1
			[16,6]: holder.texture = FIRE_1
			[17,7]: holder.texture = FIRE_2
			[17,3]: holder.texture = FIRE_3
