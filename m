From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 27 Nov 2017 10:16:20 +0100
Subject: [PATCH u-boot v3 5/5] arm: Add Khadas VIM support based on Meson GXL
 family
In-Reply-To: <1511774180-22672-1-git-send-email-narmstrong@baylibre.com>
References: <1511774180-22672-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1511774180-22672-6-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This adds platform code for the Khadas VIM board based on a
Meson GXL (S905X) SoC with the Meson GXL configuration.

This initial submission supports UART, MMC/SDCard and Ethernet with the
Internal RMII PHY.

The meson-gxl-s905x-khadas-vim.dts is synchronised from the linux 4.13
stable tree as of 4.13.8.

Reviewed-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/dts/Makefile                       |   3 +-
 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts | 137 ++++++++++++++++++++++++++++
 arch/arm/mach-meson/Kconfig                 |   9 ++
 board/amlogic/khadas-vim/Kconfig            |  12 +++
 board/amlogic/khadas-vim/MAINTAINERS        |   6 ++
 board/amlogic/khadas-vim/Makefile           |   8 ++
 board/amlogic/khadas-vim/README             |  96 +++++++++++++++++++
 board/amlogic/khadas-vim/khadas-vim.c       |  49 ++++++++++
 configs/khadas-vim_defconfig                |  35 +++++++
 include/configs/khadas-vim.h                |  21 +++++
 10 files changed, 375 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
 create mode 100644 board/amlogic/khadas-vim/Kconfig
 create mode 100644 board/amlogic/khadas-vim/MAINTAINERS
 create mode 100644 board/amlogic/khadas-vim/Makefile
 create mode 100644 board/amlogic/khadas-vim/README
 create mode 100644 board/amlogic/khadas-vim/khadas-vim.c
 create mode 100644 configs/khadas-vim_defconfig
 create mode 100644 include/configs/khadas-vim.h

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 1845552..b44a915 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -56,7 +56,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 dtb-$(CONFIG_ARCH_MESON) += \
 	meson-gxbb-odroidc2.dtb \
 	meson-gxl-s905x-p212.dtb \
-	meson-gxl-s905x-libretech-cc.dtb
+	meson-gxl-s905x-libretech-cc.dtb \
+	meson-gxl-s905x-khadas-vim.dtb
 dtb-$(CONFIG_TEGRA) += tegra20-harmony.dtb \
 	tegra20-medcom-wide.dtb \
 	tegra20-paz00.dtb \
