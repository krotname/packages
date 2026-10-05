# OpenWrt packages feed

[![CI](https://github.com/krotname/packages/actions/workflows/llm-review.yml/badge.svg?branch=master)](https://github.com/krotname/packages/actions/workflows/llm-review.yml?query=branch%3Amaster)
[![License: GPL-2.0](https://img.shields.io/badge/license-GPL--2.0-blue.svg)](LICENSE)
[![Makefile](https://img.shields.io/badge/Makefile-technology-555.svg)](https://github.com/krotname/packages/search?l=Makefile)
[![Shell](https://img.shields.io/badge/Shell-technology-555.svg)](https://github.com/krotname/packages/search?l=Shell)
[![C++](https://img.shields.io/badge/C%2B%2B-technology-555.svg)](https://github.com/krotname/packages/search?l=C%2B%2B)

## Description

This is the OpenWrt "packages"-feed containing community-maintained build scripts, options and patches for applications, modules and libraries used within OpenWrt.

Installation of pre-built packages is handled directly by the **opkg** utility within your running OpenWrt system or by using the [OpenWrt SDK](https://openwrt.org/docs/guide-developer/using_the_sdk) on a build system.

## Usage

This repository is intended to be layered on-top of an OpenWrt buildroot. If you do not have an OpenWrt buildroot installed, see the documentation at: [OpenWrt Buildroot – Installation](https://openwrt.org/docs/guide-developer/build-system/install-buildsystem) on the OpenWrt support site.

This feed is enabled by default. To install all its package definitions, run:
```
./scripts/feeds update packages
./scripts/feeds install -a -p packages
```

## License

See [LICENSE](LICENSE) file.
 
## Package Guidelines

See [CONTRIBUTING.md](CONTRIBUTING.md) file.
