From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 11 Apr 2017 08:07:17 +0200
Subject: [PATCH 5/5] media: rc: meson-ir: change irq name to to of node name
In-Reply-To: <f65a1465-14ba-8db2-7726-454dcfbee69d@gmail.com>
References: <f65a1465-14ba-8db2-7726-454dcfbee69d@gmail.com>
Message-ID: <aff59e48-c030-3e80-fca5-969e41f7d758@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Switch the interrupt description to the default which is the of node
name. This is more in line with the interrupt descriptions in
other meson drivers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/media/rc/meson-ir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 246da2db..471251b3 100644
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
