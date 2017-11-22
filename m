From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 22 Nov 2017 14:25:50 +0100
Subject: [PATCH v2 4/5] arm: Add LibreTech CC support based on Meson GXL family
In-Reply-To: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
References: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1511357151-3771-5-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This adds platform code for the Libre Computer CC "Le Potato" board based on a
Meson GXL (S905X) SoC with the Meson GXL configuration.

This initial submission supports UART, MMC/SDCard and Ethernet with the
Internal RMII PHY.

The meson-gxl-s905x-libretech-cc.dts is synchronised from the linux 4.13
stable tree as of 4.13.8.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/dts/Makefile                         |   3 +-
 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts | 171 ++++++++++++++++++++++++++
 arch/arm/mach-meson/Kconfig                   |   9 ++
 board/amlogic/libretech-cc/Kconfig            |  12 ++
 board/amlogic/libretech-cc/MAINTAINERS        |   6 +
 board/amlogic/libretech-cc/Makefile           |   8 ++
 board/amlogic/libretech-cc/README             |  96 +++++++++++++++
 board/amlogic/libretech-cc/libretech-cc.c     |  52 ++++++++
 configs/libretech-cc_defconfig                |  35 ++++++
 include/configs/libretech-cc.h                |  21 ++++
 10 files changed, 412 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
 create mode 100644 board/amlogic/libretech-cc/Kconfig
 create mode 100644 board/amlogic/libretech-cc/MAINTAINERS
 create mode 100644 board/amlogic/libretech-cc/Makefile
 create mode 100644 board/amlogic/libretech-cc/README
 create mode 100644 board/amlogic/libretech-cc/libretech-cc.c
 create mode 100644 configs/libretech-cc_defconfig
 create mode 100644 include/configs/libretech-cc.h

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index cd540e9..1845552 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -55,7 +55,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rv1108-evb.dtb
 dtb-$(CONFIG_ARCH_MESON) += \
 	meson-gxbb-odroidc2.dtb \
-	meson-gxl-s905x-p212.dtb
+	meson-gxl-s905x-p212.dtb \
+	meson-gxl-s905x-libretech-cc.dtb
 dtb-$(CONFIG_TEGRA) += tegra20-harmony.dtb \
 	tegra20-medcom-wide.dtb \
 	tegra20-paz00.dtb \
diff --git a/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts b/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
new file mode 100644
index 0000000..266fbcf
--- /dev/null
+++ b/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
@@ -0,0 +1,171 @@
+/*
+ * Copyright (c) 2017 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+
+#include "meson-gxl-s905x.dtsi"
+
+/ {
+	compatible = "libretech,cc", "amlogic,s905x", "amlogic,meson-gxl";
+	model = "Libre Technology CC";
+
+	aliases {
+		serial0 = &uart_AO;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	cvbs-connector {
+		compatible = "composite-video-connector";
+
+		port {
+			cvbs_connector_in: endpoint {
+				remote-endpoint = <&cvbs_vdac_out>;
+			};
+		};
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		system {
+			label = "librecomputer:system-status";
+			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			panic-indicator;
+		};
+
+		blue {
+			label = "librecomputer:blue";
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	memory at 0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	vcc_3v3: regulator-vcc_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vcc_card: regulator-vcc-card {
+		compatible = "regulator-gpio";
+
+		regulator-name = "VCC_CARD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+
+		states = <3300000 0>,
+			 <1800000 1>;
+	};
+
+	vddio_boot: regulator-vddio_boot {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
+};
+
+&ethmac {
+	status = "okay";
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-names = "default";
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+/* SD card */
+&sd_emmc_b {
+	status = "okay";
+	pinctrl-0 = <&sdcard_pins>;
+	pinctrl-names = "default";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_card>;
+};
+
+/* eMMC */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>;
+	pinctrl-names = "default";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <50000000>;
+	non-removable;
+	disable-wp;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index d4bd230..ca08dc3 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -38,6 +38,13 @@ config TARGET_P212
 	  with 2 GiB of RAM, Ethernet, HDMI, 2 USB, micro-SD slot,
 	  eMMC, IR receiver, CVBS+Audio jack and a SDIO WiFi module.
 
+config TARGET_LIBRETECH_CC
+	bool "LIBRETECH-CC"
+	help
+	  LibreTech CC is a single board computer based on Meson GXL
+	  with 2 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
+	  eMMC, IR receiver and a 40-pin GPIO header.
+
 endif
 
 config SYS_SOC
