extends Sprite2D

#how many hexes away a token can attack
var attacks : int
#checks if any one token wishes to pass their turn
var skip : bool
#health each token possesses
var health : int
#speed/how many hexes a token can move
var speed : int
#each token needs an element type
var element : String
#how much damage an attack does
var damage : int
#vulnerability and resistance to other elements (+1/-1 damage): 2 element array
var vulnRes : Array
#when a token goes in turn order/modifier for random turn order
var initiative : int

func _ready():
	pass
