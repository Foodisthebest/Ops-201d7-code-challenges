#!/bin/bash

# Script Name:                  Renona Gay
# Author:                       Your Name
# Date of latest revision:      10/26/2023
# Purpose:                      Arrays

# Declaration of variables




# declare an array
directories=(./dir1 ./dir2 ./dir3 ./dir4) 
mkdir ${directories[*]}
touch ${directories[0]}/test.txt
touch ${directories[1]}/test.txt
touch ${directories[2]}/test.txt
touch ${directories[3]}/test.txt

# End