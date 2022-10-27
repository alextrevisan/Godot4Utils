extends Node

func OverlapBox(position:Vector2, size:Vector2, angle:float, layerMask: int, spaceBody):
	var check_shape = RectangleShape2D.new()
	check_shape.size = size
	
	var space = PhysicsServer2D.body_get_space(spaceBody.get_rid())
	var state = PhysicsServer2D.space_get_direct_state(space)
	
	var params = PhysicsShapeQueryParameters2D.new()
	params.set_transform(Transform2D(angle, position))
	params.collide_with_areas = true
	params.collide_with_bodies = true
	params.set_shape_rid(check_shape.get_rid())
	
	return state.intersect_shape(params)
