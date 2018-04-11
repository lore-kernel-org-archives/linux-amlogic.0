From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 11 Apr 2018 17:13:45 +0200
Subject: [PATCH v2 u-boot] ARM: meson: rename GXBB to GX
Message-ID: <1523459625-16446-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Taking into account the Amlogic Family name starts with GX, including
the GXBB, GXL and GXM SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---

Changes since v1:
 - Resent as single patch since cpuinfo needs further work
 - Aligned the defines in gx.h

 arch/arm/include/asm/arch-meson/gx.h      | 70 +++++++++++++++++++++++++++++++
 arch/arm/include/asm/arch-meson/gxbb.h    | 70 -------------------------------
 arch/arm/mach-meson/board.c               | 28 ++++++-------
 arch/arm/mach-meson/eth.c                 | 24 +++++------
 arch/arm/mach-meson/sm.c                  |  2 +-
 board/amlogic/khadas-vim/khadas-vim.c     |  2 +-
 board/amlogic/libretech-cc/libretech-cc.c |  6 +--
 board/amlogic/odroid-c2/odroid-c2.c       | 10 ++---
 board/amlogic/p212/p212.c                 |  2 +-
 include/configs/khadas-vim.h              |  2 +-
 include/configs/libretech-cc.h            |  2 +-
 include/configs/meson-gx-common.h         | 47 +++++++++++++++++++++
 include/configs/meson-gxbb-common.h       | 47 ---------------------
 include/configs/odroid-c2.h               |  2 +-
 include/configs/p212.h                    |  2 +-
 15 files changed, 158 insertions(+), 158 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-meson/gx.h
 delete mode 100644 arch/arm/include/asm/arch-meson/gxbb.h
 create mode 100644 include/configs/meson-gx-common.h
 delete mode 100644 include/configs/meson-gxbb-common.h

