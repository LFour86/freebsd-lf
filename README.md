# freebsd-lf

A comprehensive FreeBSD configuration collection for desktop workstations with Linux compatibility, GPU acceleration, and network services.

## Overview

This repository contains production-ready configuration files for FreeBSD systems, optimized for desktop use with support for virtualization, wireless networking, and Linux application compatibility. The configurations are organized to mirror standard FreeBSD system paths for easy deployment.

## Features

### Desktop Environment
- LightDM display manager with Wayland compositor support
- NVIDIA GPU driver configuration with modeset support
- Hardware acceleration and video playback optimization
- Bluetooth audio (A2DP) and device management

### Linux Compatibility
- Linux binary compatibility layer with kernel 6.18.9 emulation
- Support for running Linux applications natively
- FUSE filesystem support for Linux-compatible mounting

### Network Services
- IPFW firewall with stateful packet inspection
- NAT configuration for wireless hotspot functionality
- DNS and DHCP services via dnsmasq
- NFS and Samba file sharing
- SSH server with fail2ban brute-force protection

### System Optimization
- ZFS filesystem with SSD optimizations
- TCP BBR and RACK congestion control algorithms
- CPU thermal monitoring and power management
- Security hardening through sysctl parameters

### Virtualization
- bhyve hypervisor support
- libvirt integration for VM management
- Device passthrough capabilities

## File Structure

```
boot/
  device.hints      - Device configuration hints
  loader.conf       - Boot loader settings and kernel modules

etc/
  rc.conf           - System and service configuration
  sysctl.conf       - Kernel runtime parameters
  ipfw.rules        - Firewall ruleset
  fstab             - Filesystem mount table
  devfs.rules       - Device filesystem permissions
  motd.template     - Message of the day template
  make.conf         - Build system options

usr/local/etc/
  rc.motd           - Dynamic MOTD generation script
```

## Installation

1. Review configurations and adjust network interfaces, hostnames, and paths to match your system
2. Copy files to their corresponding system locations
3. Update device names in `ipfw.rules` and `rc.conf` based on your hardware
4. Verify ZFS pool names and mount points in `fstab`
5. Reboot to apply changes

## Key Configuration Points

### Network Interfaces
- `re0`: Primary wired Ethernet interface
- `rtwn0/wlan0`: Wireless interface for WiFi and hotspot
- `wifibox0`: Virtualized network interface

### Firewall
The IPFW ruleset follows a deny-by-default policy:
- Allows all outbound traffic from the local system
- NAT for hotspot clients on specified subnet
- Blocks unsolicited inbound connections
- Permits essential services (DHCP, DNS, ICMP)

### GPU Drivers
Configured for NVIDIA by default. To use AMD GPUs, comment out NVIDIA settings in `loader.conf` and enable the AMD section.

### Power Management
Adaptive CPU frequency scaling configured via powerd with:
- 75% minimum frequency on AC power
- 60% reduction threshold
- 100% performance maximum

## Security Notes

- Processes cannot see other users' processes by default
- Random PID assignment enabled
- Core dumps restricted to `/var/coredump/`
- TCP SYN cookies enabled to prevent SYN flood attacks
- Port randomization active

## Requirements

- FreeBSD 14.0 or later recommended
- ZFS root filesystem
- Compatible wireless adapter for hotspot functionality
- NVIDIA or AMD GPU for graphics acceleration

## Customization

Before deploying, ensure you modify:
- Hostname in `rc.conf`
- Network interface names throughout all files
- Wireless country code and regulatory domain
- VM storage directory paths
- Hotspot subnet ranges

## License

This configuration collection is provided **as-is** for reference and adaptation to your specific FreeBSD deployment.

This project is licensed under the **BSD 2-Clause License**. See the [LICENSE](LICENSE) file for the full license text.
