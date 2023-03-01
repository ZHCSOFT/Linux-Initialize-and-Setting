#!/bin/bash

conda_path=$(whereis conda)
nvcc_required=11.8

if [[ "$conda_path" = "conda:" || "$CONDA_DEFAULT_ENV" = '' ]]; then
    echo "[ FATAL ] No conda detected"
    exit
fi

if [ "$CONDA_DEFAULT_ENV" = 'base' ]; then
    echo "[ FATAL ] Installing on base environment is not supported"
    exit
else
    echo "[ INFO ] Install packages on "$CONDA_DEFAULT_ENV
fi

if [ -d "/usr/local/cuda" ]; then
    echo "[ INFO ] Installing PaddlePaddle-CUDA version"
    nvcc_path=$(whereis nvcc)
    if [[ "$nvcc_path" != *$nvcc_required* || "$nvcc_path" = '' ]]; then
        echo "[ FATAL ] Invalid nvcc detected, required: "$nvcc_required", find: "$nvcc_path
        exit
    fi
    pip3 install --upgrade paddlepaddle-gpu==0.0.0.post117 -f https://www.paddlepaddle.org.cn/whl/linux/gpu/develop.html
else
    echo "[ INFO ] Installing PyTorch-CPU version"
    pip3 install --upgrade paddlepaddle==0.0.0 -f https://www.paddlepaddle.org.cn/whl/linux/cpu-mkl/develop.html
fi

pip3 install --upgrade numpy matplotlib pandas opencv-python visualdl paddle2onnx 
