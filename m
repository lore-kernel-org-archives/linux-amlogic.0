From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 16:26:52 +0100
Subject: [PATCH u-boot 13/19] ARM: meson: rework soc arch file to prepare for
 new SoC
In-Reply-To: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541777218-472-14-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

We are about to add support for the Amlogic AXG SoC. While very close to
the Gx SoC family, we will need to handle a few thing which are different
in this SoC. Rework the meson arch directory to prepare for this.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/include/asm/arch-meson/clock-gx.h | 117 +++++++++++++++++++++++++
 arch/arm/include/asm/arch-meson/clock.h    | 117 -------------------------
 arch/arm/include/asm/arch-meson/eth.h      |   6 +-
 arch/arm/include/asm/arch-meson/mem.h      |   3 +-
 arch/arm/mach-meson/Kconfig                |  10 ++-
 arch/arm/mach-meson/Makefile               |   3 +-
 arch/arm/mach-meson/board-common.c         |  56 ++++++++++++
 arch/arm/mach-meson/board-gx.c             | 132 +++++++++++++++++++++++++++++
 arch/arm/mach-meson/board.c                | 130 ----------------------------
 arch/arm/mach-meson/eth.c                  |  53 ------------
 arch/arm/mach-meson/sm.c                   |   1 -
 board/amlogic/odroid-c2/odroid-c2.c        |   6 +-
 board/amlogic/p212/p212.c                  |   6 +-
 board/amlogic/q200/q200.c                  |   4 +-
 drivers/clk/clk_meson.c                    |   2 +-
 15 files changed, 328 insertions(+), 318 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-meson/clock-gx.h
 delete mode 100644 arch/arm/include/asm/arch-meson/clock.h
 create mode 100644 arch/arm/mach-meson/board-common.c
 create mode 100644 arch/arm/mach-meson/board-gx.c
 delete mode 100644 arch/arm/mach-meson/board.c
 delete mode 100644 arch/arm/mach-meson/eth.c

