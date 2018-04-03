From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue,  3 Apr 2018 11:40:51 +0200
Subject: [PATCH v2 u-boot 2/2] reset: add sandbox test for bulk API
In-Reply-To: <1522748451-21209-1-git-send-email-narmstrong@baylibre.com>
References: <1522748451-21209-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1522748451-21209-3-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds the bulk reset API tests for the sandbox test suite.

Unlike the main test, it also check the "other" reset signal using the bulk API
and checks if the resets are correctly asserted/deasserted.

To allow the bulk API to work, and avoid changing the DT, the number of resets
of the sandbox reset controller has been bumped to 101 for the "other" reset
line to be valid.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/sandbox/include/asm/reset.h   |  4 ++++
 drivers/reset/sandbox-reset-test.c | 29 +++++++++++++++++++++++++++++
 drivers/reset/sandbox-reset.c      |  2 +-
 test/dm/reset.c                    | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/sandbox/include/asm/reset.h b/arch/sandbox/include/asm/reset.h
index 7146aa5..0cd7702 100644
--- a/arch/sandbox/include/asm/reset.h
+++ b/arch/sandbox/include/asm/reset.h
@@ -14,8 +14,12 @@ struct udevice;
 int sandbox_reset_query(struct udevice *dev, unsigned long id);
 
 int sandbox_reset_test_get(struct udevice *dev);
+int sandbox_reset_test_get_bulk(struct udevice *dev);
 int sandbox_reset_test_assert(struct udevice *dev);
+int sandbox_reset_test_assert_bulk(struct udevice *dev);
 int sandbox_reset_test_deassert(struct udevice *dev);
+int sandbox_reset_test_deassert_bulk(struct udevice *dev);
 int sandbox_reset_test_free(struct udevice *dev);
+int sandbox_reset_test_release_bulk(struct udevice *dev);
 
 #endif
diff --git a/drivers/reset/sandbox-reset-test.c b/drivers/reset/sandbox-reset-test.c
index e37d6c9..f0ceaa0 100644
--- a/drivers/reset/sandbox-reset-test.c
+++ b/drivers/reset/sandbox-reset-test.c
@@ -12,6 +12,7 @@
 
 struct sandbox_reset_test {
 	struct reset_ctl ctl;
+	struct reset_ctl_bulk bulk;
 };
 
 int sandbox_reset_test_get(struct udevice *dev)
@@ -21,6 +22,13 @@ int sandbox_reset_test_get(struct udevice *dev)
 	return reset_get_by_name(dev, "test", &sbrt->ctl);
 }
 
+int sandbox_reset_test_get_bulk(struct udevice *dev)
+{
+	struct sandbox_reset_test *sbrt = dev_get_priv(dev);
+
+	return reset_get_bulk(dev, &sbrt->bulk);
+}
+
 int sandbox_reset_test_assert(struct udevice *dev)
 {
 	struct sandbox_reset_test *sbrt = dev_get_priv(dev);
@@ -28,6 +36,13 @@ int sandbox_reset_test_assert(struct udevice *dev)
 	return reset_assert(&sbrt->ctl);
 }
 
+int sandbox_reset_test_assert_bulk(struct udevice *dev)
+{
+	struct sandbox_reset_test *sbrt = dev_get_priv(dev);
+
+	return reset_assert_bulk(&sbrt->bulk);
+}
+
 int sandbox_reset_test_deassert(struct udevice *dev)
 {
 	struct sandbox_reset_test *sbrt = dev_get_priv(dev);
@@ -35,6 +50,13 @@ int sandbox_reset_test_deassert(struct udevice *dev)
 	return reset_deassert(&sbrt->ctl);
 }
 
+int sandbox_reset_test_deassert_bulk(struct udevice *dev)
+{
+	struct sandbox_reset_test *sbrt = dev_get_priv(dev);
+
+	return reset_deassert_bulk(&sbrt->bulk);
+}
+
 int sandbox_reset_test_free(struct udevice *dev)
 {
 	struct sandbox_reset_test *sbrt = dev_get_priv(dev);
@@ -42,6 +64,13 @@ int sandbox_reset_test_free(struct udevice *dev)
 	return reset_free(&sbrt->ctl);
 }
 
+int sandbox_reset_test_release_bulk(struct udevice *dev)
+{
+	struct sandbox_reset_test *sbrt = dev_get_priv(dev);
+
+	return reset_release_bulk(&sbrt->bulk);
+}
+
 static const struct udevice_id sandbox_reset_test_ids[] = {
 	{ .compatible = "sandbox,reset-ctl-test" },
 	{ }
diff --git a/drivers/reset/sandbox-reset.c b/drivers/reset/sandbox-reset.c
index 4258af5..c310749 100644
--- a/drivers/reset/sandbox-reset.c
+++ b/drivers/reset/sandbox-reset.c
@@ -10,7 +10,7 @@
 #include <asm/io.h>
 #include <asm/reset.h>
 
-#define SANDBOX_RESET_SIGNALS 3
+#define SANDBOX_RESET_SIGNALS 101
 
 struct sandbox_reset_signal {
 	bool asserted;
diff --git a/test/dm/reset.c b/test/dm/reset.c
index 0ae8031..8dc0023 100644
--- a/test/dm/reset.c
+++ b/test/dm/reset.c
@@ -13,6 +13,9 @@
 /* This must match the specifier for mbox-names="test" in the DT node */
 #define TEST_RESET_ID 2
 
+/* This is the other reset phandle specifier handled by bulk */
+#define OTHER_RESET_ID 2
+
 static int dm_test_reset(struct unit_test_state *uts)
 {
 	struct udevice *dev_reset;
@@ -37,3 +40,33 @@ static int dm_test_reset(struct unit_test_state *uts)
 	return 0;
 }
 DM_TEST(dm_test_reset, DM_TESTF_SCAN_FDT);
+
+static int dm_test_reset_bulk(struct unit_test_state *uts)
+{
+	struct udevice *dev_reset;
+	struct udevice *dev_test;
+
+	ut_assertok(uclass_get_device_by_name(UCLASS_RESET, "reset-ctl",
+					      &dev_reset));
+	ut_asserteq(0, sandbox_reset_query(dev_reset, TEST_RESET_ID));
+	ut_asserteq(0, sandbox_reset_query(dev_reset, OTHER_RESET_ID));
+
+	ut_assertok(uclass_get_device_by_name(UCLASS_MISC, "reset-ctl-test",
+					      &dev_test));
+	ut_assertok(sandbox_reset_test_get_bulk(dev_test));
+
+	ut_assertok(sandbox_reset_test_assert_bulk(dev_test));
+	ut_asserteq(1, sandbox_reset_query(dev_reset, TEST_RESET_ID));
+	ut_asserteq(1, sandbox_reset_query(dev_reset, OTHER_RESET_ID));
+
+	ut_assertok(sandbox_reset_test_deassert_bulk(dev_test));
+	ut_asserteq(0, sandbox_reset_query(dev_reset, TEST_RESET_ID));
+	ut_asserteq(0, sandbox_reset_query(dev_reset, OTHER_RESET_ID));
+
+	ut_assertok(sandbox_reset_test_release_bulk(dev_test));
+	ut_asserteq(1, sandbox_reset_query(dev_reset, TEST_RESET_ID));
+	ut_asserteq(1, sandbox_reset_query(dev_reset, OTHER_RESET_ID));
+
+	return 0;
+}
+DM_TEST(dm_test_reset_bulk, DM_TESTF_SCAN_FDT);
-- 
2.7.4
