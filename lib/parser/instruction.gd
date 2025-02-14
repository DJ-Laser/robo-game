class_name Instruction

enum InstructionKind {FORWARD, TWO, YEET}

const english_mapping = {
	"forward": InstructionKind.FORWARD,
	"two": InstructionKind.TWO,
	"yeet": InstructionKind.YEET,
}

var kind
var args

func _init(kind: InstructionKind, args: Array) -> void:
	self.kind = kind
	self.args = args

func _to_string() -> String:
	return "%s %s" % [english_mapping.find_key(self.kind), self.args]

static func _get_num_args(instruction_kind: InstructionKind) -> int:
	match instruction_kind:
		InstructionKind.FORWARD: return 1
		InstructionKind.TWO: return 2
		InstructionKind.YEET: return 0
	
	return 0
