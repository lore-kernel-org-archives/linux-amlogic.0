From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue,  3 Apr 2018 11:44:19 +0200
Subject: [PATCH v2 u-boot 2/2] clk: add sandbox test for bulk API
In-Reply-To: <1522748659-21622-1-git-send-email-narmstrong@baylibre.com>
References: <1522748659-21622-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1522748659-21622-3-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds the bulk clock API tests for the sandbox test suite.

It's very similar to the main test but only uses the _bulk() API and
checks if the clocks are correctly enabled/disabled.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/sandbox/include/asm/clk.h | 32 ++++++++++++++++++++++++++++++++
 drivers/clk/clk_sandbox_test.c | 29 +++++++++++++++++++++++++++++
 test/dm/clk.c                  | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/arch/sandbox/include/asm/clk.h b/arch/sandbox/include/asm/clk.h
index 9dc6c81..01b5ba4 100644
--- a/arch/sandbox/include/asm/clk.h
+++ b/arch/sandbox/include/asm/clk.h
@@ -64,6 +64,14 @@ int sandbox_clk_query_enable(struct udevice *dev, int id);
  */
 int sandbox_clk_test_get(struct udevice *dev);
 /**
+ * sandbox_clk_test_get_bulk - Ask the sandbox clock test device to request its
+ * clocks with the bulk clk API.
+ *
+ * @dev:	The sandbox clock test (client) devivce.
+ * @return:	0 if OK, or a negative error code.
+ */
+int sandbox_clk_test_get_bulk(struct udevice *dev);
+/**
  * sandbox_clk_test_get_rate - Ask the sandbox clock test device to query a
  * clock's rate.
  *
@@ -91,6 +99,14 @@ ulong sandbox_clk_test_set_rate(struct udevice *dev, int id, ulong rate);
  */
 int sandbox_clk_test_enable(struct udevice *dev, int id);
 /**
+ * sandbox_clk_test_enable_bulk - Ask the sandbox clock test device to enable
+ * all clocks in it's clock bulk struct.
+ *
+ * @dev:	The sandbox clock test (client) devivce.
+ * @return:	0 if OK, or a negative error code.
+ */
+int sandbox_clk_test_enable_bulk(struct udevice *dev);
+/**
  * sandbox_clk_test_disable - Ask the sandbox clock test device to disable a
  * clock.
  *
@@ -100,6 +116,14 @@ int sandbox_clk_test_enable(struct udevice *dev, int id);
  */
 int sandbox_clk_test_disable(struct udevice *dev, int id);
 /**
+ * sandbox_clk_test_disable_bulk - Ask the sandbox clock test device to disable
+ * all clocks in it's clock bulk struct.
+ *
+ * @dev:	The sandbox clock test (client) devivce.
+ * @return:	0 if OK, or a negative error code.
+ */
+int sandbox_clk_test_disable_bulk(struct udevice *dev);
+/**
  * sandbox_clk_test_free - Ask the sandbox clock test device to free its
  * clocks.
  *
@@ -107,5 +131,13 @@ int sandbox_clk_test_disable(struct udevice *dev, int id);
  * @return:	0 if OK, or a negative error code.
  */
 int sandbox_clk_test_free(struct udevice *dev);
+/**
+ * sandbox_clk_test_release_bulk - Ask the sandbox clock test device to release
+ * all clocks in it's clock bulk struct.
+ *
+ * @dev:	The sandbox clock test (client) devivce.
+ * @return:	0 if OK, or a negative error code.
+ */
+int sandbox_clk_test_release_bulk(struct udevice *dev);
 
 #endif
diff --git a/drivers/clk/clk_sandbox_test.c b/drivers/clk/clk_sandbox_test.c
index 999100d..d089881 100644
--- a/drivers/clk/clk_sandbox_test.c
+++ b/drivers/clk/clk_sandbox_test.c
@@ -11,6 +11,7 @@
 
 struct sandbox_clk_test {
 	struct clk clks[SANDBOX_CLK_TEST_ID_COUNT];
+	struct clk_bulk bulk;
 };
 
 static const char * const sandbox_clk_test_names[] = {
@@ -34,6 +35,13 @@ int sandbox_clk_test_get(struct udevice *dev)
 	return 0;
 }
 
+int sandbox_clk_test_get_bulk(struct udevice *dev)
+{
+	struct sandbox_clk_test *sbct = dev_get_priv(dev);
+
+	return clk_get_bulk(dev, &sbct->bulk);
+}
+
 ulong sandbox_clk_test_get_rate(struct udevice *dev, int id)
 {
 	struct sandbox_clk_test *sbct = dev_get_priv(dev);
@@ -64,6 +72,13 @@ int sandbox_clk_test_enable(struct udevice *dev, int id)
 	return clk_enable(&sbct->clks[id]);
 }
 
