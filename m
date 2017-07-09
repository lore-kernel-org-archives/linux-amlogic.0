From: b.galvani@gmail.com (Beniamino Galvani)
Date: Mon, 10 Jul 2017 00:30:06 +0200
Subject: [PATCH v2 4/4] pinctrl: meson: convert to livetree
In-Reply-To: <20170709223006.3998-1-b.galvani@gmail.com>
References: <20170709223006.3998-1-b.galvani@gmail.com>
Message-ID: <20170709223006.3998-5-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Update the Meson pinctrl/gpio driver to support a live device tree.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 66 +++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index a860200..c8cae51 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -8,6 +8,8 @@
 #include <dm.h>
 #include <dm/device-internal.h>
 #include <dm/lists.h>
+#include <dm/of_addr.h>
+#include <linux/ioport.h>
 #include <dm/pinctrl.h>
 #include <fdt_support.h>
 #include <linux/err.h>
@@ -257,66 +259,70 @@ static struct driver meson_gpio_driver = {
 	.ops	= &meson_gpio_ops,
 };
 
-static fdt_addr_t parse_address(int offset, const char *name, int na, int ns)
+static phys_addr_t parse_address(struct udevice *dev, ofnode node,
+				 const char *name)
 {
-	int index, len = 0;
-	const fdt32_t *reg;
+	struct resource r;
+	fdt_size_t sz;
+	int na, ns, index;
 
-	index = fdt_stringlist_search(gd->fdt_blob, offset, "reg-names", name);
+	index = ofnode_stringlist_search(node, "reg-names", name);
 	if (index < 0)
 		return FDT_ADDR_T_NONE;
 
-	reg = fdt_getprop(gd->fdt_blob, offset, "reg", &len);
-	if (!reg || (len <= (index * sizeof(fdt32_t) * (na + ns))))
+	if (of_live_active()) {
+		if (of_address_to_resource(ofnode_to_np(node), index, &r))
+			return FDT_ADDR_T_NONE;
+		else
+			return r.start;
+	}
+
+	na = dev_read_addr_cells(dev->parent);
+	if (na < 1) {
+		debug("bad #address-cells\n");
 		return FDT_ADDR_T_NONE;
+	}
 
-	reg += index * (na + ns);
+	ns = dev_read_size_cells(dev->parent);
+	if (ns < 1) {
+		debug("bad #size-cells\n");
+		return FDT_ADDR_T_NONE;
+	}
 
-	return fdt_translate_address((void *)gd->fdt_blob, offset, reg);
+	return fdtdec_get_addr_size_fixed(gd->fdt_blob, ofnode_to_offset(node),
+					  "reg", index, na, ns, &sz, true);
 }
 
 int meson_pinctrl_probe(struct udevice *dev)
 {
 	struct meson_pinctrl *priv = dev_get_priv(dev);
+	ofnode node, gpio = ofnode_null();
 	struct uclass_driver *drv;
 	struct udevice *gpio_dev;
-	fdt_addr_t addr;
-	int node, gpio = -1, len;
-	int na, ns;
+	phys_addr_t addr;
 	char *name;
+	int len;
 
-	na = fdt_address_cells(gd->fdt_blob, dev_of_offset(dev->parent));
-	if (na < 1) {
-		debug("bad #address-cells\n");
-		return -EINVAL;
-	}
-
-	ns = fdt_size_cells(gd->fdt_blob, dev_of_offset(dev->parent));
-	if (ns < 1) {
-		debug("bad #size-cells\n");
-		return -EINVAL;
-	}
-
-	fdt_for_each_subnode(node, gd->fdt_blob, dev_of_offset(dev)) {
-		if (fdt_getprop(gd->fdt_blob, node, "gpio-controller", &len)) {
+	dev_for_each_subnode(node, dev) {
+		if (ofnode_read_prop(node, "gpio-controller", &len)) {
 			gpio = node;
 			break;
 		}
 	}
 
-	if (!gpio) {
+	if (!ofnode_valid(gpio)) {
 		debug("gpio node not found\n");
 		return -EINVAL;
 	}
 
-	addr = parse_address(gpio, "mux", na, ns);
+	addr = parse_address(dev, gpio, "mux");
 	if (addr == FDT_ADDR_T_NONE) {
 		debug("mux address not found\n");
 		return -EINVAL;
 	}
 	priv->reg_mux = (void __iomem *)addr;
 
-	addr = parse_address(gpio, "gpio", na, ns);
+	addr = parse_address(dev, gpio, "gpio");
 	if (addr == FDT_ADDR_T_NONE) {
 		debug("gpio address not found\n");
 		return -EINVAL;
@@ -335,8 +341,8 @@ int meson_pinctrl_probe(struct udevice *dev)
 	sprintf(name, "meson-gpio");
 
 	/* Create child device UCLASS_GPIO and bind it */
-	device_bind(dev, &meson_gpio_driver, name, NULL, gpio, &gpio_dev);
-	dev_set_of_offset(gpio_dev, gpio);
+	device_bind_with_driver_data(dev, &meson_gpio_driver, name, 0,
+				     gpio, &gpio_dev);
 
 	return 0;
 }
-- 
2.9.3