diff --git a/arch/arm/include/asm/arch-meson/clock-gx.h b/arch/arm/include/asm/arch-meson/clock-gx.h
new file mode 100644
index 0000000..13a2e76
--- /dev/null
+++ b/arch/arm/include/asm/arch-meson/clock-gx.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2016 - AmLogic, Inc.
+ * Copyright 2018 - Beniamino Galvani <b.galvani@gmail.com>
+ */
+#ifndef _ARCH_MESON_CLOCK_GX_H_
+#define _ARCH_MESON_CLOCK_GX_H_
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
diff --git a/arch/arm/include/asm/arch-meson/clock.h b/arch/arm/include/asm/arch-meson/clock.h
deleted file mode 100644
index c0ff00f..0000000
--- a/arch/arm/include/asm/arch-meson/clock.h
+++ /dev/null
@@ -1,117 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Copyright 2016 - AmLogic, Inc.
- * Copyright 2018 - Beniamino Galvani <b.galvani@gmail.com>
- */
-#ifndef _ARCH_MESON_CLOCK_H_
-#define _ARCH_MESON_CLOCK_H_
-
-/*
- * Clock controller register offsets
- *
- * Register offsets from the data sheet are listed in comment blocks below.
- * Those offsets must be multiplied by 4 before adding them to the base address
- * to get the right value
- */
-#define SCR				0x2C /* 0x0b offset in data sheet */
-#define TIMEOUT_VALUE			0x3c /* 0x0f offset in data sheet */
-
-#define HHI_GP0_PLL_CNTL		0x40 /* 0x10 offset in data sheet */
-#define HHI_GP0_PLL_CNTL2		0x44 /* 0x11 offset in data sheet */
-#define HHI_GP0_PLL_CNTL3		0x48 /* 0x12 offset in data sheet */
-#define HHI_GP0_PLL_CNTL4		0x4c /* 0x13 offset in data sheet */
-#define	HHI_GP0_PLL_CNTL5		0x50 /* 0x14 offset in data sheet */
-#define	HHI_GP0_PLL_CNTL1		0x58 /* 0x16 offset in data sheet */
-
-#define	HHI_XTAL_DIVN_CNTL		0xbc /* 0x2f offset in data sheet */
-#define	HHI_TIMER90K			0xec /* 0x3b offset in data sheet */
-
-#define	HHI_MEM_PD_REG0			0x100 /* 0x40 offset in data sheet */
-#define	HHI_MEM_PD_REG1			0x104 /* 0x41 offset in data sheet */
-#define	HHI_VPU_MEM_PD_REG1		0x108 /* 0x42 offset in data sheet */
-#define	HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
-#define	HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
-
-#define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
-#define HHI_GCLK_MPEG1			0x144 /* 0x51 offset in data sheet */
-#define HHI_GCLK_MPEG2			0x148 /* 0x52 offset in data sheet */
-#define HHI_GCLK_OTHER			0x150 /* 0x54 offset in data sheet */
-#define HHI_GCLK_AO			0x154 /* 0x55 offset in data sheet */
-#define HHI_SYS_OSCIN_CNTL		0x158 /* 0x56 offset in data sheet */
-#define HHI_SYS_CPU_CLK_CNTL1		0x15c /* 0x57 offset in data sheet */
-#define HHI_SYS_CPU_RESET_CNTL		0x160 /* 0x58 offset in data sheet */
-#define HHI_VID_CLK_DIV			0x164 /* 0x59 offset in data sheet */
-
-#define HHI_MPEG_CLK_CNTL		0x174 /* 0x5d offset in data sheet */
-#define HHI_AUD_CLK_CNTL		0x178 /* 0x5e offset in data sheet */
-#define HHI_VID_CLK_CNTL		0x17c /* 0x5f offset in data sheet */
-#define HHI_AUD_CLK_CNTL2		0x190 /* 0x64 offset in data sheet */
-#define HHI_VID_CLK_CNTL2		0x194 /* 0x65 offset in data sheet */
-#define HHI_SYS_CPU_CLK_CNTL0		0x19c /* 0x67 offset in data sheet */
-#define HHI_VID_PLL_CLK_DIV		0x1a0 /* 0x68 offset in data sheet */
-#define HHI_AUD_CLK_CNTL3		0x1a4 /* 0x69 offset in data sheet */
-#define HHI_MALI_CLK_CNTL		0x1b0 /* 0x6c offset in data sheet */
-#define HHI_VPU_CLK_CNTL		0x1bC /* 0x6f offset in data sheet */
-
-#define HHI_HDMI_CLK_CNTL		0x1CC /* 0x73 offset in data sheet */
-#define HHI_VDEC_CLK_CNTL		0x1E0 /* 0x78 offset in data sheet */
-#define HHI_VDEC2_CLK_CNTL		0x1E4 /* 0x79 offset in data sheet */
-#define HHI_VDEC3_CLK_CNTL		0x1E8 /* 0x7a offset in data sheet */
-#define HHI_VDEC4_CLK_CNTL		0x1EC /* 0x7b offset in data sheet */
-#define HHI_HDCP22_CLK_CNTL		0x1F0 /* 0x7c offset in data sheet */
-#define HHI_VAPBCLK_CNTL		0x1F4 /* 0x7d offset in data sheet */
-
-#define HHI_VPU_CLKB_CNTL		0x20C /* 0x83 offset in data sheet */
-#define HHI_USB_CLK_CNTL		0x220 /* 0x88 offset in data sheet */
-#define HHI_32K_CLK_CNTL		0x224 /* 0x89 offset in data sheet */
-#define HHI_GEN_CLK_CNTL		0x228 /* 0x8a offset in data sheet */
-#define HHI_GEN_CLK_CNTL		0x228 /* 0x8a offset in data sheet */
-
-#define HHI_PCM_CLK_CNTL		0x258 /* 0x96 offset in data sheet */
-#define HHI_NAND_CLK_CNTL		0x25C /* 0x97 offset in data sheet */
-#define HHI_SD_EMMC_CLK_CNTL		0x264 /* 0x99 offset in data sheet */
-
-#define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
-#define HHI_MPLL_CNTL2			0x284 /* 0xa1 offset in data sheet */
-#define HHI_MPLL_CNTL3			0x288 /* 0xa2 offset in data sheet */
-#define HHI_MPLL_CNTL4			0x28C /* 0xa3 offset in data sheet */
-#define HHI_MPLL_CNTL5			0x290 /* 0xa4 offset in data sheet */
-#define HHI_MPLL_CNTL6			0x294 /* 0xa5 offset in data sheet */
-#define HHI_MPLL_CNTL7			0x298 /* 0xa6 offset in data sheet */
-#define HHI_MPLL_CNTL8			0x29C /* 0xa7 offset in data sheet */
-#define HHI_MPLL_CNTL9			0x2A0 /* 0xa8 offset in data sheet */
-#define HHI_MPLL_CNTL10			0x2A4 /* 0xa9 offset in data sheet */
-
-#define HHI_MPLL3_CNTL0			0x2E0 /* 0xb8 offset in data sheet */
-#define HHI_MPLL3_CNTL1			0x2E4 /* 0xb9 offset in data sheet */
-#define HHI_VDAC_CNTL0			0x2F4 /* 0xbd offset in data sheet */
-#define HHI_VDAC_CNTL1			0x2F8 /* 0xbe offset in data sheet */
-
-#define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
-#define HHI_SYS_PLL_CNTL2		0x304 /* 0xc1 offset in data sheet */
-#define HHI_SYS_PLL_CNTL3		0x308 /* 0xc2 offset in data sheet */
-#define HHI_SYS_PLL_CNTL4		0x30c /* 0xc3 offset in data sheet */
-#define HHI_SYS_PLL_CNTL5		0x310 /* 0xc4 offset in data sheet */
-#define HHI_DPLL_TOP_I			0x318 /* 0xc6 offset in data sheet */
-#define HHI_DPLL_TOP2_I			0x31C /* 0xc7 offset in data sheet */
-#define HHI_HDMI_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
-#define HHI_HDMI_PLL_CNTL2		0x324 /* 0xc9 offset in data sheet */
-#define HHI_HDMI_PLL_CNTL3		0x328 /* 0xca offset in data sheet */
-#define HHI_HDMI_PLL_CNTL4		0x32C /* 0xcb offset in data sheet */
-#define HHI_HDMI_PLL_CNTL5		0x330 /* 0xcc offset in data sheet */
-#define HHI_HDMI_PLL_CNTL6		0x334 /* 0xcd offset in data sheet */
-#define HHI_HDMI_PLL_CNTL_I		0x338 /* 0xce offset in data sheet */
-#define HHI_HDMI_PLL_CNTL7		0x33C /* 0xcf offset in data sheet */
-
-#define HHI_HDMI_PHY_CNTL0		0x3A0 /* 0xe8 offset in data sheet */
-#define HHI_HDMI_PHY_CNTL1		0x3A4 /* 0xe9 offset in data sheet */
-#define HHI_HDMI_PHY_CNTL2		0x3A8 /* 0xea offset in data sheet */
-#define HHI_HDMI_PHY_CNTL3		0x3AC /* 0xeb offset in data sheet */
-
-#define HHI_VID_LOCK_CLK_CNTL		0x3C8 /* 0xf2 offset in data sheet */
-#define HHI_BT656_CLK_CNTL		0x3D4 /* 0xf5 offset in data sheet */
-#define HHI_SAR_CLK_CNTL		0x3D8 /* 0xf6 offset in data sheet */
-
-ulong meson_measure_clk_rate(unsigned int clk);
-
-#endif
diff --git a/arch/arm/include/asm/arch-meson/eth.h b/arch/arm/include/asm/arch-meson/eth.h
index 1aa0872..08acc5c 100644
--- a/arch/arm/include/asm/arch-meson/eth.h
+++ b/arch/arm/include/asm/arch-meson/eth.h
@@ -10,13 +10,13 @@
 #include <phy.h>
 
 enum {
-	/* Use GXL Internal RMII PHY */
-	MESON_GXL_USE_INTERNAL_RMII_PHY = 1,
+	/* Use Internal RMII PHY */
+	MESON_USE_INTERNAL_RMII_PHY = 1,
 };
 
 /* Configure the Ethernet MAC with the requested interface mode
  * with some optional flags.
  */
