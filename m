From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun,  8 May 2016 08:30:13 +0200
Subject: [PATCH v7 0/4] Amlogic Meson GXBaby and ODROID-C2 support
Message-ID: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

this series adds a very basic support for Amlogic S905 SoC (GXBaby)
and for the ODROID-C2 board [1], and is based on u-boot sources
available from the board vendor [2]. At the moment the only supported
devices are the integrated UART and Ethernet adapter.

Changes since v6:
 - documented ARCH_MESON Kconfig entry

Changes since v5:
 - used default CONFIG_SYS_BAUDRATE_TABLE
 - removed check for CONFIG_IDENT_STRING

Changes since v4:
 - added patch to implement generic PSCI reset
 - used min() macro from linux/kernel.h

Changes since v3:
 - designware eth: added check that buffer addresses are in first 4GiB
   as suggested by Marek (and thus removed the ack tags)
 - consolidated pinmux and gpio macros
 - used get_unaligned_be64() to avoid alignment faults in dram_init()
 - uint32_t -> u32 in serial_meson.c
 - implemented reboot and read from e-fuse through secure monitor

Changes since v2:
 - squashed all platform patches into a single one
 - got rid of additional non-upstream DTS node for ethernet
 - improved board README
 - added macros for SoC registers fields

Changes since v1:
 - updated DTS files from Linux kernel
 - added Ethernet support
 - first 16MiB of RAM are now marked as unavailable; this seems to
   be required to successfully boot Linux
 - fixed typo in config file

[1] http://www.hardkernel.com/main/products/prdt_info.php?g_code=G145457216438
[2] https://github.com/hardkernel/u-boot/tree/odroidc2-v2015.01

Beniamino Galvani (4):
  arm: implement generic PSCI reset call for armv8
  net: designware: fix descriptor layout and warnings on 64-bit archs
  arm: add initial support for Amlogic Meson and ODROID-C2
  arm: meson: implement calls to secure monitor

 arch/arm/Kconfig                       |   9 ++
 arch/arm/Makefile                      |   1 +
 arch/arm/cpu/armv8/fwcall.c            |  16 +++
 arch/arm/dts/Makefile                  |   2 +
 arch/arm/dts/meson-gxbb-odroidc2.dts   |  69 +++++++++++++
 arch/arm/dts/meson-gxbb.dtsi           | 178 +++++++++++++++++++++++++++++++++
 arch/arm/include/asm/arch-meson/gxbb.h |  52 ++++++++++
 arch/arm/include/asm/arch-meson/sm.h   |  12 +++
 arch/arm/include/asm/psci.h            |  17 +++-
 arch/arm/include/asm/system.h          |   2 +
 arch/arm/mach-meson/Kconfig            |  31 ++++++
 arch/arm/mach-meson/Makefile           |   7 ++
 arch/arm/mach-meson/board.c            |  67 +++++++++++++
 arch/arm/mach-meson/sm.c               |  57 +++++++++++
 board/hardkernel/odroid-c2/Kconfig     |  12 +++
 board/hardkernel/odroid-c2/MAINTAINERS |   6 ++
 board/hardkernel/odroid-c2/Makefile    |   7 ++
 board/hardkernel/odroid-c2/README      |  60 +++++++++++
 board/hardkernel/odroid-c2/odroid-c2.c |  67 +++++++++++++
 configs/odroid-c2_defconfig            |  23 +++++
 drivers/net/designware.c               |  59 ++++++-----
 drivers/net/designware.h               |   4 +-
 drivers/serial/Kconfig                 |  15 +++
 drivers/serial/Makefile                |   1 +
 drivers/serial/serial_meson.c          | 162 ++++++++++++++++++++++++++++++
 include/configs/odroid-c2.h            |  51 ++++++++++
 26 files changed, 957 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm/dts/meson-gxbb-odroidc2.dts
 create mode 100644 arch/arm/dts/meson-gxbb.dtsi
 create mode 100644 arch/arm/include/asm/arch-meson/gxbb.h
 create mode 100644 arch/arm/include/asm/arch-meson/sm.h
 create mode 100644 arch/arm/mach-meson/Kconfig
 create mode 100644 arch/arm/mach-meson/Makefile
 create mode 100644 arch/arm/mach-meson/board.c
 create mode 100644 arch/arm/mach-meson/sm.c
 create mode 100644 board/hardkernel/odroid-c2/Kconfig
 create mode 100644 board/hardkernel/odroid-c2/MAINTAINERS
 create mode 100644 board/hardkernel/odroid-c2/Makefile
 create mode 100644 board/hardkernel/odroid-c2/README
 create mode 100644 board/hardkernel/odroid-c2/odroid-c2.c
 create mode 100644 configs/odroid-c2_defconfig
 create mode 100644 drivers/serial/serial_meson.c
 create mode 100644 include/configs/odroid-c2.h

-- 
2.7.3
