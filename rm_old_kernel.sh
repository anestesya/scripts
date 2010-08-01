#!/bin/bash 
### Este script ajuda a remover os kernels antigos do sistema
  # o script é interativo.

KERNEL_VERSION=`uname -r`
 

     for i in `ls /boot | grep vmlinuz | cut -d'-' -f2,3`; do
        echo "Kernel instalado: $i" 
	 `sudo dpkg -l | grep ^ii | grep $i | awk -F' ' '{print $2 }'`
     done