-void meson_gx_eth_init(phy_interface_t mode, unsigned int flags);
+void meson_eth_init(phy_interface_t mode, unsigned int flags);
 
 #endif /* __MESON_ETH_H__ */
diff --git a/arch/arm/include/asm/arch-meson/mem.h b/arch/arm/include/asm/arch-meson/mem.h
index 6281833..a65100a 100644
--- a/arch/arm/include/asm/arch-meson/mem.h
+++ b/arch/arm/include/asm/arch-meson/mem.h
@@ -10,6 +10,7 @@
 /* Configure the reserved memory zones exported by the secure registers
  * into EFI and DTB reserved memory entries.
  */
-void meson_gx_init_reserved_memory(void *fdt);
+void meson_board_add_reserved_memory(void *fdt, u64 start, u64 size);
+void meson_init_reserved_memory(void *fdt);
 
 #endif /* __MESON_MEM_H__ */
diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 6f60167..6225417 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -8,25 +8,29 @@ config MESON64_COMMON
 	select DM_SERIAL
 	imply CMD_DM
 
+config MESON_GX
+	bool
+	select MESON64_COMMON
+
 choice
 	prompt "Platform select"
 	default MESON_GXBB
 
 config MESON_GXBB
 	bool "GXBB"
-	select MESON64_COMMON
+	select MESON_GX
 	help
 	  Select this if your SoC is an S905
 
 config MESON_GXL
 	bool "GXL"
