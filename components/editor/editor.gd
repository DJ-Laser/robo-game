extends Control

@onready
var code_editor = %CodeEditor
var parser: Parser

func _init() -> void:
	parser = Parser.new()

func _process(delta: float) -> void:
	pass

func _on_run_button_pressed() -> void:
	print(parse_code(code_editor.text))

func parse_code(code: String) -> Array[Instruction]:
	return self.parser.parse(code)
	
