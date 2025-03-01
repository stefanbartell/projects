#!/bin/bash

[[ -z "${4}" ]] && gpu_config="" || gpu_config="--gpu-id $4"

# Runs training. Expects as arguments: (1) dataset ID, (2) config file name, (3) max. steps.
PYTHONPATH=scripts python -m spacy train configs/$2 \
          --paths.dataset_name $1 \
          --output training/$1 \
          --paths.train corpora/$1/train.spacy \
          --paths.dev corpora/$1/dev.spacy \
          --paths.kb temp/$1/kb \
          --paths.base_nlp temp/$1/nlp \
          --training.max_steps $3 \
          -c scripts/custom_functions.py \
          ${gpu_config}