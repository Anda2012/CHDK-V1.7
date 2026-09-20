# CHDK Source Code Mirror (General Development Trunk)

This is a Git mirror of the official **Canon Hack Development Kit (CHDK)** Subversion (SVN) repository. 

CHDK is an open-source, non-destructive firmware enhancement for Canon PowerShot compact cameras. It adds features such as RAW photo capture, scripting (Lua & BASIC), advanced exposure controls, customizable OSD elements, and modular software execution without altering the camera's permanent internal flash memory.

> **Note:** This repository is an unofficial read-only mirror hosted for modern Git workflows, issue tracking, and module development. The canonical upstream repository remains hosted on Assembla SVN.

---

## 🛠 Upstream Source & Credits

* **Official SVN Repository:** [https://subversion.assembla.com/svn/chdk/trunk](https://subversion.assembla.com/svn/chdk/trunk)
* **Official Website & Docs:** [https://chdk.fandom.com/](https://chdk.fandom.com/)
* **Build Mirror / Downloads:** [https://mighty-hoernsche.de/](https://mighty-hoernsche.de/)

All code in this repository belongs to the CHDK development team and contributors.

---

## 🚀 Building from Source

To compile CHDK for a specific camera model and firmware subversion (e.g., Canon PowerShot S95 firmware `100h`):

### Prerequisites

You need the `arm-none-eabi-gcc` toolchain installed (typically `xPack arm-none-eabi-gcc 11.3.1` or compatible) and available in your `PATH`.

```bash
# Ubuntu / Debian prerequisites
sudo apt-get update
wget https://developer.arm.com/-/media/Files/downloads/gnu/11.3.rel1/binrel/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz
sudo tar -xf arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi.tar.xz -C /usr/share/
sudo mv /usr/share/arm-gnu-toolchain-11.3.rel1-x86_64-arm-none-eabi /usr/share/gcc-arm-none-eabi-11.3
sudo ln -sf /usr/share/gcc-arm-none-eabi-11.3/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc
sudo ln -sf /usr/share/gcc-arm-none-eabi-11.3/bin/arm-none-eabi-g++ /usr/bin/arm-none-eabi-g++
sudo ln -sf /usr/share/gcc-arm-none-eabi-11.3/bin/arm-none-eabi-gdb /usr/bin/arm-none-eabi-gdb
sudo ln -sf /usr/share/gcc-arm-none-eabi-11.3/bin/arm-none-eabi-size /usr/bin/arm-none-eabi-size
arm-none-eabi-gcc --version
```

Build Steps
Clone the repository:

```bash
git clone https://github.com/Anda2012/CHDK-V1.7.git chdk
cd chdk
```

Compile for your target platform:

```bash
make -j$(nproc) PLATFORM=s95 PLATFORMSUB=100h
```

Output Files:
Upon a successful build, the compiled core binaries (DISKBOOT.BIN) and modules (.flt) will be generated inside the bin/ directory.

📜 License
CHDK is licensed under the GNU General Public License v2.0 or later (GPL-2.0-or-later).
