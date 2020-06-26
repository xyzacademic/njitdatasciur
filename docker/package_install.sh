#!/bin/sh

conda install pytorch torchvision cudatoolkit=10.1 -c pytorch  -y # pytorch
pip install nibabel  # nibabel
# apex
conda install -c conda-forge xgboost -y  # XGBoost
conda install -c pytorch faiss-gpu -y  # Faiss
conda install -c anaconda opencv -y  # opencv
