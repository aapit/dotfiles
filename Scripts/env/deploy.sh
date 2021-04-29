#!/bin/bash
findContext() {
    case $(realpath ${PWD}) in
        ($(realpath ~/Lab/cuda-infer-template)) context=cuda;;
    esac

    echo $context
}

case "$(findContext)" in
    (cuda) rsync -avz . jetson:~/cat-detector/ --exclude .git \
        --exclude /obj/ --exclude '*.onnx' --exclude '*.engine' && \
        ssh jetson 'PATH=$PATH:/usr/local/cuda/bin && \
        cd ~/cat-detector/examples/hikvision/ && \
        make clean && make';;
    (*) echo "No known deploy context registered.";;
esac
