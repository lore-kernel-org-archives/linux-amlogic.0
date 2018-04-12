From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 12 Apr 2018 10:03:19 +0200
Subject: [PATCH] reset: fix bulk API when DM_RESET is disabled
Message-ID: <1523520199-12341-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

In the commit "reset: Add get/assert/deassert/release for bulk of reset signals"
the disabled reset_release_bulk() and reset_get_bulk() used the wrong
struct clk_bulk instead of struct reset_ctl_bulk.

Fixes: 0c28233903b5 ("reset: Add get/assert/deassert/release for bulk of reset signals")
Reported-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/reset.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/reset.h b/include/reset.h
index d38f176..ae247ce 100644
--- a/include/reset.h
+++ b/include/reset.h
@@ -243,7 +243,8 @@ static inline int reset_get_by_index(struct udevice *dev, int index,
 	return -ENOTSUPP;
 }
 
-static inline int reset_get_bulk(struct udevice *dev, struct clk_bulk *bulk)
+static inline int reset_get_bulk(struct udevice *dev,
+				 struct reset_ctl_bulk *bulk)
 {
 	return -ENOTSUPP;
 }
@@ -284,7 +285,7 @@ static inline int reset_release_all(struct reset_ctl *reset_ctl, int count)
 	return 0;
 }
 
-static inline int reset_release_bulk(struct clk_bulk *bulk)
+static inline int reset_release_bulk(struct reset_ctl_bulk *bulk)
 {
 	return 0;
 }
-- 
2.7.4
