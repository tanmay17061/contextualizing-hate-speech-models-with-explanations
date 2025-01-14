#!/bin/bash

if [[ -n "$1" ]]; then
    current_seed=$1
else
    current_seed=0
fi


if [[ -n "$2" ]]; then
    max_seeds=$2
else
    max_seeds=1
fi

echo seed = $current_seed
echo max_seeds = $max_seeds

while(( $current_seed < $max_seeds ))
do
    #python3 run_model.py --do_train --do_lower_case --data_dir ./data/white_supremacy --bert_model bert-base-uncased --max_seq_length 128 --train_batch_size 32 --learning_rate 2e-5 --num_train_epochs 20 --early_stop 5 --output_dir runs/ws_es_reg_nb5_h5_is_bal_new_seed_${current_seed} --seed ${current_seed} --task_name ws --reg_explanations --nb_range 5 --sample_n 5 --negative_weight 0.125 --reg_strength 0.1 --lm_dir runs/lm_ws --hiex_add_itself --neutral_words_file data/identity_ws_new.csv
    #python3 run_model.py --do_train --do_lower_case --data_dir ./data/white_supremacy --bert_model bert-base-multilingual-uncased --max_seq_length 128 --train_batch_size 32 --learning_rate 2e-5 --num_train_epochs 20 --early_stop 5 --output_dir runs/ws_es_reg_nb5_h5_is_bal_new_seed_${current_seed} --seed ${current_seed} --task_name ws --reg_explanations --nb_range 5 --sample_n 5 --negative_weight 0.125 --reg_strength 0.1 --lm_dir runs/lm_ws --hiex_add_itself --neutral_words_file data/identity_ws_new.csv

    #no regularization
    #python3 run_model.py --do_train --do_lower_case --data_dir ./data/waseem --bert_model bert-base-multilingual-uncased --max_seq_length 128 --train_batch_size 32 --learning_rate 2e-5 --num_train_epochs 20 --early_stop 5 --output_dir runs/waseem_es_reg_nb5_h5_is_bal_new_seed_${current_seed} --seed ${current_seed} --task_name ws --nb_range 5 --sample_n 5 --negative_weight 0.125 --lm_dir runs/lm_ws --hiex_add_itself --neutral_words_file data/identity_waseem.csv

    python3 run_model.py --do_train --do_lower_case --data_dir ./data/white_supremacy --bert_model bert-base-uncased --max_seq_length 64 --train_batch_size 32 --learning_rate 2e-5 --num_train_epochs 20 --early_stop 5 --output_dir runs/bert_ws_noreg_seed_${current_seed} --seed ${current_seed} --task_name ws --nb_range 5 --sample_n 5 --negative_weight 0.125 --reg_strength 0.1 --lm_dir runs/lm_ws --hiex_add_itself --neutral_words_file data/identity_ws_new.csv --use_padding_variant 0
    let current_seed++
done
