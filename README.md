<pre>
<p align="center">

CSCE3304-Digital Design II
Project II
Automatic Clock Gating 


Khalid Mohamed  900153041
Rawan Sameh     900192388
</p>
</pre>

#### How to use the tool
1. Clone the repository.
2. Make sure Python 3 is installed by running ```python3 --version```
3. Install iverilog ```pip3 install iverilog```
4. Install yosys & gtkwave for testing & verification

#### How to compile
1. cd into the repository.
2. cd into PyVerilog and run ```pip3 setup.py```
3. run ```python3 main.py``` followed by the path of the synthesized module from yosys.

#### Dependancies
Libraries used:
1. Pyverilog https://github.com/PyHDI/Pyverilog
2. sky130_fd_sc_hd.v 


#### Code Structure
. The code looks at multiplexers and aoi components in the netlist and looks at the number of enables
and accordingly replaces them with clock gating cells depending on number of enables

#### Problems
Code compatible only with skywater technology

#### Tests
![alt text](https://github.com/Khaliddxx/Automatic_Clock_Gating/blob/main/Test1.jpg?raw=true)

