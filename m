From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 7 Jun 2017 07:44:20 +0200
Subject: [PATCH] pinctrl: meson-gxbb: remove non-existing pin GPIOX_22
Message-ID: <77ac1caf-f2b1-efe8-70ea-5a358908cc87@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

After commit 34e61801a3b9 "pinctrl: meson-gxbb: Add missing GPIODV_18
pin entry" I started to get the following warning:

"meson-pinctrl c8834000.periphs:pinctrl at 4b0: names 119 do not match
number of GPIOs 120"

It turned out that not the mentioned commit has a problem, it just
revealed another problem which had existed before.

There is no PIN GPIOX_22 on Meson GXBB.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 8b716b93..a879cf07 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -138,7 +138,6 @@ static const struct pinctrl_pin_desc meson_gxbb_periphs_pins[] = {
 	MESON_PIN(GPIOX_19, EE_OFF),
 	MESON_PIN(GPIOX_20, EE_OFF),
 	MESON_PIN(GPIOX_21, EE_OFF),
-	MESON_PIN(GPIOX_22, EE_OFF),
 
 	MESON_PIN(GPIOCLK_0, EE_OFF),
 	MESON_PIN(GPIOCLK_1, EE_OFF),
-- 
2.13.0