+int sandbox_clk_test_enable_bulk(struct udevice *dev)
+{
+	struct sandbox_clk_test *sbct = dev_get_priv(dev);
+
+	return clk_enable_bulk(&sbct->bulk);
+}
+
 int sandbox_clk_test_disable(struct udevice *dev, int id)
 {
 	struct sandbox_clk_test *sbct = dev_get_priv(dev);
@@ -74,6 +89,13 @@ int sandbox_clk_test_disable(struct udevice *dev, int id)
 	return clk_disable(&sbct->clks[id]);
 }
 
+int sandbox_clk_test_disable_bulk(struct udevice *dev)
+{
+	struct sandbox_clk_test *sbct = dev_get_priv(dev);
+
+	return clk_disable_bulk(&sbct->bulk);
+}
+
 int sandbox_clk_test_free(struct udevice *dev)
 {
 	struct sandbox_clk_test *sbct = dev_get_priv(dev);
@@ -88,6 +110,13 @@ int sandbox_clk_test_free(struct udevice *dev)
 	return 0;
 }
 
+int sandbox_clk_test_release_bulk(struct udevice *dev)
+{
+	struct sandbox_clk_test *sbct = dev_get_priv(dev);
+
+	return clk_release_bulk(&sbct->bulk);
+}
+
 static const struct udevice_id sandbox_clk_test_ids[] = {
 	{ .compatible = "sandbox,clk-test" },
 	{ }
diff --git a/test/dm/clk.c b/test/dm/clk.c
index 712a1e6..95716f8 100644
--- a/test/dm/clk.c
+++ b/test/dm/clk.c
@@ -101,3 +101,41 @@ static int dm_test_clk(struct unit_test_state *uts)
 	return 0;
 }
 DM_TEST(dm_test_clk, DM_TESTF_SCAN_FDT);
+
+static int dm_test_clk_bulk(struct unit_test_state *uts)
+{
+	struct udevice *dev_clk, *dev_test;
+	ulong rate;
+
+	ut_assertok(uclass_get_device_by_name(UCLASS_CLK, "clk-sbox",
+					      &dev_clk));
+	ut_assertok(uclass_get_device_by_name(UCLASS_MISC, "clk-test",
+					      &dev_test));
+	ut_assertok(sandbox_clk_test_get_bulk(dev_test));
+
+	ut_asserteq(0, sandbox_clk_query_enable(dev_clk, SANDBOX_CLK_ID_SPI));
+	ut_asserteq(0, sandbox_clk_query_enable(dev_clk, SANDBOX_CLK_ID_I2C));
+
+	/* Fixed clock does not support enable, thus should not fail */
+	ut_assertok(sandbox_clk_test_enable_bulk(dev_test));
+	ut_asserteq(1, sandbox_clk_query_enable(dev_clk, SANDBOX_CLK_ID_SPI));
+	ut_asserteq(1, sandbox_clk_query_enable(dev_clk, SANDBOX_CLK_ID_I2C));
+
+	/* Fixed clock does not support disable, thus should not fail */
+	ut_assertok(sandbox_clk_test_disable_bulk(dev_test));
+	ut_asserteq(0, sandbox_clk_query_enable(dev_clk, SANDBOX_CLK_ID_SPI));
+	ut_asserteq(0, sandbox_clk_query_enable(dev_clk, SANDBOX_CLK_ID_I2C));
+
+	/* Fixed clock does not support enable, thus should not fail */
+	ut_assertok(sandbox_clk_test_enable_bulk(dev_test));
+	ut_asserteq(1, sandbox_clk_query_enable(dev_clk, SANDBOX_CLK_ID_SPI));
+	ut_asserteq(1, sandbox_clk_query_enable(dev_clk, SANDBOX_CLK_ID_I2C));
+
+	/* Fixed clock does not support disable, thus should not fail */
+	ut_assertok(sandbox_clk_test_release_bulk(dev_test));
+	ut_asserteq(0, sandbox_clk_query_enable(dev_clk, SANDBOX_CLK_ID_SPI));
+	ut_asserteq(0, sandbox_clk_query_enable(dev_clk, SANDBOX_CLK_ID_I2C));
+
+	return 0;
+}
+DM_TEST(dm_test_clk_bulk, DM_TESTF_SCAN_FDT);
-- 
2.7.4
