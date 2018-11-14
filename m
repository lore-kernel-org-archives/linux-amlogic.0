From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 14 Nov 2018 11:25:18 +0100
Subject: [PATCH u-boot v3 1/3] regmap: add regmap_read_poll_timeout() helper
In-Reply-To: <20181114102520.25346-1-narmstrong@baylibre.com>
References: <20181114102520.25346-1-narmstrong@baylibre.com>
Message-ID: <20181114102520.25346-2-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the regmap_read_poll_timeout() macro based on the Linux implementation
to simplify register polling with configurable timeout and sleep.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/regmap.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/regmap.h b/include/regmap.h
index 6a574eaa41..cf795c455f 100644
--- a/include/regmap.h
+++ b/include/regmap.h
@@ -42,6 +42,44 @@ int regmap_read(struct regmap *map, uint offset, uint *valp);
 #define regmap_read32(map, ptr, member, valp) \
 	regmap_read(map, (uint32_t *)(ptr)->member - (uint32_t *)(ptr), valp)
 
+/**
+ * regmap_read_poll_timeout - Poll until a condition is met or a timeout occurs
+ *
+ * @map:	Regmap to read from
+ * @addr:	Offset to poll
+ * @val:	Unsigned integer variable to read the value into
+ * @cond:	Break condition (usually involving @val)
+ * @sleep_us:	Maximum time to sleep between reads in us (0 tight-loops).
+ * @timeout_ms:	Timeout in ms, 0 means never timeout
+ *
+ * Returns 0 on success and -ETIMEDOUT upon a timeout or the regmap_read
+ * error return value in case of a error read. In the two former cases,
+ * the last read value at @addr is stored in @val. Must not be called
+ * from atomic context if sleep_us or timeout_us are used.
+ *
+ * This is modelled after the regmap_read_poll_timeout macros in linux but
+ * with millisecond timeout.
+ */
+#define regmap_read_poll_timeout(map, addr, val, cond, sleep_us, timeout_ms) \
+({ \
+	unsigned long __start = get_timer(0); \
+	int __ret; \
+	for (;;) { \
+		__ret = regmap_read((map), (addr), &(val)); \
+		if (__ret) \
+			break; \
+		if (cond) \
+			break; \
+		if ((timeout_ms) && get_timer(__start) > (timeout_ms)) { \
+			__ret = regmap_read((map), (addr), &(val)); \
+			break; \
+		} \
+		if ((sleep_us)) \
+			udelay((sleep_us)); \
+	} \
+	__ret ?: ((cond) ? 0 : -ETIMEDOUT); \
+})
+
 /**
  * regmap_update_bits() - Perform a read/modify/write using a mask
  *
-- 
2.19.1
