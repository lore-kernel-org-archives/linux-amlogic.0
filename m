From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 15 Feb 2017 19:15:51 +0100
Subject: [PATCH] reset: fix shared reset triggered_count decrement on error
Message-ID: <1487182551-31517-1-git-send-email-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

For a shared reset, when the reset is successful, the triggered_count is
incremented when trying to call the reset callback, so that another device
sharing the same reset line won't trigger it again. If the reset has not
been triggered successfully, the trigger_count should be decremented.

The code does the opposite, and decrements the trigger_count on success.
As a consequence, another device sharing the reset will be able to trigger
it again.

Fixed be removing negation in from of the error code of the reset function.

Fixes: 7da33a37b48f ("reset: allow using reset_control_reset with shared reset")

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Hi Philipp,

 I found this issue while testing your patch [0]
 It fixes a regression we have been having with usb. On meson-gxbb
 platforms, usb0 and usb1 share the same reset line. Martin had
 reports that usb0 recently got broken. In fact usb1 was able to
 trigger the reset again because the issue mentioned above.

[0]: http://lkml.kernel.org/r/20170130114116.22089-10-p.zabel at pengutronix.de

 drivers/reset/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 71ccf281dce3..f1e5e65388bb 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -169,7 +169,7 @@ int reset_control_reset(struct reset_control *rstc)
 	}
 
 	ret = rstc->rcdev->ops->reset(rstc->rcdev, rstc->id);
-	if (rstc->shared && !ret)
+	if (rstc->shared && ret)
 		atomic_dec(&rstc->triggered_count);
 
 	return ret;
-- 
2.7.4
