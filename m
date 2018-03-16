From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 16 Mar 2018 16:01:13 +0100
Subject: [PATCH 2/2] nvmem: meson-efuse: add write support
In-Reply-To: <20180316150113.9779-1-jbrunet@baylibre.com>
References: <20180316150113.9779-1-jbrunet@baylibre.com>
Message-ID: <20180316150113.9779-3-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add write support to the meson-gx efuse driver.
Beware, this efuse is one time programmable !

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/nvmem/meson-efuse.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index 7ad80b80b293..30da5e1abf84 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -35,6 +35,20 @@ static int meson_efuse_read(void *context, unsigned int offset,
 	return 0;
 }
 
+static int meson_efuse_write(void *context, unsigned int offset,
+			     void *val, size_t bytes)
+{
+	u8 *buf = val;
+	int ret;
+
+	ret = meson_sm_call_write(buf, bytes, SM_EFUSE_WRITE, offset,
+				  bytes, 0, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static const struct of_device_id meson_efuse_match[] = {
 	{ .compatible = "amlogic,meson-gxbb-efuse", },
 	{ /* sentinel */ },
@@ -59,8 +73,8 @@ static int meson_efuse_probe(struct platform_device *pdev)
 	econfig->name = dev_name(dev);
 	econfig->stride = 1;
 	econfig->word_size = 1;
-	econfig->read_only = true;
 	econfig->reg_read = meson_efuse_read;
+	econfig->reg_write = meson_efuse_write;
 	econfig->size = size;
 
 	nvmem = nvmem_register(econfig);
-- 
2.14.3
