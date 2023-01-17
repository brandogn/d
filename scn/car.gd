extends VehicleBody3D

var max_rpm = 750
var max_torque = 250
var acc = 0.0

func _physics_process(delta):
	if Input.is_action_pressed("floor_gas"):
		max_torque = 500
	else:
		max_torque = 250
	steering = lerp(steering, Input.get_axis("right", "left") * .4, 5 * delta)
#	steering = Input.get_axis("steer_right", "steer_left") * .4
	acc = lerp(acc, Input.get_axis("back", "forward"), 5 * delta)
	var rpm = $wheel_BL.get_rpm()
	$wheel_BL.engine_force = acc * max_torque * ( 1 - rpm / max_rpm )
	rpm = $wheel_BR.get_rpm()
	$wheel_BR.engine_force = acc * max_torque * ( 1 - rpm / max_rpm )
	
	brake = lerp(brake, Input.get_action_strength("brake") * 3, 5 * delta)
	
	print("Acc: %s\t vel: %s\t Brakes: %s " % [acc, rpm, brake])
	
#	var decc = Input.get_action_strength("brake_pedal") * 20
#	brake += decc;
	
