#!/bin/bash

# Scripts directory
Parent_Dir=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Trainers directory 
Trainers_Dir="$Parent_Dir/../Trainers"

echo $'########################################################'
echo $'###--- Cross-Domain Few-Shot Learning Experiments ---###'
echo $'########################################################\n\n'

Models=("finetuning" "maml")

for model in ${Models[@]}; do
    # Fixed ways and shots
    Shots=(10)
    for shot in ${Shots[@]}; do
        if [ "$model" = "maml" ]; then
			# Sets same as cd-metadl (CV Lab Setting)
			#python $Trainers_Dir/train_cross_domain_fsl.py --model $model --n_way_eval 5 --k_shot_eval $shot \
			#--train_datasets BRD,FLW,BCT,CRS,SPT --val_datasets DOG,PLT_NET,PNU,APL,ACT_40 \
			#--test_datasets AWA,FNG,PRT,BTS,ACT_410 --T 5 --T_val 10 --T_test 10 \
			#--val_after 500 --eval_iters 500 --train_iters 10000 --runs 1

			# Same as dustins test1
			python $Trainers_Dir/train_cross_domain_fsl.py --model $model --n_way_eval 5 --k_shot_eval $shot \
			--train_datasets DOG,INS_2,PLT_NET,MED_LF,PNU,RSICB,APL,TEX_DTD,ACT_40,MD_5_BIS \
			--val_datasets AWA,INS,FNG,PLT_DOC,PRT,RSD,BTS,TEX_ALOT,ACT_410,MD_6 \
			--test_datasets BRD,PLK,FLW,PLT_VIL,BCT,RESISC,CRS,TEX,SPT,MD_MIX --T 5 --T_val 10 --T_test 10 \
			--val_after 500 --eval_iters 500 --train_iters 10000 --runs 1

	
        else
			# Sets same as cd-metadl (CV Lab Setting)
			#python $Trainers_Dir/train_cross_domain_fsl.py --model $model --n_way_eval 5 --k_shot_eval $shot \
			#--train_datasets BRD,FLW,BCT,CRS,SPT --val_datasets DOG,PLT_NET,PNU,APL,ACT_40 \
			#--test_datasets AWA,FNG,PRT,BTS,ACT_410 \
			#--val_after 500 --eval_iters 500 --train_iters 10000 --runs 1

			# Same as dustins test1
			python $Trainers_Dir/train_cross_domain_fsl.py --model $model --n_way_eval 5 --k_shot_eval $shot \
			--train_datasets DOG,INS_2,PLT_NET,MED_LF,PNU,RSICB,APL,TEX_DTD,ACT_40,MD_5_BIS \
			--val_datasets AWA,INS,FNG,PLT_DOC,PRT,RSD,BTS,TEX_ALOT,ACT_410,MD_6 \
			--test_datasets BRD,PLK,FLW,PLT_VIL,BCT,RESISC,CRS,TEX,SPT,MD_MIX \
			--val_after 500 --eval_iters 500 --train_iters 10000 --runs 1
					
        fi
    done
done




