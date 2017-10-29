From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 29 Oct 2017 10:09:01 +0100
Subject: [PATCH 2/2] odroid-c2: enable I2C
In-Reply-To: <20171029090901.24299-1-b.galvani@gmail.com>
References: <20171029090901.24299-1-b.galvani@gmail.com>
Message-ID: <20171029090901.24299-3-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 arch/arm/include/asm/arch-meson/gxbb.h | 1 +
 board/amlogic/odroid-c2/odroid-c2.c    | 1 +
 configs/odroid-c2_defconfig            | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/arch/arm/include/asm/arch-meson/gxbb.h b/arch/arm/include/asm/arch-meson/gxbb.h
index ce41349792..96c9535f53 100644
--- a/arch/arm/include/asm/arch-meson/gxbb.h
+++ b/arch/arm/include/asm/arch-meson/gxbb.h
@@ -44,6 +44,7 @@
 #define GXBB_GCLK_MPEG_OTHER	GXBB_HIU_ADDR(0x53)
 #define GXBB_GCLK_MPEG_AO	GXBB_HIU_ADDR(0x54)
 
+#define GXBB_GCLK_MPEG_0_I2C   BIT(9)
 #define GXBB_GCLK_MPEG_1_ETH	BIT(3)
 
 #endif /* __GXBB_H__ */
diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
index eac04d8178..a5ea8dc5af 100644
--- a/board/amlogic/odroid-c2/odroid-c2.c
+++ b/board/amlogic/odroid-c2/odroid-c2.c
@@ -35,6 +35,7 @@ int misc_init_r(void)
 				     GXBB_ETH_REG_0_CLK_EN);
 
 	/* Enable power and clock gate */
+	setbits_le32(GXBB_GCLK_MPEG_0, GXBB_GCLK_MPEG_0_I2C);
 	setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
 	clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
 
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index f7f8016644..1afd2fc111 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -11,12 +11,15 @@ CONFIG_DEBUG_UART=y
 # CONFIG_CMD_IMI is not set
 # CONFIG_CMD_FPGA is not set
 CONFIG_CMD_GPIO=y
+CONFIG_CMD_I2C=y
 # CONFIG_CMD_LOADS is not set
 CONFIG_CMD_MMC=y
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_OF_CONTROL=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_GPIO=y
+CONFIG_DM_I2C=y
+CONFIG_SYS_I2C_MESON=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_DM_ETH=y
-- 
2.13.6
