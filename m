From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 22:51:27 +0100
Subject: [PATCH net-next 4/5] net: phy: realtek: use the same indentation for
 all #defines
In-Reply-To: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
References: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171202215128.20202-5-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This simply makes the code easier to read. No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/realtek.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index da263a92d6b1..d6868e8daaab 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -17,24 +17,25 @@
 #include <linux/phy.h>
 #include <linux/module.h>
 
-#define RTL821x_PHYSR		0x11
-#define RTL821x_PHYSR_DUPLEX	BIT(13)
-#define RTL821x_PHYSR_SPEED	GENMASK(15, 14)
+#define RTL821x_PHYSR				0x11
+#define RTL821x_PHYSR_DUPLEX			BIT(13)
+#define RTL821x_PHYSR_SPEED			GENMASK(15, 14)
 
-#define RTL821x_INER		0x12
-#define RTL8211B_INER_INIT	0x6400
-#define RTL8211E_INER_LINK_STATUS	BIT(10)
-#define RTL8211F_INER_LINK_STATUS	BIT(4)
+#define RTL821x_INER				0x12
+#define RTL8211B_INER_INIT			0x6400
+#define RTL8211E_INER_LINK_STATUS		BIT(10)
+#define RTL8211F_INER_LINK_STATUS		BIT(4)
 
-#define RTL821x_INSR		0x13
+#define RTL821x_INSR				0x13
 
-#define RTL821x_PAGE_SELECT	0x1f
+#define RTL821x_PAGE_SELECT			0x1f
 
-#define RTL8211F_INSR		0x1d
-#define RTL8211F_TX_DELAY	BIT(8)
+#define RTL8211F_INSR				0x1d
 
-#define RTL8201F_ISR		0x1e
-#define RTL8201F_IER		0x13
+#define RTL8211F_TX_DELAY			BIT(8)
+
+#define RTL8201F_ISR				0x1e
+#define RTL8201F_IER				0x13
 
 MODULE_DESCRIPTION("Realtek PHY driver");
 MODULE_AUTHOR("Johnson Leung");
-- 
2.15.1
