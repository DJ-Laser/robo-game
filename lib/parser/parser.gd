class_name Parser

var instruction_mapping_dict: Dictionary

func _init() -> void:
	self.instruction_mapping_dict = InstructionAstNode.english_mapping

func parse(input: String) -> Array[AstNode]:
	var code: Array[AstNode] = []
	for line in input.split("\n", false):
		var inst = self.parse_instruction(line)
		if inst != null:
			code.append(inst)
	
	return code

func parse_instruction(input: String) -> AstNode:
	var args = input.split(" ", false)
	if len(args) == 0:
		return null
	
	var instruction_name = args[0]
	args.remove_at(0)
	
	var instruction_kind = self.instruction_mapping_dict.get(instruction_name)
	if instruction_kind == null:
		return ErrorAstNode.new("Thats not a valid isntruction silly!", "Ur silly ahh code")
	
	return InstructionAstNode.new(instruction_kind)
