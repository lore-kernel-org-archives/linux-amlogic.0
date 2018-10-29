From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 29 Oct 2018 16:13:37 +0100
Subject: [PATCH 1/4] pinctrl: meson: fix gxbb ao pull register bits
In-Reply-To: <20181029151340.9087-1-jbrunet@baylibre.com>
References: <20181029151340.9087-1-jbrunet@baylibre.com>
Message-ID: <20181029151340.9087-2-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

AO pull register definition is inverted between pull (up/down) and
pull enable. Fixing this allows to properly apply bias setting
through pinconf

Fixes: 468c234f9ed7 ("pinctrl: amlogic: Add support for Amlogic Meson GXBB SoC")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 4ceb06f8a33c..4edeb4cae72a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -830,7 +830,7 @@ static struct meson_bank meson_gxbb_periphs_banks[] = {
 
 static struct meson_bank meson_gxbb_aobus_banks[] = {
 	/*   name    first      last       irq    pullen  pull    dir     out     in  */
-	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
+	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
 };
 
 static struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
-- 
2.17.2
