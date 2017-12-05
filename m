From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue,  5 Dec 2017 11:28:09 +0100
Subject: [RFC PATCH] net: stmmac: enable EEE in MII, GMII or RGMII only
Message-ID: <20171205102809.4347-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Note in the databook - Section 4.4 - EEE :
" The EEE feature is not supported when the MAC is configured to use the
TBI, RTBI, SMII, RMII or SGMII single PHY interface. Even if the MAC
supports multiple PHY interfaces, you should activate the EEE mode only
when the MAC is operating with GMII, MII, or RGMII interface."

Applying this restriction solves a stability issue observed on Amlogic
gxl platforms operating with RMII interface and the internal PHY.

Fixes: 83bf79b6bb64 ("stmmac: disable at run-time the EEE if not supported")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Hi Peppe, Alexandre,

As quickly explained in the log above, we are having some stability issue on
Amlogic gxl platform: synopsys MAC + internal PHY over RMII. We found out that
these issues are caused by EEE. Forcefully disabling this feature solves our
problem. We are now looking for the more appropriate way to address the
problem.

I only had access to a snip of databook. I have no idea if the restriction
explained above applies to all the revision of Synopsys MAC controller ?
Or maybe the restriction is more generic and we should check for the
interface type in phy_init_eee() instead ?

Could you please share your opinion on this matter ?

Thanks
Jerome

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f63c2ddced3c..8e8add8c6ed3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -364,9 +364,18 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
 bool stmmac_eee_init(struct stmmac_priv *priv)
 {
 	struct net_device *ndev = priv->dev;
+	int interface = priv->plat->interface;
 	unsigned long flags;
 	bool ret = false;
 
+	if ((interface != PHY_INTERFACE_MODE_MII) &&
+	    (interface != PHY_INTERFACE_MODE_GMII) &&
+	    (interface != PHY_INTERFACE_MODE_RGMII) &&
+	    (interface != PHY_INTERFACE_MODE_RGMII_ID) &&
+	    (interface != PHY_INTERFACE_MODE_RGMII_TXID) &&
+	    (interface != PHY_INTERFACE_MODE_RGMII_RXID))
+		goto out;
+
 	/* Using PCS we cannot dial with the phy registers at this stage
 	 * so we do not support extra feature like EEE.
 	 */
-- 
2.14.3