diff --git a/arch/arm/include/asm/arch-meson/gx.h b/arch/arm/include/asm/arch-meson/gx.h
new file mode 100644
index 0000000..2b311cd
--- /dev/null
+++ b/arch/arm/include/asm/arch-meson/gx.h
@@ -0,0 +1,70 @@
+/*
+ * (C) Copyright 2016 - Beniamino Galvani <b.galvani@gmail.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef __GX_H__
+#define __GX_H__
+
+#define GX_FIRMWARE_MEM_SIZE		0x1000000
+
+#define GX_AOBUS_BASE			0xc8100000
+#define GX_PERIPHS_BASE			0xc8834400
+#define GX_HIU_BASE			0xc883c000
+#define GX_ETH_BASE			0xc9410000
+
+/* Always-On Peripherals registers */
+#define GX_AO_ADDR(off)			(GX_AOBUS_BASE + ((off) << 2))
+
+#define GX_AO_SEC_GP_CFG0		GX_AO_ADDR(0x90)
+#define GX_AO_SEC_GP_CFG3		GX_AO_ADDR(0x93)
+#define GX_AO_SEC_GP_CFG4		GX_AO_ADDR(0x94)
+#define GX_AO_SEC_GP_CFG5		GX_AO_ADDR(0x95)
+
+#define GX_AO_MEM_SIZE_MASK		0xFFFF0000
+#define GX_AO_MEM_SIZE_SHIFT		16
+#define GX_AO_BL31_RSVMEM_SIZE_MASK	0xFFFF0000
+#define GX_AO_BL31_RSVMEM_SIZE_SHIFT	16
+#define GX_AO_BL32_RSVMEM_SIZE_MASK	0xFFFF
+
+/* Peripherals registers */
+#define GX_PERIPHS_ADDR(off)		(GX_PERIPHS_BASE + ((off) << 2))
+
+/* GPIO registers 0 to 6 */
+#define _GX_GPIO_OFF(n)			((n) == 6 ? 0x08 : 0x0c + 3 * (n))
+#define GX_GPIO_EN(n)			GX_PERIPHS_ADDR(_GX_GPIO_OFF(n) + 0)
+#define GX_GPIO_IN(n)			GX_PERIPHS_ADDR(_GX_GPIO_OFF(n) + 1)
+#define GX_GPIO_OUT(n)			GX_PERIPHS_ADDR(_GX_GPIO_OFF(n) + 2)
+
+#define GX_ETH_REG_0			GX_PERIPHS_ADDR(0x50)
+#define GX_ETH_REG_1			GX_PERIPHS_ADDR(0x51)
+#define GX_ETH_REG_2			GX_PERIPHS_ADDR(0x56)
+#define GX_ETH_REG_3			GX_PERIPHS_ADDR(0x57)
+
+#define GX_ETH_REG_0_PHY_INTF		BIT(0)
+#define GX_ETH_REG_0_TX_PHASE(x)	(((x) & 3) << 5)
+#define GX_ETH_REG_0_TX_RATIO(x)	(((x) & 7) << 7)
+#define GX_ETH_REG_0_PHY_CLK_EN		BIT(10)
+#define GX_ETH_REG_0_INVERT_RMII_CLK	BIT(11)
+#define GX_ETH_REG_0_CLK_EN		BIT(12)
+
+/* HIU registers */
+#define GX_HIU_ADDR(off)		(GX_HIU_BASE + ((off) << 2))
+
+#define GX_MEM_PD_REG_0			GX_HIU_ADDR(0x40)
+
+/* Ethernet memory power domain */
+#define GX_MEM_PD_REG_0_ETH_MASK	(BIT(2) | BIT(3))
+
+/* Clock gates */
+#define GX_GCLK_MPEG_0			GX_HIU_ADDR(0x50)
+#define GX_GCLK_MPEG_1			GX_HIU_ADDR(0x51)
+#define GX_GCLK_MPEG_2			GX_HIU_ADDR(0x52)
+#define GX_GCLK_MPEG_OTHER		GX_HIU_ADDR(0x53)
+#define GX_GCLK_MPEG_AO			GX_HIU_ADDR(0x54)
+
+#define GX_GCLK_MPEG_0_I2C		BIT(9)
+#define GX_GCLK_MPEG_1_ETH		BIT(3)
+
+#endif /* __GX_H__ */
diff --git a/arch/arm/include/asm/arch-meson/gxbb.h b/arch/arm/include/asm/arch-meson/gxbb.h
deleted file mode 100644
index ef63dea..0000000
--- a/arch/arm/include/asm/arch-meson/gxbb.h
+++ /dev/null
@@ -1,70 +0,0 @@
-/*
- * (C) Copyright 2016 - Beniamino Galvani <b.galvani@gmail.com>
- *
- * SPDX-License-Identifier:	GPL-2.0+
- */
-
-#ifndef __GXBB_H__
-#define __GXBB_H__
-
-#define GXBB_FIRMWARE_MEM_SIZE	0x1000000
-
-#define GXBB_AOBUS_BASE		0xc8100000
-#define GXBB_PERIPHS_BASE	0xc8834400
-#define GXBB_HIU_BASE		0xc883c000
-#define GXBB_ETH_BASE		0xc9410000
-
-/* Always-On Peripherals registers */
-#define GXBB_AO_ADDR(off)	(GXBB_AOBUS_BASE + ((off) << 2))
-
-#define GXBB_AO_SEC_GP_CFG0	GXBB_AO_ADDR(0x90)
-#define GXBB_AO_SEC_GP_CFG3	GXBB_AO_ADDR(0x93)
-#define GXBB_AO_SEC_GP_CFG4	GXBB_AO_ADDR(0x94)
-#define GXBB_AO_SEC_GP_CFG5	GXBB_AO_ADDR(0x95)
-
-#define GXBB_AO_MEM_SIZE_MASK	0xFFFF0000
-#define GXBB_AO_MEM_SIZE_SHIFT	16
-#define GXBB_AO_BL31_RSVMEM_SIZE_MASK	0xFFFF0000
-#define GXBB_AO_BL31_RSVMEM_SIZE_SHIFT	16
-#define GXBB_AO_BL32_RSVMEM_SIZE_MASK	0xFFFF
-
-/* Peripherals registers */
-#define GXBB_PERIPHS_ADDR(off)	(GXBB_PERIPHS_BASE + ((off) << 2))
-
-/* GPIO registers 0 to 6 */
-#define _GXBB_GPIO_OFF(n)	((n) == 6 ? 0x08 : 0x0c + 3 * (n))
-#define GXBB_GPIO_EN(n)		GXBB_PERIPHS_ADDR(_GXBB_GPIO_OFF(n) + 0)
-#define GXBB_GPIO_IN(n)		GXBB_PERIPHS_ADDR(_GXBB_GPIO_OFF(n) + 1)
-#define GXBB_GPIO_OUT(n)	GXBB_PERIPHS_ADDR(_GXBB_GPIO_OFF(n) + 2)
-
-#define GXBB_ETH_REG_0		GXBB_PERIPHS_ADDR(0x50)
-#define GXBB_ETH_REG_1		GXBB_PERIPHS_ADDR(0x51)
-#define GXBB_ETH_REG_2		GXBB_PERIPHS_ADDR(0x56)
-#define GXBB_ETH_REG_3		GXBB_PERIPHS_ADDR(0x57)
-
-#define GXBB_ETH_REG_0_PHY_INTF		BIT(0)
-#define GXBB_ETH_REG_0_TX_PHASE(x)	(((x) & 3) << 5)
-#define GXBB_ETH_REG_0_TX_RATIO(x)	(((x) & 7) << 7)
-#define GXBB_ETH_REG_0_PHY_CLK_EN	BIT(10)
-#define GXBB_ETH_REG_0_INVERT_RMII_CLK	BIT(11)
-#define GXBB_ETH_REG_0_CLK_EN		BIT(12)
-
-/* HIU registers */
-#define GXBB_HIU_ADDR(off)	(GXBB_HIU_BASE + ((off) << 2))
-
-#define GXBB_MEM_PD_REG_0	GXBB_HIU_ADDR(0x40)
-
-/* Ethernet memory power domain */
-#define GXBB_MEM_PD_REG_0_ETH_MASK	(BIT(2) | BIT(3))
-
-/* Clock gates */
-#define GXBB_GCLK_MPEG_0	GXBB_HIU_ADDR(0x50)
-#define GXBB_GCLK_MPEG_1	GXBB_HIU_ADDR(0x51)
-#define GXBB_GCLK_MPEG_2	GXBB_HIU_ADDR(0x52)
-#define GXBB_GCLK_MPEG_OTHER	GXBB_HIU_ADDR(0x53)
-#define GXBB_GCLK_MPEG_AO	GXBB_HIU_ADDR(0x54)
-
-#define GXBB_GCLK_MPEG_0_I2C   BIT(9)
-#define GXBB_GCLK_MPEG_1_ETH	BIT(3)
-
-#endif /* __GXBB_H__ */
diff --git a/arch/arm/mach-meson/board.c b/arch/arm/mach-meson/board.c
index b6d3a17..0693d9d 100644
--- a/arch/arm/mach-meson/board.c
+++ b/arch/arm/mach-meson/board.c
@@ -7,7 +7,7 @@
 #include <common.h>
 #include <linux/libfdt.h>
 #include <linux/err.h>
