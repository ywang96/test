#!/bin/bash

export MODEL_DIR="runwayml/stable-diffusion-v1-5"
export OUTPUT_DIR="controlnet"

accelerate launch --main_process_port 0 --multi_gpu --mixed_precision="bf16" --num_processes=8 train_controlnet.py \
 --pretrained_model_name_or_path=$MODEL_DIR \
 --output_dir=$OUTPUT_DIR \
 --dataset_name=fusing/fill50k \
 --resolution=512 \
 --learning_rate=1e-5 \
 --train_batch_size=6 \
 --mixed_precision="bf16" \
