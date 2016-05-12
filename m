From: carlo@caione.org (Carlo Caione)
Date: Thu, 12 May 2016 14:41:42 +0200
Subject: [PATCH 2/2] arm: amlogic: Enable MMC driver on Odroid-C2
In-Reply-To: <1463056902-8533-1-git-send-email-carlo@caione.org>
References: <1463056902-8533-1-git-send-email-carlo@caione.org>
Message-ID: <1463056902-8533-3-git-send-email-carlo@caione.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Carlo Caione <carlo@endlessm.com>

Add support for the MMC on the Hardkernel Odroid-C2 board.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 board/hardkernel/odroid-c2/odroid-c2.c | 42 ++++++++++++++++++++++++++++++++++
 configs/odroid-c2_defconfig            |  5 ++++
 include/configs/odroid-c2.h            |  7 ++++++
 3 files changed, 54 insertions(+)

diff --git a/board/hardkernel/odroid-c2/odroid-c2.c b/board/hardkernel/odroid-c2/odroid-c2.c
index bd72100..34b9a95 100644
--- a/board/hardkernel/odroid-c2/odroid-c2.c
+++ b/board/hardkernel/odroid-c2/odroid-c2.c
@@ -8,6 +8,7 @@
 #include <asm/io.h>
 #include <asm/arch/gxbb.h>
 #include <asm/arch/sm.h>
+#include <asm/arch/sd_emmc.h>
 #include <dm/platdata.h>
 #include <phy.h>
 
@@ -65,3 +66,44 @@ int misc_init_r(void)
 
 	return 0;
 }
+
+#ifdef CONFIG_GENERIC_MMC
+
+static const struct meson_mmc_platdata gxbb_sd_platdata[] = {
+	{ .sd_emmc_reg = (struct meson_mmc_regs *)SD_EMMC_BASE_A },
+	{ .sd_emmc_reg = (struct meson_mmc_regs *)SD_EMMC_BASE_B },
+	{ .sd_emmc_reg = (struct meson_mmc_regs *)SD_EMMC_BASE_C },
+};
+
+U_BOOT_DEVICE(meson_mmc) = {
+	.name = "meson_mmc",
+	.platdata = &gxbb_sd_platdata[CONFIG_MMC_MESON_SD_PORT],
+};
+
+static void meson_mmc_pinmux_setup(unsigned int port)
+{
+	switch (port) {
+	case SDIO_PORT_A:
+		setbits_le32(GXBB_PINMUX(8), 0x3f);
+		break;
+	case SDIO_PORT_B:
+		setbits_le32(GXBB_PINMUX(2), 0x3f << 10);
+		break;
+	case SDIO_PORT_C:
+		clrbits_le32(GXBB_PINMUX(2), 0x1f << 22);
+		setbits_le32(GXBB_PINMUX(4), (0x3 << 18) | (3 << 30));
+		break;
+	default:
+		printf("meson: invalid MMC port %d for pinmux setup\n", port);
+		break;
+	}
+}
+
+int board_mmc_init(bd_t *bis)
+{
+	meson_mmc_pinmux_setup(CONFIG_MMC_MESON_SD_PORT);
+
+	return 0;
+}
+
+#endif
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index a771b20..a1ffe73 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -7,11 +7,16 @@ CONFIG_DEFAULT_DEVICE_TREE="meson-gxbb-odroidc2"
 # CONFIG_CMD_IMI is not set
 # CONFIG_CMD_IMLS is not set
 # CONFIG_CMD_LOADS is not set
+CONFIG_CMD_MMC=y
 # CONFIG_CMD_FPGA is not set
 # CONFIG_CMD_SOURCE is not set
 # CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_EXT4=y
+CONFIG_CMD_FAT=y
+CONFIG_CMD_FS_GENERIC=y
 CONFIG_OF_CONTROL=y
 CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_DM_MMC=y
 CONFIG_DM_ETH=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_DEBUG_UART=y
diff --git a/include/configs/odroid-c2.h b/include/configs/odroid-c2.h
index 37a5671..4af7cc6 100644
--- a/include/configs/odroid-c2.h
+++ b/include/configs/odroid-c2.h
@@ -46,6 +46,13 @@
 #define CONFIG_SYS_LONGHELP
 #define CONFIG_CMDLINE_EDITING
 
+#ifdef CONFIG_DM_MMC
+#define CONFIG_MMC
+#define CONFIG_GENERIC_MMC
+#define CONFIG_MMC_MESON
+#define CONFIG_MMC_MESON_SD_PORT	1
+#endif
+
 #include <config_distro_defaults.h>
 
 #endif /* __CONFIG_H */
-- 
2.7.4