-#include <asm/arch/gxbb.h>
+#include <asm/arch/gx.h>
 #include <asm/arch/sm.h>
 #include <asm/armv8/mmu.h>
 #include <asm/unaligned.h>
@@ -40,8 +40,8 @@ int dram_init(void)
 phys_size_t get_effective_memsize(void)
 {
 	/* Size is reported in MiB, convert it in bytes */
-	return ((readl(GXBB_AO_SEC_GP_CFG0) & GXBB_AO_MEM_SIZE_MASK)
-			>> GXBB_AO_MEM_SIZE_SHIFT) * SZ_1M;
+	return ((readl(GX_AO_SEC_GP_CFG0) & GX_AO_MEM_SIZE_MASK)
+			>> GX_AO_MEM_SIZE_SHIFT) * SZ_1M;
 }
 
 static void meson_board_add_reserved_memory(void *fdt, u64 start, u64 size)
@@ -72,27 +72,27 @@ void meson_gx_init_reserved_memory(void *fdt)
 	 * - AO_SEC_GP_CFG4: bl32 physical start address, can be NULL
 	 */
 
-	reg = readl(GXBB_AO_SEC_GP_CFG3);
+	reg = readl(GX_AO_SEC_GP_CFG3);
 
-	bl31_size = ((reg & GXBB_AO_BL31_RSVMEM_SIZE_MASK)
-			>> GXBB_AO_BL31_RSVMEM_SIZE_SHIFT) * SZ_1K;
-	bl32_size = (reg & GXBB_AO_BL32_RSVMEM_SIZE_MASK) * SZ_1K;
+	bl31_size = ((reg & GX_AO_BL31_RSVMEM_SIZE_MASK)
+			>> GX_AO_BL31_RSVMEM_SIZE_SHIFT) * SZ_1K;
+	bl32_size = (reg & GX_AO_BL32_RSVMEM_SIZE_MASK) * SZ_1K;
 