-	select MESON64_COMMON
+	select MESON_GX
 	help
 	  Select this if your SoC is an S905X/D or S805X
 
 config MESON_GXM
 	bool "GXM"
-	select MESON64_COMMON
+	select MESON_GX
 	help
 	  Select this if your SoC is an S912
 
diff --git a/arch/arm/mach-meson/Makefile b/arch/arm/mach-meson/Makefile
index 8ad9b3e..78345b4 100644
--- a/arch/arm/mach-meson/Makefile
+++ b/arch/arm/mach-meson/Makefile
@@ -2,4 +2,5 @@
 #
 # Copyright (c) 2016 Beniamino Galvani <b.galvani@gmail.com>
 
-obj-y += board.o sm.o eth.o
+obj-y += board-common.o sm.o
+obj-$(CONFIG_MESON_GX) += board-gx.o
diff --git a/arch/arm/mach-meson/board-common.c b/arch/arm/mach-meson/board-common.c
new file mode 100644
index 0000000..0446507
--- /dev/null
+++ b/arch/arm/mach-meson/board-common.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+ */
+
+#include <common.h>
+#include <linux/libfdt.h>
+#include <linux/err.h>
+#include <asm/arch/mem.h>
+#include <asm/arch/sm.h>
+#include <asm/armv8/mmu.h>
+#include <asm/unaligned.h>
+#include <efi_loader.h>
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
+void meson_board_add_reserved_memory(void *fdt, u64 start, u64 size)
+{
+	int ret;
+
+	ret = fdt_add_mem_rsv(fdt, start, size);
+	if (ret)
+		printf("Could not reserve zone @ 0x%llx\n", start);
+
+	if (IS_ENABLED(CONFIG_EFI_LOADER)) {
+		efi_add_memory_map(start,
+				   ALIGN(size, EFI_PAGE_SIZE) >> EFI_PAGE_SHIFT,
+				   EFI_RESERVED_MEMORY_TYPE, false);
+	}
+}
+
+void reset_cpu(ulong addr)
+{
+	psci_system_reset();
+}
+
diff --git a/arch/arm/mach-meson/board-gx.c b/arch/arm/mach-meson/board-gx.c
new file mode 100644
index 0000000..f1397f8
--- /dev/null
+++ b/arch/arm/mach-meson/board-gx.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+ * (C) Copyright 2018 Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <common.h>
+#include <asm/arch/eth.h>
+#include <asm/arch/gx.h>
+#include <asm/arch/mem.h>
+#include <asm/io.h>
+#include <asm/armv8/mmu.h>
+#include <linux/sizes.h>
+#include <phy.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+/* Configure the reserved memory zones exported by the secure registers
+ * into EFI and DTB reserved memory entries.
+ */
+void meson_init_reserved_memory(void *fdt)
+{
+	u64 bl31_size, bl31_start;
+	u64 bl32_size, bl32_start;
+	u32 reg;
+
+	/*
+	 * Get ARM Trusted Firmware reserved memory zones in :
+	 * - AO_SEC_GP_CFG3: bl32 & bl31 size in KiB, can be 0
+	 * - AO_SEC_GP_CFG5: bl31 physical start address, can be NULL
+	 * - AO_SEC_GP_CFG4: bl32 physical start address, can be NULL
+	 */
+	reg = readl(GX_AO_SEC_GP_CFG3);
+
+	bl31_size = ((reg & GX_AO_BL31_RSVMEM_SIZE_MASK)
+			>> GX_AO_BL31_RSVMEM_SIZE_SHIFT) * SZ_1K;
+	bl32_size = (reg & GX_AO_BL32_RSVMEM_SIZE_MASK) * SZ_1K;
+
+	bl31_start = readl(GX_AO_SEC_GP_CFG5);
+	bl32_start = readl(GX_AO_SEC_GP_CFG4);
+
+	/*
+	 * Early Meson GX Firmware revisions did not provide the reserved
+	 * memory zones in the registers, keep fixed memory zone handling.
+	 */
+	if (IS_ENABLED(CONFIG_MESON_GX) &&
+	    !reg && !bl31_start && !bl32_start) {
+		bl31_start = 0x10000000;
+		bl31_size = 0x200000;
+	}
+
+	/* Add first 16MiB reserved zone */
+	meson_board_add_reserved_memory(fdt, 0, GX_FIRMWARE_MEM_SIZE);
+
+	/* Add BL31 reserved zone */
+	if (bl31_start && bl31_size)
+		meson_board_add_reserved_memory(fdt, bl31_start, bl31_size);
+
+	/* Add BL32 reserved zone */
+	if (bl32_start && bl32_size)
+		meson_board_add_reserved_memory(fdt, bl32_start, bl32_size);
+}
+
+phys_size_t get_effective_memsize(void)
+{
+	/* Size is reported in MiB, convert it in bytes */
+	return ((readl(GX_AO_SEC_GP_CFG0) & GX_AO_MEM_SIZE_MASK)
+			>> GX_AO_MEM_SIZE_SHIFT) * SZ_1M;
+}
+
+static struct mm_region gx_mem_map[] = {
+	{
+		.virt = 0x0UL,
+		.phys = 0x0UL,
+		.size = 0xc0000000UL,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
+			 PTE_BLOCK_INNER_SHARE
+	}, {
+		.virt = 0xc0000000UL,
+		.phys = 0xc0000000UL,
+		.size = 0x30000000UL,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* List terminator */
+		0,
+	}
+};
+
+struct mm_region *mem_map = gx_mem_map;
+
+/* Configure the Ethernet MAC with the requested interface mode
+ * with some optional flags.
+ */
+void meson_eth_init(phy_interface_t mode, unsigned int flags)
+{
+	switch (mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		/* Set RGMII mode */
+		setbits_le32(GX_ETH_REG_0, GX_ETH_REG_0_PHY_INTF |
+			     GX_ETH_REG_0_TX_PHASE(1) |
+			     GX_ETH_REG_0_TX_RATIO(4) |
+			     GX_ETH_REG_0_PHY_CLK_EN |
+			     GX_ETH_REG_0_CLK_EN);
+		break;
+
+	case PHY_INTERFACE_MODE_RMII:
+		/* Set RMII mode */
+		out_le32(GX_ETH_REG_0, GX_ETH_REG_0_INVERT_RMII_CLK |
+					 GX_ETH_REG_0_CLK_EN);
+
+		/* Use GXL RMII Internal PHY */
+		if (IS_ENABLED(CONFIG_MESON_GXL) &&
+		    (flags & MESON_USE_INTERNAL_RMII_PHY)) {
+			writel(0x10110181, GX_ETH_REG_2);
+			writel(0xe40908ff, GX_ETH_REG_3);
+		}
+
+		break;
+
+	default:
+		printf("Invalid Ethernet interface mode\n");
+		return;
+	}
+
+	/* Enable power gate */
+	clrbits_le32(GX_MEM_PD_REG_0, GX_MEM_PD_REG_0_ETH_MASK);
+}
diff --git a/arch/arm/mach-meson/board.c b/arch/arm/mach-meson/board.c
deleted file mode 100644
index d6c6253..0000000
--- a/arch/arm/mach-meson/board.c
+++ /dev/null
@@ -1,130 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
- */
-
-#include <common.h>
-#include <linux/libfdt.h>
-#include <linux/err.h>
-#include <asm/arch/gx.h>
-#include <asm/arch/sm.h>
-#include <asm/armv8/mmu.h>
-#include <asm/unaligned.h>
-#include <linux/sizes.h>
-#include <efi_loader.h>
-#include <asm/io.h>
-
-DECLARE_GLOBAL_DATA_PTR;
-
-int dram_init(void)
-{
-	const fdt64_t *val;
-	int offset;
-	int len;
-
-	offset = fdt_path_offset(gd->fdt_blob, "/memory");
-	if (offset < 0)
-		return -EINVAL;
-
-	val = fdt_getprop(gd->fdt_blob, offset, "reg", &len);
-	if (len < sizeof(*val) * 2)
-		return -EINVAL;
-
-	/* Use unaligned access since cache is still disabled */
-	gd->ram_size = get_unaligned_be64(&val[1]);
-
-	return 0;
-}
-
-phys_size_t get_effective_memsize(void)
-{
-	/* Size is reported in MiB, convert it in bytes */
-	return ((readl(GX_AO_SEC_GP_CFG0) & GX_AO_MEM_SIZE_MASK)
-			>> GX_AO_MEM_SIZE_SHIFT) * SZ_1M;
-}
-
-static void meson_board_add_reserved_memory(void *fdt, u64 start, u64 size)
-{
-	int ret;
-
-	ret = fdt_add_mem_rsv(fdt, start, size);
-	if (ret)
-		printf("Could not reserve zone @ 0x%llx\n", start);
-
-	if (IS_ENABLED(CONFIG_EFI_LOADER)) {
-		efi_add_memory_map(start,
-				   ALIGN(size, EFI_PAGE_SIZE) >> EFI_PAGE_SHIFT,
-				   EFI_RESERVED_MEMORY_TYPE, false);
-	}
-}
-
-void meson_gx_init_reserved_memory(void *fdt)
-{
-	u64 bl31_size, bl31_start;
-	u64 bl32_size, bl32_start;
-	u32 reg;
-
-	/*
-	 * Get ARM Trusted Firmware reserved memory zones in :
-	 * - AO_SEC_GP_CFG3: bl32 & bl31 size in KiB, can be 0
-	 * - AO_SEC_GP_CFG5: bl31 physical start address, can be NULL
-	 * - AO_SEC_GP_CFG4: bl32 physical start address, can be NULL
-	 */
-
-	reg = readl(GX_AO_SEC_GP_CFG3);
-
-	bl31_size = ((reg & GX_AO_BL31_RSVMEM_SIZE_MASK)
-			>> GX_AO_BL31_RSVMEM_SIZE_SHIFT) * SZ_1K;
-	bl32_size = (reg & GX_AO_BL32_RSVMEM_SIZE_MASK) * SZ_1K;
-
-	bl31_start = readl(GX_AO_SEC_GP_CFG5);
-	bl32_start = readl(GX_AO_SEC_GP_CFG4);
-
-	/*
-	 * Early Meson GX Firmware revisions did not provide the reserved
-	 * memory zones in the registers, keep fixed memory zone handling.
-	 */
-	if (IS_ENABLED(CONFIG_MESON_GX) &&
-	    !reg && !bl31_start && !bl32_start) {
-		bl31_start = 0x10000000;
-		bl31_size = 0x200000;
-	}
-
-	/* Add first 16MiB reserved zone */
-	meson_board_add_reserved_memory(fdt, 0, GX_FIRMWARE_MEM_SIZE);
-
-	/* Add BL31 reserved zone */
-	if (bl31_start && bl31_size)
-		meson_board_add_reserved_memory(fdt, bl31_start, bl31_size);
-
-	/* Add BL32 reserved zone */
-	if (bl32_start && bl32_size)
-		meson_board_add_reserved_memory(fdt, bl32_start, bl32_size);
-}
-
-void reset_cpu(ulong addr)
-{
-	psci_system_reset();
-}
-
-static struct mm_region gx_mem_map[] = {
-	{
-		.virt = 0x0UL,
-		.phys = 0x0UL,
-		.size = 0xc0000000UL,
-		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
-			 PTE_BLOCK_INNER_SHARE
-	}, {
-		.virt = 0xc0000000UL,
-		.phys = 0xc0000000UL,
-		.size = 0x30000000UL,
-		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-			 PTE_BLOCK_NON_SHARE |
-			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
-	}, {
-		/* List terminator */
-		0,
-	}
-};
-
-struct mm_region *mem_map = gx_mem_map;
diff --git a/arch/arm/mach-meson/eth.c b/arch/arm/mach-meson/eth.c
deleted file mode 100644
index 8b28bc8..0000000
--- a/arch/arm/mach-meson/eth.c
+++ /dev/null
@@ -1,53 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2016 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#include <common.h>
-#include <dm.h>
-#include <asm/io.h>
-#include <asm/arch/gx.h>
-#include <asm/arch/eth.h>
-#include <phy.h>
-
-/* Configure the Ethernet MAC with the requested interface mode
- * with some optional flags.
- */
-void meson_gx_eth_init(phy_interface_t mode, unsigned int flags)
-{
-	switch (mode) {
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		/* Set RGMII mode */
-		setbits_le32(GX_ETH_REG_0, GX_ETH_REG_0_PHY_INTF |
-			     GX_ETH_REG_0_TX_PHASE(1) |
-			     GX_ETH_REG_0_TX_RATIO(4) |
-			     GX_ETH_REG_0_PHY_CLK_EN |
-			     GX_ETH_REG_0_CLK_EN);
-		break;
-
-	case PHY_INTERFACE_MODE_RMII:
-		/* Set RMII mode */
-		out_le32(GX_ETH_REG_0, GX_ETH_REG_0_INVERT_RMII_CLK |
-					 GX_ETH_REG_0_CLK_EN);
-
-		/* Use GXL RMII Internal PHY */
-		if (IS_ENABLED(CONFIG_MESON_GXL) &&
-		    (flags & MESON_GXL_USE_INTERNAL_RMII_PHY)) {
-			writel(0x10110181, GX_ETH_REG_2);
-			writel(0xe40908ff, GX_ETH_REG_3);
-		}
-
-		break;
-
-	default:
-		printf("Invalid Ethernet interface mode\n");
-		return;
-	}
-
-	/* Enable power gate */
-	clrbits_le32(GX_MEM_PD_REG_0, GX_MEM_PD_REG_0_ETH_MASK);
-}
diff --git a/arch/arm/mach-meson/sm.c b/arch/arm/mach-meson/sm.c
index 0bba5e4..a07b468 100644
--- a/arch/arm/mach-meson/sm.c
+++ b/arch/arm/mach-meson/sm.c
@@ -6,7 +6,6 @@
  */
 
 #include <common.h>
