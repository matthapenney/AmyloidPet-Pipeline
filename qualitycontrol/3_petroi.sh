#!/bin/bash


CONFIG=${1}
source utils.sh
utils_setup_config ${CONFIG}

for subj in ${SUBJECT[@]}; do
utils_setup_config ${CONFIG}

for ROI in ${regionsofinterest[@]};do
utils_setup_config ${CONFIG}

fslview_deprecated ${PET_OUT}/${subj}_T1skullstrip_in_PETspace.nii.gz ${PET_OUT}/${subj}_PET_BET.nii.gz -l Blue -t .5 ${PETSPACE}/${subj}_aparc+aseg_inPETspace_ROI_${ROI}_bin.nii.gz -l Red-Yellow -t .8

done

done
