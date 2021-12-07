import pyverilog.vparser.ast as vast
from pyverilog.vparser.parser import parse
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator
import sys

if __name__ == "__main__":
	rtl = sys.argv[1]
	# abstract syntax tree

	ast,_ = parse([rtl])

	# Pyverilog has [description] tree, get root
	description = ast.description
	
	# Module definition node
	definition = description.definitions[0]
	
	
	# Instantiating clock gate components
	newRTL = []

	enables = []
	en = []
	List = []
	clkGateArgs = []
    


	for itemDeclaration in definition.items:
		item_type = type(itemDeclaration).__name__
		if item_type == "InstanceList":
			mux = itemDeclaration.instances[0]
			if mux.module == "sky130_fd_sc_hd__a21oi_1":
				for i in mux.portlist:
					if i.portname == "A1":
						en.append(i.argname)
			if mux.module == "sky130_fd_sc_hd__mux2_1":
				for i in mux.portlist:
					if i.portname == "S":
						en.append(i.argname)
			for i in mux.portlist:
				if i.portname == "CLK":
					i.argname = vast.Identifier('_clockgate_output_')


	enables = list(set(en))
	#print(enables)
	for j in range(len(enables)):
		clkGateArgs.append([vast.PortArg("GCLK", vast.Identifier("_clockgate_output_")), vast.PortArg("GATE", vast.Identifier(str(en[j]))), vast.PortArg("CLK", vast.Identifier("CLK"))])
	
    
	clockgate_output_gclk = vast.Wire('_clockgate_output_')
	newRTL.append(clockgate_output_gclk)
    
	for itemDeclaration in definition.items:
		item_type = type(itemDeclaration).__name__
		if item_type != "InstanceList":
			newRTL.append(itemDeclaration)
		else:
			mux = itemDeclaration.instances[0]
			if mux.module != "sky130_fd_sc_hd__mux2_1" and mux.module != "sky130_fd_sc_hd__a21oi_1":
				newRTL.append(itemDeclaration)


	for j in range(len(enables)):       
		clkgate_cell = vast.Instance("sky130_fd_sc_hd__dlclkp_1", "__clockgate_cell__", tuple(clkGateArgs[j]), tuple())
		newRTL.append(vast.InstanceList("sky130_fd_sc_hd__dlclkp_1", tuple(), tuple([clkgate_cell])))
    
	definition.items = tuple(newRTL)
	codegen = ASTCodeGenerator()
	rslt = codegen.visit(ast)
	f = open("test1_out.v", "w+")
	f.write(rslt)
	f.close()



