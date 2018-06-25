From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 25 Jun 2018 16:50:15 +0200
Subject: [PATCH u-boot 0/2] Add support for the FriendlyElec NanoPi K2 board
Message-ID: <1529938217-4196-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This adds platform code for the FriendlyElec NanoPi K2 board based on a
Meson GXBB (S905) SoC with the Meson GXBB configuration.

This initial submission only supports:
- UART
- MMC/SDCard
- Ethernet
- Reset Controller
- Clock controller

A sync with Linux 4.17 to get the device tree is also necessary.

Neil Armstrong (1):
  ARM: dts: sync meson-gxbb-nanopi-k2 from Linux 4.17

Thomas McKahan (1):
  boards: amlogic: Add FriendlyElec NanoPi K2 board support

 arch/arm/dts/Makefile                 |   2 +
 arch/arm/dts/meson-gxbb-nanopi-k2.dts | 323 ++++++++++++++++++++++++++++++++++
 arch/arm/mach-meson/Kconfig           |   8 +
 board/amlogic/nanopi-k2/Kconfig       |  12 ++
 board/amlogic/nanopi-k2/MAINTAINERS   |   6 +
 board/amlogic/nanopi-k2/Makefile      |   7 +
 board/amlogic/nanopi-k2/README        |  99 +++++++++++
 board/amlogic/nanopi-k2/nanopi-k2.c   |  61 +++++++
 configs/nanopi-k2_defconfig           |  40 +++++
 include/configs/nanopi-k2.h           |  18 ++
 10 files changed, 576 insertions(+)
 create mode 100644 arch/arm/dts/meson-gxbb-nanopi-k2.dts
 create mode 100644 board/amlogic/nanopi-k2/Kconfig
 create mode 100644 board/amlogic/nanopi-k2/MAINTAINERS
 create mode 100644 board/amlogic/nanopi-k2/Makefile
 create mode 100644 board/amlogic/nanopi-k2/README
 create mode 100644 board/amlogic/nanopi-k2/nanopi-k2.c
 create mode 100644 configs/nanopi-k2_defconfig
 create mode 100644 include/configs/nanopi-k2.h

-- 
2.7.4
