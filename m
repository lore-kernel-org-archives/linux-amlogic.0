From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 30 Mar 2018 01:00:35 +0200
Subject: [PATCH net-next v1 2/2] net: stmmac: dwmac-meson8b: Add support for
 the Meson8m2 SoC
In-Reply-To: <20180329230035.20958-1-martin.blumenstingl@googlemail.com>
References: <20180329230035.20958-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180329230035.20958-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Meson8m2 SoC uses a similar (potentially even identical) register
layout as the Meson8b and GXBB SoCs for the dwmac glue.
Add a new compatible string and update the module description to
indicate support for these SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 2d5d4aea3bcb..7cb794094a70 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -1,5 +1,5 @@
 /*
- * Amlogic Meson8b and GXBB DWMAC glue layer
+ * Amlogic Meson8b, Meson8m2 and GXBB DWMAC glue layer
  *
  * Copyright (C) 2016 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  *
@@ -318,6 +318,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{ .compatible = "amlogic,meson8b-dwmac" },
+	{ .compatible = "amlogic,meson8m2-dwmac" },
 	{ .compatible = "amlogic,meson-gxbb-dwmac" },
 	{ }
 };
@@ -335,5 +336,5 @@ static struct platform_driver meson8b_dwmac_driver = {
 module_platform_driver(meson8b_dwmac_driver);
 
 MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
-MODULE_DESCRIPTION("Amlogic Meson8b and GXBB DWMAC glue layer");
+MODULE_DESCRIPTION("Amlogic Meson8b, Meson8m2 and GXBB DWMAC glue layer");
 MODULE_LICENSE("GPL v2");
-- 
2.16.3
