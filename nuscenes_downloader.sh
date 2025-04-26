#!/bin/bash

# =========================================================
# Script: nuscenes_downloader.sh
# Description: 使用 aria2 高速下载 NuScenes 所有 .tgz 文件
# Author: Wang Shayn
# =========================================================

SAVE_DIR="/data/nuscenes"
mkdir -p "$SAVE_DIR"
cd "$SAVE_DIR" || exit

BASE_URL="https://motional-nuscenes.s3.amazonaws.com/public/v1.0"

FILES=(
  "v1.0-test_meta.tgz"
  "v1.0-test_blobs.tgz"
  "v1.0-trainval01_blobs.tgz"
  "v1.0-trainval02_blobs.tgz"
  "v1.0-trainval03_blobs.tgz"
  "v1.0-trainval04_blobs.tgz"
  "v1.0-trainval05_blobs.tgz"
  "v1.0-trainval06_blobs.tgz"
  "v1.0-trainval07_blobs.tgz"
  "v1.0-trainval08_blobs.tgz"
  "v1.0-trainval09_blobs.tgz"
  "v1.0-trainval10_blobs.tgz"
  "v1.0-trainval_meta.tgz"
)

for file in "${FILES[@]}"; do
  echo "⏬ Downloading $file ..."
  aria2c -x 16 -s 16 -c "${BASE_URL}/${file}" -d "$SAVE_DIR" -o "$file"
done

echo "✅ All files downloaded to $SAVE_DIR"
