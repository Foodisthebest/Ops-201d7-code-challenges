#!/bin/bash

# Script:                     System Information
# Author:                     Renona Gay
# Date of latest revision:    10/31/2023 
# Purpose:                    Ops 201 Challenge 04

# Create a script that uses lshw to display system info to the screen about hardware

# Search output of lshw and return every line with the word "bridge" in it
    # lshw -c shows specific components 
    # Pipes grab output of command on the left side of the pipe, then feeds it to command on right side of pipe
    

# Check for root permissions 
if [ "$EUDID" -ne 0 ] # Means "root user not equal to 0"
    then echo "Run as root"
    exit
fi

# Function to extract info using lshw and grep
function get_info() {
    local component=$1
    local keys=("${!2}")
    echo "=== $component ==="
    for key in "${keys[@]}"; do
        lshw -c $component | grep -E "^/s*key"
    done
    echo ""
}

# Define the keys for each component
declare -a cpu_keys=("product:" "vendor:" "physical id:" "bus info:" "width:")
declare -a ram_keys=("description:" "physical id:" "size:")
declare -a display_keys=("description:" "product:" "vendor:" "physical id:" "bus info:" "width:" "clock:" "capabilities:" "configuration:" "resources:")
declare -a network_keys=("description:" "product:" "vendor:" "physical id:" "bus info:" "logical name:" "version:" "serial:" "size:" "capacity:" "width:" "clock:" "capabilities:" "configuration:" "resources:")

# Retrieve and display system information
echo "Computer name: $(hostname)"
echo ""

# Get information for each component
get_info "cpu" "cpu_keys[@]"
get_info "memory" "ram_keys[@]"
get_info "display" "display_keys[@]"
get_info "network" "network_keys[@]"