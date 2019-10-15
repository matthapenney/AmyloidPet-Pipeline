#!/bin/bash


#$ -q compute.q

# Run Amyloid Pet Processing

# -----------------------------------------------------
if [ "$SGE_TASK_ID" == "" ]
then

 CONFIG=${1}
 SGE_TASK_ID=1

fi

# CONFIG - petproc.config
source utils.sh

utils_setup_config ${CONFIG}

echo ${subj}
# -----------------------------------------------------
# Reference Region Erode by 1 voxel
 ./0_dicom_nifti_convert.sh ${CONFIG}
 ./1_fs_to_native.sh ${CONFIG}
 ./2_ref_region_extract.sh ${CONFIG}
 ./refregion_erode.sh ${CONFIG}
 ./3_native_to_pet.sh ${CONFIG}
 ./4_pet_skullstrip.sh ${CONFIG}
 ./5_pet_roi_analysis.sh ${CONFIG}
 ./6_pet_roi_values.sh ${CONFIG}
