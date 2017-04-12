From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 12 Apr 2017 21:28:42 +0200
Subject: [PATCH v2 1/5] media: rc: meson-ir: remove irq from struct meson_ir
In-Reply-To: <d5c18dbb-e86a-6b1c-1410-d6cc92dce711@gmail.com>
References: <d5c18dbb-e86a-6b1c-1410-d6cc92dce711@gmail.com>
Message-ID: <bf1c9544-8b58-6861-2ae9-00f59551c9dd@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The irq number is used in the probe function only, therefore just use
a local variable.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- no changes
---
 drivers/media/rc/meson-ir.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 5576dbd6..a4128d7c 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -68,7 +68,6 @@
 struct meson_ir {
 	void __iomem	*reg;
 	struct rc_dev	*rc;
-	int		irq;
 	spinlock_t	lock;
 };
 
@@ -112,7 +111,7 @@ static int meson_ir_probe(struct platform_device *pdev)
 	struct resource *res;
 	const char *map_name;
 	struct meson_ir *ir;
-	int ret;
+	int irq, ret;
 
 	ir = devm_kzalloc(dev, sizeof(struct meson_ir), GFP_KERNEL);
 	if (!ir)
@@ -125,10 +124,10 @@ static int meson_ir_probe(struct platform_device *pdev)
 		return PTR_ERR(ir->reg);
 	}
 
-	ir->irq = platform_get_irq(pdev, 0);
-	if (ir->irq < 0) {
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
 		dev_err(dev, "no irq resource\n");
-		return ir->irq;
+		return irq;
 	}
 
 	ir->rc = rc_allocate_device(RC_DRIVER_IR_RAW);
@@ -158,7 +157,7 @@ static int meson_ir_probe(struct platform_device *pdev)
 		goto out_free;
 	}
 
-	ret = devm_request_irq(dev, ir->irq, meson_ir_irq, 0, "ir-meson", ir);
+	ret = devm_request_irq(dev, irq, meson_ir_irq, 0, "ir-meson", ir);
 	if (ret) {
 		dev_err(dev, "failed to request irq\n");
 		goto out_unreg;
-- 
2.12.2
