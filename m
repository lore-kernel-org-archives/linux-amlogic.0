From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 29 Oct 2018 16:13:40 +0100
Subject: [PATCH 4/4] pinctrl: meson: fix meson8b ao pull register bits
In-Reply-To: <20181029151340.9087-1-jbrunet@baylibre.com>
References: <20181029151340.9087-1-jbrunet@baylibre.com>
Message-ID: <20181029151340.9087-5-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

AO pull register definition is inverted between pull (up/down) and
pull enable. Fixing this allows to properly apply bias setting
through pinconf

Fixes: 0fefcb6876d0 ("pinctrl: Add support for Meson8b")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index bb2a30964fc6..647ad15d5c3c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -906,7 +906,7 @@ static struct meson_bank meson8b_cbus_banks[] = {
 
 static struct meson_bank meson8b_aobus_banks[] = {
 	/*   name    first     lastc        irq    pullen  pull    dir     out     in  */
-	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
+	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0,  16, 0, 0,  0,  0,  0, 16,  1,  0),
 };
 
 static struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
-- 
2.17.2
