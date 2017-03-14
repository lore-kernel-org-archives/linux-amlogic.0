From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Mar 2017 22:51:25 +0100
Subject: [PATCH v4 04/10] i2c: meson: use i2c core for DT clock-frequency
 parsing
In-Reply-To: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
References: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
Message-ID: <96c1b005-063e-ae22-ded4-fbb0b023f02b@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

We don't have to parse the DT manually to retrieve the bus frequency
and we don't have to maintain an own default for the bus frequency.
Let the i2c core do this for us.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
v2:
- added Reviewed-by
v3:
- changed order of patches
v4:
- update DT binding documentation
---
 Documentation/devicetree/bindings/i2c/i2c-meson.txt | 17 +++++++++++++++++
 drivers/i2c/busses/i2c-meson.c                      |  8 +++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-meson.txt b/Documentation/devicetree/bindings/i2c/i2c-meson.txt
index 386357d1..6bc10cdc 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-meson.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-meson.txt
@@ -8,10 +8,27 @@ Required properties:
  - #address-cells: should be <1>
  - #size-cells: should be <0>
 
+For details regarding the following core I2C bindings see also i2c.txt.
+
 Optional properties:
 - clock-frequency: the desired I2C bus clock frequency in Hz; in
   absence of this property the default value is used (100 kHz).
 
+- i2c-scl-falling-time-ns
+  Number of nanoseconds the SCL signal takes to fall; t(f) in the I2C
+  specification.
+
+- i2c-scl-internal-delay-ns
+  Number of nanoseconds the IP core additionally needs to setup SCL.
+
+- i2c-scl-rising-time-ns
+  Number of nanoseconds the SCL signal takes to rise; t(r) in the I2C
+  specification.
+
+- i2c-sda-falling-time-ns
+  Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
+  specification.
+
 Examples:
 
 	i2c at c8100500 {
diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index e597764e..ac0ac82d 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -38,7 +38,6 @@
 #define REG_CTRL_CLKDIV_MASK	((BIT(10) - 1) << REG_CTRL_CLKDIV_SHIFT)
 
 #define I2C_TIMEOUT_MS		500
-#define DEFAULT_FREQ		100000
 
 enum {
 	TOKEN_END = 0,
@@ -387,15 +386,14 @@ static int meson_i2c_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct meson_i2c *i2c;
 	struct resource *mem;
-	u32 freq;
+	struct i2c_timings timings;
 	int irq, ret = 0;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct meson_i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
-	if (of_property_read_u32(pdev->dev.of_node, "clock-frequency", &freq))
-		freq = DEFAULT_FREQ;
+	i2c_parse_fw_timings(&pdev->dev, &timings, true);
 
 	i2c->dev = &pdev->dev;
 	platform_set_drvdata(pdev, i2c);
@@ -453,7 +451,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	meson_i2c_set_clk_div(i2c, freq);
+	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
 
 	return 0;
 }
-- 
2.12.0
