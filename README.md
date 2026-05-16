# 🌌 MT6768-Place: The Developer's Forge

> *"Breathing new life into the Xiaomi MT6768 architecture, one commit at a time."*

Welcome to the central hub for **Xiaomi Redmi 9 (Lancelot)** and **Redmi Note 9 (Merlinx)** bring-up development.

This repository provides everything required to initialize a fully functional build environment for **AOSP**, **LineageOS**, and other custom ROM projects based on the **MT6768** platform.

Whether you prefer fast manual cloning or a clean manifest-based workflow, this README has you covered.

---

# 📚 Table of Contents

* [✨ Features](#-features)
* [📦 Included Components](#-included-components)
* [⚡ Path A — Manual Sync Script](#-path-a--manual-sync-script)
* [🏛️ Path B — Local Manifest (Recommended)](#️-path-b--local-manifest-recommended)
* [💡 Developer Notes](#-developer-notes)
* [🛠️ Requirements](#️-requirements)
* [🤝 Contributing](#-contributing)
* [📜 License](#-license)

---

# ✨ Features

* 📱 Complete device tree setup for:

  * `lancelot`
  * `merlinx`
  * `mt6768-common`

* 🧠 Preconfigured kernel source

* 📦 Proprietary vendor blobs included

* 🛡️ Mediatek sepolicy and hardware support

* ⚡ Fast setup with either:

  * Manual clone script
  * Local manifest integration

* 🧹 Clean and maintainable structure

---

# 📦 Included Components

| Component                       | Description              |
| ------------------------------- | ------------------------ |
| `device/xiaomi/lancelot`        | Redmi 9 device tree      |
| `device/xiaomi/merlinx`         | Redmi Note 9 device tree |
| `device/xiaomi/mt6768-common`   | Shared common tree       |
| `kernel/xiaomi/mt6768`          | MT6768 kernel source     |
| `vendor/xiaomi/*`               | Proprietary vendor blobs |
| `device/mediatek/sepolicy_vndr` | Mediatek vendor sepolicy |
| `hardware/xiaomi`               | Xiaomi hardware layer    |
| `hardware/mediatek`             | Mediatek hardware layer  |
| `vendor/mediatek/ims`           | IMS support              |

---

# ⚡ Path A — Manual Sync Script

Perfect for:

* Quick bring-ups
* Testing
* Temporary environments
* Developers who prefer direct control

This method clones everything directly into your source tree.

---

## 1️⃣ Download the Script

```bash
mkdir -p tools/mt6768

curl -L https://raw.githubusercontent.com/mt6768-place/local_manifests/main/trees.sh \
-o tools/mt6768/trees.sh

chmod +x tools/mt6768/trees.sh
```

---

## 2️⃣ trees.sh

```bash
#!/bin/bash

echo "🚀 Igniting the forge for Lancelot & Merlinx..."

# -------------------------------------------------
# 📱 Device Trees
# -------------------------------------------------

rm -rf device/xiaomi/lancelot
git clone -b 16.2 https://github.com/mt6768-place/device_xiaomi_lancelot.git \
device/xiaomi/lancelot

rm -rf device/xiaomi/merlinx
git clone -b 16.2 https://github.com/mt6768-place/device_xiaomi_merlinx.git \
device/xiaomi/merlinx

rm -rf device/xiaomi/mt6768-common
git clone -b 16.2 https://github.com/mt6768-place/device_xiaomi_mt6768-common.git \
device/xiaomi/mt6768-common

# -------------------------------------------------
# 🧠 Kernel
# -------------------------------------------------

rm -rf kernel/xiaomi/mt6768
git clone -b sixteen-qpr2 https://github.com/mt6768-place/android_kernel_xiaomi_mt6768-r.git \
kernel/xiaomi/mt6768

# -------------------------------------------------
# 📦 Vendor Trees
# -------------------------------------------------

rm -rf vendor/xiaomi/mt6768-common
git clone -b 16.2 https://github.com/mt6768-place/proprietary_vendor_xiaomi_mt6768-common.git \
vendor/xiaomi/mt6768-common

rm -rf vendor/xiaomi/lancelot
git clone -b 16.2 https://github.com/mt6768-place/proprietary_vendor_xiaomi_lancelot.git \
vendor/xiaomi/lancelot

rm -rf vendor/xiaomi/merlinx
git clone -b 16.2 https://github.com/mt6768-place/proprietary_vendor_xiaomi_merlinx.git \
vendor/xiaomi/merlinx

# -------------------------------------------------
# 🛡️ Hardware & Sepolicy
# -------------------------------------------------

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

echo "✨ All repositories successfully forged!"
```

---

## 3️⃣ Execute the Script

```bash
bash tools/mt6768/trees.sh
```

---

# 🏛️ Path B — Local Manifest (Recommended)

Best option for:

* Long-term maintenance
* Cleaner source trees
* Easier syncing
* CI/CD environments

This method integrates directly with Android's native `repo sync` workflow.

---

## 1️⃣ Create the Local Manifest

```bash
mkdir -p .repo/local_manifests

curl -L https://raw.githubusercontent.com/mt6768-place/local_manifests/main/manifest.xml \
-o .repo/local_manifests/mt6768.xml
```

---

## 2️⃣ mt6768.xml

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

    <!-- Hardware & Security -->

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

## 3️⃣ Sync Everything

```bash
repo sync -c -j$(nproc --all) \
--force-sync \
--no-clone-bundle \
--no-tags
```

---

# 💡 Developer Notes

## ⏱️ Speed Up Builds

Enable `ccache`:

```bash
export USE_CCACHE=1
ccache -M 100G
```

---

## 💾 Save Disk Space

This setup intentionally excludes:

* Google Apps (GApps)
* Signing keys
* OTA keys

Bring your own setup depending on your ROM project.

---

## ⚠️ Clean Branch Switching

When switching between Android versions or ROM bases:

```bash
repo sync --force-sync
```

This avoids broken trees and leftover conflicts.

---

# 🛠️ Requirements

Recommended environment:

| Requirement | Recommended     |
| ----------- | --------------- |
| OS          | Ubuntu 22.04+   |
| RAM         | 16 GB minimum   |
| Storage     | 300+ GB         |
| CPU         | 8 cores or more |
| Python      | 3.x             |
| Git         | Latest          |

---

# 🤝 Contributing

Pull requests, fixes, and improvements are always welcome.

If you discover:

* broken trees
* outdated blobs
* missing dependencies
* sepolicy issues
* build errors

feel free to open an issue or submit a patch.

---

# 📜 License

Unless otherwise specified, all repositories follow their respective upstream licenses.

Kernel source complies with:

* GNU General Public License v2.0 (GPL-2.0)

Vendor blobs remain property of their respective owners.

---

# ⭐ Credits

Special thanks to:

* LineageOS
* AOSP
* Mediatek OSS community
* Xiaomi bring-up developers
* Everyone keeping MTK devices alive

---

> *"Every successful build starts with a single sync."*
