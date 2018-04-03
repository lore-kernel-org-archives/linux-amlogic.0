From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue,  3 Apr 2018 11:44:18 +0200
Subject: [PATCH v2 u-boot 1/2] clk: Add get/enable/disable/release for a bulk
 of clocks
In-Reply-To: <1522748659-21622-1-git-send-email-narmstrong@baylibre.com>
References: <1522748659-21622-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1522748659-21622-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds a "bulk" API to the clock API in order to get/enable/disable
/release a group of clocks associated with a device.

This bulk API will avoid adding a copy of the same code to manage
a group of clocks in drivers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk-uclass.c | 59 +++++++++++++++++++++++++++++++++++++++
 include/clk.h            | 72 +++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index ad76379..6e99b3b 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -104,6 +104,39 @@ int clk_get_by_index(struct udevice *dev, int index, struct clk *clk)
 	return clk_get_by_indexed_prop(dev, "clocks", index, clk);
 }
 
+int clk_get_bulk(struct udevice *dev, struct clk_bulk *bulk)
+{
+	int i, ret, err, count;
+	
+	bulk->count = 0;
+
+	count = dev_count_phandle_with_args(dev, "clocks", "#clock-cells");
+	if (!count)
+		return 0;
+
+	bulk->clks = devm_kcalloc(dev, count, sizeof(struct clk), GFP_KERNEL);
+	if (!bulk->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		ret = clk_get_by_index(dev, i, &bulk->clks[i]);
+		if (ret < 0)
+			goto bulk_get_err;
+
+		++bulk->count;
+	}
+
+	return 0;
+
+bulk_get_err:
+	err = clk_release_all(bulk->clks, bulk->count);
+	if (err)
+		debug("%s: could release all clocks for %p\n",
+		      __func__, dev);
+
+	return ret;
+}
+
 static int clk_set_default_parents(struct udevice *dev)
 {
 	struct clk clk, parent_clk;
@@ -336,6 +369,19 @@ int clk_enable(struct clk *clk)
 	return ops->enable(clk);
 }
 
+int clk_enable_bulk(struct clk_bulk *bulk)
+{
+	int i, ret;
+
+	for (i = 0; i < bulk->count; i++) {
+		ret = clk_enable(&bulk->clks[i]);
+		if (ret < 0 && ret != -ENOSYS)
+			return ret;
+	}
+
+	return 0;
+}
+
 int clk_disable(struct clk *clk)
 {
 	const struct clk_ops *ops = clk_dev_ops(clk->dev);
@@ -348,6 +394,19 @@ int clk_disable(struct clk *clk)
 	return ops->disable(clk);
 }
 
