#!/bin/bash

#SBATCH --job-name=triton_lora_eval_detailed                # 作业名称
#SBATCH -o /data/home/szli/triton/eval/logs/eval_10_test_mixed_qwen.out       # 标准输出和错误日志文件 todo
#SBATCH -e /data/home/szli/triton/eval/logs/eval_10_test_mixed_qwen.err         # 错误日志文件（可选）todo
#SBATCH --time=15:00:00                  # 运行时间限制（格式：hh:mm:ss）
#SBATCH -N 1 # 只用一个节点
#SBATCH --gres=gpu:8 #用8张卡 todo
#SBATCH -w g0001 # 用哪个节点 todo

# 激活 Conda 环境
source /data/home/ljl/miniconda3/bin/activate /mnt/afs/ljl/004/llamafactory
# 指定显卡
# export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7  # 根据需要调整 GPU 的 ID

# 执行训练命令
llamafactory-cli train examples/train_lora/qwen_triton_lora_sft.yaml


# sbatch train.sh 在终端