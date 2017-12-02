From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 22:51:24 +0100
Subject: [PATCH net-next 1/5] net: phy: realtek: use the BIT and GENMASK macros
In-Reply-To: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
References: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171202215128.20202-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This makes it easier to compare the #defines with the datasheets.
No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/realtek.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index eda0a6e86918..9708aa9c58dd 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -13,21 +13,22 @@
  * option) any later version.
  *
  */
+#include <linux/bitops.h>
 #include <linux/phy.h>
 #include <linux/module.h>
 
 #define RTL821x_PHYSR		0x11
-#define RTL821x_PHYSR_DUPLEX	0x2000
-#define RTL821x_PHYSR_SPEED	0xc000
+#define RTL821x_PHYSR_DUPLEX	BIT(13)
+#define RTL821x_PHYSR_SPEED	GENMASK(15, 14)
 #define RTL821x_INER		0x12
 #define RTL821x_INER_INIT	0x6400
 #define RTL821x_INSR		0x13
 #define RTL821x_PAGE_SELECT	0x1f
-#define RTL8211E_INER_LINK_STATUS 0x400
+#define RTL8211E_INER_LINK_STATUS	BIT(10)
 
-#define RTL8211F_INER_LINK_STATUS 0x0010
+#define RTL8211F_INER_LINK_STATUS	BIT(4)
 #define RTL8211F_INSR		0x1d
-#define RTL8211F_TX_DELAY	0x100
+#define RTL8211F_TX_DELAY	BIT(8)
 
 #define RTL8201F_ISR		0x1e
 #define RTL8201F_IER		0x13
-- 
2.15.1
