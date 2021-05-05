extends Node2D


var shoot_angle = 0
var init_velocity_x = 100
var init_velocity_y = 0
var init_y = 27
var d = 0
var gravity = 9.80665
var dt = 0.1
var n = 0
var gun_pos = Vector2(250,250)

func ballist():
	var Vx = init_velocity_x
	var Vy = init_velocity_y
	var T = sqrt(d/(0.5*gravity))
	for t in range(T/dt+1):
		var X = Vx * t * dt
		var Y = (-1)*0.5*gravity*pow(t*dt,2)
		draw_circle(Vector2(gun_pos.x+X,gun_pos.y-Y),2,Color(0,0,1))
		draw_line(gun_pos,Vector2(gun_pos.x+X,gun_pos.y),Color(0,0.1,0),1.0)
		get_node("Label").set_text("Y = "+str(Y))
		get_node("Label2").set_text("X = "+str(X))
		get_node("Label3").set_text(str(T))

func _input(_event):
	if Input.is_key_pressed(KEY_RIGHT):
		n += 1;
		d += 1; 
		update()
	if Input.is_key_pressed(KEY_LEFT):
		n -= 1; 
		d -= 1;
		update()
func _ready(): 
	get_node("gun_carriage").position = gun_pos
	set_process_input(true)

func _draw(): ballist()
