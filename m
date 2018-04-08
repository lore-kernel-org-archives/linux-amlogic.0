From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun,  8 Apr 2018 23:27:42 +0200
Subject: [PATCH usb v5 5/6] usb: core: phy: add missing forward declaration
 for "struct device"
In-Reply-To: <20180408212743.22934-1-martin.blumenstingl@googlemail.com>
References: <20180408212743.22934-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180408212743.22934-6-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Currently hcd.c is the only consumer of the usb_phy_roothub logic. This
already includes the required header files so struct device is known.
However, future consumers might not know about struct device.
Add a forward declaration for struct device to fix potential future
consumers which don't include any of the struct device API headers.

Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/core/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
index 605555901d44..bbc969383074 100644
--- a/drivers/usb/core/phy.h
+++ b/drivers/usb/core/phy.h
@@ -1,3 +1,4 @@
+struct device;
 struct usb_phy_roothub;
 
 struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev);
-- 
2.17.0
