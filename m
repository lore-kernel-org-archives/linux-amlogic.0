From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed,  3 Jan 2018 16:46:29 +0100
Subject: [PATCH net] net: stmmac: enable EEE in MII, GMII or RGMII only
Message-ID: <20180103154629.1433-1-jbrunet@baylibre.com>
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
Tested-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---

Hi David,

As quickly explained in the log above, we are having some stability issue on
Amlogic gxl platform: synopsys MAC + internal PHY over RMII. We found out that
these issues are caused by EEE. Forcefully disabling this feature solves our
problem.

I only had access to a snip of databook. I have no idea if the restriction
explained above applies to all the revision of Synopsys MAC controller.

Anyway, this change should be safe to apply. If we get more information from
Synopsys later on, it will be easy to revert, if necessary.

Thanks
Jerome

Change since RFC [0]:
* use phy_interface_mode_is_rgmii() as suggested by Andrew

[0]: http://lkml.kernel.org/r/20171205102809.4347-1-jbrunet at baylibre.com

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c52a9963c19d..023938166821 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -364,9 +364,15 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
 bool stmmac_eee_init(struct stmmac_priv *priv)
 {
 	struct net_device *ndev = priv->dev;
+	int interface = priv->plat->interface;
 	unsigned long flags;
 	bool ret = false;
 
+	if ((interface != PHY_INTERFACE_MODE_MII) &&
+	    (interface != PHY_INTERFACE_MODE_GMII) &&
+	    !phy_interface_mode_is_rgmii(interface))
+		goto out;
+
 	/* Using PCS we cannot dial with the phy registers at this stage
 	 * so we do not support extra feature like EEE.
 	 */
-- 
2.14.3
