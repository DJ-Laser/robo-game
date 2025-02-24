class_name ErrorAstNode extends AstNode

var message: String;
var origin: String;

func _init(message: String, origin: String) -> void:
	self.message = message
	self.origin = origin

func desc() -> String:
	return "Error %s At %s" % [self.message, self.origin]
