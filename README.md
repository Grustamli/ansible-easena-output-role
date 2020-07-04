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
- `NB_SIN`: default is **2**
- `MIN_AMP`: default is **68100.0**
- `MAX_AMP`: default is **100000.0**
- `MIN_FREQ`: default is **0.2688 * nACC_MULT**
- `MAX_FREQ`: default is **0.2691 * nACC_MULT**
- `MIN_PH`: default is **3.34**
- `MAX_PH`: default is **4.49**
- `NB_SAMPLES`: default is **4096**

### Run parameters
These variables correspond to the '\User declarations' section of the .ez file.
- `NB_GEN`: default is **2000**
- `TIME_LIMIT`: default is **0**
- `POPULATION_SIZE`: default is **131072**
- `OFFSPRING_SIZE`: default is **100%**
- `MUT_PROB`: default is **1**
- `XOVER_PROB`: default is **1**
- `EVAL_GOAL`: default is **minimise**
- `SELECTION_OPERATOR`: default is **Tournament 10**
- `SURVIVING_PARENTS`: default is **100%**
- `SURVIVING_OFFSPRING`: default is **100%**
- `REDUCE_PARENTS_OPERATOR`: default is **Tournament 2**
- `REDUCE_OFFSPRING_OPERATOR`: default is **Tournament 2**
- `FINAL_REDUCE_OPERATOR`: default is **Tournament 7**
- `ELITISM`: default is **weak**
- `ELITE`: default is **1**
- `PRINT_STATS`: default is **true**
- `GEN_CSV_STATS_FILE`: default is **false**
- `GEN_GNUPLOT_SCRIPT`: default is **false**
- `GEN_R_SCRIPT`: default is **false**
- `PLOT_STATS`: default is **true*
- `REMOTE_ISLAND_MODEL`: default is **false**
- `IP_FILE`: default is **ip.txt**
- `SERVER_PORT`: default is **2929**
- `MIGRATION_PROB`: default is **.333**
- `SAVE_POPULATION`: default is **false**
- `START_FROM_FILE`: default is **false**

### Ansible task variables
These variables control the behaviour of the steps descriped in the begginning of this README

- `EZ_TEMPLATE`: Path to the Jinja2 template file that renders **User declarations** and **Run parameters** variables. Do not change this value unless you know how to create .ez Jinja2 template. Default is **sinus_it.ez.j2**
- `EZ_FILE`: Path to an .ez file which contains further modifications apart from the variables. This variable will override `EZ_TEMPLATE`. Default is empty **''**.
- `EZ_DEST_FILENAME`: File basename that will be used to save the .ez file as in the remote host. If not specified basename of `EZ_TEMPLATE` or `EZ_FILE` will be used. Default is empty **''**. Do not include **.ez** extension. Example: **sinus_it_test**. File will be save to the remote host as **sinus_it_test.ez**
- `EZ_DEST_DIRNAME`: Created directory name in the remote host which will contain .ez file and compilations. Default is **sinus_it**
- `EZ_OUTPUT_FILE`: Name of the file that easena generation output will be written to. Default is **output.log**
- `DELETE_EZ_DIRECTORY`: Deletes the easena directory after all outputs are copied to localhost. Default is **true**. Change it to false to prevent deletion
- `CLEAN_COMPILATION`: Runs `make easenaclean` after copying all outputs to localhost. Default is **false**. Don't need to set it to `true` if `DELETE_EZ_DIRECTORY` is set to `true`
- `DELETE_EZ_FILE`: Deletes .ez file on the remote host after copying all outputs to localhost. Default is **false**. Don't need to set it to `true` if `DELETE_EZ_DIRECTORY` is set to `true`

**Note**. Stick to editing EZ variables if **\User declarations** and **\Run parameters** are only things to be changed. Specify `EZ_FILE` if an .ez file includes more changes apart from the variables.
