From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 22:51:25 +0100
Subject: [PATCH net-next 2/5] net: phy: realtek: rename RTL821x_INER_INIT to
 RTL8211B_INER_INIT
In-Reply-To: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
References: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171202215128.20202-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This macro is only used by the RTL8211B code. RTL8211E and RTL8211F both
use other bits to initialize the RTL821x_INER register.
No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/realtek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index 9708aa9c58dd..59f0688e4d28 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -21,7 +21,7 @@
 #define RTL821x_PHYSR_DUPLEX	BIT(13)
 #define RTL821x_PHYSR_SPEED	GENMASK(15, 14)
 #define RTL821x_INER		0x12
-#define RTL821x_INER_INIT	0x6400
+#define RTL8211B_INER_INIT	0x6400
 #define RTL821x_INSR		0x13
 #define RTL821x_PAGE_SELECT	0x1f
 #define RTL8211E_INER_LINK_STATUS	BIT(10)
@@ -92,7 +92,7 @@ static int rtl8211b_config_intr(struct phy_device *phydev)
 
 	if (phydev->interrupts == PHY_INTERRUPT_ENABLED)
 		err = phy_write(phydev, RTL821x_INER,
-				RTL821x_INER_INIT);
+				RTL8211B_INER_INIT);
 	else
 		err = phy_write(phydev, RTL821x_INER, 0);
 
-- 
2.15.1
