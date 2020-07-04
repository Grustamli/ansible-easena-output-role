# ansible-easena-output-role
## Description of the taskflow:
Role performs the following tasks:
- copies the .ez file to remote host
- runs easena <.ez file> -cuda
- runs make
- runs the compiled program and writes the output to a file
- fetches the output txt file to localhost

## Variables
The role provides variables to edit .ez files without directly editing an .ez file. List of available variables are following.
### User declarations
These variables correspond to the '\User declarations' section of the .ez file. 
- `nACC_MULT`:  default is **1024 * 1024**
- `NB_SIN`:  default is **2**
- `MIN_AMP`: default is **68100.0**
- `MAX_AMP`: default is **100000.0**
- `MIN_FREQ`: default is **0.2688 * nACC_MULT**
- `MAX_FREQ`: default is **0.2691 * nACC_MULT**
- `MIN_PH`: default is **3.34**
- `MAX_PH`: default is **4.49**
- `NB_SAMPLES`: default is **4096**
