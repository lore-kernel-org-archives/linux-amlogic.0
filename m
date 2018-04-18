From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 18 Apr 2018 21:39:51 +0200
Subject: [PATCH usb v6 6/6] usb: core: phy: add the SPDX-License-Identifier
 and include guard
In-Reply-To: <20180418193951.17922-1-martin.blumenstingl@googlemail.com>
References: <20180418193951.17922-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180418193951.17922-7-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This clarifies the license of the code. While here also add an include
guard to the header file.

Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/core/phy.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
index bbc969383074..88a3c037e9df 100644
--- a/drivers/usb/core/phy.h
+++ b/drivers/usb/core/phy.h
@@ -1,3 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * USB roothub wrapper
+ *
+ * Copyright (C) 2018 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ */
+
+#ifndef __USB_CORE_PHY_H_
+#define __USB_CORE_PHY_H_
+
 struct device;
 struct usb_phy_roothub;
 
@@ -13,3 +23,5 @@ int usb_phy_roothub_suspend(struct device *controller_dev,
 			    struct usb_phy_roothub *phy_roothub);
 int usb_phy_roothub_resume(struct device *controller_dev,
 			   struct usb_phy_roothub *phy_roothub);
+
+#endif /* __USB_CORE_PHY_H_ */
-- 
2.17.0
