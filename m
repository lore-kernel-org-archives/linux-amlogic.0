From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 24 Mar 2018 14:56:29 +0100
Subject: [PATCH usb-next v1] usb: core: phy: fix return value of
 usb_phy_roothub_exit()
Message-ID: <20180324135629.31409-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

usb_phy_roothub_exit() should return the error code from the phy_exit()
call if exiting the PHY failed.
However, since a wrong variable is used usb_phy_roothub_exit() currently
always returns 0, even if one of the phy_exit calls returned an error.
Fix this by assigning the error code from phy_exit() to the "ret"
variable to propagate the error correctly.

Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/core/phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index 09b7c43c0ea4..f19aaa3c899c 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -111,7 +111,7 @@ int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub)
 	list_for_each_entry(roothub_entry, head, list) {
 		err = phy_exit(roothub_entry->phy);
 		if (err)
-			ret = ret;
+			ret = err;
 	}
 
 	return ret;
-- 
2.16.2
