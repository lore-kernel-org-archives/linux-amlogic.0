From: carlo@caione.org (Carlo Caione)
Date: Thu,  9 Jun 2016 16:45:43 +0200
Subject: [PATCH 2/2] board: amlogic: Rename folder for Amlogic boards
In-Reply-To: <1465483543-2240-1-git-send-email-carlo@caione.org>
References: <1465483543-2240-1-git-send-email-carlo@caione.org>
Message-ID: <1465483543-2240-3-git-send-email-carlo@caione.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Carlo Caione <carlo@endlessm.com>

s/hardkernel/amlogic/ to have a single place for all the amlogic-based
boards.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 arch/arm/mach-meson/Kconfig            |  2 +-
 board/amlogic/odroid-c2/Kconfig        | 12 ++++++
 board/amlogic/odroid-c2/MAINTAINERS    |  6 +++
 board/amlogic/odroid-c2/Makefile       |  7 ++++
 board/amlogic/odroid-c2/README         | 60 ++++++++++++++++++++++++++++++
 board/amlogic/odroid-c2/odroid-c2.c    | 67 ++++++++++++++++++++++++++++++++++
 board/hardkernel/odroid-c2/Kconfig     | 12 ------
 board/hardkernel/odroid-c2/MAINTAINERS |  6 ---
 board/hardkernel/odroid-c2/Makefile    |  7 ----
 board/hardkernel/odroid-c2/README      | 60 ------------------------------
 board/hardkernel/odroid-c2/odroid-c2.c | 67 ----------------------------------
 11 files changed, 153 insertions(+), 153 deletions(-)
 create mode 100644 board/amlogic/odroid-c2/Kconfig
 create mode 100644 board/amlogic/odroid-c2/MAINTAINERS
 create mode 100644 board/amlogic/odroid-c2/Makefile
 create mode 100644 board/amlogic/odroid-c2/README
 create mode 100644 board/amlogic/odroid-c2/odroid-c2.c
 delete mode 100644 board/hardkernel/odroid-c2/Kconfig
 delete mode 100644 board/hardkernel/odroid-c2/MAINTAINERS
 delete mode 100644 board/hardkernel/odroid-c2/Makefile
 delete mode 100644 board/hardkernel/odroid-c2/README
 delete mode 100644 board/hardkernel/odroid-c2/odroid-c2.c

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 77d3cfe..af3be59 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -26,6 +26,6 @@ config SYS_SOC
 config SYS_MALLOC_F_LEN
 	default 0x1000
 
-source "board/hardkernel/odroid-c2/Kconfig"
+source "board/amlogic/odroid-c2/Kconfig"
 
 endif
