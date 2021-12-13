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
			if ("a21oi" or "a211oi" or "a2111oi") in mux.module:
				for i in mux.portlist:
					if i.portname == "A1":
						en.append(i.argname)
			if ("a22oi" or "a221oi") in mux.module:
				for i in mux.portlist:
					if i.portname == "A1":
						en.append(i.argname)
					if i.portname == "B1":
						en.append(i.argname)
			if ("a222oi") in mux.module:
				for i in mux.portlist:
					if i.portname == "A1":
						en.append(i.argname)
					if i.portname == "B1":
						en.append(i.argname)
					if i.portname == "C1":
						en.append(i.argname)
			if "a31oi" in mux.module:
				for i in mux.portlist:
					if i.portname == "A1":
						en.append(i.argname)
					if i.portname == "A2":
						en.append(i.argname)
			if "a32oi" in mux.module:
				for i in mux.portlist:
					if i.portname == "A1":
						en.append(i.argname)
					if i.portname == "A3":
						en.append(i.argname)
					if i.portname == "B1":
						en.append(i.argname)
			if "a41oi" in mux.module:
				for i in mux.portlist:
					if i.portname == "A1":
						en.append(i.argname)
					if i.portname == "A3":
						en.append(i.argname)
					if i.portname == "A4":
						en.append(i.argname)
			if "mux2" in mux.module:
				for i in mux.portlist:
					if i.portname == "S":
						en.append(i.argname)
			if "mux4" in mux.module:
				for i in mux.portlist:
					if i.portname == "S0":
						en.append(i.argname)
					if i.portname == "S1":
						en.append(i.argname)
			for i in mux.portlist:
				if i.portname == "CLK":
					i.argname = vast.Identifier('_clockgate_output_')


	enables = list(set(en))
#	print(enables)
	for j in range(len(enables)):
		clkGateArgs.append([vast.PortArg("GCLK", vast.Identifier("_clockgate_output_")), vast.PortArg("GATE", vast.Identifier(str(en[j]))), vast.PortArg("CLK", vast.Identifier("clk"))])
	
    
	clockgate_output_gclk = vast.Wire('_clockgate_output_')
	newRTL.append(clockgate_output_gclk)
    
	for itemDeclaration in definition.items:
		item_type = type(itemDeclaration).__name__
		if item_type != "InstanceList":
			newRTL.append(itemDeclaration)
		else:
			mux = itemDeclaration.instances[0]
			if ("mux" not in mux.module) and ("a21" not in mux.module):
				newRTL.append(itemDeclaration)

	list = []
	string = "" 
	for j in range(len(enables)):
		string = "__clockgate_cell"+str(j+1)+"__"
		list.append(string);

	#print(list)
	for j in range(len(enables)):       
		clkgate_cell = vast.Instance("sky130_fd_sc_hd__dlclkp_1", list[j], tuple(clkGateArgs[j]), tuple())
		newRTL.append(vast.InstanceList("sky130_fd_sc_hd__dlclkp_1", tuple(), tuple([clkgate_cell])))
    
	definition.items = tuple(newRTL)
	codegen = ASTCodeGenerator()
	rslt = codegen.visit(ast)
	f = open("updatedTestOut.v", "w+")
	f.write(rslt)
	f.close()




