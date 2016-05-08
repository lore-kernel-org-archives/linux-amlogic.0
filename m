From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun,  8 May 2016 08:30:16 +0200
Subject: [PATCH v7 3/4] arm: add initial support for Amlogic Meson and
 ODROID-C2
In-Reply-To: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
Message-ID: <1462689017-3160-4-git-send-email-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This adds platform code for the Amlogic Meson GXBaby (S905) SoC and a
board definition for ODROID-C2. This initial submission only supports
UART and Ethernet (through the existing Designware driver). DTS files
are the ones submitted to Linux arm-soc for 4.7 [1].

[1] https://patchwork.ozlabs.org/patch/603583/

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---
 arch/arm/Kconfig                       |   9 ++
 arch/arm/Makefile                      |   1 +
 arch/arm/dts/Makefile                  |   2 +
 arch/arm/dts/meson-gxbb-odroidc2.dts   |  69 +++++++++++++
 arch/arm/dts/meson-gxbb.dtsi           | 178 +++++++++++++++++++++++++++++++++
 arch/arm/include/asm/arch-meson/gxbb.h |  52 ++++++++++
 arch/arm/mach-meson/Kconfig            |  31 ++++++
 arch/arm/mach-meson/Makefile           |   7 ++
 arch/arm/mach-meson/board.c            |  66 ++++++++++++
 board/hardkernel/odroid-c2/Kconfig     |  12 +++
 board/hardkernel/odroid-c2/MAINTAINERS |   6 ++
 board/hardkernel/odroid-c2/Makefile    |   7 ++
 board/hardkernel/odroid-c2/README      |  60 +++++++++++
 board/hardkernel/odroid-c2/odroid-c2.c |  51 ++++++++++
 configs/odroid-c2_defconfig            |  23 +++++
 drivers/serial/Kconfig                 |  15 +++
 drivers/serial/Makefile                |   1 +
 drivers/serial/serial_meson.c          | 162 ++++++++++++++++++++++++++++++
 include/configs/odroid-c2.h            |  51 ++++++++++
 19 files changed, 803 insertions(+)
 create mode 100644 arch/arm/dts/meson-gxbb-odroidc2.dts
 create mode 100644 arch/arm/dts/meson-gxbb.dtsi
 create mode 100644 arch/arm/include/asm/arch-meson/gxbb.h
 create mode 100644 arch/arm/mach-meson/Kconfig
 create mode 100644 arch/arm/mach-meson/Makefile
 create mode 100644 arch/arm/mach-meson/board.c
 create mode 100644 board/hardkernel/odroid-c2/Kconfig
 create mode 100644 board/hardkernel/odroid-c2/MAINTAINERS
 create mode 100644 board/hardkernel/odroid-c2/Makefile
 create mode 100644 board/hardkernel/odroid-c2/README
 create mode 100644 board/hardkernel/odroid-c2/odroid-c2.c
 create mode 100644 configs/odroid-c2_defconfig
 create mode 100644 drivers/serial/serial_meson.c
 create mode 100644 include/configs/odroid-c2.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 6b65d8e..2786372 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -456,6 +456,13 @@ config ARCH_KEYSTONE
 	select SUPPORT_SPL
 	select CMD_POWEROFF
 
+config ARCH_MESON
+	bool "Amlogic Meson"
+	help
+	  Support for the Meson SoC family developed by Amlogic Inc.,
+	  targeted at media players and tablet computers. We currently
+	  support the S905 (GXBaby) 64-bit SoC.
+
 config ARCH_MX7
 	bool "Freescale MX7"
 	select CPU_V7
@@ -781,6 +788,8 @@ source "arch/arm/mach-orion5x/Kconfig"
 
 source "arch/arm/cpu/armv7/rmobile/Kconfig"
 
