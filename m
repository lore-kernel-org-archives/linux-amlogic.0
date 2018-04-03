From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue,  3 Apr 2018 11:40:50 +0200
Subject: [PATCH v2 u-boot 1/2] reset: Add get/assert/deassert/release for bulk
 of reset signals
In-Reply-To: <1522748451-21209-1-git-send-email-narmstrong@baylibre.com>
References: <1522748451-21209-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1522748451-21209-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds a "bulk" API to the reset API in order to get/deassert/
assert/release a group of reset signals associated with a device.

This bulk API will avoid adding a copy of the same code to manage
a group of reset signals in drivers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/reset/reset-uclass.c | 60 +++++++++++++++++++++++++++
 include/reset.h              | 99 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 159 insertions(+)

diff --git a/drivers/reset/reset-uclass.c b/drivers/reset/reset-uclass.c
index 307a297..9a5c9c9 100644
--- a/drivers/reset/reset-uclass.c
+++ b/drivers/reset/reset-uclass.c
@@ -81,6 +81,40 @@ int reset_get_by_index(struct udevice *dev, int index,
 	return 0;
 }
 
+int reset_get_bulk(struct udevice *dev, struct reset_ctl_bulk *bulk)
+{
+	int i, ret, err, count;
+	
+	bulk->count = 0;
+
+	count = dev_count_phandle_with_args(dev, "resets", "#reset-cells");
+	if (!count)
+		return 0;
+
+	bulk->resets = devm_kcalloc(dev, count, sizeof(struct reset_ctl),
+				    GFP_KERNEL);
+	if (!bulk->resets)
+		return -ENOMEM;
+
+	for (i = 0; i < count; i++) {
+		ret = reset_get_by_index(dev, i, &bulk->resets[i]);
+		if (ret < 0)
+			goto bulk_get_err;
+
+		++bulk->count;
+	}
+
+	return 0;
+
+bulk_get_err:
+	err = reset_release_all(bulk->resets, bulk->count);
+	if (err)
+		debug("%s: could release all resets for %p\n",
+		      __func__, dev);
+
+	return ret;
+}
+
 int reset_get_by_name(struct udevice *dev, const char *name,
 		     struct reset_ctl *reset_ctl)
 {
@@ -126,6 +160,19 @@ int reset_assert(struct reset_ctl *reset_ctl)
 	return ops->rst_assert(reset_ctl);
 }
 
