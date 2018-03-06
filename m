From: sudeep.holla@arm.com (Sudeep Holla)
Date: Tue,  6 Mar 2018 11:47:49 +0000
Subject: [PATCH] firmware: meson-sm: rework meson_sm_init to use
 module_platform_driver_probe
Message-ID: <1520336869-25224-1-git-send-email-sudeep.holla@arm.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Commit 3aa0582fdb82 ("of: platform: populate /firmware/ node from
of_platform_default_populate_init()") takes care of populating
all the devices under the /firmware/ node in of_platform_default_populate_init()

This patch reworks meson_sm_init to use module_platform_driver_probe as
the platform device is populated.

Cc: Carlo Caione <carlo@caione.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic at lists.infradead.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/meson/meson_sm.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ff204421117b..0ec2ca87318c 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -17,8 +17,10 @@
 #include <linux/arm-smccc.h>
 #include <linux/bug.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 #include <linux/sizes.h>
@@ -217,21 +219,11 @@ static const struct of_device_id meson_sm_ids[] = {
 	{ /* sentinel */ },
 };
 
-int __init meson_sm_init(void)
+static int __init meson_sm_probe(struct platform_device *pdev)
 {
 	const struct meson_sm_chip *chip;
-	const struct of_device_id *matched_np;
-	struct device_node *np;
 
-	np = of_find_matching_node_and_match(NULL, meson_sm_ids, &matched_np);
-	if (!np)
-		return -ENODEV;
-
-	chip = matched_np->data;
-	if (!chip) {
-		pr_err("unable to setup secure-monitor data\n");
-		goto out;
-	}
+	chip = of_match_device(meson_sm_ids, &pdev->dev)->data;
 
 	if (chip->cmd_shmem_in_base) {
 		fw.sm_shmem_in_base = meson_sm_map_shmem(chip->cmd_shmem_in_base,
@@ -257,4 +249,11 @@ int __init meson_sm_init(void)
 out:
 	return -EINVAL;
 }
-device_initcall(meson_sm_init);
+
+static struct platform_driver meson_sm_driver = {
+	.driver = {
+		.name = "meson-sm",
+		.of_match_table = of_match_ptr(meson_sm_ids),
+	},
+};
+module_platform_driver_probe(meson_sm_driver, meson_sm_probe);
-- 
2.7.4
