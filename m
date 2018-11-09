From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 15:20:59 +0100
Subject: [PATCH u-boot 1/2] net: designware: add meson meson gxbb compatible
In-Reply-To: <1541773260-16197-1-git-send-email-narmstrong@baylibre.com>
References: <1541773260-16197-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541773260-16197-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the compatible string for the Amlogic GXBB SoC family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/net/designware.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/designware.c b/drivers/net/designware.c
index 19db0a8..cdcc03f 100644
--- a/drivers/net/designware.c
+++ b/drivers/net/designware.c
@@ -838,6 +838,7 @@ static const struct udevice_id designware_eth_ids[] = {
 	{ .compatible = "altr,socfpga-stmmac" },
 	{ .compatible = "amlogic,meson6-dwmac" },
 	{ .compatible = "amlogic,meson-gx-dwmac" },
+	{ .compatible = "amlogic,meson-gxbb-dwmac" },
 	{ .compatible = "st,stm32-dwmac" },
 	{ }
 };
-- 
2.7.4