+int reset_assert_bulk(struct reset_ctl_bulk *bulk)
+{
+	int i, ret;
+
+	for (i = 0; i < bulk->count; i++) {
+		ret = reset_assert(&bulk->resets[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 int reset_deassert(struct reset_ctl *reset_ctl)
 {
 	struct reset_ops *ops = reset_dev_ops(reset_ctl->dev);
@@ -135,6 +182,19 @@ int reset_deassert(struct reset_ctl *reset_ctl)
 	return ops->rst_deassert(reset_ctl);
 }
 
+int reset_deassert_bulk(struct reset_ctl_bulk *bulk)
+{
+	int i, ret;
+
+	for (i = 0; i < bulk->count; i++) {
+		ret = reset_deassert(&bulk->resets[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 int reset_release_all(struct reset_ctl *reset_ctl, int count)
 {
 	int i, ret;
diff --git a/include/reset.h b/include/reset.h
index 7185ade..d38f176 100644
--- a/include/reset.h
+++ b/include/reset.h
@@ -60,6 +60,24 @@ struct reset_ctl {
 	unsigned long id;
 };
 
+/**
+ * struct reset_ctl_bulk - A handle to (allowing control of) a bulk of reset
+ * signals.
+ *
+ * Clients provide storage for the reset control bulk. The content of the
+ * structure is managed solely by the reset API. A reset control bulk struct is
+ * initialized by "get"ing the reset control bulk struct.
+ * The reset control bulk struct is passed to all other bulk reset APIs to apply
+ * the API to all the reset signals in the bulk struct.
+ *
+ * @resets: An array of reset signal handles handles.
+ * @count: The number of reset signal handles in the reset array.
+ */
+struct reset_ctl_bulk {
+	struct reset_ctl *resets;
+	unsigned int count;
+};
+
 #ifdef CONFIG_DM_RESET
 /**
  * reset_get_by_index - Get/request a reset signal by integer index.
@@ -81,6 +99,22 @@ int reset_get_by_index(struct udevice *dev, int index,
 		       struct reset_ctl *reset_ctl);
 
 /**
+ * reset_get_bulk - Get/request all reset signals of a device.
+ *
+ * This looks up and requests all reset signals of the client device; each
+ * device is assumed to have n reset signals associated with it somehow,
+ * and this function finds and requests all of them in a separate structure.
+ * The mapping of client device reset signals indices to provider reset signals
+ * may be via device-tree properties, board-provided mapping tables, or some
+ * other mechanism.
+ *
+ * @dev:	The client device.
+ * @bulk	A pointer to a reset control bulk struct to initialize.
+ * @return 0 if OK, or a negative error code.
+ */
+int reset_get_bulk(struct udevice *dev, struct reset_ctl_bulk *bulk);
+
+/**
  * reset_get_by_name - Get/request a reset signal by name.
  *
  * This looks up and requests a reset signal. The name is relative to the
@@ -132,6 +166,21 @@ int reset_free(struct reset_ctl *reset_ctl);
 int reset_assert(struct reset_ctl *reset_ctl);
 
 /**
+ * reset_assert_bulk - Assert all reset signals in a reset control bulk struct.
+ *
+ * This function will assert the specified reset signals in a reset control
+ * bulk struct, thus resetting the affected HW module(s). Depending on the
+ * reset controller hardware, the reset signals will either stay asserted
+ * until reset_deassert_bulk() is called, or the hardware may autonomously
+ * clear the reset signals itself.
+ *
+ * @bulk:	A reset control bulk struct that was previously successfully
+ *		requested by reset_get_bulk().
+ * @return 0 if OK, or a negative error code.
+ */
+int reset_assert_bulk(struct reset_ctl_bulk *bulk);
+
+/**
  * reset_deassert - Deassert a reset signal.
  *
  * This function will deassert the specified reset signal, thus releasing the
@@ -145,6 +194,20 @@ int reset_assert(struct reset_ctl *reset_ctl);
 int reset_deassert(struct reset_ctl *reset_ctl);
 
 /**
+ * reset_deassert_bulk - Deassert all reset signals in a reset control bulk
+ * struct.
+ *
+ * This function will deassert the specified reset signals in a reset control
+ * bulk struct, thus releasing the affected HW modules() from reset, and
+ * allowing them to continue normal operation.
+ *
+ * @bulk:	A reset control bulk struct that was previously successfully
+ *		requested by reset_get_bulk().
+ * @return 0 if OK, or a negative error code.
+ */
+int reset_deassert_bulk(struct reset_ctl_bulk *bulk);
+
+/**
  * reset_release_all - Assert/Free an array of previously requested resets.
  *
  * For each reset contained in the reset array, this function will check if
@@ -156,6 +219,23 @@ int reset_deassert(struct reset_ctl *reset_ctl);
  * @return 0 if OK, or a negative error code.
  */
 int reset_release_all(struct reset_ctl *reset_ctl, int count);
+
+/**
+ * reset_release_bulk - Assert/Free an array of previously requested reset
+ * signals in a reset control bulk struct.
+ *
+ * For each reset contained in the reset control bulk struct, this function
+ * will check if reset has been previously requested and then will assert
+ * and free it.
+ *
+ * @bulk:	A reset control bulk struct that was previously successfully
+ *		requested by reset_get_bulk().
+ * @return 0 if OK, or a negative error code.
+ */
+static inline int reset_release_bulk(struct reset_ctl_bulk *bulk)
+{
+	return reset_release_all(bulk->resets, bulk->count);
+}
 #else
 static inline int reset_get_by_index(struct udevice *dev, int index,
 				     struct reset_ctl *reset_ctl)
@@ -163,6 +243,11 @@ static inline int reset_get_by_index(struct udevice *dev, int index,
 	return -ENOTSUPP;
 }
 
+static inline int reset_get_bulk(struct udevice *dev, struct clk_bulk *bulk)
+{
+	return -ENOTSUPP;
+}
+
 static inline int reset_get_by_name(struct udevice *dev, const char *name,
 				    struct reset_ctl *reset_ctl)
 {
@@ -179,16 +264,30 @@ static inline int reset_assert(struct reset_ctl *reset_ctl)
 	return 0;
 }
 
+static inline int reset_assert_bulk(struct reset_ctl_bulk *bulk)
+{
+	return 0;
+}
+
 static inline int reset_deassert(struct reset_ctl *reset_ctl)
 {
 	return 0;
 }
 
+static inline int reset_deassert_bulk(struct reset_ctl_bulk *bulk)
+{
+	return 0;
+}
+
 static inline int reset_release_all(struct reset_ctl *reset_ctl, int count)
 {
 	return 0;
 }
 
+static inline int reset_release_bulk(struct clk_bulk *bulk)
+{
+	return 0;
+}
 #endif
 
 #endif
-- 
2.7.4