@@ -50,4 +57,6 @@ source "board/amlogic/odroid-c2/Kconfig"
 
 source "board/amlogic/p212/Kconfig"
 
+source "board/amlogic/libretech-cc/Kconfig"
+
 endif
diff --git a/board/amlogic/libretech-cc/Kconfig b/board/amlogic/libretech-cc/Kconfig
new file mode 100644
index 0000000..7a6f916
--- /dev/null
+++ b/board/amlogic/libretech-cc/Kconfig
@@ -0,0 +1,12 @@
+if TARGET_LIBRETECH_CC
+
+config SYS_BOARD
+	default "libretech-cc"
+
+config SYS_VENDOR
+	default "amlogic"
+
+config SYS_CONFIG_NAME
+	default "libretech-cc"
+
+endif
diff --git a/board/amlogic/libretech-cc/MAINTAINERS b/board/amlogic/libretech-cc/MAINTAINERS
new file mode 100644
index 0000000..398ce57
--- /dev/null
+++ b/board/amlogic/libretech-cc/MAINTAINERS
@@ -0,0 +1,6 @@
+LIBRETECH-CC
+M:	Neil Armstrong <narmstrong@baylibre.com>
+S:	Maintained
+F:	board/amlogic/libretech-cc/
+F:	include/configs/libretech-cc.h
+F:	configs/libretech-cc_defconfig
diff --git a/board/amlogic/libretech-cc/Makefile b/board/amlogic/libretech-cc/Makefile
new file mode 100644
index 0000000..d0e3bbb
--- /dev/null
+++ b/board/amlogic/libretech-cc/Makefile
@@ -0,0 +1,8 @@
+#
+# (C) Copyright 2016 BayLibre, SAS
+# Author: Neil Armstrong <narmstrong@baylibre.com>
+#
+# SPDX-License-Identifier:	GPL-2.0+
+#
+
+obj-y	:= libretech-cc.o
diff --git a/board/amlogic/libretech-cc/README b/board/amlogic/libretech-cc/README
new file mode 100644
index 0000000..8b38fff
--- /dev/null
+++ b/board/amlogic/libretech-cc/README
@@ -0,0 +1,96 @@
+U-Boot for LibreTech CC
+=======================
+
+LibreTech CC is a single board computer manufactured by Libre Technology
+with the following specifications:
+
+ - Amlogic S905X ARM Cortex-A53 quad-core SoC @ 2GHz
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
+Currently the U-Boot port supports the following devices:
+ - serial
+ - eMMC, microSD
+ - Ethernet
+
+u-boot compilation
+==================
+
+ > export ARCH=arm
+ > export CROSS_COMPILE=aarch64-none-elf-
+ > make libretech-cc_defconfig
+ > make
+
+Image creation
+==============
+
+Amlogic doesn't provide sources for the firmware and for tools needed
+to create the bootloader image, so it is necessary to obtain them from
+the git tree published by the board vendor:
+
+ > wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
+ > wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
+ > tar xvfJ gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
+ > tar xvfJ gcc-linaro-arm-none-eabi-4.8-2013.11_linux.tar.xz
+ > export PATH=$PWD/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:$PWD/gcc-linaro-arm-none-eabi-4.8-2013.11_linux/bin:$PATH
+ > git clone https://github.com/BayLibre/u-boot.git -b libretech-cc amlogic-u-boot
+ > cd amlogic-u-boot
+ > make libretech_cc_defconfig
+ > make
+ > export FIPDIR=$PWD/fip
+
+Go back to mainline U-Boot source tree then :
+ > mkdir fip
+
+ > cp $FIPDIR/gxl/bl2.bin fip/
+ > cp $FIPDIR/gxl/acs.bin fip/
+ > cp $FIPDIR/gxl/bl21.bin fip/
+ > cp $FIPDIR/gxl/bl30.bin fip/
+ > cp $FIPDIR/gxl/bl301.bin fip/
+ > cp $FIPDIR/gxl/bl31.img fip/
+ > cp u-boot.bin fip/bl33.bin
+
+ > $FIPDIR/blx_fix.sh \
+	fip/bl30.bin \
+	fip/zero_tmp \
+	fip/bl30_zero.bin \
+	fip/bl301.bin \
+	fip/bl301_zero.bin \
+	fip/bl30_new.bin \
+	bl30
+
+ > $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
+
+ > $FIPDIR/blx_fix.sh \
+	fip/bl2_acs.bin \
+	fip/zero_tmp \
+	fip/bl2_zero.bin \
+	fip/bl21.bin \
+	fip/bl21_zero.bin \
+	fip/bl2_new.bin \
+	bl2
+
+ > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
+ > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
+ > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
+ > $FIPDIR/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
+ > $FIPDIR/gxl/aml_encrypt_gxl --bootmk \
+		--output fip/u-boot.bin \
+		--bl2 fip/bl2.n.bin.sig \
+		--bl30 fip/bl30_new.bin.enc \
+		--bl31 fip/bl31.img.enc \
+		--bl33 fip/bl33.bin.enc
+
+and then write the image to SD with:
+
+ > DEV=/dev/your_sd_device
+ > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
+ > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
diff --git a/board/amlogic/libretech-cc/libretech-cc.c b/board/amlogic/libretech-cc/libretech-cc.c
new file mode 100644
index 0000000..4125f0f
--- /dev/null
+++ b/board/amlogic/libretech-cc/libretech-cc.c
@@ -0,0 +1,52 @@
+/*
+ * Copyright (C) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <asm/io.h>
+#include <asm/arch/gxbb.h>
+#include <asm/arch/sm.h>
+#include <asm/arch/eth.h>
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
+int misc_init_r(void)
+{
+	u8 mac_addr[EFUSE_MAC_SIZE];
+	char serial[EFUSE_SN_SIZE];
+	ssize_t len;
+
+	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII, true);
+
+	/* Enable power and clock gate */
+	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
+	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
+
+	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
+		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
+					  mac_addr, EFUSE_MAC_SIZE);
+		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
+			eth_env_set_enetaddr("ethaddr", mac_addr);
+	}
+
+	if (!env_get("serial#")) {
+		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
+			EFUSE_SN_SIZE);
+		if (len == EFUSE_SN_SIZE)
+			env_set("serial#", serial);
+	}
+
+	return 0;
+}
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
new file mode 100644
index 0000000..a63e940
--- /dev/null
+++ b/configs/libretech-cc_defconfig
@@ -0,0 +1,35 @@
+CONFIG_ARM=y
+CONFIG_ARCH_MESON=y
+CONFIG_MESON_GXL=y
+CONFIG_TARGET_LIBRETECH_CC=y
+CONFIG_IDENT_STRING=" libretech-cc"
+CONFIG_DEFAULT_DEVICE_TREE="meson-gxl-s905x-libretech-cc"
+CONFIG_DEBUG_UART=y
+CONFIG_ENV_IS_NOWHERE=y
+# CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_DISPLAY_BOARDINFO is not set
+# CONFIG_CMD_BDI is not set
+# CONFIG_CMD_IMI is not set
+# CONFIG_CMD_IMLS is not set
+# CONFIG_CMD_LOADS is not set
+CONFIG_CMD_MMC=y
+# CONFIG_CMD_FPGA is not set
+CONFIG_CMD_GPIO=y
+# CONFIG_CMD_SETEXPR is not set
+CONFIG_OF_CONTROL=y
+CONFIG_DM_GPIO=y
+CONFIG_DM_MMC=y
+CONFIG_MMC_MESON_GX=y
+CONFIG_DM_ETH=y
+CONFIG_ETH_DESIGNWARE=y
+CONFIG_PHY_MESON_GXL=y
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_MESON_GXL=y
+CONFIG_DEBUG_UART_MESON=y
+CONFIG_DEBUG_UART_BASE=0xc81004c0
+CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_DEBUG_UART_ANNOUNCE=y
+CONFIG_DEBUG_UART_SKIP_INIT=y
+CONFIG_MESON_SERIAL=y
+CONFIG_OF_LIBFDT_OVERLAY=y
diff --git a/include/configs/libretech-cc.h b/include/configs/libretech-cc.h
new file mode 100644
index 0000000..c06e40a
--- /dev/null
+++ b/include/configs/libretech-cc.h
@@ -0,0 +1,21 @@
+/*
+ * Configuration for LibreTech CC
+ *
+ * Copyright (C) 2017 Baylibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef __CONFIG_H
+#define __CONFIG_H
+
+#define CONFIG_MISC_INIT_R
+
+#define CONFIG_PHY_ADDR 		8
+
+#define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxl-s905x-libretech-cc.dtb\0"
+
+#include <configs/meson-gxbb-common.h>
+
+#endif /* __CONFIG_H */
-- 
2.7.4
