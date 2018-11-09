From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 15:21:00 +0100
Subject: [PATCH u-boot 2/2] net: designware: add meson meson axg compatible
In-Reply-To: <1541773260-16197-1-git-send-email-narmstrong@baylibre.com>
References: <1541773260-16197-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541773260-16197-3-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the compatible string for the upcoming Amlogic AXG SoC family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/net/designware.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/designware.c b/drivers/net/designware.c
index cdcc03f..4fa26ab 100644
--- a/drivers/net/designware.c
+++ b/drivers/net/designware.c
@@ -839,6 +839,7 @@ static const struct udevice_id designware_eth_ids[] = {
 	{ .compatible = "amlogic,meson6-dwmac" },
 	{ .compatible = "amlogic,meson-gx-dwmac" },
 	{ .compatible = "amlogic,meson-gxbb-dwmac" },
+	{ .compatible = "amlogic,meson-axg-dwmac" },
 	{ .compatible = "st,stm32-dwmac" },
 	{ }
 };
-- 
2.7.4
