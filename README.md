# FreeBSD Configuration: Workstation & Development Environment

This repository contains a curated set of configuration files for a FreeBSD system, specifically tuned for **modern laptop/desktop hardware**, **high-performance networking** (BBR/RACK), and **containerization/virtualization**.

## 🛠 Core System Configurations (/etc & /boot)

### Boot & Kernel (`/boot/`)

* **`loader.conf`**: Configures the initial boot environment.
* 
**Drivers**: Loads ZFS, NVIDIA KMS, AMD temperature sensors, and High Definition Audio.


* 
**Networking**: Enables experimental but fast TCP stacks (**BBR** and **RACK**) and adds support for USB tethering (Android/iPhone).


* 
**Virtualization**: Prepares the kernel for **bhyve** hypervisor use and enables AMD-Vi for hardware passthrough.

* **`device.hints`**: Hardware-specific quirks.
* Includes custom audio routing for the **Realtek ALC257** codec, mapping internal speakers, headphones, and microphones to the correct pins.

### System Services (`/etc/rc.conf`)

The central hub for service management:

* 
**Graphics**: Enables `dbus`, `seatd`, and `wlroots` for Wayland/Sway compatibility.


* 
**Power**: Replaces the standard power daemon with `powerdxx` for better adaptive frequency scaling on AC and Battery.


* 
**Linux Compatibility**: Enables both 32-bit and 64-bit Linux binary layers.


* 
**Network**: Configures local DHCP, Bluetooth stacks (A2DP support), and hooks into the custom IPFW firewall.



### Security & Performance (`/etc/sysctl.conf`)

* 
**Network Optimization**: Sets **BBR** as the default congestion control and enables **TCP Fast Open** for lower latency.


* 
**Security**: Randomizes PIDs, restricts process visibility across different UIDs, and enables protections against SYN flood attacks.


* 
**Usability**: Allows unprivileged users to mount drives (`vfs.usermount=1`) and debug their own processes.



### Network & Firewall (`/etc/ipfw.rules`)

A stateful firewall script designed for a workstation that also acts as a **Hotspot/Gateway**:

* 
**Dynamic Detection**: Automatically detects the external interface (e.g., `re0` or `wifibox0`).


* 
**NAT**: Provides Network Address Translation for hotspot clients (`wlan0`) and Jails.


* 
**Hardening**: Includes rules to mitigate TCP scanning and fragmented packet attacks.



### Device Rules (`/etc/devfs.rules`)

* Defines permissions for hardware access.
* 
**`localrules`**: Grants the `video` group access to DRM/DRI for GPU acceleration and the `operator` group access to USB devices and HID raw nodes (useful for logic analyzers and debuggers).


* 
**`gpu_jail_rules`**: A specific ruleset to pass NVIDIA and CUDA device nodes into Jails.



---

## 📂 Other Directories

### `/home`

Contains user-specific dotfiles and desktop environment setups:

* **`config/`**: Configuration for **LabWC** (Wayland compositor), **Waybar**, **Mako** (notifications), **Fuzzel** (app launcher) and **fish** (Custom shell configurations).
* **`Desktop/`**: Desktop entries for specialized software like **STM32CubeMX** and Linux-based apps (QQ/WeChat).

### `/usr/local/etc`

* **`pkg/repos`**: Points to the USTC/Aliyun mirrors for faster package downloads in China.
* **`wifibox/`**: Configuration for the Linux-based WiFi driver bridge, used to support modern wireless cards that lack native FreeBSD drivers.

### `/etc/make.conf`

Optimizes the Ports collection builds:

* Enables parallel builds (`MAKE_JOBS_NUMBER=16`) and uses OpenSSL as the default SSL provider.
* Configures mirrors for faster fetching of source files.