+source "arch/arm/mach-meson/Kconfig"
+
 source "arch/arm/mach-rockchip/Kconfig"
 
 source "arch/arm/mach-s5pc1xx/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index d516345..ecd1887 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -50,6 +50,7 @@ machine-$(CONFIG_ARCH_HIGHBANK)		+= highbank
 machine-$(CONFIG_ARCH_KEYSTONE)		+= keystone
 # TODO: rename CONFIG_KIRKWOOD -> CONFIG_ARCH_KIRKWOOD
 machine-$(CONFIG_KIRKWOOD)		+= kirkwood
+machine-$(CONFIG_ARCH_MESON)		+= meson
 machine-$(CONFIG_ARCH_MVEBU)		+= mvebu
 # TODO: rename CONFIG_TEGRA -> CONFIG_ARCH_TEGRA
 # TODO: rename CONFIG_ORION5X -> CONFIG_ARCH_ORION5X
diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index d1f8e22..136a7d8 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -26,6 +26,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3288-jerry.dtb \
 	rk3288-rock2-square.dtb \
 	rk3036-sdk.dtb
+dtb-$(CONFIG_ARCH_MESON) += \
+	meson-gxbb-odroidc2.dtb
 dtb-$(CONFIG_TEGRA) += tegra20-harmony.dtb \
 	tegra20-medcom-wide.dtb \
 	tegra20-paz00.dtb \