diff --git a/arch/arm/dts/meson-gxl-s905x-khadas-vim.dts b/arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
new file mode 100644
index 0000000..94567eb
--- /dev/null
+++ b/arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
@@ -0,0 +1,137 @@
+/*
+ * Copyright (c) 2017 Martin Blumenstingl <martin.blumenstingl@googlemail.com>.
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+
+#include "meson-gxl-s905x-p212.dtsi"
+
+/ {
+	compatible = "khadas,vim", "amlogic,s905x", "amlogic,meson-gxl";
+	model = "Khadas VIM";
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+
+		button-function {
+			label = "Function";
+			linux,code = <KEY_FN>;
+			press-threshold-microvolt = <10000>;
+		};
+	};
+
+	aliases {
+		serial2 = &uart_AO_B;
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <100>;
+
+		button at 0 {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	pwmleds {
+		compatible = "pwm-leds";
+
+		power {
+			label = "vim:red:power";
+			pwms = <&pwm_AO_ab 1 7812500 0>;
+			max-brightness = <255>;
+			linux,default-trigger = "default-on";
+		};
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
+&i2c_A {
+	status = "okay";
+	pinctrl-0 = <&i2c_a_pins>;
+	pinctrl-names = "default";
+};
+
+&i2c_B {
+	status = "okay";
+	pinctrl-0 = <&i2c_b_pins>;
+	pinctrl-names = "default";
+
+	rtc: rtc at 51 {
+		/* has to be enabled manually when a battery is connected: */
+		status = "disabled";
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "xin32k";
+	};
+};
+
+&ir {
+	linux,rc-map-name = "rc-geekbox";
+};
+
+&pwm_AO_ab {
+	status = "okay";
+	pinctrl-0 = <&pwm_ao_a_3_pins>, <&pwm_ao_b_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal> , <&xtal>;
+	clock-names = "clkin0", "clkin1" ;
+};
+
+&pwm_ef {
+	pinctrl-0 = <&pwm_e_pins>, <&pwm_f_clk_pins>;
+};
+
+&sd_emmc_a {
+	brcmf: wifi at 1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
+/* This is brought out on the Linux_RX (18) and Linux_TX (19) pins: */
+&uart_AO {
+	status = "okay";
+};
+
+/* This is brought out on the UART_RX_AO_B (15) and UART_TX_AO_B (16) pins: */
+&uart_AO_B {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_b_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index ca08dc3..0350787 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -45,6 +45,13 @@ config TARGET_LIBRETECH_CC
 	  with 2 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
 	  eMMC, IR receiver and a 40-pin GPIO header.
 
+config TARGET_KHADAS_VIM
+	bool "KHADAS-VIM"
+	help
+	  Khadas VIM is a single board computer based on Meson GXL
+	  with 2 GiB of RAM, Ethernet, HDMI, 4 USB, micro-SD slot,
+	  eMMC, IR receiver and a 40-pin GPIO header.
+
 endif
 
 config SYS_SOC
@@ -59,4 +66,6 @@ source "board/amlogic/p212/Kconfig"
 
 source "board/amlogic/libretech-cc/Kconfig"
 
+source "board/amlogic/khadas-vim/Kconfig"
+
 endif
diff --git a/board/amlogic/khadas-vim/Kconfig b/board/amlogic/khadas-vim/Kconfig
new file mode 100644
index 0000000..0fa8db9
--- /dev/null
+++ b/board/amlogic/khadas-vim/Kconfig
@@ -0,0 +1,12 @@
+if TARGET_KHADAS_VIM
+
+config SYS_BOARD
+	default "khadas-vim"
+
+config SYS_VENDOR
+	default "amlogic"
+
+config SYS_CONFIG_NAME
+	default "khadas-vim"
+
+endif
diff --git a/board/amlogic/khadas-vim/MAINTAINERS b/board/amlogic/khadas-vim/MAINTAINERS
new file mode 100644
index 0000000..024220a
--- /dev/null
+++ b/board/amlogic/khadas-vim/MAINTAINERS
@@ -0,0 +1,6 @@
+KHADAS-VIM
+M:	Neil Armstrong <narmstrong@baylibre.com>
+S:	Maintained
+F:	board/amlogic/khadas-vim/
+F:	include/configs/khadas-vim.h
+F:	configs/khadas-vim_defconfig
diff --git a/board/amlogic/khadas-vim/Makefile b/board/amlogic/khadas-vim/Makefile
new file mode 100644
index 0000000..eedc1bf
--- /dev/null
+++ b/board/amlogic/khadas-vim/Makefile
@@ -0,0 +1,8 @@
+#
+# (C) Copyright 2016 BayLibre, SAS
+# Author: Neil Armstrong <narmstrong@baylibre.com>
+#
+# SPDX-License-Identifier:	GPL-2.0+
+#
+
+obj-y	:= khadas-vim.o
diff --git a/board/amlogic/khadas-vim/README b/board/amlogic/khadas-vim/README
new file mode 100644
index 0000000..0478eee
--- /dev/null
+++ b/board/amlogic/khadas-vim/README
@@ -0,0 +1,96 @@
+U-Boot for Khadas VIM
+=======================
+
+Khadas VIM is an Open Source DIY Box manufactured by Shenzhen Tomato
+Technology Co., Ltd with the following specifications:
+
+ - Amlogic S905x ARM Cortex-A53 quad-core SoC @ 2GHz
+ - ARM Mali 450 GPU
+ - 2GB DDR3 SDRAM
+ - 10/100 Ethernet
+ - HDMI 2.0 4K/60Hz display
+ - 40-pin GPIO header
+ - 2 x USB 2.0 Host, 1 x USB 2.0 Type-C OTG
+ - 8GB/16GBeMMC
+ - microSD
+ - SDIO Wifi Module, Bluetooth
+ - Two channels IR receiver
+
+Currently the u-boot port supports the following devices:
+ - serial
+ - eMMC, microSD
+ - Ethernet
+
+U-Boot compilation
+==================
+
+ > export ARCH=arm
+ > export CROSS_COMPILE=aarch64-none-elf-
+ > make khadas-vim_defconfig
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
+ > git clone https://github.com/khadas/u-boot -b Vim vim-u-boot
+ > cd vim-u-boot
+ > make kvim_defconfig
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
diff --git a/board/amlogic/khadas-vim/khadas-vim.c b/board/amlogic/khadas-vim/khadas-vim.c
new file mode 100644
index 0000000..db9c292
--- /dev/null
+++ b/board/amlogic/khadas-vim/khadas-vim.c
@@ -0,0 +1,49 @@
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
+	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII,
+			  MESON_GXL_USE_INTERNAL_RMII_PHY);
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
+					  EFUSE_SN_SIZE);
+		if (len == EFUSE_SN_SIZE)
+			env_set("serial#", serial);
+	}
+
+	return 0;
+}
diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
new file mode 100644
index 0000000..dcccc69
--- /dev/null
+++ b/configs/khadas-vim_defconfig
@@ -0,0 +1,35 @@
+CONFIG_ARM=y
+CONFIG_ARCH_MESON=y
+CONFIG_MESON_GXL=y
+CONFIG_TARGET_KHADAS_VIM=y
+CONFIG_IDENT_STRING=" khadas-vim"
+CONFIG_DEFAULT_DEVICE_TREE="meson-gxl-s905x-khadas-vim"
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
diff --git a/include/configs/khadas-vim.h b/include/configs/khadas-vim.h
new file mode 100644
index 0000000..9d99bc5
--- /dev/null
+++ b/include/configs/khadas-vim.h
@@ -0,0 +1,21 @@
+/*
+ * Configuration for Khadas VIM
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
+#define CONFIG_PHY_ADDR		8
+
+#define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxl-s905x-khadas-vim.dtb\0"
+
+#include <configs/meson-gxbb-common.h>
+
+#endif /* __CONFIG_H */
-- 
2.7.4
