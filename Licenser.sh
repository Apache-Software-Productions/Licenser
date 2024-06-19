#!/bin/bash
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#                   -- [ Licenser ] --                      #  
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
# Software Name: Licenser
# Version: 1.0.0
# Authors: AeternusDio
# [ Edited with Vim. ]
# Date Written: Tuesday June 18, 2024
#
# Acknowledgments:
#    THIS SOFTWARE WAS INSPIRED BY AND BASED OFF OF THE WORK OF: Nishanth Shanmuhham. In this repository > https://github.com/nishanths/license
#
# Description:
#   A simple command line tool for generating License text to files.
#
# License: ASP License V2 & MIT (Dual Licensed)
# Website: No Wesbite.
# Contact: No Contact.
#
# Dependencies:
# - BASH
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Copyright (c) 2024 Apache Software Production. (ASP)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# SLOWFETCH IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
Version=1.0.0

source ./Array.sh

display_usage() {
echo "Usage: ./Licenser.sh <Name of license> <File name>"
}

if [ $# -eq 1 ] && [ "$1" == "-help" ]; then
    man ./.Licenser.1
    exit 0
fi

if [ $# -lt 2 ]; then
    display_usage
    exit 1
fi

ARG1=$1
ARG2=$2

if [[ -v Templates[$ARG1] ]]; then
    TEMPLATE_FILE="${Templates[$ARG1]}"

    if [ -f "$TEMPLATE_FILE" ]; then
        cat "$TEMPLATE_FILE" > "$ARG2"
        echo "$ARG1 has been copied to $ARG2."
    else
        echo "Template file $TEMPLATE_FILE does not exist."
        exit 1
    fi
else
    echo "The specified license name ($ARG1) is not supported."
    exit 1
fi
