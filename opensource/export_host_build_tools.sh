#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PATH=$DIR/../buildroot/output/host/usr/bin/:$PATH
echo res path = $PATH
