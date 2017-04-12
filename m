From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 12 Apr 2017 21:34:50 +0200
Subject: [PATCH v2 5/5] media: rc: meson-ir: change irq name to to of node name
In-Reply-To: <d5c18dbb-e86a-6b1c-1410-d6cc92dce711@gmail.com>
References: <d5c18dbb-e86a-6b1c-1410-d6cc92dce711@gmail.com>
Message-ID: <60430e4d-2489-607b-cf08-8c6406cd5abe@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Switch the interrupt description to the default which is the of node
name. This is more in line with the interrupt descriptions in
other meson drivers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- no changes
---
 drivers/media/rc/meson-ir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 1c72593d..1ece3c04 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -155,7 +155,7 @@ static int meson_ir_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_request_irq(dev, irq, meson_ir_irq, 0, "ir-meson", ir);
+	ret = devm_request_irq(dev, irq, meson_ir_irq, 0, NULL, ir);
 	if (ret) {
 		dev_err(dev, "failed to request irq\n");
 		return ret;
-- 
2.12.2
