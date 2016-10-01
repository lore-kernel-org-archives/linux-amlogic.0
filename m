From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  1 Oct 2016 17:21:33 +0200
Subject: [PATCH 2/3] phy: meson8b-usb2: request a shared reset line
In-Reply-To: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
References: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
Message-ID: <20161001152134.8168-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Both PHYs are sharing one reset line. With recent improvements to the
reset framework we can now also use reset_control_reset with shared
resets.
This allows us to drop some workarounds where the reset was only
specified for one PHY but not the other, to make sure that the reset it
only executed once (as the reset framework was not able to use
reset_control_reset with shared reset lines).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/phy-meson8b-usb2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/phy-meson8b-usb2.c b/drivers/phy/phy-meson8b-usb2.c
index 73bf632..f1ee96a 100644
--- a/drivers/phy/phy-meson8b-usb2.c
+++ b/drivers/phy/phy-meson8b-usb2.c
@@ -237,8 +237,7 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->clk_usb))
 		return PTR_ERR(priv->clk_usb);
 
-	priv->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
-								NULL);
+	priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
 	if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
 		return PTR_ERR(priv->reset);
 
-- 
2.10.0
