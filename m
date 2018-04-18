From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 18 Apr 2018 21:39:46 +0200
Subject: [PATCH usb v6 1/6] usb: core: phy: fix return value of
 usb_phy_roothub_exit()
In-Reply-To: <20180418193951.17922-1-martin.blumenstingl@googlemail.com>
References: <20180418193951.17922-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180418193951.17922-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

usb_phy_roothub_exit() should return the error code from the phy_exit()
call if exiting the PHY failed.
However, since a wrong variable is used usb_phy_roothub_exit() currently
always returns 0, even if one of the phy_exit calls returned an error.
Clang also reports this bug:
kernel/drivers/usb/core/phy.c:114:8: warning: explicitly assigning value of
variable of type 'int' to itself [-Wself-assign] error, forbidden
warning: phy.c:114

Fix this by assigning the error code from phy_exit() to the "ret"
variable to propagate the error correctly.

Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Tested-by: Keerthy <j-keerthy@ti.com>
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
2.17.0
