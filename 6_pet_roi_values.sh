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
# CREATE CSV FILES --> CALCULATE ROI STATS --> OUTPUT ROI VALUES TO CSV
#------------------------------------------------------------------

#OUTPUT MEAN PET VALUES TO CSV FILE

    if [ ! -e ${CSV_OUT} ]
    then
    touch ${CSV_OUT}
    fi

# CREATE FILE HEADERS
#echo 'RID, lh_superiorparietal, rh_superiorparietal, bl_superiorparietal, lh_inferiorparietal, rh_inferiorparietal, bl_inferiorparietal, lh_precuneus, rh_precuneus, bl_precuneus, lh_superiortemporal, rh_superiortemporal, bl_superiortemporal, lh_middletemporal, rh_middletemporal, bl_middletemporal, lh_inferiortemporal, rh_inferiortemporal, bl_inferiortemporal, lh_fusiform, rh_fusiform, bl_fusiform, lh_entorhinal, rh_entorhinal, bl_entorhinal, lh_posteriorcingulate, rh_posteriorcingulate, bl_posteriorcingulate, lh_hippocampus, rh_hippocampus, bl_hippocampus, lh_parietaltotal, rh_parietaltotal, bl_parietaltotal, lh_temporaltotal, rh_temporaltotal, bl_temporaltotal' > ${CSV_OUT}

#echo 'RID, temporalpole, frontalpole, bankssts, superiortemporal, middletemporal, precentral, postcentral, supramarginal, superiorparietal, precuneus, cuneus, pericalcarine, lingual, superiorfrontal, rostralanteriorcingulate, caudalanteriorcingulate, posteriorcingulate, isthmuscingulate, medialorbitofrontal, inferiortemporal, lateraloccipital, inferiorparietal, caudalmiddlefrontal, rostralmiddlefrontal, lateralorbitofrontal, parsorbitalis, parstriangularis, parsopercularis, insula, transversetemporal, entorhinal, paracentral, fusiform, parahippocampal' > ${CSV_OUT}


#echo 'RID, frontal, parietal, occipital, posteriorcingulate, anteriorcingulate, lateraltemporal' > ${CSV_OUT}
echo 'RID, frontal, isthmuscingulate, parietal, posteriorcingulate, occipital, anteriorcingulate, lateraltemporal, global' > ${CSV_OUT}

for subj in ${SUBJECT[@]}; do
utils_setup_config ${CONFIG}


#INSERT SUBJECT IDS
printf "\n%s,"  "${subj}" >> ${CSV_OUT}

#------------------------------------------------------------------
for ROI in ${regionsofinterest[@]};do
utils_setup_config ${CONFIG}


#-----------------------------------------------------------------
#STEP (1) - CALCULATE ROI MEAN SUVR
#-----------------------------------------------------------------
echo "STAGE 6: STEP 1 -->  ${subj} CALCULATE ROI ${ROI} MEAN SUVR"
PET_MEAN=$(${FSLSTATS} ${ROIDIR}/${subj}_ref_adj_pet_ROI_${ROI}.nii.gz -M)
echo -e "STAGE 6: STEP 1 -->  ${subj} CALCULATE ROI ${ROI} MEAN SUVR = ${PET_MEAN} \r\n" >> ${NOTE}

#-----------------------------------------------------------------
#STEP (2) - INSERT PET VALUES BY ROI
#-----------------------------------------------------------------
echo "STAGE 6: STEP 2 -->  INSERT ${subj} ROI MEAN SUVR IN CSV FILE"
printf "%g," `echo ${PET_MEAN} | awk -F, '{print $1}'` >> ${CSV_OUT}

#sed -i.bak "${PET_MEAN} | awk -F, '{print $1}'" >> ${CSV_OUT}

#-----------------------------------------------------------------
cd ${project_conf}
done


done