-	bl31_start = readl(GXBB_AO_SEC_GP_CFG5);
-	bl32_start = readl(GXBB_AO_SEC_GP_CFG4);
+	bl31_start = readl(GX_AO_SEC_GP_CFG5);
+	bl32_start = readl(GX_AO_SEC_GP_CFG4);
 
 	/*
-	 * Early Meson GXBB Firmware revisions did not provide the reserved
+	 * Early Meson GX Firmware revisions did not provide the reserved
 	 * memory zones in the registers, keep fixed memory zone handling.
 	 */
-	if (IS_ENABLED(CONFIG_MESON_GXBB) &&
+	if (IS_ENABLED(CONFIG_MESON_GX) &&
 	    !reg && !bl31_start && !bl32_start) {
 		bl31_start = 0x10000000;
 		bl31_size = 0x200000;
 	}
 
 	/* Add first 16MiB reserved zone */
-	meson_board_add_reserved_memory(fdt, 0, GXBB_FIRMWARE_MEM_SIZE);
+	meson_board_add_reserved_memory(fdt, 0, GX_FIRMWARE_MEM_SIZE);
 
 	/* Add BL31 reserved zone */
 	if (bl31_start && bl31_size)
@@ -108,7 +108,7 @@ void reset_cpu(ulong addr)
 	psci_system_reset();
 }
 
-static struct mm_region gxbb_mem_map[] = {
+static struct mm_region gx_mem_map[] = {
 	{
 		.virt = 0x0UL,
 		.phys = 0x0UL,
@@ -128,4 +128,4 @@ static struct mm_region gxbb_mem_map[] = {
 	}
 };
 
-struct mm_region *mem_map = gxbb_mem_map;
+struct mm_region *mem_map = gx_mem_map;
diff --git a/arch/arm/mach-meson/eth.c b/arch/arm/mach-meson/eth.c
index 8c6577b..8050bfa 100644
--- a/arch/arm/mach-meson/eth.c
+++ b/arch/arm/mach-meson/eth.c
@@ -8,7 +8,7 @@
 #include <common.h>
 #include <dm.h>
 #include <asm/io.h>
-#include <asm/arch/gxbb.h>
+#include <asm/arch/gx.h>
 #include <asm/arch/eth.h>
 #include <phy.h>
 
@@ -23,23 +23,23 @@ void meson_gx_eth_init(phy_interface_t mode, unsigned int flags)
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		/* Set RGMII mode */
-		setbits_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_PHY_INTF |
-			     GXBB_ETH_REG_0_TX_PHASE(1) |
-			     GXBB_ETH_REG_0_TX_RATIO(4) |
-			     GXBB_ETH_REG_0_PHY_CLK_EN |
-			     GXBB_ETH_REG_0_CLK_EN);
+		setbits_le32(GX_ETH_REG_0, GX_ETH_REG_0_PHY_INTF |
+			     GX_ETH_REG_0_TX_PHASE(1) |
+			     GX_ETH_REG_0_TX_RATIO(4) |
+			     GX_ETH_REG_0_PHY_CLK_EN |
+			     GX_ETH_REG_0_CLK_EN);
 		break;
 
 	case PHY_INTERFACE_MODE_RMII:
 		/* Set RMII mode */
-		out_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_INVERT_RMII_CLK |
-					 GXBB_ETH_REG_0_CLK_EN);
+		out_le32(GX_ETH_REG_0, GX_ETH_REG_0_INVERT_RMII_CLK |
+					 GX_ETH_REG_0_CLK_EN);
 
 		/* Use GXL RMII Internal PHY */
 		if (IS_ENABLED(CONFIG_MESON_GXL) &&
 		    (flags & MESON_GXL_USE_INTERNAL_RMII_PHY)) {
-			writel(0x10110181, GXBB_ETH_REG_2);
-			writel(0xe40908ff, GXBB_ETH_REG_3);
+			writel(0x10110181, GX_ETH_REG_2);
+			writel(0xe40908ff, GX_ETH_REG_3);
 		}
 
 		break;
