From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 12 Feb 2018 23:39:27 +0100
Subject: [PATCH v2 4/5] phy: amlogic: phy-meson-gxl-usb2: don't log an error
 on -EPROBE_DEFER
In-Reply-To: <20180212223928.22993-1-martin.blumenstingl@googlemail.com>
References: <20180212223928.22993-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180212223928.22993-5-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

devm_phy_create can return -EPROBE_DEFER if the phy-supply is not ready
yet. Silence this warning as the driver framework will re-attempt
registering the PHY - this second try works without any errors. So only
log actual errors to keep the kernel log free of misleading error
messages.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Yixun Lan <yixun.lan@amlogic.com>
---
 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index ee3c2c0c8572..f062fc7f0a3a 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -240,6 +240,7 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
 	struct phy_meson_gxl_usb2_priv *priv;
 	struct phy *phy;
 	void __iomem *base;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -275,8 +276,11 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
 
 	phy = devm_phy_create(dev, NULL, &phy_meson_gxl_usb2_ops);
 	if (IS_ERR(phy)) {
-		dev_err(dev, "failed to create PHY\n");
-		return PTR_ERR(phy);
+		ret = PTR_ERR(phy);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to create PHY\n");
+
+		return ret;
 	}
 
 	phy_set_drvdata(phy, priv);
-- 
2.16.1
