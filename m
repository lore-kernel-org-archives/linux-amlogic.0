From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 11 Apr 2018 16:29:05 +0200
Subject: [PATCH v2 u-boot 1/3] usb: host: Add simple of glue driver for DWC3
 USB Controllers integration
In-Reply-To: <1523456947-4242-1-git-send-email-narmstrong@baylibre.com>
References: <1523456947-4242-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1523456947-4242-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This is a port of the dwc3-of-simple driver from Linux to enable/deassert
clock and resets of a simple DWC3 Controller HW glue.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/host/Kconfig          |   7 +++
 drivers/usb/host/Makefile         |   1 +
 drivers/usb/host/dwc3-of-simple.c | 123 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 drivers/usb/host/dwc3-of-simple.c

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index a7249b7..6caa615 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -21,6 +21,13 @@ config USB_XHCI_DWC3
 	  Say Y or if your system has a Dual Role SuperSpeed
 	  USB controller based on the DesignWare USB3 IP Core.
 
+config USB_XHCI_DWC3_OF_SIMPLE
+	bool "DesignWare USB3 DRD Generic OF Simple Glue Layer"
+	select MISC
+	help
+	  Support USB2/3 functionality in simple SoC integrations with
+	  USB controller based on the DesignWare USB3 IP Core.
+
 config USB_XHCI_MVEBU
 	bool "MVEBU USB 3.0 support"
 	default y
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 9819489..abe4f90 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_USB_EHCI_ZYNQ) += ehci-zynq.o
 # xhci
 obj-$(CONFIG_USB_XHCI_HCD) += xhci.o xhci-mem.o xhci-ring.o
 obj-$(CONFIG_USB_XHCI_DWC3) += xhci-dwc3.o
+obj-$(CONFIG_USB_XHCI_DWC3_OF_SIMPLE) += dwc3-of-simple.o
 obj-$(CONFIG_USB_XHCI_ROCKCHIP) += xhci-rockchip.o
 obj-$(CONFIG_USB_XHCI_ZYNQMP) += xhci-zynqmp.o
 obj-$(CONFIG_USB_XHCI_KEYSTONE) += xhci-keystone.o
diff --git a/drivers/usb/host/dwc3-of-simple.c b/drivers/usb/host/dwc3-of-simple.c
new file mode 100644
index 0000000..9abe450
--- /dev/null
+++ b/drivers/usb/host/dwc3-of-simple.c
@@ -0,0 +1,123 @@
+/*
+ * dwc3-of-simple.c - OF glue layer for simple integrations
+ *
+ * Copyright (c) 2015 Texas Instruments Incorporated - http://www.ti.com
+ *
+ * Author: Felipe Balbi <balbi@ti.com>
+ *
+ * Copyright (C) 2018 BayLibre, SAS
+ * Author: Neil Armstrong <narmstron@baylibre.com>
+ *
+ * SPDX-License-Identifier:     GPL-2.0+
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <fdtdec.h>
+#include <reset.h>
+#include <clk.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+struct dwc3_of_simple {
+#if CONFIG_IS_ENABLED(CLK)
+	struct clk_bulk		clks;
+#endif
+#if CONFIG_IS_ENABLED(DM_RESET)
+	struct reset_ctl_bulk	resets;
+#endif
+};
+
+#if CONFIG_IS_ENABLED(DM_RESET)
+static int dwc3_of_simple_reset_init(struct udevice *dev,
+				     struct dwc3_of_simple *simple)
+{
+	int ret;
+
+	ret = reset_get_bulk(dev, &simple->resets);
+	if (ret)
+		return ret;
+
+	ret = reset_deassert_bulk(&simple->resets);
+	if (ret) {
+		reset_release_bulk(&simple->resets);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
+#if CONFIG_IS_ENABLED(CLK)
+static int dwc3_of_simple_clk_init(struct udevice *dev,
+				   struct dwc3_of_simple *simple)
+{
+	int ret;
+
+	ret = clk_get_bulk(dev, &simple->clks);
+	if (ret)
+		return ret;
+
+	ret = clk_enable_bulk(&simple->clks);
+	if (ret) {
+		clk_release_bulk(&simple->clks);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
+static int dwc3_of_simple_probe(struct udevice *dev)
+{
+#if CONFIG_IS_ENABLED(DM_RESET) || CONFIG_IS_ENABLED(CLK)
+	struct dwc3_of_simple *simple = dev_get_platdata(dev);
+	int ret;
+#endif
+
+#if CONFIG_IS_ENABLED(CLK)
+	ret = dwc3_of_simple_clk_init(dev, simple);
+	if (ret)
+		return ret;
+#endif
+
+#if CONFIG_IS_ENABLED(DM_RESET)
+	ret = dwc3_of_simple_reset_init(dev, simple);
+	if (ret)
+		return ret;
+#endif
+
+	return 0;
+}
+
+static int dwc3_of_simple_remove(struct udevice *dev)
+{
+#if CONFIG_IS_ENABLED(DM_RESET) || CONFIG_IS_ENABLED(CLK)
+	struct dwc3_of_simple *simple = dev_get_platdata(dev);
+#endif
+
+#if CONFIG_IS_ENABLED(DM_RESET)
+	reset_release_bulk(&simple->resets);
+#endif
+
+#if CONFIG_IS_ENABLED(CLK)
+	clk_release_bulk(&simple->clks);
+#endif
+
+	return dm_scan_fdt_dev(dev);
+}
+
+static const struct udevice_id dwc3_of_simple_ids[] = {
+	{ .compatible = "amlogic,meson-gxl-dwc3" },
+	{ }
+};
+
+U_BOOT_DRIVER(dwc3_of_simple) = {
+	.name = "dwc3-of-simple",
+	.id = UCLASS_SIMPLE_BUS,
+	.of_match = dwc3_of_simple_ids,
+	.probe = dwc3_of_simple_probe,
+	.remove = dwc3_of_simple_remove,
+	.platdata_auto_alloc_size = sizeof(struct dwc3_of_simple),
+	.flags = DM_FLAG_ALLOC_PRIV_DMA,
+};
-- 
2.7.4
