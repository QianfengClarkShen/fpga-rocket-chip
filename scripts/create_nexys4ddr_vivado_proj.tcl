set mem_data_width {64}
set io_data_width {32}
set axi_id_width {8}

set base_dir "."

set project_name nexys4ddr
set CONFIG DefaultNexys4DDRConfig

# Set the directory path for the original project from where this script was exported
set orig_proj_dir [file normalize $base_dir/$project_name]

# Create project
create_project $project_name $base_dir/$project_name

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [get_projects $project_name]
set_property "default_lib" "xil_defaultlib" $obj
set_property "part" "xc7a100tcsg324-1" $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

proc findFiles { basedir pattern } {
    set basedir [string trimright [file join [file normalize $basedir] { }]]
    set fileList {}

    foreach fileName [glob -nocomplain -type {f r} -path $basedir $pattern] {
        lappend fileList $fileName
    }

    foreach dirName [glob -nocomplain -type {d  r} -path $basedir *] {
        set subDirList [findFiles $dirName $pattern]
        if { [llength $subDirList] > 0 } {
            foreach subDirFile $subDirList {
                lappend fileList $subDirFile
            }
        }
    }
    return $fileList
}


# Set 'sources_1' fileset object
set files [list \
               [file normalize $base_dir/firmware/firmware.hex ] \
               [file normalize $base_dir/rocket-chip/vsim/generated-src/freechips.rocketchip.system.$CONFIG.v ]
             ]
add_files -norecurse -fileset [get_filesets sources_1] $files
add_files -norecurse -fileset [get_filesets sources_1] [findFiles ${base_dir}/verilog "*.sv"]
add_files -norecurse -fileset [get_filesets sources_1] [findFiles ${base_dir}/verilog "*.v"]

set_property file_type {Memory File} [get_files $base_dir/firmware/firmware.hex ]

# Set 'sources_1' fileset properties
set_property "top" "chip_top" [get_filesets sources_1]

# Clock generators
create_ip -name clk_wiz -vendor xilinx.com -library ip -module_name clk_wiz_0
set_property -dict [list \
                        CONFIG.PRIMITIVE {PLL} \
                        CONFIG.RESET_TYPE {ACTIVE_LOW} \
                        CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50.000} \
                        CONFIG.CLKOUT1_DRIVES {BUFG}] \
    [get_ips clk_wiz_0]
generate_target {instantiation_template} [get_files $proj_dir/$project_name.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci]

#UART
#create_ip -name axi_uart16550 -vendor xilinx.com -library ip -module_name axi_uart16550_0
#set_property -dict [list \
                        CONFIG.UART_BOARD_INTERFACE {Custom} \
                        CONFIG.C_S_AXI_ACLK_FREQ_HZ_d {50} \
                       ] [get_ips axi_uart16550_0]
#generate_target {instantiation_template} \
    [get_files $proj_dir/$project_name.srcs/sources_1/ip/axi_uart16550_0/axi_uart16550_0.xci]

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set files [list [file normalize "$base_dir/constraints/$project_name.xdc"]]
set file_added [add_files -norecurse -fileset $obj $files]

# generate all IP source code
generate_target all [get_ips]

#some tweaking of optimizations
set_property STEPS.SYNTH_DESIGN.ARGS.KEEP_EQUIVALENT_REGISTERS true [get_runs synth_1]
set_property STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY none [get_runs synth_1]