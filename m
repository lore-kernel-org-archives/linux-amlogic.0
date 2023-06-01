Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D795C7EE23
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jun 2023 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ivSpnwPra8q2VuMqc2VbNux0fSNZVkipPpfYv5OR3w=; b=3uFBKvi4IsCq+v
	/ai2cVVUrE4s/SKkSwjo7I8O3yNsYNQgcEYBOuTA7c6AA/LX272L4jIzgJHnaTm43e1HqLskToD7K
	uwAQ6VB+PgxDkzmm23eUZNY9ZF5NkpO6syEN9uui8PV6mvnIoQpl3yMTCv0zSHAGQOq8O9QD9Bgfy
	416NTsOw3M+D2mvTSOD7tJOOUGU4DK11tfDMobqcUW62mev5YPk/d99eXcoNCScGtL37YeOQRZtKr
	gxzo9ly7DK/gw8GITfOopJ3HQSKlR+vhvzsWH4x/o3sduDqFp01IVajy5c/FM59xL0Ub6cx25pL+4
	8pCvh17jIsWGQwresSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gtI-003J2P-2q;
	Thu, 01 Jun 2023 11:54:52 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gtG-003Iyj-09
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Jun 2023 11:54:51 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 1 Jun 2023
 19:54:01 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH v3 3/3] media: rc: meson-ir: support MMIO regmaps to access registers
Date: Thu, 1 Jun 2023 19:54:33 +0800
Message-ID: <20230601115433.21809-4-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230601115433.21809-1-zelong.dong@amlogic.com>
References: <20230601115433.21809-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_045450_083341_4E468919 
X-CRM114-Status: GOOD (  17.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Zelong Dong <zelong.dong@amlogic.com>

Supports MMIO regmaps to access controller registers in Meson IR driver.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 drivers/media/rc/Kconfig    |  1 +
 drivers/media/rc/meson-ir.c | 72 +++++++++++++++++++------------------
 2 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
index ac4172feb6f9..24437ed64a27 100644
--- a/drivers/media/rc/Kconfig
+++ b/drivers/media/rc/Kconfig
@@ -271,6 +271,7 @@ config IR_MCEUSB
 config IR_MESON
 	tristate "Amlogic Meson IR remote receiver"
 	depends on ARCH_MESON || COMPILE_TEST
+	select REGMAP_MMIO
 	help
 	   Say Y if you want to use the IR remote receiver available
 	   on Amlogic Meson SoCs.
diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index a0ccde02bc08..d22d2578ec39 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/bitfield.h>
+#include <linux/regmap.h>
 
 #include <media/rc-core.h>
 
@@ -50,21 +51,16 @@
 #define MESON_HW_TRATE		20	/* us */
 
 struct meson_ir {
-	void __iomem	*reg;
+	struct regmap	*reg;
 	struct rc_dev	*rc;
 	spinlock_t	lock;
 };
 
-static void meson_ir_set_mask(struct meson_ir *ir, unsigned int reg,
-			      u32 mask, u32 value)
-{
-	u32 data;
-
-	data = readl(ir->reg + reg);
-	data &= ~mask;
-	data |= (value & mask);
-	writel(data, ir->reg + reg);
-}
+static struct regmap_config meson_ir_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
 
 static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
 {
@@ -74,11 +70,11 @@ static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
 
 	spin_lock(&ir->lock);
 
-	duration = readl_relaxed(ir->reg + IR_DEC_REG1);
+	regmap_read(ir->reg, IR_DEC_REG1, &duration);
 	duration = FIELD_GET(IR_DEC_REG1_TIME_IV, duration);
 	rawir.duration = duration * MESON_RAW_TRATE;
 
-	status = readl_relaxed(ir->reg + IR_DEC_STATUS);
+	regmap_read(ir->reg, IR_DEC_STATUS, &status);
 	rawir.pulse = !!(status & IR_DEC_STATUS_PULSE);
 
 	ir_raw_event_store_with_timeout(ir->rc, &rawir);
@@ -92,6 +88,7 @@ static int meson_ir_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	void __iomem *res_start;
 	const char *map_name;
 	struct meson_ir *ir;
 	int irq, ret;
@@ -100,7 +97,12 @@ static int meson_ir_probe(struct platform_device *pdev)
 	if (!ir)
 		return -ENOMEM;
 
-	ir->reg = devm_platform_ioremap_resource(pdev, 0);
+	res_start = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(res_start))
+		return PTR_ERR(res_start);
+
+	ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
+					&meson_ir_regmap_config);
 	if (IS_ERR(ir->reg))
 		return PTR_ERR(ir->reg);
 
@@ -143,27 +145,28 @@ static int meson_ir_probe(struct platform_device *pdev)
 	}
 
 	/* Reset the decoder */
-	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_RESET,
-			  IR_DEC_REG1_RESET);
-	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET,
+			   IR_DEC_REG1_RESET);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
 
 	/* Set general operation mode (= raw/software decoding) */
 	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
-		meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_MODE,
-				  FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_RAW));
+		regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
+				   FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_RAW));
 	else
-		meson_ir_set_mask(ir, IR_DEC_REG2, IR_DEC_REG2_MODE,
-				  FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_RAW));
+		regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
+				   FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_RAW));
 
 	/* Set rate */
-	meson_ir_set_mask(ir, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
-			  MESON_RAW_TRATE - 1);
+	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
+			   FIELD_PREP(IR_DEC_REG0_BASE_TIME,
+				      MESON_RAW_TRATE - 1));
 	/* IRQ on rising and falling edges */
-	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
-			  FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
+			   FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
 	/* Enable the decoder */
-	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
-			  IR_DEC_REG1_ENABLE);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
+			   IR_DEC_REG1_ENABLE);
 
 	dev_info(dev, "receiver initialized\n");
 
@@ -177,7 +180,7 @@ static void meson_ir_remove(struct platform_device *pdev)
 
 	/* Disable the decoder */
 	spin_lock_irqsave(&ir->lock, flags);
-	meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
 
@@ -195,15 +198,16 @@ static void meson_ir_shutdown(struct platform_device *pdev)
 	 * bootloader a chance to power the system back on
 	 */
 	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
-		meson_ir_set_mask(ir, IR_DEC_REG1, IR_DEC_REG1_MODE,
-				  FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_NEC));
+		regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
+				   FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_NEC));
 	else
-		meson_ir_set_mask(ir, IR_DEC_REG2, IR_DEC_REG2_MODE,
-				  FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_NEC));
+		regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
+				   FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_NEC));
 
 	/* Set rate to default value */
-	meson_ir_set_mask(ir, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
-			  MESON_HW_TRATE - 1);
+	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
+			   FIELD_PREP(IR_DEC_REG0_BASE_TIME,
+				      MESON_HW_TRATE - 1));
 
 	spin_unlock_irqrestore(&ir->lock, flags);
 }
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
