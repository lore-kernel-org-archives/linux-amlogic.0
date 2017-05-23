From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 23 May 2017 18:05:03 +0200
Subject: [PATCH] pwm: silently error on EPROBE_DEFER
Message-ID: <20170523160503.16920-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

In of_pwm_chip, if we fail to get the pwm chip due to probe defer, we
shouldn't print an error message. Just be silent in this case.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pwm/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index a0860b30bd93..1581f6ab1b1f 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -678,7 +678,9 @@ struct pwm_device *of_pwm_get(struct device_node *np, const char *con_id)
 
 	pc = of_node_to_pwmchip(args.np);
 	if (IS_ERR(pc)) {
-		pr_err("%s(): PWM chip not found\n", __func__);
+		if (PTR_ERR(pc) != -EPROBE_DEFER)
+			pr_err("%s(): PWM chip not found\n", __func__);
+
 		pwm = ERR_CAST(pc);
 		goto put;
 	}
-- 
2.9.4
