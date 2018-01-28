From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Jan 2018 21:22:43 +0100
Subject: [PATCH 3/5] phy: amlogic: phy-meson-gxl-usb2: default to host mode
In-Reply-To: <20180128202245.25021-1-martin.blumenstingl@googlemail.com>
References: <20180128202245.25021-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180128202245.25021-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The USB2 PHY can switch between PHY_MODE_USB_HOST and
PHY_MODE_USB_DEVICE. However, it cannot do it on it's own since it
requires re-routing of the corresponding USB pins from dwc3 (which is
used for host-mode) to dwc2 (which is used for device-mode).
Thus we don't need to auto-detect the mode based on the USB controller,
which simplifies the driver code.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/Kconfig              |  1 -
 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 15 ++-------------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index 2f690d24203a..23fe1cda2f70 100644
--- a/drivers/phy/amlogic/Kconfig
+++ b/drivers/phy/amlogic/Kconfig
@@ -18,7 +18,6 @@ config PHY_MESON_GXL_USB2
 	default ARCH_MESON
 	depends on OF && (ARCH_MESON || COMPILE_TEST)
 	depends on USB_SUPPORT
-	select USB_COMMON
 	select GENERIC_PHY
 	select REGMAP_MMIO
 	help
diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 303b2b46af3c..ee3c2c0c8572 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -20,7 +20,6 @@
 #include <linux/reset.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
-#include <linux/usb/of.h>
 
 /* bits [31:27] are read-only */
 #define U2P_R0							0x0
@@ -253,18 +252,8 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	switch (of_usb_get_dr_mode_by_phy(dev->of_node, -1)) {
-	case USB_DR_MODE_PERIPHERAL:
-		priv->mode = PHY_MODE_USB_DEVICE;
-		break;
-	case USB_DR_MODE_OTG:
-		priv->mode = PHY_MODE_USB_OTG;
-		break;
-	case USB_DR_MODE_HOST:
-	default:
-		priv->mode = PHY_MODE_USB_HOST;
-		break;
-	}
+	/* start in host mode */
+	priv->mode = PHY_MODE_USB_HOST;
 
 	priv->regmap = devm_regmap_init_mmio(dev, base,
 					     &phy_meson_gxl_usb2_regmap_conf);
-- 
2.16.1
