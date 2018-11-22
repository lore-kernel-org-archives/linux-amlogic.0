From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 22 Nov 2018 10:07:30 +0100
Subject: [PATCH u-boot v2 09/19] pinctrl: meson: select generic pinctrl
In-Reply-To: <20181122090740.29739-1-narmstrong@baylibre.com>
References: <20181122090740.29739-1-narmstrong@baylibre.com>
Message-ID: <20181122090740.29739-10-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Meson pinctrl needs generic pinctrl, rather than depending on it
select it

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
index 15a8d9c704..fc51b4361a 100644
--- a/drivers/pinctrl/meson/Kconfig
+++ b/drivers/pinctrl/meson/Kconfig
@@ -1,7 +1,7 @@
 if ARCH_MESON
 
 config PINCTRL_MESON
-	depends on PINCTRL_GENERIC
+	select PINCTRL_GENERIC
 	bool
 
 config PINCTRL_MESON_GX_PMX
-- 
2.19.1
