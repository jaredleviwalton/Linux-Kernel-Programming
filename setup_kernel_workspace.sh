#!/bin/bash

# Basic needs
sudo dnf -y install vim gcc make perl git fakeroot openssl-devel redhat-lsb-core openssl-devel-1:1.1.1d-2.fc31 elfutils-libelf-devel

# Static analysis tools for the Linux kernel
sudo dnf -y install sparse
# Example usage
# cd <kernel-src-tree>
# make C=1 CHECK="/usr/bin/sparse"

# Linux Trace Toolkit next generation
sudo dnf -y install lttng-tools lttng-tools-devel lttng-ust lttng-ust-devel python3-lttng python3-lttngust

# Build kernel


sudo dnf -y install fedpkg fedora-packager rpmdevtools ncurses-devel pesign grubby qt3-devel libXi-devel gcc-c++
fedpkg clone -a kernel
pushd kernel
git checkout origin/f35
sudo dnf -y builddep kernel.spec
sudo /usr/libexec/pesign/pesign-authorize
popd
rm -rf kernel
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.15.59.tar.xz
tar xf linux-5.15.59.tar.xz