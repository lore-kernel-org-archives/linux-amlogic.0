From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 20 Sep 2017 16:08:15 +0200
Subject: [PATCH] pinctrl: meson: fix incorrect usage of ENOSYS
Message-ID: <20170920140815.20776-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

ENOSYS is special and should only be used for incorrect syscall number.
It is not the case here. let's use ENOTSUPP instead.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index c9cd54de0449..71bccb7acbf8 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -399,7 +399,7 @@ static int meson_pinconf_group_set(struct pinctrl_dev *pcdev,
 static int meson_pinconf_group_get(struct pinctrl_dev *pcdev,
 				   unsigned int group, unsigned long *config)
 {
-	return -ENOSYS;
+	return -ENOTSUPP;
 }
 
 static const struct pinconf_ops meson_pinconf_ops = {
-- 
2.13.5
