class_name AstNode

func children() -> Array[AstNode]:
	return [];

func desc() -> String:
	return "Empty AST Node"

func _to_string() -> String:
	var children_str = str(self.children())
	
	if children_str == "[]":
		children_str = ""
	else:
		children_str = " " + children_str
	
	return "%s%s" % [self.desc(), children_str]
