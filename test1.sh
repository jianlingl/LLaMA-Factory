#!/bin/bash

# 激活 Conda 环境
source /data/home/ljl/miniconda3/bin/activate /mnt/afs/ljl/004/llamafactory
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 # todo
# 记得改 adapter_name_or_path todo
# 记得改 output_dir todo

echo "hello synthe_triton_test"
llamafactory-cli train \
    --stage sft \
    --model_name_or_path /mnt/afs/hfmodel/Qwen2.5-Coder-7B-Instruct \
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
    --output_dir /mnt/afs/ljl/triton_exps/test_res/qwen2.5_coder_7b_instru/crawl_triton_all_simpleInstru/synthe_triton_test \
    --do_predict True \
    --adapter_name_or_path /mnt/afs/ljl/triton_exps/qwen2.5_coder_7b-instru/crawl_triton_all_simpleInstru

echo "Hello, crawl_triton_test_simpInstru!" 
llamafactory-cli train \
    --stage sft \
    --model_name_or_path /mnt/afs/hfmodel/Qwen2.5-Coder-7B-Instruct \
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
    --output_dir /mnt/afs/ljl/triton_exps/test_res/qwen2.5_coder_7b_instru/crawl_triton_all_simpleInstru/crawl_triton_test_simpInstru \
    --do_predict True \
    --adapter_name_or_path /mnt/afs/ljl/triton_exps/qwen2.5_coder_7b-instru/crawl_triton_all_simpleInstru

# echo "Hello, 10_triton_test!"
# llamafactory-cli train \
#     --stage sft \
#     --model_name_or_path /mnt/afs/hfmodel/Qwen2.5-Coder-7B-Instruct \
#     --preprocessing_num_workers 16 \
#     --finetuning_type lora \
#     --quantization_method bitsandbytes \
#     --template qwen \
#     --flash_attn auto \
#     --eval_dataset 10_triton_test \
#     --per_device_eval_batch_size 2 \
#     --predict_with_generate True \
#     --max_new_tokens 4096 \
#     --top_p 0.7 \
#     --temperature 0.95 \
#     --output_dir /mnt/afs/ljl/triton_exps/test_res/qwen2.5_coder_7b_instru/crawl_triton_all_simpleInstru/10_triton_test \
#     --do_predict True \
#     --adapter_name_or_path /mnt/afs/ljl/triton_exps/qwen2.5_coder_7b-instru/crawl_triton_all_simpleInstru

echo "Hello, crawl_triton_test_compInstru!"
llamafactory-cli train \
    --stage sft \
    --model_name_or_path /mnt/afs/hfmodel/Qwen2.5-Coder-7B-Instruct \
    --preprocessing_num_workers 16 \
    --finetuning_type lora \
    --quantization_method bitsandbytes \
    --template qwen \
    --flash_attn auto \
    --eval_dataset crawl_triton_test_compInstru \
    --per_device_eval_batch_size 2 \
    --predict_with_generate True \
    --max_new_tokens 4096 \
    --top_p 0.7 \
    --temperature 0.95 \
    --output_dir /mnt/afs/ljl/triton_exps/test_res/qwen2.5_coder_7b_instru/crawl_triton_all_simpleInstru/crawl_triton_test_compInstru \
    --do_predict True \
    --adapter_name_or_path /mnt/afs/ljl/triton_exps/qwen2.5_coder_7b-instru/crawl_triton_all_simpleInstru

# echo "Hello, torchBench_briefInstru!"
# llamafactory-cli train \
#     --stage sft \
#     --model_name_or_path /mnt/afs/hfmodel/Qwen2.5-Coder-7B-Instruct \
#     --preprocessing_num_workers 16 \
#     --finetuning_type lora \
#     --quantization_method bitsandbytes \
#     --template qwen \
#     --flash_attn auto \
#     --eval_dataset torchBench_briefInstru \
#     --per_device_eval_batch_size 2 \
#     --predict_with_generate True \
#     --max_new_tokens 4096 \
#     --top_p 0.7 \
#     --temperature 0.95 \
#     --output_dir /mnt/afs/ljl/triton_exps/test_res/qwen2.5_coder_7b_instru/crawl_triton_all_simpleInstru/torchBench_briefInstru \
#     --do_predict True \
#     --adapter_name_or_path /mnt/afs/ljl/triton_exps/qwen2.5_coder_7b-instru/crawl_triton_all_simpleInstru

# echo "Hello, torchBench_detailInstru!"
# llamafactory-cli train \
#     --stage sft \
#     --model_name_or_path /mnt/afs/hfmodel/Qwen2.5-Coder-7B-Instruct \
#     --preprocessing_num_workers 16 \
#     --finetuning_type lora \
#     --quantization_method bitsandbytes \
#     --template qwen \
#     --flash_attn auto \
#     --eval_dataset torchBench_detailInstru \
#     --per_device_eval_batch_size 2 \
#     --predict_with_generate True \
#     --max_new_tokens 4096 \
#     --top_p 0.7 \
#     --temperature 0.95 \
#     --output_dir /mnt/afs/ljl/triton_exps/test_res/qwen2.5_coder_7b_instru/crawl_triton_all_simpleInstru/torchBench_detailInstru \
#     --do_predict True \
#     --adapter_name_or_path /mnt/afs/ljl/triton_exps/qwen2.5_coder_7b-instru/crawl_triton_all_simpleInstru