diff --git a/arch/arm/dts/meson-gxbb-odroidc2.dts b/arch/arm/dts/meson-gxbb-odroidc2.dts
new file mode 100644
index 0000000..653c2fa
--- /dev/null
+++ b/arch/arm/dts/meson-gxbb-odroidc2.dts
@@ -0,0 +1,69 @@
+/*
+ * Copyright (c) 2016 Andreas F?rber
+ * Copyright (c) 2016 BayLibre, Inc.
+ * Author: Kevin Hilman <khilman@kernel.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+
+#include "meson-gxbb.dtsi"
+
+/ {
+	compatible = "hardkernel,odroid-c2", "amlogic,meson-gxbb";
+	model = "Hardkernel ODROID-C2";
+
+	aliases {
+		serial0 = &uart_AO;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory at 0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+};
+
+&uart_AO {
+	status = "okay";
+};
diff --git a/arch/arm/dts/meson-gxbb.dtsi b/arch/arm/dts/meson-gxbb.dtsi
new file mode 100644
index 0000000..832815d
--- /dev/null
+++ b/arch/arm/dts/meson-gxbb.dtsi
@@ -0,0 +1,178 @@
+/*
+ * Copyright (c) 2016 Andreas F?rber
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "amlogic,meson-gxbb";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <0x2>;
+		#size-cells = <0x0>;
+
+		cpu0: cpu at 0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu at 1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu at 2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu at 3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+		};
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
+			     <GIC_PPI 14
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
+			     <GIC_PPI 11
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
+			     <GIC_PPI 10
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>;
+	};
+
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cbus: cbus at c1100000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xc1100000 0x0 0x100000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xc1100000 0x0 0x100000>;
+
+			uart_A: serial at 84c0 {
+				compatible = "amlogic,meson-uart";
+				reg = <0x0 0x084c0 0x0 0x14>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>;
+				status = "disabled";
+			};
+		};
+
+		gic: interrupt-controller at c4301000 {
+			compatible = "arm,gic-400";
+			reg = <0x0 0xc4301000 0 0x1000>,
+			      <0x0 0xc4302000 0 0x2000>,
+			      <0x0 0xc4304000 0 0x2000>,
+			      <0x0 0xc4306000 0 0x2000>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+		};
+
+		aobus: aobus at c8100000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xc8100000 0x0 0x100000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xc8100000 0x0 0x100000>;
+
+			uart_AO: serial at 4c0 {
+				compatible = "amlogic,meson-uart";
+				reg = <0x0 0x004c0 0x0 0x14>;
+				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>;
+				status = "disabled";
+			};
+		};
+
+		apb: apb at d0000000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xd0000000 0x0 0x200000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xd0000000 0x0 0x200000>;
+		};
+	};
+};
diff --git a/arch/arm/include/asm/arch-meson/gxbb.h b/arch/arm/include/asm/arch-meson/gxbb.h
new file mode 100644
index 0000000..f90f632
--- /dev/null
+++ b/arch/arm/include/asm/arch-meson/gxbb.h
@@ -0,0 +1,52 @@
+/*
+ * (C) Copyright 2016 - Beniamino Galvani <b.galvani@gmail.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef __GXBB_H__
+#define __GXBB_H__
+
+#define GXBB_PERIPHS_BASE	0xc8834400
+#define GXBB_HIU_BASE		0xc883c000
+#define GXBB_ETH_BASE		0xc9410000
+
+/* Peripherals registers */
+#define GXBB_PERIPHS_ADDR(off)	(GXBB_PERIPHS_BASE + ((off) << 2))
+
+/* GPIO registers 0 to 6 */
+#define _GXBB_GPIO_OFF(n)	((n) == 6 ? 0x08 : 0x0c + 3 * (n))
+#define GXBB_GPIO_EN(n)		GXBB_PERIPHS_ADDR(_GXBB_GPIO_OFF(n) + 0)
+#define GXBB_GPIO_IN(n)		GXBB_PERIPHS_ADDR(_GXBB_GPIO_OFF(n) + 1)
+#define GXBB_GPIO_OUT(n)	GXBB_PERIPHS_ADDR(_GXBB_GPIO_OFF(n) + 2)
+
+/* Pinmux registers 0 to 12 */
+#define GXBB_PINMUX(n)		GXBB_PERIPHS_ADDR(0x2c + (n))
+
+#define GXBB_ETH_REG_0		GXBB_PERIPHS_ADDR(0x50)
+#define GXBB_ETH_REG_1		GXBB_PERIPHS_ADDR(0x51)
+
+#define GXBB_ETH_REG_0_PHY_INTF		BIT(0)
+#define GXBB_ETH_REG_0_TX_PHASE(x)	(((x) & 3) << 5)
+#define GXBB_ETH_REG_0_TX_RATIO(x)	(((x) & 7) << 7)
+#define GXBB_ETH_REG_0_PHY_CLK_EN	BIT(10)
+#define GXBB_ETH_REG_0_CLK_EN		BIT(12)
+
+/* HIU registers */
+#define GXBB_HIU_ADDR(off)	(GXBB_HIU_BASE + ((off) << 2))
+
+#define GXBB_MEM_PD_REG_0	GXBB_HIU_ADDR(0x40)
+
+/* Ethernet memory power domain */
+#define GXBB_MEM_PD_REG_0_ETH_MASK	(BIT(2) | BIT(3))
+
+/* Clock gates */
+#define GXBB_GCLK_MPEG_0	GXBB_HIU_ADDR(0x50)
+#define GXBB_GCLK_MPEG_1	GXBB_HIU_ADDR(0x51)
+#define GXBB_GCLK_MPEG_2	GXBB_HIU_ADDR(0x52)
+#define GXBB_GCLK_MPEG_OTHER	GXBB_HIU_ADDR(0x53)
+#define GXBB_GCLK_MPEG_AO	GXBB_HIU_ADDR(0x54)
+
+#define GXBB_GCLK_MPEG_1_ETH	BIT(3)
+
+#endif /* __GXBB_H__ */
diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
new file mode 100644
index 0000000..77d3cfe
--- /dev/null
+++ b/arch/arm/mach-meson/Kconfig
@@ -0,0 +1,31 @@
+if ARCH_MESON
+
+config MESON_GXBB
+	bool "Support Meson GXBaby"
+	select ARM64
+	select DM
+	select DM_SERIAL
+	help
+	  The Amlogic Meson GXBaby (S905) is an ARM SoC with a
+	  quad-core Cortex-A53 CPU and a Mali-450 GPU.
+
+if MESON_GXBB
+
+config TARGET_ODROID_C2
+	bool "ODROID-C2"
+	help
+	  ODROID-C2 is a single board computer based on Meson GXBaby
+	  with 2 GiB of RAM, Gigabit Ethernet, HDMI, 4 USB, micro-SD
+	  slot, eMMC, IR receiver and a 40-pin GPIO header.
+
+endif
+
+config SYS_SOC
+	default "meson"
+
+config SYS_MALLOC_F_LEN
+	default 0x1000
+
+source "board/hardkernel/odroid-c2/Kconfig"
+
+endif
diff --git a/arch/arm/mach-meson/Makefile b/arch/arm/mach-meson/Makefile
new file mode 100644
index 0000000..44e3d63
--- /dev/null
+++ b/arch/arm/mach-meson/Makefile
@@ -0,0 +1,7 @@
+#
+# Copyright (c) 2016 Beniamino Galvani <b.galvani@gmail.com>
+#
+# SPDX-License-Identifier:	GPL-2.0+
+#
+
+obj-y += board.o
diff --git a/arch/arm/mach-meson/board.c b/arch/arm/mach-meson/board.c
new file mode 100644
index 0000000..782f86c
--- /dev/null
+++ b/arch/arm/mach-meson/board.c
@@ -0,0 +1,66 @@
+/*
+ * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <libfdt.h>
+#include <linux/err.h>
+#include <asm/arch/gxbb.h>
+#include <asm/armv8/mmu.h>
+#include <asm/unaligned.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+int dram_init(void)
+{
+	const fdt64_t *val;
+	int offset;
+	int len;
+
+	offset = fdt_path_offset(gd->fdt_blob, "/memory");
+	if (offset < 0)
+		return -EINVAL;
+
+	val = fdt_getprop(gd->fdt_blob, offset, "reg", &len);
+	if (len < sizeof(*val) * 2)
+		return -EINVAL;
+
+	/* Use unaligned access since cache is still disabled */
+	gd->ram_size = get_unaligned_be64(&val[1]);
+
+	return 0;
+}
+
+void dram_init_banksize(void)
+{
+	/* Reserve first 16 MiB of RAM for firmware */
+	gd->bd->bi_dram[0].start = CONFIG_SYS_SDRAM_BASE + (16 * 1024 * 1024);
+	gd->bd->bi_dram[0].size = gd->ram_size - (16 * 1024 * 1024);
+}
+
+void reset_cpu(ulong addr)
+{
+	psci_system_reset(true);
+}
+
+static struct mm_region gxbb_mem_map[] = {
+	{
+		.base = 0x0UL,
+		.size = 0x80000000UL,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
+			 PTE_BLOCK_INNER_SHARE
+	}, {
+		.base = 0x80000000UL,
+		.size = 0x80000000UL,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* List terminator */
+		0,
+	}
+};
+
+struct mm_region *mem_map = gxbb_mem_map;
diff --git a/board/hardkernel/odroid-c2/Kconfig b/board/hardkernel/odroid-c2/Kconfig
new file mode 100644
index 0000000..687d9c6
--- /dev/null
+++ b/board/hardkernel/odroid-c2/Kconfig
@@ -0,0 +1,12 @@
+if TARGET_ODROID_C2
+
+config SYS_BOARD
+	default "odroid-c2"
+
+config SYS_VENDOR
+	default "hardkernel"
+
+config SYS_CONFIG_NAME
+	default "odroid-c2"
+
+endif
diff --git a/board/hardkernel/odroid-c2/MAINTAINERS b/board/hardkernel/odroid-c2/MAINTAINERS
new file mode 100644
index 0000000..23ae1e7
--- /dev/null
+++ b/board/hardkernel/odroid-c2/MAINTAINERS
@@ -0,0 +1,6 @@
+ODROID-C2
+M:	Beniamino Galvani <b.galvani@gmail.com>
+S:	Maintained
+F:	board/hardkernel/odroid-c2/
+F:	include/configs/odroid-c2.h
+F:	configs/odroid-c2_defconfig
diff --git a/board/hardkernel/odroid-c2/Makefile b/board/hardkernel/odroid-c2/Makefile
new file mode 100644
index 0000000..571044b
--- /dev/null
+++ b/board/hardkernel/odroid-c2/Makefile
@@ -0,0 +1,7 @@
+#
+# (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+#
+# SPDX-License-Identifier:	GPL-2.0+
+#
+
+obj-y	:= odroid-c2.o
diff --git a/board/hardkernel/odroid-c2/README b/board/hardkernel/odroid-c2/README
new file mode 100644
index 0000000..d6d266a
--- /dev/null
+++ b/board/hardkernel/odroid-c2/README
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
diff --git a/board/hardkernel/odroid-c2/odroid-c2.c b/board/hardkernel/odroid-c2/odroid-c2.c
new file mode 100644
index 0000000..c258d4f
--- /dev/null
+++ b/board/hardkernel/odroid-c2/odroid-c2.c
@@ -0,0 +1,51 @@
+/*
+ * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <asm/io.h>
+#include <asm/arch/gxbb.h>
+#include <dm/platdata.h>
+#include <phy.h>
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
+	return 0;
+}
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
new file mode 100644
index 0000000..a771b20
--- /dev/null
+++ b/configs/odroid-c2_defconfig
@@ -0,0 +1,23 @@
+CONFIG_ARM=y
+CONFIG_ARCH_MESON=y
+CONFIG_MESON_GXBB=y
+CONFIG_TARGET_ODROID_C2=y
+CONFIG_DEFAULT_DEVICE_TREE="meson-gxbb-odroidc2"
+# CONFIG_CMD_BDI is not set
+# CONFIG_CMD_IMI is not set
+# CONFIG_CMD_IMLS is not set
+# CONFIG_CMD_LOADS is not set
+# CONFIG_CMD_FPGA is not set
+# CONFIG_CMD_SOURCE is not set
+# CONFIG_CMD_SETEXPR is not set
+CONFIG_OF_CONTROL=y
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_DM_ETH=y
+CONFIG_ETH_DESIGNWARE=y
+CONFIG_DEBUG_UART=y
+CONFIG_DEBUG_UART_MESON=y
+CONFIG_DEBUG_UART_BASE=0xc81004c0
+CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_DEBUG_UART_ANNOUNCE=y
+CONFIG_DEBUG_UART_SKIP_INIT=y
+CONFIG_MESON_SERIAL=y
diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
index a9a5d47..7720b3e 100644
--- a/drivers/serial/Kconfig
+++ b/drivers/serial/Kconfig
@@ -112,6 +112,14 @@ config DEBUG_UART_S5P
 	  will need to provide parameters to make this work. The driver will
 	  be available until the real driver-model serial is running.
 
+config DEBUG_UART_MESON
+	bool "Amlogic Meson"
+	depends on MESON_SERIAL
+	help
+	  Select this to enable a debug UART using the serial_meson driver. You
+	  will need to provide parameters to make this work. The driver will
+	  be available until the real driver-model serial is running.
+
 config DEBUG_UART_UARTLITE
 	bool "Xilinx Uartlite"
 	help
@@ -320,6 +328,13 @@ config XILINX_UARTLITE
 	  If you have a Xilinx based board and want to use the uartlite
 	  serial ports, say Y to this option. If unsure, say N.
 
+config MESON_SERIAL
+	bool "Support for Amlogic Meson UART"
+	depends on DM_SERIAL && ARCH_MESON
+	help
+	  If you have an Amlogic Meson based board and want to use the on-chip
+	  serial ports, say Y to this option. If unsure, say N.
+
 config MSM_SERIAL
 	bool "Qualcomm on-chip UART"
 	depends on DM_SERIAL
diff --git a/drivers/serial/Makefile b/drivers/serial/Makefile
index b0ac9d8..35c143d 100644
--- a/drivers/serial/Makefile
+++ b/drivers/serial/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_SYS_NS16550) += ns16550.o
 obj-$(CONFIG_S5P) += serial_s5p.o
 obj-$(CONFIG_MXC_UART) += serial_mxc.o
 obj-$(CONFIG_PXA_SERIAL) += serial_pxa.o
+obj-$(CONFIG_MESON_SERIAL) += serial_meson.o
 obj-$(CONFIG_S3C24X0_SERIAL) += serial_s3c24x0.o
 obj-$(CONFIG_XILINX_UARTLITE) += serial_xuartlite.o
 obj-$(CONFIG_SANDBOX_SERIAL) += sandbox.o
diff --git a/drivers/serial/serial_meson.c b/drivers/serial/serial_meson.c
new file mode 100644
index 0000000..1b49426
--- /dev/null
+++ b/drivers/serial/serial_meson.c
@@ -0,0 +1,162 @@
+/*
+ * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <errno.h>
+#include <fdtdec.h>
+#include <linux/compiler.h>
+#include <serial.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+struct meson_uart {
+	u32 wfifo;
+	u32 rfifo;
+	u32 control;
+	u32 status;
+	u32 misc;
+};
+
+struct meson_serial_platdata {
+	struct meson_uart *reg;
+};
+
+/* AML_UART_STATUS bits */
+#define AML_UART_PARITY_ERR		BIT(16)
+#define AML_UART_FRAME_ERR		BIT(17)
+#define AML_UART_TX_FIFO_WERR		BIT(18)
+#define AML_UART_RX_EMPTY		BIT(20)
+#define AML_UART_TX_FULL		BIT(21)
+#define AML_UART_TX_EMPTY		BIT(22)
+#define AML_UART_XMIT_BUSY		BIT(25)
+#define AML_UART_ERR			(AML_UART_PARITY_ERR | \
+					 AML_UART_FRAME_ERR  | \
+					 AML_UART_TX_FIFO_WERR)
+
+/* AML_UART_CONTROL bits */
+#define AML_UART_TX_EN			BIT(12)
+#define AML_UART_RX_EN			BIT(13)
+#define AML_UART_TX_RST			BIT(22)
+#define AML_UART_RX_RST			BIT(23)
+#define AML_UART_CLR_ERR		BIT(24)
+
+static void meson_serial_init(struct meson_uart *uart)
+{
+	u32 val;
+
+	val = readl(&uart->control);
+	val |= (AML_UART_RX_RST | AML_UART_TX_RST | AML_UART_CLR_ERR);
+	writel(val, &uart->control);
+	val &= ~(AML_UART_RX_RST | AML_UART_TX_RST | AML_UART_CLR_ERR);
+	writel(val, &uart->control);
+	val |= (AML_UART_RX_EN | AML_UART_TX_EN);
+	writel(val, &uart->control);
+}
+
+static int meson_serial_probe(struct udevice *dev)
+{
+	struct meson_serial_platdata *plat = dev->platdata;
+	struct meson_uart *const uart = plat->reg;
+
+	meson_serial_init(uart);
+
+	return 0;
+}
+
+static int meson_serial_getc(struct udevice *dev)
+{
+	struct meson_serial_platdata *plat = dev->platdata;
+	struct meson_uart *const uart = plat->reg;
+
+	if (readl(&uart->status) & AML_UART_RX_EMPTY)
+		return -EAGAIN;
+
+	return readl(&uart->rfifo) & 0xff;
+}
+
+static int meson_serial_putc(struct udevice *dev, const char ch)
+{
+	struct meson_serial_platdata *plat = dev->platdata;
+	struct meson_uart *const uart = plat->reg;
+
+	if (readl(&uart->status) & AML_UART_TX_FULL)
+		return -EAGAIN;
+
+	writel(ch, &uart->wfifo);
+
+	return 0;
+}
+
+static int meson_serial_pending(struct udevice *dev, bool input)
+{
+	struct meson_serial_platdata *plat = dev->platdata;
+	struct meson_uart *const uart = plat->reg;
+	uint32_t status = readl(&uart->status);
+
+	if (input)
+		return !(status & AML_UART_RX_EMPTY);
+	else
+		return !(status & AML_UART_TX_FULL);
+}
+
+static int meson_serial_ofdata_to_platdata(struct udevice *dev)
+{
+	struct meson_serial_platdata *plat = dev->platdata;
+	fdt_addr_t addr;
+
+	addr = dev_get_addr(dev);
+	if (addr == FDT_ADDR_T_NONE)
+		return -EINVAL;
+
+	plat->reg = (struct meson_uart *)addr;
+
+	return 0;
+}
+
+static const struct dm_serial_ops meson_serial_ops = {
+	.putc = meson_serial_putc,
+	.pending = meson_serial_pending,
+	.getc = meson_serial_getc,
+};
+
+static const struct udevice_id meson_serial_ids[] = {
+	{ .compatible = "amlogic,meson-uart" },
+	{ }
+};
+
+U_BOOT_DRIVER(serial_meson) = {
+	.name		= "serial_meson",
+	.id		= UCLASS_SERIAL,
+	.of_match	= meson_serial_ids,
+	.probe		= meson_serial_probe,
+	.ops		= &meson_serial_ops,
+	.flags		= DM_FLAG_PRE_RELOC,
+	.ofdata_to_platdata = meson_serial_ofdata_to_platdata,
+	.platdata_auto_alloc_size = sizeof(struct meson_serial_platdata),
+};
+
+#ifdef CONFIG_DEBUG_UART_MESON
+
+#include <debug_uart.h>
+
+static inline void _debug_uart_init(void)
+{
+}
+
+static inline void _debug_uart_putc(int ch)
+{
+	struct meson_uart *regs = (struct meson_uart *)CONFIG_DEBUG_UART_BASE;
+
+	while (readl(&regs->status) & AML_UART_TX_FULL)
+		;
+
+	writel(ch, &regs->wfifo);
+}
+
+DEBUG_UART_FUNCS
+
+#endif
diff --git a/include/configs/odroid-c2.h b/include/configs/odroid-c2.h
new file mode 100644
index 0000000..37a5671
--- /dev/null
+++ b/include/configs/odroid-c2.h
@@ -0,0 +1,51 @@
+/*
+ * Configuration for ODROID-C2
+ * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef __CONFIG_H
+#define __CONFIG_H
+
+#define CONFIG_CPU_ARMV8
+#define CONFIG_REMAKE_ELF
+#define CONFIG_SYS_CACHELINE_SIZE	64
+#define CONFIG_SYS_NO_FLASH
+#define CONFIG_NR_DRAM_BANKS		1
+#define CONFIG_ENV_IS_NOWHERE		1
+#define CONFIG_ENV_SIZE			0x2000
+#define CONFIG_SYS_MAXARGS		32
+#define CONFIG_SYS_MALLOC_LEN		(32 << 20)
+#define CONFIG_SYS_CBSIZE		1024
+#define CONFIG_MISC_INIT_R
+
+#define CONFIG_SYS_SDRAM_BASE		0
+#define CONFIG_SYS_TEXT_BASE		0x01000000
+#define CONFIG_SYS_INIT_SP_ADDR		0x20000000
+#define CONFIG_SYS_LOAD_ADDR		CONFIG_SYS_TEXT_BASE
+
+/* Generic Interrupt Controller Definitions */
+#define GICD_BASE			0xc4301000
+#define GICC_BASE			0xc4302000
+
+#define CONFIG_IDENT_STRING		" odroid-c2"
+
+/* Serial setup */
+#define CONFIG_CONS_INDEX		0
+#define CONFIG_BAUDRATE			115200
+
+#define CONFIG_CMD_ENV
+
+/* Monitor Command Prompt */
+/* Console I/O Buffer Size */
+#define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + \
+					sizeof(CONFIG_SYS_PROMPT) + 16)
+#define CONFIG_SYS_HUSH_PARSER
+#define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
+#define CONFIG_SYS_LONGHELP
+#define CONFIG_CMDLINE_EDITING
+
+#include <config_distro_defaults.h>
+
+#endif /* __CONFIG_H */
-- 
2.7.3
