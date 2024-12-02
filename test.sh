#!/bin/bash

#SBATCH --job-name=test3bench                # 作业名称 todo
#SBATCH -o log/test3bench.out       # 标准输出和错误日志文件 todo
#SBATCH -e log/test3bench.err         # 错误日志文件（可选）todo
#SBATCH --time=15:00:00                  # 运行时间限制（格式：hh:mm:ss）
#SBATCH -N 1 # 只用一个节点
#SBATCH --gres=gpu:4 #用几张卡 todo
#SBATCH -w g0001 # 用哪个节点 todo

# sbatch test.sh 在终端
# 激活 Conda 环境
source /data/home/ljl/miniconda3/bin/activate /mnt/afs/ljl/004/llamafactory

llamafactory-cli train \
    --stage sft \
    --model_name_or_path /mnt/afs/ljl/codehit/001/model_cache/hub/Qwen/Qwen2___5-Coder-7B \
    --preprocessing_num_workers 16 \
    --finetuning_type lora \
    --quantization_method bitsandbytes \
    --template qwen \
    --flash_attn auto \
    --eval_dataset synthe_triton_test \
    --per_device_eval_batch_size 2 \
    --predict_with_generate True \
    --max_new_tokens 4096 \
    --top_p 0.7 \
    --temperature 0.95 \
    --output_dir /mnt/afs/ljl/triton_exps/test_res/synthe_triton_test \
    --do_predict True \
    --adapter_name_or_path /mnt/afs/ljl/triton_exps/qwen2.5_coder_7b/synthe_triton_all

echo "Hello, Bash!" 
llamafactory-cli train \
    --stage sft \
    --model_name_or_path /mnt/afs/ljl/codehit/001/model_cache/hub/Qwen/Qwen2___5-Coder-7B \
    --preprocessing_num_workers 16 \
    --finetuning_type lora \
    --quantization_method bitsandbytes \
    --template qwen \
    --flash_attn auto \
    --eval_dataset crawl_triton_test_simpInstru \
    --per_device_eval_batch_size 2 \
    --predict_with_generate True \
    --max_new_tokens 4096 \
    --top_p 0.7 \
    --temperature 0.95 \
    --output_dir /mnt/afs/ljl/triton_exps/test_res/crawl_triton_test_simpInstru \
    --do_predict True \
    --adapter_name_or_path /mnt/afs/ljl/triton_exps/qwen2.5_coder_7b/synthe_triton_all

echo "Hello, Bash!"
llamafactory-cli train \
    --stage sft \
    --model_name_or_path /mnt/afs/ljl/codehit/001/model_cache/hub/Qwen/Qwen2___5-Coder-7B \
    --preprocessing_num_workers 16 \
    --finetuning_type lora \
    --quantization_method bitsandbytes \
    --template qwen \
    --flash_attn auto \
    --eval_dataset 10_triton_test \
    --per_device_eval_batch_size 2 \
    --predict_with_generate True \
    --max_new_tokens 4096 \
    --top_p 0.7 \
    --temperature 0.95 \
    --output_dir /mnt/afs/ljl/triton_exps/test_res/10_triton_test \
    --do_predict True \
    --adapter_name_or_path /mnt/afs/ljl/triton_exps/qwen2.5_coder_7b/synthe_triton_all