diff --git a/board/amlogic/odroid-c2/Kconfig b/board/amlogic/odroid-c2/Kconfig
new file mode 100644
index 0000000..2b16889
--- /dev/null
+++ b/board/amlogic/odroid-c2/Kconfig
@@ -0,0 +1,12 @@
+if TARGET_ODROID_C2
+
+config SYS_BOARD
+	default "odroid-c2"
+
+config SYS_VENDOR
+	default "amlogic"
+
+config SYS_CONFIG_NAME
+	default "odroid-c2"
+
+endif
diff --git a/board/amlogic/odroid-c2/MAINTAINERS b/board/amlogic/odroid-c2/MAINTAINERS
new file mode 100644
index 0000000..699850f
--- /dev/null
+++ b/board/amlogic/odroid-c2/MAINTAINERS
@@ -0,0 +1,6 @@
+ODROID-C2
+M:	Beniamino Galvani <b.galvani@gmail.com>
+S:	Maintained
+F:	board/amlogic/odroid-c2/
+F:	include/configs/odroid-c2.h
+F:	configs/odroid-c2_defconfig
diff --git a/board/amlogic/odroid-c2/Makefile b/board/amlogic/odroid-c2/Makefile
new file mode 100644
index 0000000..571044b
--- /dev/null
+++ b/board/amlogic/odroid-c2/Makefile
@@ -0,0 +1,7 @@
+#
+# (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+#
+# SPDX-License-Identifier:	GPL-2.0+
+#
+
+obj-y	:= odroid-c2.o
diff --git a/board/amlogic/odroid-c2/README b/board/amlogic/odroid-c2/README
new file mode 100644
index 0000000..d6d266a
--- /dev/null
+++ b/board/amlogic/odroid-c2/README
@@ -0,0 +1,60 @@
+U-Boot for ODROID-C2
+====================
+
+ODROID-C2 is a single board computer manufactured by Hardkernel
+Co. Ltd with the following specifications:
+
+ - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 2GHz
+ - ARM Mali 450 GPU
+ - 2GB DDR3 SDRAM
+ - Gigabit Ethernet
+ - HDMI 2.0 4K/60Hz display
+ - 40-pin GPIO header
+ - 4 x USB 2.0 Host, 1 x USB OTG
+ - eMMC, microSD
+ - Infrared receiver
+
+Schematics are available on the manufacturer website.
+
+Currently the u-boot port supports the following devices:
+ - serial
+ - Ethernet
+
+u-boot compilation
+==================
+
+ > export ARCH=arm
+ > export CROSS_COMPILE=aarch64-none-elf-
+ > make odroid-c2_defconfig
+ > make
+
+Image creation
+==============
+
+Amlogic doesn't provide sources for the firmware and for tools needed
+to create the bootloader image, so it is necessary to obtain them from
+the git tree published by the board vendor:
+
+ > DIR=odroid-c2
+ > git clone --depth 1 \
+       https://github.com/hardkernel/u-boot.git -b odroidc2-v2015.01 \
+       $DIR
+ > $DIR/fip/fip_create --bl30  $DIR/fip/gxb/bl30.bin \
+                       --bl301 $DIR/fip/gxb/bl301.bin \
+                       --bl31  $DIR/fip/gxb/bl31.bin \
+                       --bl33  u-boot.bin \
+                       $DIR/fip.bin
+ > $DIR/fip/fip_create --dump $DIR/fip.bin
+ > cat $DIR/fip/gxb/bl2.package $DIR/fip.bin > $DIR/boot_new.bin
+ > $DIR/fip/gxb/aml_encrypt_gxb --bootsig \
+                                --input $DIR/boot_new.bin \
+                                --output $DIR/u-boot.img
+ > dd if=$DIR/u-boot.img of=$DIR/u-boot.gxbb bs=512 skip=96
+
+and then write the image to SD with:
+
+ > DEV=/dev/your_sd_device
+ > BL1=$DIR/sd_fuse/bl1.bin.hardkernel
+ > dd if=$BL1 of=$DEV conv=fsync bs=1 count=442
+ > dd if=$BL1 of=$DEV conv=fsync bs=512 skip=1 seek=1
+ > dd if=$DIR/u-boot.gxbb of=$DEV conv=fsync bs=512 seek=97
diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
new file mode 100644
index 0000000..bd72100
--- /dev/null
+++ b/board/amlogic/odroid-c2/odroid-c2.c
@@ -0,0 +1,67 @@
+/*
+ * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <asm/io.h>
+#include <asm/arch/gxbb.h>
+#include <asm/arch/sm.h>
+#include <dm/platdata.h>
+#include <phy.h>
+
+#define EFUSE_SN_OFFSET		20
+#define EFUSE_SN_SIZE		16
+#define EFUSE_MAC_OFFSET	52
+#define EFUSE_MAC_SIZE		6
+
+int board_init(void)
+{
+	return 0;
+}
+
+static const struct eth_pdata gxbb_eth_pdata = {
+	.iobase = GXBB_ETH_BASE,
+	.phy_interface = PHY_INTERFACE_MODE_RGMII,
+};
+
+U_BOOT_DEVICE(meson_eth) = {
+	.name = "eth_designware",
+	.platdata = &gxbb_eth_pdata,
+};
+
+int misc_init_r(void)
+{
+	u8 mac_addr[EFUSE_MAC_SIZE];
+	ssize_t len;
+
+	/* Select Ethernet function */
+	setbits_le32(GXBB_PINMUX(6), 0x3fff);
+
+	/* Set RGMII mode */
+	setbits_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_PHY_INTF |
+				     GXBB_ETH_REG_0_TX_PHASE(1) |
+				     GXBB_ETH_REG_0_TX_RATIO(4) |
+				     GXBB_ETH_REG_0_PHY_CLK_EN |
+				     GXBB_ETH_REG_0_CLK_EN);
+
+	/* Enable power and clock gate */
+	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
+	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
+
+	/* Reset PHY on GPIOZ_14 */
+	clrbits_le32(GXBB_GPIO_EN(3), BIT(14));
+	clrbits_le32(GXBB_GPIO_OUT(3), BIT(14));
+	mdelay(10);
+	setbits_le32(GXBB_GPIO_OUT(3), BIT(14));
+
+	if (!eth_getenv_enetaddr("ethaddr", mac_addr)) {
+		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
+					  mac_addr, EFUSE_MAC_SIZE);
+		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
+			eth_setenv_enetaddr("ethaddr", mac_addr);
+	}
+
+	return 0;
+}
diff --git a/board/hardkernel/odroid-c2/Kconfig b/board/hardkernel/odroid-c2/Kconfig
deleted file mode 100644
index 687d9c6..0000000
--- a/board/hardkernel/odroid-c2/Kconfig
+++ /dev/null
@@ -1,12 +0,0 @@
-if TARGET_ODROID_C2
-
-config SYS_BOARD
-	default "odroid-c2"
-
-config SYS_VENDOR
-	default "hardkernel"
-
-config SYS_CONFIG_NAME
-	default "odroid-c2"
-
-endif
diff --git a/board/hardkernel/odroid-c2/MAINTAINERS b/board/hardkernel/odroid-c2/MAINTAINERS
deleted file mode 100644
index 23ae1e7..0000000
--- a/board/hardkernel/odroid-c2/MAINTAINERS
+++ /dev/null
@@ -1,6 +0,0 @@
-ODROID-C2
-M:	Beniamino Galvani <b.galvani@gmail.com>
-S:	Maintained
-F:	board/hardkernel/odroid-c2/
-F:	include/configs/odroid-c2.h
-F:	configs/odroid-c2_defconfig
diff --git a/board/hardkernel/odroid-c2/Makefile b/board/hardkernel/odroid-c2/Makefile
deleted file mode 100644
index 571044b..0000000
--- a/board/hardkernel/odroid-c2/Makefile
+++ /dev/null
@@ -1,7 +0,0 @@
-#
-# (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
-#
-# SPDX-License-Identifier:	GPL-2.0+
-#
-
-obj-y	:= odroid-c2.o
diff --git a/board/hardkernel/odroid-c2/README b/board/hardkernel/odroid-c2/README
deleted file mode 100644
index d6d266a..0000000
--- a/board/hardkernel/odroid-c2/README
+++ /dev/null
@@ -1,60 +0,0 @@
-U-Boot for ODROID-C2
-====================
-
-ODROID-C2 is a single board computer manufactured by Hardkernel
-Co. Ltd with the following specifications:
-
- - Amlogic S905 ARM Cortex-A53 quad-core SoC @ 2GHz
- - ARM Mali 450 GPU
- - 2GB DDR3 SDRAM
- - Gigabit Ethernet
- - HDMI 2.0 4K/60Hz display
- - 40-pin GPIO header
- - 4 x USB 2.0 Host, 1 x USB OTG
- - eMMC, microSD
- - Infrared receiver
-
-Schematics are available on the manufacturer website.
-
-Currently the u-boot port supports the following devices:
- - serial
- - Ethernet
-
-u-boot compilation
-==================
-
- > export ARCH=arm
- > export CROSS_COMPILE=aarch64-none-elf-
- > make odroid-c2_defconfig
- > make
-
-Image creation
-==============
-
-Amlogic doesn't provide sources for the firmware and for tools needed
-to create the bootloader image, so it is necessary to obtain them from
-the git tree published by the board vendor:
-
- > DIR=odroid-c2
- > git clone --depth 1 \
-       https://github.com/hardkernel/u-boot.git -b odroidc2-v2015.01 \
-       $DIR
- > $DIR/fip/fip_create --bl30  $DIR/fip/gxb/bl30.bin \
-                       --bl301 $DIR/fip/gxb/bl301.bin \
-                       --bl31  $DIR/fip/gxb/bl31.bin \
-                       --bl33  u-boot.bin \
-                       $DIR/fip.bin
- > $DIR/fip/fip_create --dump $DIR/fip.bin
- > cat $DIR/fip/gxb/bl2.package $DIR/fip.bin > $DIR/boot_new.bin
- > $DIR/fip/gxb/aml_encrypt_gxb --bootsig \
-                                --input $DIR/boot_new.bin \
-                                --output $DIR/u-boot.img
- > dd if=$DIR/u-boot.img of=$DIR/u-boot.gxbb bs=512 skip=96
-
-and then write the image to SD with:
-
- > DEV=/dev/your_sd_device
- > BL1=$DIR/sd_fuse/bl1.bin.hardkernel
- > dd if=$BL1 of=$DEV conv=fsync bs=1 count=442
- > dd if=$BL1 of=$DEV conv=fsync bs=512 skip=1 seek=1
- > dd if=$DIR/u-boot.gxbb of=$DEV conv=fsync bs=512 seek=97
diff --git a/board/hardkernel/odroid-c2/odroid-c2.c b/board/hardkernel/odroid-c2/odroid-c2.c
deleted file mode 100644
index bd72100..0000000
--- a/board/hardkernel/odroid-c2/odroid-c2.c
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
- *
- * SPDX-License-Identifier:	GPL-2.0+
- */
-
-#include <common.h>
-#include <asm/io.h>
-#include <asm/arch/gxbb.h>
-#include <asm/arch/sm.h>
-#include <dm/platdata.h>
-#include <phy.h>
-
-#define EFUSE_SN_OFFSET		20
-#define EFUSE_SN_SIZE		16
-#define EFUSE_MAC_OFFSET	52
-#define EFUSE_MAC_SIZE		6
-
-int board_init(void)
-{
-	return 0;
-}
-
-static const struct eth_pdata gxbb_eth_pdata = {
-	.iobase = GXBB_ETH_BASE,
-	.phy_interface = PHY_INTERFACE_MODE_RGMII,
-};
-
-U_BOOT_DEVICE(meson_eth) = {
-	.name = "eth_designware",
-	.platdata = &gxbb_eth_pdata,
-};
-
-int misc_init_r(void)
-{
-	u8 mac_addr[EFUSE_MAC_SIZE];
-	ssize_t len;
-
-	/* Select Ethernet function */
-	setbits_le32(GXBB_PINMUX(6), 0x3fff);
-
-	/* Set RGMII mode */
-	setbits_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_PHY_INTF |
-				     GXBB_ETH_REG_0_TX_PHASE(1) |
-				     GXBB_ETH_REG_0_TX_RATIO(4) |
-				     GXBB_ETH_REG_0_PHY_CLK_EN |
-				     GXBB_ETH_REG_0_CLK_EN);
-
-	/* Enable power and clock gate */
-	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
-	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
-
-	/* Reset PHY on GPIOZ_14 */
-	clrbits_le32(GXBB_GPIO_EN(3), BIT(14));
-	clrbits_le32(GXBB_GPIO_OUT(3), BIT(14));
-	mdelay(10);
-	setbits_le32(GXBB_GPIO_OUT(3), BIT(14));
-
-	if (!eth_getenv_enetaddr("ethaddr", mac_addr)) {
-		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
-					  mac_addr, EFUSE_MAC_SIZE);
-		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
-			eth_setenv_enetaddr("ethaddr", mac_addr);
-	}
-
-	return 0;
-}
-- 
2.7.4
