#!/bin/bash


CONFIG=${1}
source utils.sh
utils_setup_config ${CONFIG}

for subj in ${SUBJECT[@]}; do
utils_setup_config ${CONFIG}

fslview_deprecated ${T1}/${subj}_orig_to_native.nii.gz ${T1}/${subj}_aparc+aseg_to_native.nii.gz -l Red-Yellow -t .5

done
