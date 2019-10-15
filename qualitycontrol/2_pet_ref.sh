#!/bin/bash
#$ -cwd

CONFIG=${1}

source utils.sh
utils_setup_config ${CONFIG}

for subj in ${SUBJECT[@]}; do
utils_setup_config ${CONFIG}

fslview_deprecated ${PET_OUT}/${subj}_T1skullstrip_in_PETspace.nii.gz ${PET_OUT}/${subj}_PET_BET.nii.gz -l Blue -t .5 ${PET_OUT}/${subj}_aparc+aseg_PET_ref_cerebellum-whole_bin.nii.gz -l Red-Yellow -t .8

done
