
utils_setup_config() {
     if  [ -e ${1} ]; then
       source ${1}
     else
       echo "Configuration file ${1} not found. :( Aborting"
       exit 1
     fi
	
	readarray SUBJECT < ${subjectlist}
    readarray reference < ${referencereg} 
    readarray regionsofinterest < ${regionsofinterest}
}

