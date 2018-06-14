From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 14 Jun 2018 13:43:39 +0200
Subject: [PATCH u-boot 3/5] clk: add Amlogic meson clock driver
In-Reply-To: <1528976621-8397-1-git-send-email-narmstrong@baylibre.com>
References: <1528976621-8397-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1528976621-8397-4-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Beniamino Galvani <b.galvani@gmail.com>

Introduce a basic clock driver for Amlogic Meson SoCs which supports
enabling/disabling clock gates and getting their frequency.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/include/asm/arch-meson/clock.h | 117 ++++++++++
 arch/arm/mach-meson/Kconfig             |   2 +
 drivers/clk/Makefile                    |   1 +
 drivers/clk/clk_meson.c                 | 393 ++++++++++++++++++++++++++++++++
 drivers/clk/clk_meson.h                 |  47 ++++
 5 files changed, 560 insertions(+)
 create mode 100644 arch/arm/include/asm/arch-meson/clock.h
 create mode 100644 drivers/clk/clk_meson.c
 create mode 100644 drivers/clk/clk_meson.h

diff --git a/arch/arm/include/asm/arch-meson/clock.h b/arch/arm/include/asm/arch-meson/clock.h
new file mode 100644
index 0000000..c0ff00f
--- /dev/null
+++ b/arch/arm/include/asm/arch-meson/clock.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2016 - AmLogic, Inc.
+ * Copyright 2018 - Beniamino Galvani <b.galvani@gmail.com>
+ */
+#ifndef _ARCH_MESON_CLOCK_H_
+#define _ARCH_MESON_CLOCK_H_
+
+/*
+ * Clock controller register offsets
+ *
+ * Register offsets from the data sheet are listed in comment blocks below.
+ * Those offsets must be multiplied by 4 before adding them to the base address
+ * to get the right value
+ */
+#define SCR				0x2C /* 0x0b offset in data sheet */
+#define TIMEOUT_VALUE			0x3c /* 0x0f offset in data sheet */
+
+#define HHI_GP0_PLL_CNTL		0x40 /* 0x10 offset in data sheet */
+#define HHI_GP0_PLL_CNTL2		0x44 /* 0x11 offset in data sheet */
+#define HHI_GP0_PLL_CNTL3		0x48 /* 0x12 offset in data sheet */
+#define HHI_GP0_PLL_CNTL4		0x4c /* 0x13 offset in data sheet */
+#define	HHI_GP0_PLL_CNTL5		0x50 /* 0x14 offset in data sheet */
+#define	HHI_GP0_PLL_CNTL1		0x58 /* 0x16 offset in data sheet */
+
+#define	HHI_XTAL_DIVN_CNTL		0xbc /* 0x2f offset in data sheet */
+#define	HHI_TIMER90K			0xec /* 0x3b offset in data sheet */
+
+#define	HHI_MEM_PD_REG0			0x100 /* 0x40 offset in data sheet */
+#define	HHI_MEM_PD_REG1			0x104 /* 0x41 offset in data sheet */
+#define	HHI_VPU_MEM_PD_REG1		0x108 /* 0x42 offset in data sheet */
+#define	HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
+#define	HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
+
+#define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
+#define HHI_GCLK_MPEG1			0x144 /* 0x51 offset in data sheet */
+#define HHI_GCLK_MPEG2			0x148 /* 0x52 offset in data sheet */
+#define HHI_GCLK_OTHER			0x150 /* 0x54 offset in data sheet */
+#define HHI_GCLK_AO			0x154 /* 0x55 offset in data sheet */
+#define HHI_SYS_OSCIN_CNTL		0x158 /* 0x56 offset in data sheet */
+#define HHI_SYS_CPU_CLK_CNTL1		0x15c /* 0x57 offset in data sheet */
+#define HHI_SYS_CPU_RESET_CNTL		0x160 /* 0x58 offset in data sheet */
+#define HHI_VID_CLK_DIV			0x164 /* 0x59 offset in data sheet */
+
+#define HHI_MPEG_CLK_CNTL		0x174 /* 0x5d offset in data sheet */
+#define HHI_AUD_CLK_CNTL		0x178 /* 0x5e offset in data sheet */
+#define HHI_VID_CLK_CNTL		0x17c /* 0x5f offset in data sheet */
+#define HHI_AUD_CLK_CNTL2		0x190 /* 0x64 offset in data sheet */
+#define HHI_VID_CLK_CNTL2		0x194 /* 0x65 offset in data sheet */
+#define HHI_SYS_CPU_CLK_CNTL0		0x19c /* 0x67 offset in data sheet */
+#define HHI_VID_PLL_CLK_DIV		0x1a0 /* 0x68 offset in data sheet */
+#define HHI_AUD_CLK_CNTL3		0x1a4 /* 0x69 offset in data sheet */
+#define HHI_MALI_CLK_CNTL		0x1b0 /* 0x6c offset in data sheet */
+#define HHI_VPU_CLK_CNTL		0x1bC /* 0x6f offset in data sheet */
+
+#define HHI_HDMI_CLK_CNTL		0x1CC /* 0x73 offset in data sheet */
+#define HHI_VDEC_CLK_CNTL		0x1E0 /* 0x78 offset in data sheet */
+#define HHI_VDEC2_CLK_CNTL		0x1E4 /* 0x79 offset in data sheet */
+#define HHI_VDEC3_CLK_CNTL		0x1E8 /* 0x7a offset in data sheet */
+#define HHI_VDEC4_CLK_CNTL		0x1EC /* 0x7b offset in data sheet */
+#define HHI_HDCP22_CLK_CNTL		0x1F0 /* 0x7c offset in data sheet */
+#define HHI_VAPBCLK_CNTL		0x1F4 /* 0x7d offset in data sheet */
+
+#define HHI_VPU_CLKB_CNTL		0x20C /* 0x83 offset in data sheet */
+#define HHI_USB_CLK_CNTL		0x220 /* 0x88 offset in data sheet */
+#define HHI_32K_CLK_CNTL		0x224 /* 0x89 offset in data sheet */
+#define HHI_GEN_CLK_CNTL		0x228 /* 0x8a offset in data sheet */
+#define HHI_GEN_CLK_CNTL		0x228 /* 0x8a offset in data sheet */
+
+#define HHI_PCM_CLK_CNTL		0x258 /* 0x96 offset in data sheet */
+#define HHI_NAND_CLK_CNTL		0x25C /* 0x97 offset in data sheet */
+#define HHI_SD_EMMC_CLK_CNTL		0x264 /* 0x99 offset in data sheet */
+
+#define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
+#define HHI_MPLL_CNTL2			0x284 /* 0xa1 offset in data sheet */
+#define HHI_MPLL_CNTL3			0x288 /* 0xa2 offset in data sheet */
+#define HHI_MPLL_CNTL4			0x28C /* 0xa3 offset in data sheet */
+#define HHI_MPLL_CNTL5			0x290 /* 0xa4 offset in data sheet */
+#define HHI_MPLL_CNTL6			0x294 /* 0xa5 offset in data sheet */
+#define HHI_MPLL_CNTL7			0x298 /* 0xa6 offset in data sheet */
+#define HHI_MPLL_CNTL8			0x29C /* 0xa7 offset in data sheet */
+#define HHI_MPLL_CNTL9			0x2A0 /* 0xa8 offset in data sheet */
+#define HHI_MPLL_CNTL10			0x2A4 /* 0xa9 offset in data sheet */
+
+#define HHI_MPLL3_CNTL0			0x2E0 /* 0xb8 offset in data sheet */
+#define HHI_MPLL3_CNTL1			0x2E4 /* 0xb9 offset in data sheet */
+#define HHI_VDAC_CNTL0			0x2F4 /* 0xbd offset in data sheet */
+#define HHI_VDAC_CNTL1			0x2F8 /* 0xbe offset in data sheet */
+
+#define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
+#define HHI_SYS_PLL_CNTL2		0x304 /* 0xc1 offset in data sheet */
+#define HHI_SYS_PLL_CNTL3		0x308 /* 0xc2 offset in data sheet */
+#define HHI_SYS_PLL_CNTL4		0x30c /* 0xc3 offset in data sheet */
+#define HHI_SYS_PLL_CNTL5		0x310 /* 0xc4 offset in data sheet */
+#define HHI_DPLL_TOP_I			0x318 /* 0xc6 offset in data sheet */
+#define HHI_DPLL_TOP2_I			0x31C /* 0xc7 offset in data sheet */
+#define HHI_HDMI_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
+#define HHI_HDMI_PLL_CNTL2		0x324 /* 0xc9 offset in data sheet */
+#define HHI_HDMI_PLL_CNTL3		0x328 /* 0xca offset in data sheet */
+#define HHI_HDMI_PLL_CNTL4		0x32C /* 0xcb offset in data sheet */
+#define HHI_HDMI_PLL_CNTL5		0x330 /* 0xcc offset in data sheet */
+#define HHI_HDMI_PLL_CNTL6		0x334 /* 0xcd offset in data sheet */
+#define HHI_HDMI_PLL_CNTL_I		0x338 /* 0xce offset in data sheet */
+#define HHI_HDMI_PLL_CNTL7		0x33C /* 0xcf offset in data sheet */
+
+#define HHI_HDMI_PHY_CNTL0		0x3A0 /* 0xe8 offset in data sheet */
+#define HHI_HDMI_PHY_CNTL1		0x3A4 /* 0xe9 offset in data sheet */
+#define HHI_HDMI_PHY_CNTL2		0x3A8 /* 0xea offset in data sheet */
+#define HHI_HDMI_PHY_CNTL3		0x3AC /* 0xeb offset in data sheet */
+
+#define HHI_VID_LOCK_CLK_CNTL		0x3C8 /* 0xf2 offset in data sheet */
+#define HHI_BT656_CLK_CNTL		0x3D4 /* 0xf5 offset in data sheet */
+#define HHI_SAR_CLK_CNTL		0x3D8 /* 0xf6 offset in data sheet */
+
+ulong meson_measure_clk_rate(unsigned int clk);
+
+#endif
diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 0350787..9a06ccc 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -3,6 +3,7 @@ if ARCH_MESON
 config MESON_GXBB
 	bool "Support Meson GXBaby"
 	select ARM64