@@ -50,6 +50,6 @@ void meson_gx_eth_init(phy_interface_t mode, unsigned int flags)
 	}
 
 	/* Enable power and clock gate */
-	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
-	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
+	setbits_le32(GX_GCLK_MPEG_1, GX_GCLK_MPEG_1_ETH);
+	clrbits_le32(GX_MEM_PD_REG_0, GX_MEM_PD_REG_0_ETH_MASK);
 }
diff --git a/arch/arm/mach-meson/sm.c b/arch/arm/mach-meson/sm.c
index 1b35a22..b374031 100644
--- a/arch/arm/mach-meson/sm.c
+++ b/arch/arm/mach-meson/sm.c
@@ -7,7 +7,7 @@
  */
 
 #include <common.h>
-#include <asm/arch/gxbb.h>
+#include <asm/arch/gx.h>
 #include <linux/kernel.h>
 
 #define FN_GET_SHARE_MEM_INPUT_BASE	0x82000020
diff --git a/board/amlogic/khadas-vim/khadas-vim.c b/board/amlogic/khadas-vim/khadas-vim.c
index 83b1b6e..c23ddab 100644
--- a/board/amlogic/khadas-vim/khadas-vim.c
+++ b/board/amlogic/khadas-vim/khadas-vim.c
@@ -9,7 +9,7 @@
 #include <dm.h>
 #include <environment.h>
 #include <asm/io.h>
-#include <asm/arch/gxbb.h>
+#include <asm/arch/gx.h>
 #include <asm/arch/mem.h>
 #include <asm/arch/sm.h>
 #include <asm/arch/eth.h>
diff --git a/board/amlogic/libretech-cc/libretech-cc.c b/board/amlogic/libretech-cc/libretech-cc.c
index 5795340..36fda46 100644
--- a/board/amlogic/libretech-cc/libretech-cc.c
+++ b/board/amlogic/libretech-cc/libretech-cc.c
@@ -9,7 +9,7 @@
 #include <dm.h>
 #include <environment.h>
 #include <asm/io.h>
-#include <asm/arch/gxbb.h>
+#include <asm/arch/gx.h>
 #include <asm/arch/sm.h>
 #include <asm/arch/eth.h>
 #include <asm/arch/mem.h>
@@ -34,8 +34,8 @@ int misc_init_r(void)
 			  MESON_GXL_USE_INTERNAL_RMII_PHY);
 
 	/* Enable power and clock gate */
-	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
-	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
+	setbits_le32(GX_GCLK_MPEG_1, GX_GCLK_MPEG_1_ETH);
+	clrbits_le32(GX_MEM_PD_REG_0, GX_MEM_PD_REG_0_ETH_MASK);
 
 	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
 		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
