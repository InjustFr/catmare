extends Node


func get_component(component_class: StringName, entity: Node) -> Node:
	var matching_components: Array[Node] = entity.find_children("*", component_class, true, false)

	assert(matching_components.size() > 0, "Could not find any component of type " + component_class)

	return matching_components[0]
