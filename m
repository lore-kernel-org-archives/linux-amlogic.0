From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 22 Nov 2018 10:07:32 +0100
Subject: [PATCH u-boot v2 11/19] clk: meson: add static to meson_gates table
In-Reply-To: <20181122090740.29739-1-narmstrong@baylibre.com>
References: <20181122090740.29739-1-narmstrong@baylibre.com>
Message-ID: <20181122090740.29739-12-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The meson_gates table should be set static in the clk_meson driver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk_meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk_meson.c b/drivers/clk/clk_meson.c
index c44858822d..a096a3582c 100644
--- a/drivers/clk/clk_meson.c
+++ b/drivers/clk/clk_meson.c
@@ -79,7 +79,7 @@ static ulong meson_clk_set_rate_by_id(struct clk *clk, unsigned long id,
 static ulong meson_mux_get_parent(struct clk *clk, unsigned long id);
 static ulong meson_clk_get_rate_by_id(struct clk *clk, unsigned long id);
 
-struct meson_gate gates[] = {
+static struct meson_gate gates[] = {
 	/* Everything Else (EE) domain gates */
 	MESON_GATE(CLKID_DDR, HHI_GCLK_MPEG0, 0),
 	MESON_GATE(CLKID_DOS, HHI_GCLK_MPEG0, 1),
-- 
2.19.1
