#!/bin/bash

# Scripts directory
Parent_Dir=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Trainers directory 
Trainers_Dir="$Parent_Dir/../Trainers"

echo $'########################################################'
echo $'###--- Within-Domain Few-Shot Learning Experiments ---###'
echo $'########################################################\n\n'

Datasets=("ACT_410")
Models=("finetuning")
Shots=(10)

for dataset in ${Datasets[@]}; do 
    for model in ${Models[@]}; do
        for shot in ${Shots[@]}; do
            if [ "$model" = "maml" ]; then
                python $Trainers_Dir/train_within_domain_fsl.py --dataset $dataset --model $model --k $shot --T 5 --T_val 10 --T_test 10 \
                --val_after 500 --eval_iters 500 --train_iters 10000 --runs 1
            else
                python $Trainers_Dir/train_within_domain_fsl.py --dataset $dataset --model $model --k $shot \
                --val_after 500 --eval_iters 500 --train_iters 10000 --runs 1
            fi
        done
    done
done


Datasets=("BTS")
Models=("maml")
Shots=(10)

for dataset in ${Datasets[@]}; do 
    for model in ${Models[@]}; do
        for shot in ${Shots[@]}; do
            if [ "$model" = "maml" ]; then
                python $Trainers_Dir/train_within_domain_fsl.py --dataset $dataset --model $model --k $shot --T 5 --T_val 10 --T_test 10 \
                --val_after 500 --eval_iters 500 --train_iters 10000 --runs 1
            else
                python $Trainers_Dir/train_within_domain_fsl.py --dataset $dataset --model $model --k $shot \
                --val_after 500 --eval_iters 500 --train_iters 10000 --runs 1
            fi
        done
    done
done