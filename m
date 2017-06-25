From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 25 Jun 2017 17:55:10 +0200
Subject: [PATCH 2/3] pinctrl: meson: add GPIO support
In-Reply-To: <20170625155511.28447-1-b.galvani@gmail.com>
References: <20170625155511.28447-1-b.galvani@gmail.com>
Message-ID: <20170625155511.28447-3-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This commit adds GPIO support to the Amlogic Meson pin controller
driver, based on code from Linux kernel.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  21 ++++
 drivers/pinctrl/meson/pinctrl-meson.c      | 167 ++++++++++++++++++++++++++++-
 drivers/pinctrl/meson/pinctrl-meson.h      |  63 +++++++++++
 3 files changed, 249 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 2fa840c..87c9912 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -391,14 +391,33 @@ static struct meson_pmx_func meson_gxbb_aobus_functions[] = {
 	FUNCTION(i2c_slave_ao),
 };
 
+static struct meson_bank meson_gxbb_periphs_banks[] = {
+	/*   name    first                      last                    pullen  pull    dir     out     in  */
+	BANK("X",    PIN(GPIOX_0, EE_OFF),	PIN(GPIOX_22, EE_OFF),  4,  0,  4,  0,  12, 0,  13, 0,  14, 0),
+	BANK("Y",    PIN(GPIOY_0, EE_OFF),	PIN(GPIOY_16, EE_OFF),  1,  0,  1,  0,  3,  0,  4,  0,  5,  0),
+	BANK("DV",   PIN(GPIODV_0, EE_OFF),	PIN(GPIODV_29, EE_OFF), 0,  0,  0,  0,  0,  0,  1,  0,  2,  0),
+	BANK("H",    PIN(GPIOH_0, EE_OFF),	PIN(GPIOH_3, EE_OFF),   1, 20,  1, 20,  3, 20,  4, 20,  5, 20),
+	BANK("Z",    PIN(GPIOZ_0, EE_OFF),	PIN(GPIOZ_15, EE_OFF),  3,  0,  3,  0,  9,  0,  10, 0, 11,  0),
+	BANK("CARD", PIN(CARD_0, EE_OFF),	PIN(CARD_6, EE_OFF),    2, 20,  2, 20,  6, 20,  7, 20,  8, 20),
+	BANK("BOOT", PIN(BOOT_0, EE_OFF),	PIN(BOOT_17, EE_OFF),   2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
+	BANK("CLK",  PIN(GPIOCLK_0, EE_OFF),	PIN(GPIOCLK_3, EE_OFF), 3, 28,  3, 28,  9, 28, 10, 28, 11, 28),
+};
+
+static struct meson_bank meson_gxbb_aobus_banks[] = {
+	/*   name    first              last               pullen  pull    dir     out     in  */
+	BANK("AO",   PIN(GPIOAO_0, 0),  PIN(GPIOAO_13, 0), 0,  0,  0, 16,  0,  0,  0, 16,  1,  0),
+};
+
 struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
 	.pin_base	= 14,
 	.groups		= meson_gxbb_periphs_groups,
 	.funcs		= meson_gxbb_periphs_functions,
+	.banks		= meson_gxbb_periphs_banks,
 	.num_pins	= 120,
 	.num_groups	= ARRAY_SIZE(meson_gxbb_periphs_groups),
 	.num_funcs	= ARRAY_SIZE(meson_gxbb_periphs_functions),
+	.num_banks	= ARRAY_SIZE(meson_gxbb_periphs_banks),
 };
 
 struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data = {
@@ -406,9 +425,11 @@ struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data = {
 	.pin_base	= 0,
 	.groups		= meson_gxbb_aobus_groups,
 	.funcs		= meson_gxbb_aobus_functions,
+	.banks		= meson_gxbb_aobus_banks,
 	.num_pins	= 14,
 	.num_groups	= ARRAY_SIZE(meson_gxbb_aobus_groups),
 	.num_funcs	= ARRAY_SIZE(meson_gxbb_aobus_functions),
+	.num_banks	= ARRAY_SIZE(meson_gxbb_aobus_banks),
 };
 
 static const struct udevice_id meson_gxbb_pinctrl_match[] = {
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 6281f52..0ac1dc6 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -6,11 +6,14 @@
 
 #include <common.h>
 #include <dm.h>
+#include <dm/device-internal.h>
+#include <dm/lists.h>
 #include <dm/pinctrl.h>
 #include <fdt_support.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/sizes.h>
+#include <asm/gpio.h>
 
 #include "pinctrl-meson.h"
 
@@ -135,12 +138,152 @@ static fdt_addr_t parse_address(int offset, const char *name, int na, int ns)
 	return fdt_translate_address((void *)gd->fdt_blob, offset, reg);
 }
 
+static int meson_gpio_calc_reg_and_bit(struct udevice *dev, unsigned int offset,
+				       enum meson_reg_type reg_type,
+				       unsigned int *reg, unsigned int *bit)
+{
+	struct meson_pinctrl *priv = dev_get_priv(dev->parent);
+	struct meson_bank *bank = NULL;
+	struct meson_reg_desc *desc;
+	unsigned int pin;
+	int i;
+
+	pin = priv->data->pin_base + offset;
+
+	for (i = 0; i < priv->data->num_banks; i++) {
+		if (pin >= priv->data->banks[i].first &&
+		    pin <= priv->data->banks[i].last) {
+			bank = &priv->data->banks[i];
+			break;
+		}
+	}
+
+	if (!bank)
+		return -EINVAL;
+
+	desc = &bank->regs[reg_type];
+	*reg = desc->reg * 4;
+	*bit = desc->bit + pin - bank->first;
+
+	return 0;
+}
+
+static int meson_gpio_get(struct udevice *dev, unsigned int offset)
+{
+	struct meson_pinctrl *priv = dev_get_priv(dev->parent);
+	unsigned int reg, bit;
+	int ret;
+
+	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_IN, &reg, &bit);
+	if (ret)
+		return ret;
+
+	return !!(readl(priv->reg_gpio + reg) & BIT(bit));
+}
+
+static int meson_gpio_set(struct udevice *dev, unsigned int offset, int value)
+{
+	struct meson_pinctrl *priv = dev_get_priv(dev->parent);
+	unsigned int reg, bit;
+	int ret;
+
+	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_OUT, &reg, &bit);
+	if (ret)
+		return ret;
+
+	clrsetbits_le32(priv->reg_gpio + reg, BIT(bit), value ? BIT(bit) : 0);
+
+	return 0;
+}
+
+static int meson_gpio_get_direction(struct udevice *dev, unsigned int offset)
+{
+	struct meson_pinctrl *priv = dev_get_priv(dev->parent);
+	unsigned int reg, bit, val;
+	int ret;
+
+	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_DIR, &reg, &bit);
+	if (ret)
+		return ret;
+
+	val = readl(priv->reg_gpio + reg);
+
+	return (val & BIT(bit)) ? GPIOF_INPUT : GPIOF_OUTPUT;
+}
+
+static int meson_gpio_direction_input(struct udevice *dev, unsigned int offset)
+{
+	struct meson_pinctrl *priv = dev_get_priv(dev->parent);
+	unsigned int reg, bit;
+	int ret;
+
+	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_DIR, &reg, &bit);
+	if (ret)
+		return ret;
+
+	clrsetbits_le32(priv->reg_gpio + reg, BIT(bit), 1);
+
+	return 0;
+}
+
+static int meson_gpio_direction_output(struct udevice *dev,
+				       unsigned int offset, int value)
+{
+	struct meson_pinctrl *priv = dev_get_priv(dev->parent);
+	unsigned int reg, bit;
+	int ret;
+
+	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_DIR, &reg, &bit);
+	if (ret)
+		return ret;
+
+	clrsetbits_le32(priv->reg_gpio + reg, BIT(bit), 0);
+
+	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_OUT, &reg, &bit);
+	if (ret)
+		return ret;
+
+	clrsetbits_le32(priv->reg_gpio + reg, BIT(bit), value ? BIT(bit) : 0);
+
+	return 0;
+}
+
+static int meson_gpio_probe(struct udevice *dev)
+{
+	struct meson_pinctrl *priv = dev_get_priv(dev->parent);
+	struct gpio_dev_priv *uc_priv;
+
+	uc_priv = dev_get_uclass_priv(dev);
+	uc_priv->bank_name = priv->data->name;
+	uc_priv->gpio_count = priv->data->num_pins;
+
+	return 0;
+}
+
+static const struct dm_gpio_ops meson_gpio_ops = {
+	.set_value = meson_gpio_set,
+	.get_value = meson_gpio_get,
+	.get_function = meson_gpio_get_direction,
+	.direction_input = meson_gpio_direction_input,
+	.direction_output = meson_gpio_direction_output,
+};
+
+static struct driver meson_gpio_driver = {
+	.name	= "meson-gpio",
+	.id	= UCLASS_GPIO,
+	.probe	= meson_gpio_probe,
+	.ops	= &meson_gpio_ops,
+};
+
 int meson_pinctrl_probe(struct udevice *dev)
 {
 	struct meson_pinctrl *priv = dev_get_priv(dev);
+	struct uclass_driver *drv;
+	struct udevice *gpio_dev;
 	fdt_addr_t addr;
 	int node, gpio = -1, len;
 	int na, ns;
+	char *name;
 
 	na = fdt_address_cells(gd->fdt_blob, dev_of_offset(dev->parent));
 	if (na < 1) {
@@ -168,12 +311,32 @@ int meson_pinctrl_probe(struct udevice *dev)
 
 	addr = parse_address(gpio, "mux", na, ns);
 	if (addr == FDT_ADDR_T_NONE) {
-		debug("mux not found\n");
+		debug("mux address not found\n");
 		return -EINVAL;
 	}
-
 	priv->reg_mux = (void __iomem *)addr;
+
+	addr = parse_address(gpio, "gpio", na, ns);
+	if (addr == FDT_ADDR_T_NONE) {
+		debug("gpio address not found\n");
+		return -EINVAL;
+	}
+	priv->reg_gpio = (void __iomem *)addr;
 	priv->data = (struct meson_pinctrl_data *)dev_get_driver_data(dev);
 
+	/* Lookup GPIO driver */
+	drv = lists_uclass_lookup(UCLASS_GPIO);
+	if (!drv) {
+		puts("Cannot find GPIO driver\n");
+		return -ENOENT;
+	}
+
+	name = calloc(1, 32);
+	sprintf(name, "meson-gpio");
+
+	/* Create child device UCLASS_GPIO and bind it */
+	device_bind(dev, &meson_gpio_driver, name, NULL, gpio, &gpio_dev);
+	dev_set_of_offset(gpio_dev, gpio);
+
 	return 0;
 }
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index 4127a60..90d2369 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -28,15 +28,64 @@ struct meson_pinctrl_data {
 	const char *name;
 	struct meson_pmx_group *groups;
 	struct meson_pmx_func *funcs;
+	struct meson_bank *banks;
 	unsigned int pin_base;
 	unsigned int num_pins;
 	unsigned int num_groups;
 	unsigned int num_funcs;
+	unsigned int num_banks;
 };
 
 struct meson_pinctrl {
 	struct meson_pinctrl_data *data;
 	void __iomem *reg_mux;
+	void __iomem *reg_gpio;
+};
+
+/**
+ * struct meson_reg_desc - a register descriptor
+ *
+ * @reg:	register offset in the regmap
+ * @bit:	bit index in register
+ *
+ * The structure describes the information needed to control pull,
+ * pull-enable, direction, etc. for a single pin
+ */
+struct meson_reg_desc {
+	unsigned int reg;
+	unsigned int bit;
+};
+
+/**
+ * enum meson_reg_type - type of registers encoded in @meson_reg_desc
+ */
+enum meson_reg_type {
+	REG_PULLEN,
+	REG_PULL,
+	REG_DIR,
+	REG_OUT,
+	REG_IN,
+	NUM_REG,
+};
+
+/**
+ * struct meson bank
+ *
+ * @name:	bank name
+ * @first:	first pin of the bank
+ * @last:	last pin of the bank
+ * @regs:	array of register descriptors
+ *
+ * A bank represents a set of pins controlled by a contiguous set of
+ * bits in the domain registers. The structure specifies which bits in
+ * the regmap control the different functionalities. Each member of
+ * the @regs array refers to the first pin of the bank.
+ */
+struct meson_bank {
+	const char *name;
+	unsigned int first;
+	unsigned int last;
+	struct meson_reg_desc regs[NUM_REG];
 };
 
 #define PIN(x, b)	(b + x)
@@ -65,6 +114,20 @@ struct meson_pinctrl {
 		.num_groups = ARRAY_SIZE(fn ## _groups),		\
 	}
 
+#define BANK(n, f, l, per, peb, pr, pb, dr, db, or, ob, ir, ib)		\
+	{								\
+		.name	= n,						\
+		.first	= f,						\
+		.last	= l,						\
+		.regs	= {						\
+			[REG_PULLEN]	= { per, peb },			\
+			[REG_PULL]	= { pr, pb },			\
+			[REG_DIR]	= { dr, db },			\
+			[REG_OUT]	= { or, ob },			\
+			[REG_IN]	= { ir, ib },			\
+		},							\
+	 }
+
 #define MESON_PIN(x, b) PINCTRL_PIN(PIN(x, b), #x)
 
 extern const struct pinctrl_ops meson_pinctrl_ops;
-- 
2.9.3
