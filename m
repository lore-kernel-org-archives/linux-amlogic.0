From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 16:26:51 +0100
Subject: [PATCH u-boot 12/19] clk: meson: silence debug print
In-Reply-To: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541777218-472-13-git-send-email-narmstrong@baylibre.com>
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
index 509872b..87e959e 100644
--- a/drivers/clk/clk_meson.c
+++ b/drivers/clk/clk_meson.c
@@ -790,7 +790,7 @@ static ulong meson_clk_get_rate_by_id(struct clk *clk, unsigned long id)
 		return -ENOENT;
 	}
 
-	printf("clock %lu has rate %lu\n", id, rate);
+	debug("clock %lu has rate %lu\n", id, rate);
 	return rate;
 }
 
-- 
2.7.4
