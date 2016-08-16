From: b.galvani@gmail.com (Beniamino Galvani)
Date: Tue, 16 Aug 2016 11:49:50 +0200
Subject: [PATCH 4/4] meson: odroid-c2: enable Ethernet support through the
 device tree
In-Reply-To: <1471340990-16247-1-git-send-email-b.galvani@gmail.com>
References: <1471340990-16247-1-git-send-email-b.galvani@gmail.com>
Message-ID: <1471340990-16247-5-git-send-email-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Remove the device definition from board file, update the driver with
the new compatible property and update config with necessary options.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 arch/arm/include/asm/arch-meson/gxbb.h |  3 ---
 board/amlogic/odroid-c2/odroid-c2.c    | 13 -------------
 configs/odroid-c2_defconfig            |  3 +++
 drivers/net/designware.c               |  1 +
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/arch-meson/gxbb.h b/arch/arm/include/asm/arch-meson/gxbb.h
index f90f632..ce41349 100644
--- a/arch/arm/include/asm/arch-meson/gxbb.h
+++ b/arch/arm/include/asm/arch-meson/gxbb.h
@@ -20,9 +20,6 @@
 #define GXBB_GPIO_IN(n)		GXBB_PERIPHS_ADDR(_GXBB_GPIO_OFF(n) + 1)
 #define GXBB_GPIO_OUT(n)	GXBB_PERIPHS_ADDR(_GXBB_GPIO_OFF(n) + 2)
 
-/* Pinmux registers 0 to 12 */
-#define GXBB_PINMUX(n)		GXBB_PERIPHS_ADDR(0x2c + (n))
-
 #define GXBB_ETH_REG_0		GXBB_PERIPHS_ADDR(0x50)
 #define GXBB_ETH_REG_1		GXBB_PERIPHS_ADDR(0x51)
 
diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
index bd72100..b61daaa 100644
--- a/board/amlogic/odroid-c2/odroid-c2.c
+++ b/board/amlogic/odroid-c2/odroid-c2.c
@@ -21,24 +21,11 @@ int board_init(void)
 	return 0;
 }
 
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
 int misc_init_r(void)
 {
 	u8 mac_addr[EFUSE_MAC_SIZE];
 	ssize_t len;
 
-	/* Select Ethernet function */
-	setbits_le32(GXBB_PINMUX(6), 0x3fff);
-
 	/* Set RGMII mode */
 	setbits_le32(GXBB_ETH_REG_0, GXBB_ETH_REG_0_PHY_INTF |
 				     GXBB_ETH_REG_0_TX_PHASE(1) |
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index 808bbc2..3e9ef68 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -14,6 +14,9 @@ CONFIG_HUSH_PARSER=y
 CONFIG_OF_CONTROL=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_ETH=y
+CONFIG_ETH_DESIGNWARE=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_MESON_GXBB=y
 CONFIG_DEBUG_UART=y
 CONFIG_DEBUG_UART_MESON=y
 CONFIG_DEBUG_UART_BASE=0xc81004c0
diff --git a/drivers/net/designware.c b/drivers/net/designware.c
index 8ba72e3..9e6d726 100644
--- a/drivers/net/designware.c
+++ b/drivers/net/designware.c
@@ -737,6 +737,7 @@ static int designware_eth_ofdata_to_platdata(struct udevice *dev)
 static const struct udevice_id designware_eth_ids[] = {
 	{ .compatible = "allwinner,sun7i-a20-gmac" },
 	{ .compatible = "altr,socfpga-stmmac" },
+	{ .compatible = "amlogic,meson6-dwmac" },
 	{ }
 };
 
-- 
2.7.4
