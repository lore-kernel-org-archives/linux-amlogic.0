From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 22:51:28 +0100
Subject: [PATCH net-next 5/5] net: phy: realtek: add utility functions to
 read/write page addresses
In-Reply-To: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
References: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171202215128.20202-6-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Realtek PHYs implement the concept of so-called "extension pages". The
reason for this is probably because these PHYs expose more registers
than available in the standard address range.
After all read/write operations on such a page are done the driver
should switch back to page 0 where the standard MII registers (such as
MII_BMCR) are available.

When referring to such a register the datasheets of RTL8211E and
RTL8211F always specify:
- the page / "ext. page" which has to be written to RTL821x_PAGE_SELECT
- an address (sometimes also called reg)

These new utility functions make the existing code easier to read since
it removes some duplication (switching back to page 0 is done within the
new helpers for example).

No functional changes are intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/realtek.c | 83 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 30 deletions(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index d6868e8daaab..5416ec5af042 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -41,6 +41,39 @@ MODULE_DESCRIPTION("Realtek PHY driver");
 MODULE_AUTHOR("Johnson Leung");
 MODULE_LICENSE("GPL");
 
+static int rtl8211x_page_read(struct phy_device *phydev, u16 page, u16 address)
+{
+	int ret;
+
+	ret = phy_write(phydev, RTL821x_PAGE_SELECT, page);
+	if (ret)
+		return ret;
+
+	ret = phy_read(phydev, address);
+
+	/* restore to default page 0 */
+	phy_write(phydev, RTL821x_PAGE_SELECT, 0x0);
+
+	return ret;
+}
+
+static int rtl8211x_page_write(struct phy_device *phydev, u16 page,
+			       u16 address, u16 val)
+{
+	int ret;
+
+	ret = phy_write(phydev, RTL821x_PAGE_SELECT, page);
+	if (ret)
+		return ret;
+
+	ret = phy_write(phydev, address, val);
+
+	/* restore to default page 0 */
+	phy_write(phydev, RTL821x_PAGE_SELECT, 0x0);
+
+	return ret;
+}
+
 static int rtl8201_ack_interrupt(struct phy_device *phydev)
 {
 	int err;
@@ -63,31 +96,21 @@ static int rtl8211f_ack_interrupt(struct phy_device *phydev)
 {
 	int err;
 
-	phy_write(phydev, RTL821x_PAGE_SELECT, 0xa43);
-	err = phy_read(phydev, RTL8211F_INSR);
-	/* restore to default page 0 */
-	phy_write(phydev, RTL821x_PAGE_SELECT, 0x0);
+	err = rtl8211x_page_read(phydev, 0xa43, RTL8211F_INSR);
 
 	return (err < 0) ? err : 0;
 }
 
 static int rtl8201_config_intr(struct phy_device *phydev)
 {
-	int err;
-
-	/* switch to page 7 */
-	phy_write(phydev, RTL821x_PAGE_SELECT, 0x7);
+	u16 val;
 
 	if (phydev->interrupts == PHY_INTERRUPT_ENABLED)
-		err = phy_write(phydev, RTL8201F_IER,
-				BIT(13) | BIT(12) | BIT(11));
+		val = BIT(13) | BIT(12) | BIT(11);
 	else
-		err = phy_write(phydev, RTL8201F_IER, 0);
+		val = 0;
 
-	/* restore to default page 0 */
-	phy_write(phydev, RTL821x_PAGE_SELECT, 0x0);
-
-	return err;
+	return rtl8211x_page_write(phydev, 0x7, RTL8201F_IER, val);
 }
 
 static int rtl8211b_config_intr(struct phy_device *phydev)
@@ -118,41 +141,41 @@ static int rtl8211e_config_intr(struct phy_device *phydev)
 
 static int rtl8211f_config_intr(struct phy_device *phydev)
 {
-	int err;
+	u16 val;
 
-	phy_write(phydev, RTL821x_PAGE_SELECT, 0xa42);
 	if (phydev->interrupts == PHY_INTERRUPT_ENABLED)
-		err = phy_write(phydev, RTL821x_INER,
-				RTL8211F_INER_LINK_STATUS);
+		val = RTL8211F_INER_LINK_STATUS;
 	else
-		err = phy_write(phydev, RTL821x_INER, 0);
-	phy_write(phydev, RTL821x_PAGE_SELECT, 0);
+		val = 0;
 
-	return err;
+	return rtl8211x_page_write(phydev, 0xa42, RTL821x_INER, val);
 }
 
 static int rtl8211f_config_init(struct phy_device *phydev)
 {
 	int ret;
-	u16 reg;
+	u16 val;
 
 	ret = genphy_config_init(phydev);
 	if (ret < 0)
 		return ret;
 
-	phy_write(phydev, RTL821x_PAGE_SELECT, 0xd08);
-	reg = phy_read(phydev, 0x11);
+	ret = rtl8211x_page_read(phydev, 0xd08, 0x11);
+	if (ret < 0)
+		return ret;
+
+	val = ret & 0xffff;
 
 	/* enable TX-delay for rgmii-id and rgmii-txid, otherwise disable it */
 	if (phydev->interface == PHY_INTERFACE_MODE_RGMII_ID ||
 	    phydev->interface == PHY_INTERFACE_MODE_RGMII_TXID)
-		reg |= RTL8211F_TX_DELAY;
+		val |= RTL8211F_TX_DELAY;
 	else
-		reg &= ~RTL8211F_TX_DELAY;
+		val &= ~RTL8211F_TX_DELAY;
 
-	phy_write(phydev, 0x11, reg);
-	/* restore to default page 0 */
-	phy_write(phydev, RTL821x_PAGE_SELECT, 0x0);
+	ret = rtl8211x_page_write(phydev, 0xd08, 0x11, val);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.15.1
