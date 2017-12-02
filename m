From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 23:06:49 +0100
Subject: [RfC net-next 2/3] net: phy: realtek: configure the INTB pin on
 RTL8211F
In-Reply-To: <20171202220650.23391-1-martin.blumenstingl@googlemail.com>
References: <20171202220650.23391-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171202220650.23391-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The interrupt pin on the RTL8211F PHY can be used in two different
modes:
INTB
- the default mode of the PHY
- interrupts can be configured through page 0xa42 register RTL821x_INER
- interrupts can be ACK'ed through RTL8211F_INSR
- it acts as a level-interrupt which is active low
- Wake-on-LAN "wakeup" status is available in RTL8211F_INSR bit 7

PMEB:
- special mode for Wake-on-LAN
- interrupts configured through page 0xa42 register RTL821x_INER are
  disabled
- it supports a "pulse low" waveform for the interrupt

For now we simply force the pin into INTB mode since the PHY driver does
not support Wake-on-LAN yet.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/phy/realtek.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index d4e7f249a4bc..961165d128d6 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -40,6 +40,9 @@
 #define RTL8201F_ISR				0x1e
 #define RTL8201F_IER				0x13
 
+#define RTL8211F_INTBCR				0x16
+#define RTL8211F_INTBCR_INTB_PMEB		BIT(5)
+
 MODULE_DESCRIPTION("Realtek PHY driver");
 MODULE_AUTHOR("Johnson Leung");
 MODULE_LICENSE("GPL");
@@ -161,12 +164,32 @@ static int rtl8211e_config_intr(struct phy_device *phydev)
 
 static int rtl8211f_config_intr(struct phy_device *phydev)
 {
+	int err;
 	u16 val;
 
-	if (phydev->interrupts == PHY_INTERRUPT_ENABLED)
+	if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
+		/*
+		 * The interrupt pin has two functions:
+		 * 0: INTB: it acts as interrupt pin which can be configured
+		 *    through RTL821x_INER and the status can be read through
+		 *    RTL8211F_INSR
+		 * 1: PMEB: a special "Power Management Event" mode for
+		 *    Wake-on-LAN operation (with support for a "pulse low"
+		 *    wave format). Interrupts configured through RTL821x_INER
+		 *    will not work in this mode
+		 *
+		 * select INTB mode in the "INTB pin control" register to
+		 * ensure that the interrupt pin is in the correct mode.
+		 */
+		err = rtl8211x_page_mask_bits(phydev, 0xd40, RTL8211F_INTBCR,
+					      RTL8211F_INTBCR_INTB_PMEB, 0);
+		if (err)
+			return err;
+
 		val = RTL8211F_INER_LINK_STATUS;
-	else
+	} else {
 		val = 0;
+	}
 
 	return rtl8211x_page_write(phydev, 0xa42, RTL821x_INER, val);
 }
-- 
2.15.1