+	select CLK
 	select DM
 	select DM_SERIAL
 	help
@@ -12,6 +13,7 @@ config MESON_GXBB
 config MESON_GXL
 	bool "Support Meson GXL"
 	select ARM64
+	select CLK
 	select DM
 	select DM_SERIAL
 	help
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 58139b1..426c67d 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_$(SPL_TPL_)CLK) += clk-uclass.o clk_fixed_rate.o
 
 obj-y += tegra/
 obj-$(CONFIG_ARCH_ASPEED) += aspeed/
+obj-$(CONFIG_ARCH_MESON) += clk_meson.o
 obj-$(CONFIG_ARCH_ROCKCHIP) += rockchip/
 obj-$(CONFIG_CLK_AT91) += at91/
 obj-$(CONFIG_CLK_MVEBU) += mvebu/
diff --git a/drivers/clk/clk_meson.c b/drivers/clk/clk_meson.c
new file mode 100644
index 0000000..3850128
--- /dev/null
+++ b/drivers/clk/clk_meson.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2018 - Beniamino Galvani <b.galvani@gmail.com>
+ * (C) Copyright 2018 - BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <common.h>
+#include <asm/arch/clock.h>
+#include <asm/io.h>
+#include <clk-uclass.h>
+#include <div64.h>
+#include <dm.h>
+#include <dt-bindings/clock/gxbb-clkc.h>
+#include "clk_meson.h"
+
+#define XTAL_RATE 24000000
+
+struct meson_clk {
+	void __iomem *addr;
+};
+
+static ulong meson_clk_get_rate_by_id(struct clk *clk, unsigned long id);
+
+struct meson_gate gates[] = {
+	/* Everything Else (EE) domain gates */
+	MESON_GATE(CLKID_DDR, HHI_GCLK_MPEG0, 0),
+	MESON_GATE(CLKID_DOS, HHI_GCLK_MPEG0, 1),
+	MESON_GATE(CLKID_ISA, HHI_GCLK_MPEG0, 5),
+	MESON_GATE(CLKID_PL301, HHI_GCLK_MPEG0, 6),
+	MESON_GATE(CLKID_PERIPHS, HHI_GCLK_MPEG0, 7),
+	MESON_GATE(CLKID_SPICC, HHI_GCLK_MPEG0, 8),
+	MESON_GATE(CLKID_I2C, HHI_GCLK_MPEG0, 9),
+	MESON_GATE(CLKID_SAR_ADC, HHI_GCLK_MPEG0, 10),
+	MESON_GATE(CLKID_SMART_CARD, HHI_GCLK_MPEG0, 11),
+	MESON_GATE(CLKID_RNG0, HHI_GCLK_MPEG0, 12),
+	MESON_GATE(CLKID_UART0, HHI_GCLK_MPEG0, 13),
+	MESON_GATE(CLKID_SDHC, HHI_GCLK_MPEG0, 14),
+	MESON_GATE(CLKID_STREAM, HHI_GCLK_MPEG0, 15),
+	MESON_GATE(CLKID_ASYNC_FIFO, HHI_GCLK_MPEG0, 16),
+	MESON_GATE(CLKID_SDIO, HHI_GCLK_MPEG0, 17),
+	MESON_GATE(CLKID_ABUF, HHI_GCLK_MPEG0, 18),
+	MESON_GATE(CLKID_HIU_IFACE, HHI_GCLK_MPEG0, 19),
+	MESON_GATE(CLKID_ASSIST_MISC, HHI_GCLK_MPEG0, 23),
+	MESON_GATE(CLKID_SD_EMMC_A, HHI_GCLK_MPEG0, 24),
+	MESON_GATE(CLKID_SD_EMMC_B, HHI_GCLK_MPEG0, 25),
+	MESON_GATE(CLKID_SD_EMMC_C, HHI_GCLK_MPEG0, 26),
+	MESON_GATE(CLKID_SPI, HHI_GCLK_MPEG0, 30),
+
+	MESON_GATE(CLKID_I2S_SPDIF, HHI_GCLK_MPEG1, 2),
+	MESON_GATE(CLKID_ETH, HHI_GCLK_MPEG1, 3),
+	MESON_GATE(CLKID_DEMUX, HHI_GCLK_MPEG1, 4),
+	MESON_GATE(CLKID_AIU_GLUE, HHI_GCLK_MPEG1, 6),
+	MESON_GATE(CLKID_IEC958, HHI_GCLK_MPEG1, 7),
+	MESON_GATE(CLKID_I2S_OUT, HHI_GCLK_MPEG1, 8),
+	MESON_GATE(CLKID_AMCLK, HHI_GCLK_MPEG1, 9),
+	MESON_GATE(CLKID_AIFIFO2, HHI_GCLK_MPEG1, 10),
+	MESON_GATE(CLKID_MIXER, HHI_GCLK_MPEG1, 11),
+	MESON_GATE(CLKID_MIXER_IFACE, HHI_GCLK_MPEG1, 12),
+	MESON_GATE(CLKID_ADC, HHI_GCLK_MPEG1, 13),
+	MESON_GATE(CLKID_BLKMV, HHI_GCLK_MPEG1, 14),
+	MESON_GATE(CLKID_AIU, HHI_GCLK_MPEG1, 15),
+	MESON_GATE(CLKID_UART1, HHI_GCLK_MPEG1, 16),
+	MESON_GATE(CLKID_G2D, HHI_GCLK_MPEG1, 20),
+	MESON_GATE(CLKID_USB0, HHI_GCLK_MPEG1, 21),
+	MESON_GATE(CLKID_USB1, HHI_GCLK_MPEG1, 22),
+	MESON_GATE(CLKID_RESET, HHI_GCLK_MPEG1, 23),
+	MESON_GATE(CLKID_NAND, HHI_GCLK_MPEG1, 24),
+	MESON_GATE(CLKID_DOS_PARSER, HHI_GCLK_MPEG1, 25),
+	MESON_GATE(CLKID_USB, HHI_GCLK_MPEG1, 26),
+	MESON_GATE(CLKID_VDIN1, HHI_GCLK_MPEG1, 28),
+	MESON_GATE(CLKID_AHB_ARB0, HHI_GCLK_MPEG1, 29),
+	MESON_GATE(CLKID_EFUSE, HHI_GCLK_MPEG1, 30),
+	MESON_GATE(CLKID_BOOT_ROM, HHI_GCLK_MPEG1, 31),
+
+	MESON_GATE(CLKID_AHB_DATA_BUS, HHI_GCLK_MPEG2, 1),
+	MESON_GATE(CLKID_AHB_CTRL_BUS, HHI_GCLK_MPEG2, 2),
+	MESON_GATE(CLKID_HDMI_INTR_SYNC, HHI_GCLK_MPEG2, 3),
+	MESON_GATE(CLKID_HDMI_PCLK, HHI_GCLK_MPEG2, 4),
+	MESON_GATE(CLKID_USB1_DDR_BRIDGE, HHI_GCLK_MPEG2, 8),
+	MESON_GATE(CLKID_USB0_DDR_BRIDGE, HHI_GCLK_MPEG2, 9),
+	MESON_GATE(CLKID_MMC_PCLK, HHI_GCLK_MPEG2, 11),
+	MESON_GATE(CLKID_DVIN, HHI_GCLK_MPEG2, 12),
+	MESON_GATE(CLKID_UART2, HHI_GCLK_MPEG2, 15),
+	MESON_GATE(CLKID_SANA, HHI_GCLK_MPEG2, 22),
+	MESON_GATE(CLKID_VPU_INTR, HHI_GCLK_MPEG2, 25),
+	MESON_GATE(CLKID_SEC_AHB_AHB3_BRIDGE, HHI_GCLK_MPEG2, 26),
+	MESON_GATE(CLKID_CLK81_A53, HHI_GCLK_MPEG2, 29),
+
+	MESON_GATE(CLKID_VCLK2_VENCI0, HHI_GCLK_OTHER, 1),
+	MESON_GATE(CLKID_VCLK2_VENCI1, HHI_GCLK_OTHER, 2),
+	MESON_GATE(CLKID_VCLK2_VENCP0, HHI_GCLK_OTHER, 3),
+	MESON_GATE(CLKID_VCLK2_VENCP1, HHI_GCLK_OTHER, 4),
+	MESON_GATE(CLKID_GCLK_VENCI_INT0, HHI_GCLK_OTHER, 8),
+	MESON_GATE(CLKID_DAC_CLK, HHI_GCLK_OTHER, 10),
+	MESON_GATE(CLKID_AOCLK_GATE, HHI_GCLK_OTHER, 14),
+	MESON_GATE(CLKID_IEC958_GATE, HHI_GCLK_OTHER, 16),
+	MESON_GATE(CLKID_ENC480P, HHI_GCLK_OTHER, 20),
+	MESON_GATE(CLKID_RNG1, HHI_GCLK_OTHER, 21),
+	MESON_GATE(CLKID_GCLK_VENCI_INT1, HHI_GCLK_OTHER, 22),
+	MESON_GATE(CLKID_VCLK2_VENCLMCC, HHI_GCLK_OTHER, 24),
+	MESON_GATE(CLKID_VCLK2_VENCL, HHI_GCLK_OTHER, 25),
+	MESON_GATE(CLKID_VCLK_OTHER, HHI_GCLK_OTHER, 26),
+	MESON_GATE(CLKID_EDP, HHI_GCLK_OTHER, 31),
+
+	/* Always On (AO) domain gates */
+	MESON_GATE(CLKID_AO_MEDIA_CPU, HHI_GCLK_AO, 0),
+	MESON_GATE(CLKID_AO_AHB_SRAM, HHI_GCLK_AO, 1),
+	MESON_GATE(CLKID_AO_AHB_BUS, HHI_GCLK_AO, 2),
+	MESON_GATE(CLKID_AO_IFACE, HHI_GCLK_AO, 3),
+	MESON_GATE(CLKID_AO_I2C, HHI_GCLK_AO, 4),
+
+	/* PLL Gates */
+	/* CLKID_FCLK_DIV2 is critical for the SCPI Processor */
+	MESON_GATE(CLKID_FCLK_DIV3, HHI_MPLL_CNTL6, 28),
+	MESON_GATE(CLKID_FCLK_DIV4, HHI_MPLL_CNTL6, 29),
+	MESON_GATE(CLKID_FCLK_DIV5, HHI_MPLL_CNTL6, 30),
+	MESON_GATE(CLKID_FCLK_DIV7, HHI_MPLL_CNTL6, 31),
+	MESON_GATE(CLKID_MPLL0, HHI_MPLL_CNTL7, 14),
+	MESON_GATE(CLKID_MPLL1, HHI_MPLL_CNTL8, 14),
+	MESON_GATE(CLKID_MPLL2, HHI_MPLL_CNTL9, 14),
+	/* CLKID_CLK81 is critical for the system */
+
+	/* Peripheral Gates */
+	MESON_GATE(CLKID_SAR_ADC_CLK, HHI_SAR_CLK_CNTL, 8),
+	MESON_GATE(CLKID_SD_EMMC_A_CLK0, HHI_SD_EMMC_CLK_CNTL, 7),
+	MESON_GATE(CLKID_SD_EMMC_B_CLK0, HHI_SD_EMMC_CLK_CNTL, 23),
+	MESON_GATE(CLKID_SD_EMMC_C_CLK0, HHI_NAND_CLK_CNTL, 7),
+};
+
+static int meson_set_gate(struct clk *clk, bool on)
+{
+	struct meson_clk *priv = dev_get_priv(clk->dev);
+	struct meson_gate *gate;
+
+	if (clk->id >= ARRAY_SIZE(gates))
+		return -ENOENT;
+
+	gate = &gates[clk->id];
+
+	if (gate->reg == 0)
+		return 0;
+
+	clrsetbits_le32(priv->addr + gate->reg,
+			BIT(gate->bit), on ? BIT(gate->bit) : 0);
+	return 0;
+}
+
+static int meson_clk_enable(struct clk *clk)
+{
+	return meson_set_gate(clk, true);
+}
+
+static int meson_clk_disable(struct clk *clk)
+{
+	return meson_set_gate(clk, false);
+}
+
+static unsigned long meson_clk81_get_rate(struct clk *clk)
+{
+	struct meson_clk *priv = dev_get_priv(clk->dev);
+	unsigned long parent_rate;
+	u32 reg;
+	int parents[] = {
+		-1,
+		-1,
+		CLKID_FCLK_DIV7,
+		CLKID_MPLL1,
+		CLKID_MPLL2,
+		CLKID_FCLK_DIV4,
+		CLKID_FCLK_DIV3,
+		CLKID_FCLK_DIV5
+	};
+
+	/* mux */
+	reg = readl(priv->addr + HHI_MPEG_CLK_CNTL);
+	reg = (reg >> 12) & 7;
+
+	switch (reg) {
+	case 0:
+		parent_rate = XTAL_RATE;
+		break;
+	case 1:
+		return -ENOENT;
+	default:
+		parent_rate = meson_clk_get_rate_by_id(clk, parents[reg]);
+	}
+
+	/* divider */
+	reg = readl(priv->addr + HHI_MPEG_CLK_CNTL);
+	reg = reg & ((1 << 7) - 1);
+
+	return parent_rate / reg;
+}
+
+static long mpll_rate_from_params(unsigned long parent_rate,
+				  unsigned long sdm,
+				  unsigned long n2)
+{
+	unsigned long divisor = (SDM_DEN * n2) + sdm;
+
+	if (n2 < N2_MIN)
+		return -EINVAL;
+
+	return DIV_ROUND_UP_ULL((u64)parent_rate * SDM_DEN, divisor);
+}
+
+static struct parm meson_mpll0_parm[3] = {
+	{HHI_MPLL_CNTL7, 0, 14}, /* psdm */
+	{HHI_MPLL_CNTL7, 16, 9}, /* pn2 */
+};
+
+static struct parm meson_mpll1_parm[3] = {
+	{HHI_MPLL_CNTL8, 0, 14}, /* psdm */
+	{HHI_MPLL_CNTL8, 16, 9}, /* pn2 */
+};
+
+static struct parm meson_mpll2_parm[3] = {
+	{HHI_MPLL_CNTL9, 0, 14}, /* psdm */
+	{HHI_MPLL_CNTL9, 16, 9}, /* pn2 */
+};
+
+/*
+ * MultiPhase Locked Loops are outputs from a PLL with additional frequency
+ * scaling capabilities. MPLL rates are calculated as:
+ *
+ * f(N2_integer, SDM_IN ) = 2.0G/(N2_integer + SDM_IN/16384)
+ */
+static ulong meson_mpll_get_rate(struct clk *clk, unsigned long id)
+{
+	struct meson_clk *priv = dev_get_priv(clk->dev);
+	struct parm *psdm, *pn2;
+	unsigned long reg, sdm, n2;
+	unsigned long parent_rate;
+
+	switch (id) {
+	case CLKID_MPLL0:
+		psdm = &meson_mpll0_parm[0];
+		pn2 = &meson_mpll0_parm[1];
+		break;
+	case CLKID_MPLL1:
+		psdm = &meson_mpll1_parm[0];
+		pn2 = &meson_mpll1_parm[1];
+		break;
+	case CLKID_MPLL2:
+		psdm = &meson_mpll2_parm[0];
+		pn2 = &meson_mpll2_parm[1];
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	parent_rate = meson_clk_get_rate_by_id(clk, CLKID_FIXED_PLL);
+	if (IS_ERR_VALUE(parent_rate))
+		return parent_rate;
+
+	reg = readl(priv->addr + psdm->reg_off);
+	sdm = PARM_GET(psdm->width, psdm->shift, reg);
+
+	reg = readl(priv->addr + pn2->reg_off);
+	n2 = PARM_GET(pn2->width, pn2->shift, reg);
+
+	return mpll_rate_from_params(parent_rate, sdm, n2);
+}
+
+static struct parm meson_fixed_pll_parm[3] = {
+	{HHI_MPLL_CNTL, 0, 9}, /* pm */
+	{HHI_MPLL_CNTL, 9, 5}, /* pn */
+	{HHI_MPLL_CNTL, 16, 2}, /* pod */
+};
+
+static struct parm meson_sys_pll_parm[3] = {
+	{HHI_SYS_PLL_CNTL, 0, 9}, /* pm */
+	{HHI_SYS_PLL_CNTL, 9, 5}, /* pn */
+	{HHI_SYS_PLL_CNTL, 10, 2}, /* pod */
+};
+
+static ulong meson_pll_get_rate(struct clk *clk, unsigned long id)
+{
+	struct meson_clk *priv = dev_get_priv(clk->dev);
+	struct parm *pm, *pn, *pod;
+	unsigned long parent_rate_mhz = XTAL_RATE / 1000000;
+	u16 n, m, od;
+	u32 reg;
+
+	switch (id) {
+	case CLKID_FIXED_PLL:
+		pm = &meson_fixed_pll_parm[0];
+		pn = &meson_fixed_pll_parm[1];
+		pod = &meson_fixed_pll_parm[2];
+		break;
+	case CLKID_SYS_PLL:
+		pm = &meson_sys_pll_parm[0];
+		pn = &meson_sys_pll_parm[1];
+		pod = &meson_sys_pll_parm[2];
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	reg = readl(priv->addr + pn->reg_off);
+	n = PARM_GET(pn->width, pn->shift, reg);
+
+	reg = readl(priv->addr + pm->reg_off);
+	m = PARM_GET(pm->width, pm->shift, reg);
+
+	reg = readl(priv->addr + pod->reg_off);
+	od = PARM_GET(pod->width, pod->shift, reg);
+
+	return ((parent_rate_mhz * m / n) >> od) * 1000000;
+}
+
+static ulong meson_clk_get_rate_by_id(struct clk *clk, unsigned long id)
+{
+	ulong rate;
+
+	switch (id) {
+	case CLKID_FIXED_PLL:
+	case CLKID_SYS_PLL:
+		rate = meson_pll_get_rate(clk, id);
+		break;
+	case CLKID_FCLK_DIV2:
+		rate = meson_pll_get_rate(clk, CLKID_FIXED_PLL) / 2;
+		break;
+	case CLKID_FCLK_DIV3:
+		rate = meson_pll_get_rate(clk, CLKID_FIXED_PLL) / 3;
+		break;
+	case CLKID_FCLK_DIV4:
+		rate = meson_pll_get_rate(clk, CLKID_FIXED_PLL) / 4;
+		break;
+	case CLKID_FCLK_DIV5:
+		rate = meson_pll_get_rate(clk, CLKID_FIXED_PLL) / 5;
+		break;
+	case CLKID_FCLK_DIV7:
+		rate = meson_pll_get_rate(clk, CLKID_FIXED_PLL) / 7;
+		break;
+	case CLKID_MPLL0:
+	case CLKID_MPLL1:
+	case CLKID_MPLL2:
+		rate = meson_mpll_get_rate(clk, id);
+		break;
+	case CLKID_CLK81:
+		rate = meson_clk81_get_rate(clk);
+		break;
+	default:
+		if (gates[id].reg != 0) {
+			/* a clock gate */
+			rate = meson_clk81_get_rate(clk);
+			break;
+		}
+		return -ENOENT;
+	}
+
+	printf("clock %lu has rate %lu\n", id, rate);
+	return rate;
+}
+
+static ulong meson_clk_get_rate(struct clk *clk)
+{
+	return meson_clk_get_rate_by_id(clk, clk->id);
+}
+
+static int meson_clk_probe(struct udevice *dev)
+{
+	struct meson_clk *priv = dev_get_priv(dev);
+
+	priv->addr = dev_read_addr_ptr(dev);
+
+	debug("meson-clk: probed at addr %p\n", priv->addr);
+
+	return 0;
+}
+
+static struct clk_ops meson_clk_ops = {
+	.disable	= meson_clk_disable,
+	.enable		= meson_clk_enable,
+	.get_rate	= meson_clk_get_rate,
+};
+
+static const struct udevice_id meson_clk_ids[] = {
+	{ .compatible = "amlogic,gxbb-clkc" },
+	{ .compatible = "amlogic,gxl-clkc" },
+	{ }
+};
+
+U_BOOT_DRIVER(meson_clk) = {
+	.name		= "meson_clk",
+	.id		= UCLASS_CLK,
+	.of_match	= meson_clk_ids,
+	.priv_auto_alloc_size = sizeof(struct meson_clk),
+	.ops		= &meson_clk_ops,
+	.probe		= meson_clk_probe,
+};
diff --git a/drivers/clk/clk_meson.h b/drivers/clk/clk_meson.h
new file mode 100644
index 0000000..7adc55a
--- /dev/null
+++ b/drivers/clk/clk_meson.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * (C) Copyright 2018 - Beniamino Galvani <b.galvani@gmail.com>
+ * (C) Copyright 2018 - BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef CLK_MESON_H
+#define CLK_MESON_H
+
+/* Gate Structure */
+
+struct meson_gate {
+	unsigned int reg;
+	unsigned int bit;
+};
+
+#define MESON_GATE(id, _reg, _bit)		\
+	[id] = {				\
+		.reg = (_reg),			\
+		.bit = (_bit),			\
+	}
+
+/* PLL Parameters */
+
+struct parm {
+	u16 reg_off;
+	u8 shift;
+	u8 width;
+};
+
+#define PMASK(width)                    GENMASK(width - 1, 0)
+#define SETPMASK(width, shift)          GENMASK(shift + width - 1, shift)
+#define CLRPMASK(width, shift)          (~SETPMASK(width, shift))
+
+#define PARM_GET(width, shift, reg)                                     \
+	(((reg) & SETPMASK(width, shift)) >> (shift))
+#define PARM_SET(width, shift, reg, val)                                \
+	(((reg) & CLRPMASK(width, shift)) | ((val) << (shift)))
+
+/* MPLL Parameters */
+
+#define SDM_DEN 16384
+#define N2_MIN  4
+#define N2_MAX  511
+
+#endif
-- 
2.7.4
