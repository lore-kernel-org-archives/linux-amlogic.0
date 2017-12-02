From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 22:51:26 +0100
Subject: [PATCH net-next 3/5] net: phy: realtek: group all register bit
 #defines for RTL821x_INER
In-Reply-To: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
References: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171202215128.20202-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This simply moves all register bit #defines which describe the (PHY
specific) bits in the RTL821x_INER right below the RTL821x_INER register
definition. This makes it easier to spot which registers and bits belong
together.
No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/realtek.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index 59f0688e4d28..da263a92d6b1 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -20,13 +20,16 @@
 #define RTL821x_PHYSR		0x11
 #define RTL821x_PHYSR_DUPLEX	BIT(13)
 #define RTL821x_PHYSR_SPEED	GENMASK(15, 14)
+
 #define RTL821x_INER		0x12
 #define RTL8211B_INER_INIT	0x6400
+#define RTL8211E_INER_LINK_STATUS	BIT(10)
+#define RTL8211F_INER_LINK_STATUS	BIT(4)
+
 #define RTL821x_INSR		0x13
+
 #define RTL821x_PAGE_SELECT	0x1f
-#define RTL8211E_INER_LINK_STATUS	BIT(10)
 
-#define RTL8211F_INER_LINK_STATUS	BIT(4)
 #define RTL8211F_INSR		0x1d
 #define RTL8211F_TX_DELAY	BIT(8)
 
-- 
2.15.1
