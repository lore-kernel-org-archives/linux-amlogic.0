From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 17 Apr 2018 11:30:31 +0200
Subject: [PATCH] clk: fix clk_get_bulk when phandle error
Message-ID: <1523957431-16612-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This fixes the Coverity Defect CID 175347 when dev_count_phandle_with_args()
returns a negative value.

Fixes: a855be87da49 ("clk: Add get/enable/disable/release for a bulk of clocks")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk-uclass.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index 6e99b3b..53f418b 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -111,8 +111,8 @@ int clk_get_bulk(struct udevice *dev, struct clk_bulk *bulk)
 	bulk->count = 0;
 
 	count = dev_count_phandle_with_args(dev, "clocks", "#clock-cells");
-	if (!count)
-		return 0;
+	if (count < 1)
+		return count;
 
 	bulk->clks = devm_kcalloc(dev, count, sizeof(struct clk), GFP_KERNEL);
 	if (!bulk->clks)
-- 
2.7.4
