#!/bin/bash

echo "🚀 Starting MT6768-Place Sync..."

# =================================================
# 📱 Device Trees
# =================================================

rm -rf device/xiaomi/lancelot
git clone -b 16.2 https://github.com/mt6768-place/device_xiaomi_lancelot.git \
device/xiaomi/lancelot

rm -rf device/xiaomi/merlinx
git clone -b 16.2 https://github.com/mt6768-place/device_xiaomi_merlinx.git \
device/xiaomi/merlinx

rm -rf device/xiaomi/mt6768-common
git clone -b 16.2 https://github.com/mt6768-place/device_xiaomi_mt6768-common.git \
device/xiaomi/mt6768-common

# =================================================
# 🧠 Kernel
# =================================================

rm -rf kernel/xiaomi/mt6768
git clone -b sixteen-qpr2 https://github.com/mt6768-place/android_kernel_xiaomi_mt6768-r.git \
kernel/xiaomi/mt6768

# =================================================
# 📦 Vendor Trees
# =================================================

rm -rf vendor/xiaomi/mt6768-common
git clone -b 16.2 https://github.com/mt6768-place/proprietary_vendor_xiaomi_mt6768-common.git \
vendor/xiaomi/mt6768-common

rm -rf vendor/xiaomi/lancelot
git clone -b 16.2 https://github.com/mt6768-place/proprietary_vendor_xiaomi_lancelot.git \
vendor/xiaomi/lancelot

rm -rf vendor/xiaomi/merlinx
git clone -b 16.2 https://github.com/mt6768-place/proprietary_vendor_xiaomi_merlinx.git \
vendor/xiaomi/merlinx

# =================================================
# 🛡️ Hardware & Sepolicy
# =================================================

rm -rf device/mediatek/sepolicy_vndr
git clone -b lineage-23.2 https://github.com/mt6768-place/android_device_mediatek_sepolicy_vndr.git \
device/mediatek/sepolicy_vndr

rm -rf hardware/xiaomi
git clone -b lineage-23.2 https://github.com/mt6768-place/android_hardware_xiaomi.git \
hardware/xiaomi

rm -rf hardware/mediatek
git clone -b lineage-23.2 https://github.com/mt6768-place/android_hardware_mediatek.git \
hardware/mediatek

rm -rf vendor/mediatek/ims
git clone https://github.com/mt6768-place/android_vendor_mediatek_ims.git \
vendor/mediatek/ims

echo "✨ MT6768-Place sync completed!"