#!/bin/bash

#$ -S /bin/bash
#$ -o /ifshome/mhapenney/logs -j y

#$ -q compute.q
#------------------------------------------------------------------

# CONFIG - petproc.config
CONFIG=${1}

source utils.sh

utils_setup_config ${CONFIG}


#------------------------------------------------------------------
echo "Reference regions: ${reference[@]}"
# Whole Cerebellum 
for subj in ${SUBJECT[@]}; do
for rr in ${reference[@]}; do

utils_setup_config ${CONFIG}

# Test
echo ${subj}
echo ${RRLABEL}
echo ${rr}


if [ ! -d ${PET_OUT} ]
        then
        mkdir -p ${PET_OUT}
fi

#------------------------------------------------------------------
#STAGE () - Erode reference region by 1 voxel - test 
#------------------------------------------------------------------

echo "STAGE: x STEP 1 --> ${subj} ERODE BINARIZED REFERENCE REGION"
cmd="${IMAGEMATH} 3 ${PET_OUT}/${subj}_aparc+aseg_native_ref_${rr}_bin.nii.gz ME ${PET_OUT}/${subj}_aparc+aseg_native_ref_${rr}_bin.nii.gz 1"
eval ${cmd}
echo -e "STAGE: x STEP 1 --> ${subj} ERODE BINARIZED REFERENCE REGION"
echo -e "COMMAND --> ${cmd}\r\n" >> ${NOTE}

done
done
