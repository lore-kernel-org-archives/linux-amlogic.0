From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 25 Jan 2018 01:00:53 +0100
Subject: [RFC usb-next v8 3/3] usb: core: hcd: integrate the PHY wrapper into
 the HCD core
In-Reply-To: <20180125000053.9387-1-martin.blumenstingl@googlemail.com>
References: <20180125000053.9387-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180125000053.9387-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This integrates the PHY wrapper into the core hcd infrastructure.
Multiple PHYs which are part of the HCD's device tree node are now
managed (= powered on/off when needed), by the new usb_phy_roothub code.

Suspend and resume is also supported, however not for
runtime/auto-suspend (which is triggered for example when no devices are
connected to the USB bus). This is needed on some SoCs (for example
Amlogic Meson GXL) because if the PHYs are disabled during auto-suspend
then devices which are plugged in afterwards are not seen by the host.

One example where this is required is the Amlogic GXL and GXM SoCs:
They are using a dwc3 USB controller with up to three ports enabled on
the internal roothub. Each port has it's own PHY which must be enabled
(if one of the PHYs is left disabled then none of the USB ports works at
all).
The new logic works on the Amlogic GXL and GXM SoCs because the dwc3
driver internally creates a xhci-hcd which then registers a HCD which
then triggers our new PHY wrapper.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/core/hcd.c  | 29 +++++++++++++++++++++++++++++
 include/linux/usb/hcd.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index fc32391a34d5..fc99cddc117e 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -37,6 +37,7 @@
 #include <linux/usb/otg.h>
 
 #include "usb.h"
+#include "phy.h"
 
 
 /*-------------------------------------------------------------------------*/
@@ -2260,6 +2261,9 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
 		usb_set_device_state(rhdev, USB_STATE_SUSPENDED);
 		hcd->state = HC_STATE_SUSPENDED;
 
+		if (!PMSG_IS_AUTO(msg))
+			usb_phy_roothub_power_off(hcd->phy_roothub);
+
 		/* Did we race with a root-hub wakeup event? */
 		if (rhdev->do_remote_wakeup) {
 			char	buffer[6];
@@ -2296,6 +2300,13 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
 		dev_dbg(&rhdev->dev, "skipped %s of dead bus\n", "resume");
 		return 0;
 	}
+
+	if (!PMSG_IS_AUTO(msg)) {
+		status = usb_phy_roothub_power_on(hcd->phy_roothub);
+		if (status)
+			return status;
+	}
+
 	if (!hcd->driver->bus_resume)
 		return -ENOENT;
 	if (HCD_RH_RUNNING(hcd))
@@ -2333,6 +2344,7 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
 		}
 	} else {
 		hcd->state = old_state;
+		usb_phy_roothub_power_off(hcd->phy_roothub);
 		dev_dbg(&rhdev->dev, "bus %s fail, err %d\n",
 				"resume", status);
 		if (status != -ESHUTDOWN)
@@ -2769,6 +2781,16 @@ int usb_add_hcd(struct usb_hcd *hcd,
 		}
 	}
 
+	hcd->phy_roothub = usb_phy_roothub_init(hcd->self.sysdev);
+	if (IS_ERR(hcd->phy_roothub)) {
+		retval = PTR_ERR(hcd->phy_roothub);
+		goto err_phy_roothub_init;
+	}
+
+	retval = usb_phy_roothub_power_on(hcd->phy_roothub);
+	if (retval)
+		goto err_usb_phy_roothub_power_on;
+
 	dev_info(hcd->self.controller, "%s\n", hcd->product_desc);
 
 	/* Keep old behaviour if authorized_default is not in [0, 1]. */
@@ -2933,6 +2955,10 @@ int usb_add_hcd(struct usb_hcd *hcd,
 err_register_bus:
 	hcd_buffer_destroy(hcd);
 err_create_buf:
+	usb_phy_roothub_power_off(hcd->phy_roothub);
+err_usb_phy_roothub_power_on:
+	usb_phy_roothub_exit(hcd->phy_roothub);
+err_phy_roothub_init:
 	if (IS_ENABLED(CONFIG_GENERIC_PHY) && hcd->remove_phy && hcd->phy) {
 		phy_power_off(hcd->phy);
 		phy_exit(hcd->phy);
@@ -3017,6 +3043,9 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 	usb_deregister_bus(&hcd->self);
 	hcd_buffer_destroy(hcd);
 
+	usb_phy_roothub_power_off(hcd->phy_roothub);
+	usb_phy_roothub_exit(hcd->phy_roothub);
+
 	if (IS_ENABLED(CONFIG_GENERIC_PHY) && hcd->remove_phy && hcd->phy) {
 		phy_power_off(hcd->phy);
 		phy_exit(hcd->phy);
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 176900528822..9e8fc9c5f394 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -104,6 +104,7 @@ struct usb_hcd {
 	 */
 	struct usb_phy		*usb_phy;
 	struct phy		*phy;
+	struct usb_phy_roothub	*phy_roothub;
 
 	/* Flags that need to be manipulated atomically because they can
 	 * change while the host controller is running.  Always use
-- 
2.16.1
