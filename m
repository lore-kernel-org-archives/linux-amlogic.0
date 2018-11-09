From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 15:17:07 +0100
Subject: [PATCH u-boot] mmc: meson-gx: Add AXG compatible
Message-ID: <1541773027-15546-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the compatible string for the upcoming Amlogic AXG SoC family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/mmc/meson_gx_mmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/meson_gx_mmc.c b/drivers/mmc/meson_gx_mmc.c
index 332f1e1..767dfff 100644
--- a/drivers/mmc/meson_gx_mmc.c
+++ b/drivers/mmc/meson_gx_mmc.c
@@ -278,6 +278,7 @@ int meson_mmc_bind(struct udevice *dev)
 
 static const struct udevice_id meson_mmc_match[] = {
 	{ .compatible = "amlogic,meson-gx-mmc" },
+	{ .compatible = "amlogic,meson-axg-mmc" },
 	{ /* sentinel */ }
 };
 
-- 
2.7.4
