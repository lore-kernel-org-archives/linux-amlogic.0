From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 14 Nov 2018 11:25:19 +0100
Subject: [PATCH u-boot v3 2/3] test: regmap: add regmap_read_poll_timeout test
In-Reply-To: <20181114102520.25346-1-narmstrong@baylibre.com>
References: <20181114102520.25346-1-narmstrong@baylibre.com>
Message-ID: <20181114102520.25346-3-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add test to regmap_read_poll_timeout() helper to check the timeout works
properly but cannot test proper condition matching since read/write calls
are not executed in sandbox.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 test/dm/regmap.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/test/dm/regmap.c b/test/dm/regmap.c
index d4b86b3b03..00d61fe38c 100644
--- a/test/dm/regmap.c
+++ b/test/dm/regmap.c
@@ -116,3 +116,29 @@ static int dm_test_regmap_rw(struct unit_test_state *uts)
 }
 
 DM_TEST(dm_test_regmap_rw, DM_TESTF_SCAN_PDATA | DM_TESTF_SCAN_FDT);
+
+/* Read polling test */
+static int dm_test_regmap_poll(struct unit_test_state *uts)
+{
+	struct udevice *dev;
+	struct regmap *map;
+	uint reg;
+	unsigned long start;
+
+	ut_assertok(uclass_get_device(UCLASS_SYSCON, 0, &dev));
+	map = syscon_get_regmap(dev);
+	ut_assertok_ptr(map);
+
+	start = get_timer(0);
+
+	ut_asserteq(-ETIMEDOUT,
+		    regmap_read_poll_timeout(map, 0, reg,
+					     (reg == 0xcacafafa),
+					     1, 5 * CONFIG_SYS_HZ));
+
+	ut_assert(get_timer(start) > (5 * CONFIG_SYS_HZ));
+
+	return 0;
+}
+
+DM_TEST(dm_test_regmap_poll, DM_TESTF_SCAN_PDATA | DM_TESTF_SCAN_FDT);
-- 
2.19.1
