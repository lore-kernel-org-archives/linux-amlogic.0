From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 17 Oct 2017 23:21:00 +0200
Subject: [PATCH usb-next v6 3/3] usb: core: hcd: integrate the PHY roothub
 wrapper
In-Reply-To: <20171017212100.10544-1-martin.blumenstingl@googlemail.com>
References: <20171017212100.10544-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171017212100.10544-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This integrates the PHY roothub wrapper into the core hcd
infrastructure. Multiple PHYs which are part of the roothub devicetree
node (which is a sub-node of the sysdev's node) are now managed
(= powered on/off when needed), by the new usb_phy_roothub code.

One example where this is required is the Amlogic GXL and GXM SoCs:
They are using a dwc3 USB controller with up to three ports enabled on
the internal roothub. Using only the top-level "phy" properties does not
work here since one can only specify one "usb2-phy" and one "usb3-phy",
while actually at least two "usb2-phy" have to be specified.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/core/hcd.c  | 27 +++++++++++++++++++++++++++
 include/linux/usb/hcd.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 67aa3d039b9b..59bb8dac5264 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -50,6 +50,7 @@
 #include <linux/usb/otg.h>
 
 #include "usb.h"
+#include "phy.h"
 
 
 /*-------------------------------------------------------------------------*/
@@ -2271,6 +2272,8 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
 		usb_set_device_state(rhdev, USB_STATE_SUSPENDED);
 		hcd->state = HC_STATE_SUSPENDED;
 
+		usb_phy_roothub_power_off(hcd->phy_roothub);
+
 		/* Did we race with a root-hub wakeup event? */
 		if (rhdev->do_remote_wakeup) {
 			char	buffer[6];
@@ -2292,6 +2295,7 @@ int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg)
 		dev_dbg(&rhdev->dev, "bus %s fail, err %d\n",
 				"suspend", status);
 	}
+
 	return status;
 }
 
@@ -2307,6 +2311,11 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
 		dev_dbg(&rhdev->dev, "skipped %s of dead bus\n", "resume");
 		return 0;
 	}
+
+	status = usb_phy_roothub_power_on(hcd->phy_roothub);
+	if (status)
+		return status;
+
 	if (!hcd->driver->bus_resume)
 		return -ENOENT;
 	if (HCD_RH_RUNNING(hcd))
@@ -2344,6 +2353,7 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
 		}
 	} else {
 		hcd->state = old_state;
+		usb_phy_roothub_power_off(hcd->phy_roothub);
 		dev_dbg(&rhdev->dev, "bus %s fail, err %d\n",
 				"resume", status);
 		if (status != -ESHUTDOWN)
@@ -2780,6 +2790,16 @@ int usb_add_hcd(struct usb_hcd *hcd,
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
@@ -2944,6 +2964,10 @@ int usb_add_hcd(struct usb_hcd *hcd,
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
@@ -3028,6 +3052,9 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 	usb_deregister_bus(&hcd->self);
 	hcd_buffer_destroy(hcd);
 
+	usb_phy_roothub_power_off(hcd->phy_roothub);
+	usb_phy_roothub_exit(hcd->phy_roothub);
+
 	if (IS_ENABLED(CONFIG_GENERIC_PHY) && hcd->remove_phy && hcd->phy) {
 		phy_power_off(hcd->phy);
 		phy_exit(hcd->phy);
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index a1f03ebfde47..6915b2afc209 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -103,6 +103,7 @@ struct usb_hcd {
 	 */
 	struct usb_phy		*usb_phy;
 	struct phy		*phy;
+	struct usb_phy_roothub	*phy_roothub;
 
 	/* Flags that need to be manipulated atomically because they can
 	 * change while the host controller is running.  Always use
-- 
2.14.2