+int clk_disable_bulk(struct clk_bulk *bulk)
+{
+	int i, ret;
+
+	for (i = 0; i < bulk->count; i++) {
+		ret = clk_disable(&bulk->clks[i]);
+		if (ret < 0 && ret != -ENOSYS)
+			return ret;
+	}
+
+	return 0;
+}
+
 UCLASS_DRIVER(clk) = {
 	.id		= UCLASS_CLK,
 	.name		= "clk",
diff --git a/include/clk.h b/include/clk.h
index a7d95d3..b3a9fce 100644
--- a/include/clk.h
+++ b/include/clk.h
@@ -60,6 +60,23 @@ struct clk {
 	unsigned long id;
 };
 
+/**
+ * struct clk_bulk - A handle to (allowing control of) a bulk of clocks.
+ *
+ * Clients provide storage for the clock bulk. The content of the structure is
+ * managed solely by the clock API. A clock bulk struct is
+ * initialized by "get"ing the clock bulk struct.
+ * The clock bulk struct is passed to all other bulk clock APIs to apply
+ * the API to all the clock in the bulk struct.
+ *
+ * @clks: An array of clock handles.
+ * @count: The number of clock handles in the clks array.
+ */
+struct clk_bulk {
+	struct clk *clks;
+	unsigned int count;
+};
+
 #if CONFIG_IS_ENABLED(OF_CONTROL) && CONFIG_IS_ENABLED(CLK)
 struct phandle_1_arg;
 int clk_get_by_index_platdata(struct udevice *dev, int index,
@@ -83,6 +100,21 @@ int clk_get_by_index_platdata(struct udevice *dev, int index,
 int clk_get_by_index(struct udevice *dev, int index, struct clk *clk);
 
 /**
+ * clock_get_bulk - Get/request all clocks of a device.
+ *
+ * This looks up and requests all clocks of the client device; each device is
+ * assumed to have n clocks associated with it somehow, and this function finds
+ * and requests all of them in a separate structure. The mapping of client
+ * device clock indices to provider clocks may be via device-tree properties,
+ * board-provided mapping tables, or some other mechanism.
+ *
+ * @dev:	The client device.
+ * @bulk	A pointer to a clock bulk struct to initialize.
+ * @return 0 if OK, or a negative error code.
+ */
+int clk_get_bulk(struct udevice *dev, struct clk_bulk *bulk);
+
+/**
  * clock_get_by_name - Get/request a clock by name.
  *
  * This looks up and requests a clock. The name is relative to the client
@@ -120,6 +152,11 @@ static inline int clk_get_by_index(struct udevice *dev, int index,
 	return -ENOSYS;
 }
 
+static inline int clk_get_bulk(struct udevice *dev, struct clk_bulk *bulk)
+{
+	return -ENOSYS;
+}
+
 static inline int clk_get_by_name(struct udevice *dev, const char *name,
 			   struct clk *clk)
 {
@@ -130,7 +167,6 @@ static inline int clk_release_all(struct clk *clk, int count)
 {
 	return -ENOSYS;
 }
-
 #endif
 
 #if (CONFIG_IS_ENABLED(OF_CONTROL) && !CONFIG_IS_ENABLED(OF_PLATDATA)) && \
@@ -151,6 +187,22 @@ static inline int clk_set_defaults(struct udevice *dev)
 #endif
 
 /**
+ * clk_release_bulk() - Disable (turn off)/Free an array of previously
+ * requested clocks in a clock bulk struct.
+ *
+ * For each clock contained in the clock bulk struct, this function will check
+ * if clock has been previously requested and then will disable and free it.
+ *
+ * @clk:	A clock bulk struct that was previously successfully
+ *		requested by clk_get_bulk().
+ * @return zero on success, or -ve error code.
+ */
+static inline int clk_release_bulk(struct clk_bulk *bulk)
+{
+	return clk_release_all(bulk->clks, bulk->count);
+}
+
+/**
  * clk_request - Request a clock by provider-specific ID.
  *
  * This requests a clock using a provider-specific ID. Generally, this function
@@ -215,6 +267,15 @@ int clk_set_parent(struct clk *clk, struct clk *parent);
 int clk_enable(struct clk *clk);
 
 /**
+ * clk_enable_bulk() - Enable (turn on) all clocks in a clock bulk struct.
+ *
+ * @bulk:	A clock bulk struct that was previously successfully requested
+ *		by clk_get_bulk().
+ * @return zero on success, or -ve error code.
+ */
+int clk_enable_bulk(struct clk_bulk *bulk);
+
+/**
  * clk_disable() - Disable (turn off) a clock.
  *
  * @clk:	A clock struct that was previously successfully requested by
@@ -223,6 +284,15 @@ int clk_enable(struct clk *clk);
  */
 int clk_disable(struct clk *clk);
 
+/**
+ * clk_disable_bulk() - Disable (turn off) all clocks in a clock bulk struct.
+ *
+ * @bulk:	A clock bulk struct that was previously successfully requested
+ *		by clk_get_bulk().
+ * @return zero on success, or -ve error code.
+ */
+int clk_disable_bulk(struct clk_bulk *bulk);
+
 int soc_clk_dump(void);
 
 #endif
-- 
2.7.4
