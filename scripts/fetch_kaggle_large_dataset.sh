#!/usr/bin/env bash

TRAINING_DATA_URL="vbookshelf/v2-plant-seedlings-dataset"
NOW=$(date)

# We download the dataset from Kaggle
kaggle datasets download -d $TRAINING_DATA_URL -p packages/neural_network_model/neural_network_model/datasets/ && \

# We unzip the dataset
unzip packages/neural_network_model/neural_network_model/datasets/v2-plant-seedlings-dataset.zip -d packages/neural_network_model/neural_network_model/datasets/v2-plant-seedlings-dataset && \

# We persist to a file:
# 1. the URL we use
# 2. the date of the training data
echo $TRAINING_DATA_URL 'retrieved on:' $NOW > packages/neural_network_model/neural_network_model/datasets/training_data_reference.txt && \

# Rename the folder that has an apostrophe
mkdir -p "./packages/neural_network_model/neural_network_model/datasets/v2-plant-seedlings-dataset/Shepherds Purse"  && \
mv -v "./packages/neural_network_model/neural_network_model/datasets/v2-plant-seedlings-dataset/Shepherd’s Purse/"* "./packages/neural_network_model/neural_network_model/datasets/v2-plant-seedlings-dataset/Shepherds Purse"
rm -rf "./packages/neural_network_model/neural_network_model/datasets/v2-plant-seedlings-dataset/Shepherd’s Purse"