-#include <asm/arch/gx.h>
 #include <linux/kernel.h>
 
 #define FN_GET_SHARE_MEM_INPUT_BASE	0x82000020
diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
index 2a2755c..d784d6b 100644
--- a/board/amlogic/odroid-c2/odroid-c2.c
+++ b/board/amlogic/odroid-c2/odroid-c2.c
@@ -28,7 +28,7 @@ int misc_init_r(void)
 	char serial[EFUSE_SN_SIZE];
 	ssize_t len;
 
-	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
+	meson_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
 
 	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
 		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
@@ -40,7 +40,7 @@ int misc_init_r(void)
 	if (!env_get("serial#")) {
 		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
 			EFUSE_SN_SIZE);
-		if (len == EFUSE_SN_SIZE) 
+		if (len == EFUSE_SN_SIZE)
 			env_set("serial#", serial);
 	}
 
@@ -49,7 +49,7 @@ int misc_init_r(void)
 
 int ft_board_setup(void *blob, bd_t *bd)
 {
-	meson_gx_init_reserved_memory(blob);
+	meson_init_reserved_memory(blob);
 
 	return 0;
 }
diff --git a/board/amlogic/p212/p212.c b/board/amlogic/p212/p212.c
index 00e07d7..33992a2 100644
--- a/board/amlogic/p212/p212.c
+++ b/board/amlogic/p212/p212.c
@@ -29,8 +29,8 @@ int misc_init_r(void)
 	char serial[EFUSE_SN_SIZE];
 	ssize_t len;
 
