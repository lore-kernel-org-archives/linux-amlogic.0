From: paul.gortmaker@windriver.com (Paul Gortmaker)
Date: Tue, 7 Feb 2017 19:18:46 -0500
Subject: [PATCH 3/4] reset: meson: make it explicitly non-modular
In-Reply-To: <20170208001847.9887-1-paul.gortmaker@windriver.com>
References: <20170208001847.9887-1-paul.gortmaker@windriver.com>
Message-ID: <20170208001847.9887-4-paul.gortmaker@windriver.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Kconfig currently controlling compilation of this code is:

arch/arm/mach-meson/Kconfig:menuconfig ARCH_MESON
arch/arm/mach-meson/Kconfig:    bool "Amlogic Meson SoCs"

arch/arm64/Kconfig.platforms:config ARCH_MESON
arch/arm64/Kconfig.platforms:   bool "Amlogic Platforms"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Carlo Caione <carlo@caione.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic at lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/reset/reset-meson.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index c32f11a30c5f..a8b915eb8b58 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -1,4 +1,6 @@
 /*
+ * Amlogic Meson Reset Controller driver
+ *
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
@@ -53,7 +55,7 @@
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #include <linux/err.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -95,7 +97,6 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson-gxbb-reset", },
 	 { /* sentinel */ },
 };
-MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
 
 static int meson_reset_probe(struct platform_device *pdev)
 {
@@ -128,9 +129,4 @@ static struct platform_driver meson_reset_driver = {
 		.of_match_table	= meson_reset_dt_ids,
 	},
 };
-
-module_platform_driver(meson_reset_driver);
-
-MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
-MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
-MODULE_LICENSE("Dual BSD/GPL");
+builtin_platform_driver(meson_reset_driver);
-- 
2.11.0
