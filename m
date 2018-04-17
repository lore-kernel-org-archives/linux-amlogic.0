From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 17 Apr 2018 11:30:22 +0200
Subject: [PATCH] reset: fix reset_get_bulk when phandle error
Message-ID: <1523957422-16552-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This fixes the Coverity Defect CID 175348 when dev_count_phandle_with_args()
returns a negative value.

Fixes: 0c28233903b5 ("reset: Add get/assert/deassert/release for bulk of reset signals")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/reset/reset-uclass.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-uclass.c b/drivers/reset/reset-uclass.c
index 9a5c9c9..fa4f653 100644
--- a/drivers/reset/reset-uclass.c
+++ b/drivers/reset/reset-uclass.c
@@ -88,8 +88,8 @@ int reset_get_bulk(struct udevice *dev, struct reset_ctl_bulk *bulk)
 	bulk->count = 0;
 
 	count = dev_count_phandle_with_args(dev, "resets", "#reset-cells");
-	if (!count)
-		return 0;
+	if (count < 1)
+		return count;
 
 	bulk->resets = devm_kcalloc(dev, count, sizeof(struct reset_ctl),
 				    GFP_KERNEL);
-- 
2.7.4
