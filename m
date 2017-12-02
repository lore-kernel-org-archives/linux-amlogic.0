From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 23:06:50 +0100
Subject: [RfC net-next 3/3] net: phy: realtek: add more interrupt bits for
 RTL8211E and RTL8211F
In-Reply-To: <20171202220650.23391-1-martin.blumenstingl@googlemail.com>
References: <20171202220650.23391-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171202220650.23391-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This documents a few more bits in the RTL821x_INER register for RTL8211E
and RTL8211F. These are added only to document them (as no public
datasheets are available for these PHYs), they are currently not used.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/realtek.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index 961165d128d6..a793c35cbaae 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -24,7 +24,14 @@
 #define RTL821x_INER				0x12
 #define RTL8211B_INER_INIT			0x6400
 #define RTL8211E_INER_LINK_STATUS		BIT(10)
+#define RTL8211E_INER_ANEG_COMPLETED		BIT(11)
+#define RTL8211E_INER_PAGE_RECEIVED		BIT(12)
+#define RTL8211E_INER_ANEG_ERROR		BIT(15)
 #define RTL8211F_INER_LINK_STATUS		BIT(4)
+#define RTL8211F_INER_PHY_REGISTER_ACCESSIBLE	BIT(5)
+#define RTL8211F_INER_WOL_PME			BIT(7)
+#define RTL8211F_INER_ALDPS_STATE_CHANGE	BIT(9)
+#define RTL8211F_INER_JABBER			BIT(10)
 
 #define RTL821x_INSR				0x13
 
-- 
2.15.1
