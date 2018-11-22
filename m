From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 22 Nov 2018 10:07:33 +0100
Subject: [PATCH u-boot v2 12/19] clk: meson: silence debug print
In-Reply-To: <20181122090740.29739-1-narmstrong@baylibre.com>
References: <20181122090740.29739-1-narmstrong@baylibre.com>
Message-ID: <20181122090740.29739-13-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

This debug print was not designed to be active in non-debug mode.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk_meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk_meson.c b/drivers/clk/clk_meson.c
index a096a3582c..f34f376057 100644
--- a/drivers/clk/clk_meson.c
+++ b/drivers/clk/clk_meson.c
@@ -791,7 +791,7 @@ static ulong meson_clk_get_rate_by_id(struct clk *clk, unsigned long id)
 		return -ENOENT;
 	}
 
-	printf("clock %lu has rate %lu\n", id, rate);
+	debug("clock %lu has rate %lu\n", id, rate);
 	return rate;
 }
 
-- 
2.19.1
