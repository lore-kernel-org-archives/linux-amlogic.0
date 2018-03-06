From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue,  6 Mar 2018 12:10:45 +0100
Subject: [PATCH net-next] net: phy: mdio-mux: slience probe defer error
Message-ID: <20180306111045.19315-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

If we fail to register the mdio bus due to probe defer, we should not
print an error message. Just be silent in this case.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/phy/mdio-mux-mmioreg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mdio-mux-mmioreg.c b/drivers/net/phy/mdio-mux-mmioreg.c
index 2573ab012f16..70f6115530af 100644
--- a/drivers/net/phy/mdio-mux-mmioreg.c
+++ b/drivers/net/phy/mdio-mux-mmioreg.c
@@ -163,8 +163,9 @@ static int mdio_mux_mmioreg_probe(struct platform_device *pdev)
 			    mdio_mux_mmioreg_switch_fn,
 			    &s->mux_handle, s, NULL);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register mdio-mux bus %pOF\n",
-			np);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"failed to register mdio-mux bus %pOF\n", np);
 		return ret;
 	}
 
-- 
2.14.3
