#!/bin/bash

# 激活 Conda 环境
source /data/home/ljl/miniconda3/bin/activate /mnt/afs/ljl/004/llamafactory
# 指定显卡
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7  # 根据需要调整 GPU 的 ID

# 执行训练命令
llamafactory-cli train examples/train_lora/qwen_triton_lora_sft.yaml


# sbatch train.sh 在终端