index 8645f22..0ec0771 100644
--- a/board/amlogic/odroid-c2/odroid-c2.c
+++ b/board/amlogic/odroid-c2/odroid-c2.c
@@ -8,7 +8,7 @@
 #include <dm.h>
 #include <environment.h>
 #include <asm/io.h>
-#include <asm/arch/gxbb.h>
+#include <asm/arch/gx.h>
 #include <asm/arch/sm.h>
 #include <asm/arch/eth.h>
 #include <asm/arch/mem.h>
@@ -32,13 +32,13 @@ int misc_init_r(void)
 	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
 
 	/* Enable power and clock gate */
-	setbits_le32(GXBB_GCLK_MPEG_0, GXBB_GCLK_MPEG_0_I2C);
+	setbits_le32(GX_GCLK_MPEG_0, GX_GCLK_MPEG_0_I2C);
 
 	/* Reset PHY on GPIOZ_14 */
-	clrbits_le32(GXBB_GPIO_EN(3), BIT(14));
-	clrbits_le32(GXBB_GPIO_OUT(3), BIT(14));
+	clrbits_le32(GX_GPIO_EN(3), BIT(14));
+	clrbits_le32(GX_GPIO_OUT(3), BIT(14));
 	mdelay(10);
-	setbits_le32(GXBB_GPIO_OUT(3), BIT(14));
+	setbits_le32(GX_GPIO_OUT(3), BIT(14));
 
 	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
 		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
diff --git a/board/amlogic/p212/p212.c b/board/amlogic/p212/p212.c
index 7c0abbc..10f6b23 100644
--- a/board/amlogic/p212/p212.c
+++ b/board/amlogic/p212/p212.c
@@ -9,7 +9,7 @@
 #include <dm.h>
 #include <environment.h>
 #include <asm/io.h>
-#include <asm/arch/gxbb.h>
+#include <asm/arch/gx.h>
 #include <asm/arch/sm.h>
 #include <asm/arch/eth.h>
 #include <asm/arch/mem.h>
diff --git a/include/configs/khadas-vim.h b/include/configs/khadas-vim.h
index f44b388..8f14208 100644
--- a/include/configs/khadas-vim.h
+++ b/include/configs/khadas-vim.h
@@ -14,6 +14,6 @@
 
 #define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxl-s905x-khadas-vim.dtb\0"
 
-#include <configs/meson-gxbb-common.h>
+#include <configs/meson-gx-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/libretech-cc.h b/include/configs/libretech-cc.h
index 08dfb30..897a697 100644
--- a/include/configs/libretech-cc.h
+++ b/include/configs/libretech-cc.h
@@ -14,6 +14,6 @@
 
 #define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxl-s905x-libretech-cc.dtb\0"
 
