From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 14 Jun 2018 13:43:37 +0200
Subject: [PATCH u-boot 1/5] adc: meson-saradc: fix regmap_init_mem call
In-Reply-To: <1528976621-8397-1-git-send-email-narmstrong@baylibre.com>
References: <1528976621-8397-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1528976621-8397-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The SARADC driver was merged after the following commit :
commit d35812368a59 ("regmap: change regmap_init_mem() to take ofnode instead udevice")
Thus breaking build, this patch fixes the regmap_init_mem accordingly.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/adc/meson-saradc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/adc/meson-saradc.c b/drivers/adc/meson-saradc.c
index bcab76d..f7c919d 100644
--- a/drivers/adc/meson-saradc.c
+++ b/drivers/adc/meson-saradc.c
@@ -654,7 +654,7 @@ static int meson_saradc_probe(struct udevice *dev)
 	struct meson_saradc_priv *priv = dev_get_priv(dev);
 	int ret;
 
-	ret = regmap_init_mem(dev, &priv->regmap);
+	ret = regmap_init_mem(dev_ofnode(dev), &priv->regmap);
 	if (ret)
 		return ret;
 
-- 
2.7.4
