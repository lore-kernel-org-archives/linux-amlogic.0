From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 29 Mar 2018 15:42:19 +0200
Subject: [PATCH u-boot 2/3] usb: host: dwc3: Add support for multiple PHYs
In-Reply-To: <1522330940-25062-1-git-send-email-narmstrong@baylibre.com>
References: <1522330940-25062-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1522330940-25062-3-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

DWC3 Ips can have more than 1 PHY for USB2 and 1 PHY for USB3, add support
for a generic number of PHYs and adapt the code to handle a generic
number of PHYs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/host/xhci-dwc3.c | 105 ++++++++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 47 deletions(-)

diff --git a/drivers/usb/host/xhci-dwc3.c b/drivers/usb/host/xhci-dwc3.c
index 1022dd5..da29162 100644
--- a/drivers/usb/host/xhci-dwc3.c
+++ b/drivers/usb/host/xhci-dwc3.c
@@ -22,8 +22,8 @@
 DECLARE_GLOBAL_DATA_PTR;
 
 struct xhci_dwc3_platdata {
-	struct phy usb_phy;
-	struct phy usb3_phy;
+	struct phy *usb_phys;
+	int num_phys;
 };
 
 void dwc3_set_mode(struct dwc3 *dwc3_reg, u32 mode)
@@ -113,45 +113,74 @@ void dwc3_set_fladj(struct dwc3 *dwc3_reg, u32 val)
 }
 
 #ifdef CONFIG_DM_USB
-static int xhci_dwc3_setup_phy(struct udevice *dev, int index, struct phy *phy)
+static int xhci_dwc3_setup_phy(struct udevice *dev, int count)
 {
-	int ret = 0;
+	struct xhci_dwc3_platdata *plat = dev_get_platdata(dev);
+	int i, ret;
+
+	if (!count)
+		return 0;
 
-	ret = generic_phy_get_by_index(dev, index, phy);
-	if (ret) {
-		if (ret != -ENOENT) {
-			pr_err("Failed to get USB PHY for %s\n", dev->name);
+	plat->usb_phys = devm_kcalloc(dev, count, sizeof(struct phy),
+					GFP_KERNEL);
+	if (!plat->usb_phys)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		ret = generic_phy_get_by_index(dev, i, &plat->usb_phys[i]);
+		if (ret && ret != -ENOENT) {
+			pr_err("Failed to get USB PHY%d for %s\n",
+			       i, dev->name);
 			return ret;
 		}
-	} else {
-		ret = generic_phy_init(phy);
+
+		++plat->num_phys;
+	}
+	
+	for (i = 0; i < plat->num_phys; i++) {
+		ret = generic_phy_init(&plat->usb_phys[i]);
 		if (ret) {
-			pr_err("Can't init USB PHY for %s\n", dev->name);
-			return ret;
+			pr_err("Can't init USB PHY%d for %s\n",
+			       i, dev->name);
+			goto phys_err;
 		}
-		ret = generic_phy_power_on(phy);
+	}
+	
+	for (i = 0; i < plat->num_phys; i++) {
+		ret = generic_phy_power_on(&plat->usb_phys[i]);
 		if (ret) {
-			pr_err("Can't power on USB PHY for %s\n", dev->name);
-			generic_phy_exit(phy);
-			return ret;
+			pr_err("Can't power USB PHY%d for %s\n",
+			       i, dev->name);
+			goto phys_err;
 		}
 	}
 
 	return 0;
+
+phys_err:
+	for (; i >= 0; i--) {
+		generic_phy_power_off(&plat->usb_phys[i]);
+		generic_phy_exit(&plat->usb_phys[i]);
+	}
+
+	return ret;
 }
 
-static int xhci_dwc3_shutdown_phy(struct phy *phy)
+static int xhci_dwc3_shutdown_phy(struct udevice *dev)
 {
-	int ret = 0;
+	struct xhci_dwc3_platdata *plat = dev_get_platdata(dev);
+	int i, ret;
 
-	if (generic_phy_valid(phy)) {
-		ret = generic_phy_power_off(phy);
-		if (ret)
-			return ret;
+	for (i = 0; i < plat->num_phys; i++) {
+		if (!generic_phy_valid(&plat->usb_phys[i]))
+			continue;
 
-		ret = generic_phy_exit(phy);
-		if (ret)
-			return ret;
+		ret = generic_phy_power_off(&plat->usb_phys[i]);
+		ret |= generic_phy_exit(&plat->usb_phys[i]);
+		if (ret) {
+			pr_err("Can't shutdown USB PHY%d for %s\n",
+				i, dev->name);
+		}
 	}
 
 	return 0;
@@ -159,7 +188,6 @@ static int xhci_dwc3_shutdown_phy(struct phy *phy)
 
 static int xhci_dwc3_probe(struct udevice *dev)
 {
-	struct xhci_dwc3_platdata *plat = dev_get_platdata(dev);
 	struct xhci_hcor *hcor;
 	struct xhci_hccr *hccr;
 	struct dwc3 *dwc3_reg;
@@ -170,18 +198,10 @@ static int xhci_dwc3_probe(struct udevice *dev)
 	hcor = (struct xhci_hcor *)((uintptr_t)hccr +
 			HC_LENGTH(xhci_readl(&(hccr)->cr_capbase)));
 
-	ret = xhci_dwc3_setup_phy(dev, 0, &plat->usb_phy);
-	if (ret) {
-		pr_err("Failed to setup USB PHY for %s\n", dev->name);
-		return ret;
-	}
-
-	ret = xhci_dwc3_setup_phy(dev, 1, &plat->usb3_phy);
-	if (ret) {
-		pr_err("Failed to setup USB3 PHY for %s\n", dev->name);
-		xhci_dwc3_shutdown_phy(&plat->usb_phy);
+	ret = xhci_dwc3_setup_phy(dev, dev_count_phandle_with_args(
+						dev, "phys", "#phy-cells"));
+	if (ret)
 		return ret;
-	}
 
 	dwc3_reg = (struct dwc3 *)((char *)(hccr) + DWC3_REG_OFFSET);
 
@@ -199,16 +219,7 @@ static int xhci_dwc3_probe(struct udevice *dev)
 
 static int xhci_dwc3_remove(struct udevice *dev)
 {
-	struct xhci_dwc3_platdata *plat = dev_get_platdata(dev);
-	int ret;
-
-	ret = xhci_dwc3_shutdown_phy(&plat->usb_phy);
-	if (ret)
-		pr_err("Can't shutdown USB PHY for %s\n", dev->name);
-
-	ret = xhci_dwc3_shutdown_phy(&plat->usb3_phy);
-	if (ret)
-		pr_err("Can't shutdown USB3 PHY for %s\n", dev->name);
+	xhci_dwc3_shutdown_phy(dev);
 
 	return xhci_deregister(dev);
 }
-- 
2.7.4
