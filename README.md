````md
# 🌌 MT6768-Place: The Developer's Forge

> *"Breathing new life into MT6768 devices, one commit at a time."*

Welcome to the official setup guide for the MT6768-Place ecosystem.

This repository provides everything needed to initialize a complete Android ROM bringup environment for MT6768-based Xiaomi devices.

Supported devices include:

- Redmi 9 (Lancelot)
- Redmi Note 9 (Merlinx)

---

# ✨ Features

- 📱 Device Trees
- 🧠 Kernel Sources
- 📦 Vendor Blobs
- 🛡️ Hardware & Sepolicy
- ⚡ One-command setup
- 🏛️ Local manifest integration
- 🔄 Compatible with LineageOS / AOSP based ROMs

---

# 📦 Included Components

| Component | Description |
|---|---|
| device/xiaomi/lancelot | Redmi 9 |
| device/xiaomi/merlinx | Redmi Note 9 |
| device/xiaomi/mt6768-common | Shared MT6768 trees |
| kernel/xiaomi/mt6768 | Common kernel |
| vendor/xiaomi/* | Vendor blobs |
| hardware/xiaomi | Xiaomi hardware |
| hardware/mediatek | MTK hardware |
| device/mediatek/sepolicy_vndr | Vendor sepolicy |
| vendor/mediatek/ims | IMS support |

---

# ⚡ Quick Setup (Recommended)

## Download Manifest

```bash
mkdir -p .repo/local_manifests

curl -L https://raw.githubusercontent.com/mt6768-place/place-guide-mt6768/refs/heads/main/manifest.xml \
-o .repo/local_manifests/mt6768.xml
````

## Sync Sources

```bash
repo sync -c -j$(nproc --all) \
--force-sync \
--no-clone-bundle \
--no-tags
```

---

# ⚡ Alternative Setup (trees.sh)

If you prefer direct cloning instead of repo manifests:

## Download Script

```bash
mkdir -p tools/mt6768

curl -L https://raw.githubusercontent.com/mt6768-place/place-guide-mt6768/refs/heads/main/trees.sh \
-o tools/mt6768/trees.sh

chmod +x tools/mt6768/trees.sh
```

## Execute

```bash
bash tools/mt6768/trees.sh
```

---

# 📄 trees.sh

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

# 📄 manifest.xml

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

# 💡 Developer Notes

## Enable CCache

```bash
export USE_CCACHE=1
ccache -M 100G
```

## Recommended Environment

| Requirement | Recommended   |
| ----------- | ------------- |
| OS          | Ubuntu 22.04+ |
| RAM         | 16 GB+        |
| Storage     | 300 GB+       |
| CPU         | 8 Cores+      |

---

# 🤝 Contributing

Pull requests are welcome.

Feel free to:

* Update trees
* Improve scripts
* Fix blobs
* Improve sepolicy
* Add support for more MT6768 devices

---

# 📜 License

GPL-2.0 unless specified otherwise.

---

# ⭐ Credits

* LineageOS
* AOSP
* Mediatek OSS Community
* Xiaomi MTK developers

---

> *"Every successful build starts with a single sync."*

```

Basado en la estructura de manifests y bringup Android usada habitualmente en proyectos MT6768 y LineageOS. :contentReference[oaicite:0]{index=0}
::contentReference[oaicite:1]{index=1}
```