-#include <configs/meson-gxbb-common.h>
+#include <configs/meson-gx-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/meson-gx-common.h b/include/configs/meson-gx-common.h
new file mode 100644
index 0000000..1131643
--- /dev/null
+++ b/include/configs/meson-gx-common.h
@@ -0,0 +1,47 @@
+/*
+ * Configuration for Amlogic Meson GX SoCs
+ * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef __MESON_GX_COMMON_CONFIG_H
+#define __MESON_GX_COMMON_CONFIG_H
+
+#define CONFIG_CPU_ARMV8
+#define CONFIG_REMAKE_ELF
+#define CONFIG_NR_DRAM_BANKS		1
+#define CONFIG_ENV_SIZE			0x2000
+#define CONFIG_SYS_MAXARGS		32
+#define CONFIG_SYS_MALLOC_LEN		(32 << 20)
+#define CONFIG_SYS_CBSIZE		1024
+
+#define CONFIG_SYS_SDRAM_BASE		0
+#define CONFIG_SYS_INIT_SP_ADDR		0x20000000
+#define CONFIG_SYS_LOAD_ADDR		CONFIG_SYS_TEXT_BASE
+
+/* Generic Interrupt Controller Definitions */
+#define GICD_BASE			0xc4301000
+#define GICC_BASE			0xc4302000
+
+#define BOOT_TARGET_DEVICES(func) \
+	func(MMC, mmc, 0) \
+	func(MMC, mmc, 1) \
+	func(MMC, mmc, 2) \
+	func(PXE, pxe, na) \
+	func(DHCP, dhcp, na)
+
+#include <config_distro_bootcmd.h>
+
+#define CONFIG_EXTRA_ENV_SETTINGS \
+	"fdt_addr_r=0x01000000\0" \
+	"scriptaddr=0x1f000000\0" \
+	"kernel_addr_r=0x01080000\0" \
+	"pxefile_addr_r=0x01080000\0" \
+	"ramdisk_addr_r=0x13000000\0" \
+	MESON_FDTFILE_SETTING \
+	BOOTENV
+
+#define CONFIG_SYS_BOOTM_LEN    (64 << 20)      /* 64 MiB */
+
+#endif /* __MESON_GX_COMMON_CONFIG_H */
diff --git a/include/configs/meson-gxbb-common.h b/include/configs/meson-gxbb-common.h
deleted file mode 100644
index 5794bc0..0000000
--- a/include/configs/meson-gxbb-common.h
+++ /dev/null
@@ -1,47 +0,0 @@
-/*
- * Configuration for Amlogic Meson GXBB SoCs
- * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
- *
- * SPDX-License-Identifier:	GPL-2.0+
- */
-
-#ifndef __MESON_GXBB_COMMON_CONFIG_H
-#define __MESON_GXBB_COMMON_CONFIG_H
-
-#define CONFIG_CPU_ARMV8
-#define CONFIG_REMAKE_ELF
-#define CONFIG_NR_DRAM_BANKS		1
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_SYS_MAXARGS		32
-#define CONFIG_SYS_MALLOC_LEN		(32 << 20)
-#define CONFIG_SYS_CBSIZE		1024
-
-#define CONFIG_SYS_SDRAM_BASE		0
-#define CONFIG_SYS_INIT_SP_ADDR		0x20000000
-#define CONFIG_SYS_LOAD_ADDR		CONFIG_SYS_TEXT_BASE
-
-/* Generic Interrupt Controller Definitions */
-#define GICD_BASE			0xc4301000
-#define GICC_BASE			0xc4302000
-
-#define BOOT_TARGET_DEVICES(func) \
-	func(MMC, mmc, 0) \
-	func(MMC, mmc, 1) \
-	func(MMC, mmc, 2) \
-	func(PXE, pxe, na) \
-	func(DHCP, dhcp, na)
-
-#include <config_distro_bootcmd.h>
-
-#define CONFIG_EXTRA_ENV_SETTINGS \
-	"fdt_addr_r=0x01000000\0" \
-	"scriptaddr=0x1f000000\0" \
-	"kernel_addr_r=0x01080000\0" \
-	"pxefile_addr_r=0x01080000\0" \
-	"ramdisk_addr_r=0x13000000\0" \
-	MESON_FDTFILE_SETTING \
-	BOOTENV
-
-#define CONFIG_SYS_BOOTM_LEN    (64 << 20)      /* 64 MiB */
-
-#endif /* __MESON_GXBB_COMMON_CONFIG_H */
diff --git a/include/configs/odroid-c2.h b/include/configs/odroid-c2.h
index ff30a8a..d9914af 100644
--- a/include/configs/odroid-c2.h
+++ b/include/configs/odroid-c2.h
@@ -14,6 +14,6 @@
 
 #define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxbb-odroidc2.dtb\0"
 
-#include <configs/meson-gxbb-common.h>
+#include <configs/meson-gx-common.h>
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/p212.h b/include/configs/p212.h
index a087d86..a950da3 100644
--- a/include/configs/p212.h
+++ b/include/configs/p212.h
@@ -16,6 +16,6 @@
 
 #define MESON_FDTFILE_SETTING "fdtfile=amlogic/meson-gxl-s905x-p212.dtb\0"
 
-#include <configs/meson-gxbb-common.h>
+#include <configs/meson-gx-common.h>
 
 #endif /* __CONFIG_H */
-- 
2.7.4
