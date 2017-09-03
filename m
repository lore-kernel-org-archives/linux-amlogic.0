From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun,  3 Sep 2017 23:38:29 +0200
Subject: [PATCH v4 3/3] usb: host: xhci: plat: integrate the platform-roothub
In-Reply-To: <20170903213829.6589-1-martin.blumenstingl@googlemail.com>
References: <20170903213829.6589-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170903213829.6589-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This enables the platform-roothub for the xhci-plat driver. This allows
specifying a PHY for each port via devicetree. All PHYs will then be
enabled/disabled by the platform-roothub driver.

One example where this is required is the Amlogic GXL and GXM SoCs:
They are using a dwc3 USB controller with up to three ports enabled on
the internal roothub. Using only the top-level "phy" properties does not
work here since one can only specify one "usb2-phy" and one "usb3-phy",
while actually at least two "usb2-phy" have to be specified.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 drivers/usb/host/Kconfig     |  1 +
 drivers/usb/host/xhci-plat.c | 35 +++++++++++++++++++++++++++++++++--
 drivers/usb/host/xhci.h      |  2 ++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index b8b05c786b2a..3bdc49e89c0f 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -36,6 +36,7 @@ config USB_XHCI_PCI
 config USB_XHCI_PLATFORM
 	tristate "Generic xHCI driver for a platform device"
 	select USB_XHCI_RCAR if ARCH_RENESAS
+	select USB_PLATFORM_ROOTHUB
 	---help---
 	  Adds an xHCI host driver for a generic platform device, which
 	  provides a memory space and an irq.
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 163bafde709f..2c6ab3912443 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/acpi.h>
 
+#include "platform-roothub.h"
 #include "xhci.h"
 #include "xhci-plat.h"
 #include "xhci-mvebu.h"
@@ -277,9 +278,19 @@ static int xhci_plat_probe(struct platform_device *pdev)
 			goto put_usb3_hcd;
 	}
 
+	xhci->platform_roothub = platform_roothub_init(sysdev);
+	if (IS_ERR(xhci->platform_roothub)) {
+		ret = PTR_ERR(xhci->platform_roothub);
+		goto disable_usb_phy;
+	}
+
+	ret = platform_roothub_power_on(xhci->platform_roothub);
+	if (ret)
+		goto exit_plat_roothub;
+
 	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (ret)
-		goto disable_usb_phy;
+		goto disable_plat_roothub;
 
 	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
 		xhci->shared_hcd->can_do_streams = 1;
@@ -303,6 +314,12 @@ static int xhci_plat_probe(struct platform_device *pdev)
 dealloc_usb2_hcd:
 	usb_remove_hcd(hcd);
 
+disable_plat_roothub:
+	platform_roothub_power_off(xhci->platform_roothub);
+
+exit_plat_roothub:
+	platform_roothub_exit(xhci->platform_roothub);
+
 disable_usb_phy:
 	usb_phy_shutdown(hcd->usb_phy);
 
@@ -334,6 +351,9 @@ static int xhci_plat_remove(struct platform_device *dev)
 	usb_remove_hcd(xhci->shared_hcd);
 	usb_phy_shutdown(hcd->usb_phy);
 
+	platform_roothub_power_off(xhci->platform_roothub);
+	platform_roothub_exit(xhci->platform_roothub);
+
 	usb_remove_hcd(hcd);
 	usb_put_hcd(xhci->shared_hcd);
 
@@ -366,7 +386,14 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
 	if (!device_may_wakeup(dev) && !IS_ERR(xhci->clk))
 		clk_disable_unprepare(xhci->clk);
 
-	return ret;
+	if (ret)
+		return ret;
+
+	ret = platform_roothub_power_off(xhci->platform_roothub);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static int __maybe_unused xhci_plat_resume(struct device *dev)
@@ -378,6 +405,10 @@ static int __maybe_unused xhci_plat_resume(struct device *dev)
 	if (!device_may_wakeup(dev) && !IS_ERR(xhci->clk))
 		clk_prepare_enable(xhci->clk);
 
+	ret = platform_roothub_power_on(xhci->platform_roothub);
+	if (ret)
+		return ret;
+
 	ret = xhci_priv_resume_quirk(hcd);
 	if (ret)
 		return ret;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2abaa4d6d39d..c75c3247a441 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1732,6 +1732,8 @@ struct xhci_hcd {
 	int		msix_count;
 	/* optional clock */
 	struct clk		*clk;
+	/* optional platform root-hub */
+	struct platform_roothub	*platform_roothub;
 	/* data structures */
 	struct xhci_device_context_array *dcbaa;
 	struct xhci_ring	*cmd_ring;
-- 
2.14.1
