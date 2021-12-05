import pyverilog.vparser.ast as vast
from pyverilog.vparser.parser import parse
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator
import sys

if __name__ == "__main__":
	rtl = sys.argv[1]
	# abstract syntax tree
	ast = parse([rtl])
	# Pyverilog has [description] tree, get root
	description = ast.description
	
	# Module definition node
	definition = description.definitions[0]
	
	
	# Instantiating clock gate components
	newRTL = []
	inputList = []
	outputList = []
	clkGateArgs = [
	vast.PortArg("GCLK", vast.Identifier("__clockgate_output_gclk_")),
 	vast.PortArg("GATE", vast.Identifier("EN")),
 	vast.PortArg("CLK", vast.Identifier("CLK"))
	]


	clkgate_cell = vast.Instance(
	"sky130_fd_sc_hd__dlclkp",
	"__clockgate_cell__",
	tuple(clkgateArgs),
	tuple()
	)
	clockgate_output_gclk = vast.Wire('__clockgate_output_gclk_')
	
	