-	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII,
-			  MESON_GXL_USE_INTERNAL_RMII_PHY);
+	meson_eth_init(PHY_INTERFACE_MODE_RMII,
+		       MESON_USE_INTERNAL_RMII_PHY);
 
 	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
 		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
@@ -51,7 +51,7 @@ int misc_init_r(void)
 
 int ft_board_setup(void *blob, bd_t *bd)
 {
-	meson_gx_init_reserved_memory(blob);
+	meson_init_reserved_memory(blob);
 
 	return 0;
 }
diff --git a/board/amlogic/q200/q200.c b/board/amlogic/q200/q200.c
index ff56569..b59c11b 100644
--- a/board/amlogic/q200/q200.c
+++ b/board/amlogic/q200/q200.c
@@ -29,7 +29,7 @@ int misc_init_r(void)
 	char serial[EFUSE_SN_SIZE];
 	ssize_t len;
 
-	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
+	meson_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
 
 	/* Reset PHY on GPIOZ_14 */
 	clrbits_le32(GX_GPIO_EN(3), BIT(14));
@@ -56,7 +56,7 @@ int misc_init_r(void)
 
 int ft_board_setup(void *blob, bd_t *bd)
 {
-	meson_gx_init_reserved_memory(blob);
+	meson_init_reserved_memory(blob);
 
 	return 0;
 }
diff --git a/drivers/clk/clk_meson.c b/drivers/clk/clk_meson.c
index 87e959e..978f646 100644
--- a/drivers/clk/clk_meson.c
+++ b/drivers/clk/clk_meson.c
@@ -6,7 +6,7 @@
  */
 
 #include <common.h>
-#include <asm/arch/clock.h>
+#include <asm/arch/clock-gx.h>
 #include <asm/io.h>
 #include <clk-uclass.h>
 #include <div64.h>
-- 
2.7.4
