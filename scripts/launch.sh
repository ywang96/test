#!/bin/bash

export MODEL_DIR="runwayml/stable-diffusion-v1-5"
export OUTPUT_DIR="controlnet"
batchsizes=( 2 4 8 16)

for i in "${batchsizes[@]}"
do
   accelerate launch --mixed_precision="bf16" train_controlnet_gaudi.py \
     --pretrained_model_name_or_path=$MODEL_DIR \
     --output_dir=$OUTPUT_DIR \
     --dataset_name=fusing/fill50k \
     --resolution=512 \
     --learning_rate=1e-5 \
     --train_batch_size=$i \
     --mixed_precision="bf16" \
     --checkpointing_step 50000 \
     --report_to "wandb" \
     2>&1 |tee /starcoder/controlnet/txtlogs/sdcn-bs-$i.txt
done
