# 🌌 MT6768-Place: The Developer's Forge

> *"Breathing new life into MT6768 devices, one commit at a time."*

Welcome to the official setup guide for the **MT6768-Place** ecosystem.

This repository provides a simple and clean way to initialize all required sources for:
- 📱 Device Trees
- 🧠 Kernel Sources
- 📦 Vendor Blobs
- 🛡️ Hardware & Sepolicy
- ⚡ Bringup Scripts
- 🏛️ Local Manifests

Supported devices:
- Xiaomi Redmi 9 (Lancelot)
- Xiaomi Redmi Note 9 (Merlinx)

---

# 📚 Table of Contents

- [✨ Features](#-features)
- [⚡ Method A — Manual Trees Script](#-method-a--manual-trees-script)
- [🏛️ Method B — Local Manifest (Recommended)](#️-method-b--local-manifest-recommended)
- [📦 Included Components](#-included-components)
- [🤝 Contributing](#-contributing)
- [📜 License](#-license)
- [⭐ Credits](#-credits)

---

# ✨ Features

- Fully automated setup
- Clean repository structure
- Compatible with:
  - LineageOS
  - AOSP
  - PixelOS
  - crDroid
  - DerpFest
- Easy `repo sync` integration
- Fast bringup workflow

---

# 🔷 How to Start?

# ⚡ Method A — Manual Trees Script

Perfect for:
- Quick testing
- Fast bringups
- Manual control

---

## 📥 Download script to ROOT

```bash
curl -L https://raw.githubusercontent.com/mt6768-place/place-guide-mt6768/refs/heads/main/trees.sh \
-o trees.sh

chmod +x trees.sh

./trees.sh
```

## ▶️ Run it

---

## 📜 trees.sh

```bash
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
```

---

# 🏛️ Method B — Local Manifest (Recommended)

Recommended for:
- Long-term maintenance
- Cleaner source trees
- Easier syncing
- CI environments

---

## 📥 Install the Manifest

```bash
mkdir -p .repo/local_manifests

curl -L https://raw.githubusercontent.com/mt6768-place/place-guide-mt6768/refs/heads/main/manifest.xml \
-o .repo/local_manifests/mt6768.xml

repo sync -j$(nproc --all)
```

---

## 📜 manifest.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>

    <remote
        name="mt6768-place"
        fetch="https://github.com/mt6768-place"
        review="https://github.com/" />

    <!-- Device Trees -->

    <project
        path="device/xiaomi/lancelot"
        name="device_xiaomi_lancelot"
        remote="mt6768-place"
        revision="16.2" />

    <project
        path="device/xiaomi/merlinx"
        name="device_xiaomi_merlinx"
        remote="mt6768-place"
        revision="16.2" />

    <project
        path="device/xiaomi/mt6768-common"
        name="device_xiaomi_mt6768-common"
        remote="mt6768-place"
        revision="16.2" />

    <!-- Kernel -->

    <project
        path="kernel/xiaomi/mt6768"
        name="android_kernel_xiaomi_mt6768-r"
        remote="mt6768-place"
        revision="sixteen-qpr2" />

    <!-- Vendor -->

    <project
        path="vendor/xiaomi/mt6768-common"
        name="proprietary_vendor_xiaomi_mt6768-common"
        remote="mt6768-place"
        revision="16.2" />

    <project
        path="vendor/xiaomi/lancelot"
        name="proprietary_vendor_xiaomi_lancelot"
        remote="mt6768-place"
        revision="16.2" />

    <project
        path="vendor/xiaomi/merlinx"
        name="proprietary_vendor_xiaomi_merlinx"
        remote="mt6768-place"
        revision="16.2" />

    <!-- Hardware -->

    <project
        path="device/mediatek/sepolicy_vndr"
        name="android_device_mediatek_sepolicy_vndr"
        remote="mt6768-place"
        revision="lineage-23.2" />

    <project
        path="hardware/xiaomi"
        name="android_hardware_xiaomi"
        remote="mt6768-place"
        revision="lineage-23.2" />

    <project
        path="hardware/mediatek"
        name="android_hardware_mediatek"
        remote="mt6768-place"
        revision="lineage-23.2" />

    <project
        path="vendor/mediatek/ims"
        name="android_vendor_mediatek_ims"
        remote="mt6768-place" />

</manifest>
```

---

# 📦 Included Components

| Component | Description |
|---|---|
| device/xiaomi/lancelot | Redmi 9 device tree |
| device/xiaomi/merlinx | Redmi Note 9 device tree |
| device/xiaomi/mt6768-common | Shared MT6768 tree |
| kernel/xiaomi/mt6768 | Common MT6768 kernel |
| vendor/xiaomi/* | Proprietary vendor blobs |
| hardware/xiaomi | Xiaomi hardware |
| hardware/mediatek | Mediatek hardware |
| device/mediatek/sepolicy_vndr | Vendor sepolicy |
| vendor/mediatek/ims | IMS support |

---

# 🤝 Contributing

Pull requests are welcome.

Feel free to:
- Fix trees
- Improve sepolicy
- Update vendors
- Optimize scripts
- Add support for more MT6768 devices

---

# 📜 License

GPL-2.0 unless specified otherwise.

Vendor blobs remain property of their respective owners.

---

# ⭐ Credits

- LineageOS
- AOSP
- Mediatek OSS Community
- Xiaomi MTK Developers
- MT6768-Place Contributors

---

> *"Every successful build starts with a single sync."*
````
