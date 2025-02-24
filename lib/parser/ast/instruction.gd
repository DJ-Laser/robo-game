class_name InstructionAstNode extends AstNode

enum InstructionKind {FORWARD, JUMP, WAIT}

const english_mapping = {
	"forward": InstructionKind.FORWARD,
	"jump": InstructionKind.JUMP,
	"wait": InstructionKind.WAIT,
}

var kind: InstructionKind
var arg: AstNode

func _init(kind: InstructionKind, arg: AstNode = AstNode.new()) -> void:
	self.kind = kind
	self.arg = arg

func takes_arg() -> bool:
	match self.kind:
		InstructionKind.FORWARD: return true
		InstructionKind.JUMP: return true
		InstructionKind.WAIT: return true
	return false

func children() -> Array[AstNode]:
	return [self.arg]

func desc() -> String:
	return "%s %s" % [english_mapping.find_key(self.kind), self.arg]
