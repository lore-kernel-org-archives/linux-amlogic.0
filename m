Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EE3C77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 May 2023 03:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yVV1CulP4qjRyMQjfldxAHlKgxkL/d4lNswCUmSyUxo=; b=TpIeKGmSXsFFUU
	Zv4i3S5b9W8fw6m4NBjTvVcsB6h3LLkLIQABzVh/acf5kt5goivENjmLszRVwMhU3tLQRSXk2DCfq
	0YaHI2A3vqX4AgryWSHnipNg1zp+nX6q4osQvBpvfiYb92R+qkL95vj1rKh/I5wpcWNYwQFfczmgy
	yTFo9RNLfVUA14cgH4rvkw2qb0Ux+Vap3zK48xRB2z1z3/8kywSs3VHeZfx+TrrtZB7BJlNwxgXK1
	5G0i0xUBSV0IxbdDrVcVgV1yF6jvqtrFiZ6SP9CunNaO+gIBdlhwfc83lSCPoVDxIIisyJBXWlSbH
	c2YSLMgxtql4rAUGvgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwxDX-007frX-29;
	Thu, 11 May 2023 03:43:47 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwxDU-007fqR-1M
	for linux-amlogic@lists.infradead.org;
	Thu, 11 May 2023 03:43:46 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 11 May 2023
 11:43:29 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH] media: rc: meson-ir: support MMIO regmaps to access registers
Date: Thu, 11 May 2023 11:43:33 +0800
Message-ID: <20230511034333.26800-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_204344_482957_E2154084 
X-CRM114-Status: GOOD (  17.56  )
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
And rename register macro for identify more clearly.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 drivers/media/rc/meson-ir.c | 128 ++++++++++++++++++++----------------
 1 file changed, 70 insertions(+), 58 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index 4b769111f78e..045d78f0862c 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/bitfield.h>
+#include <linux/regmap.h>
 
 #include <media/rc-core.h>
 
@@ -24,57 +25,50 @@
 #define IR_DEC_LDR_IDLE		0x04
 #define IR_DEC_LDR_REPEAT	0x08
 #define IR_DEC_BIT_0		0x0c
+
 #define IR_DEC_REG0		0x10
-#define IR_DEC_FRAME		0x14
-#define IR_DEC_STATUS		0x18
-#define IR_DEC_REG1		0x1c
-/* only available on Meson 8b and newer */
-#define IR_DEC_REG2		0x20
+#define IR_DEC_REG0_BASE_TIME	GENMASK(11, 0)
 
-#define REG0_RATE_MASK		GENMASK(11, 0)
+#define IR_DEC_FRAME		0x14
 
-#define DECODE_MODE_NEC		0x0
-#define DECODE_MODE_RAW		0x2
+#define IR_DEC_STATUS		0x18
+#define IR_DEC_STATUS_PULSE	BIT(8)
 
+#define IR_DEC_REG1		0x1c
+#define IR_DEC_REG1_TIME_IV	GENMASK(28, 16)
+#define IR_DEC_REG1_ENABLE	BIT(15)
 /* Meson 6b uses REG1 to configure the mode */
-#define REG1_MODE_MASK		GENMASK(8, 7)
-#define REG1_MODE_SHIFT		7
+#define IR_DEC_REG1_MODE	GENMASK(8, 7)
+#define IR_DEC_REG1_IRQSEL	GENMASK(3, 2)
+#define IR_DEC_REG1_RESET	BIT(0)
 
+/* only available on Meson 8b and newer */
+#define IR_DEC_REG2		0x20
 /* Meson 8b / GXBB use REG2 to configure the mode */
-#define REG2_MODE_MASK		GENMASK(3, 0)
-#define REG2_MODE_SHIFT		0
-
-#define REG1_TIME_IV_MASK	GENMASK(28, 16)
-
-#define REG1_IRQSEL_MASK	GENMASK(3, 2)
-#define REG1_IRQSEL_NEC_MODE	0
-#define REG1_IRQSEL_RISE_FALL	1
-#define REG1_IRQSEL_FALL	2
-#define REG1_IRQSEL_RISE	3
+#define IR_DEC_REG2_MODE	GENMASK(3, 0)
 
-#define REG1_RESET		BIT(0)
-#define REG1_ENABLE		BIT(15)
+#define DEC_MODE_NEC		0x0
+#define DEC_MODE_RAW		0x2
 
-#define STATUS_IR_DEC_IN	BIT(8)
+#define IRQSEL_NEC_MODE		0
+#define IRQSEL_RISE_FALL	1
+#define IRQSEL_FALL		2
+#define IRQSEL_RISE		3
 
-#define MESON_TRATE		10	/* us */
+#define MESON_RAW_TRATE		10	/* us */
+#define MESON_HW_TRATE		20	/* us */
 
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
@@ -84,12 +78,12 @@ static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
 
 	spin_lock(&ir->lock);
 
-	duration = readl_relaxed(ir->reg + IR_DEC_REG1);
-	duration = FIELD_GET(REG1_TIME_IV_MASK, duration);
-	rawir.duration = duration * MESON_TRATE;
+	regmap_read(ir->reg, IR_DEC_REG1, &duration);
+	duration = FIELD_GET(IR_DEC_REG1_TIME_IV, duration);
+	rawir.duration = duration * MESON_RAW_TRATE;
 
-	status = readl_relaxed(ir->reg + IR_DEC_STATUS);
-	rawir.pulse = !!(status & STATUS_IR_DEC_IN);
+	regmap_read(ir->reg, IR_DEC_STATUS, &status);
+	rawir.pulse = !!(status & IR_DEC_STATUS_PULSE);
 
 	ir_raw_event_store_with_timeout(ir->rc, &rawir);
 
@@ -102,6 +96,8 @@ static int meson_ir_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	struct resource *res;
+	void __iomem *res_start;
 	const char *map_name;
 	struct meson_ir *ir;
 	int irq, ret;
@@ -110,7 +106,17 @@ static int meson_ir_probe(struct platform_device *pdev)
 	if (!ir)
 		return -ENOMEM;
 
-	ir->reg = devm_platform_ioremap_resource(pdev, 0);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (IS_ERR_OR_NULL(res)) {
+		dev_err(&pdev->dev, "get mem resource error, %ld\n",
+			PTR_ERR(res));
+		return PTR_ERR(res);
+	}
+
+	res_start = devm_ioremap_resource(&pdev->dev, res);
+	meson_ir_regmap_config.max_register = resource_size(res) - 4;
+	ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
+					&meson_ir_regmap_config);
 	if (IS_ERR(ir->reg))
 		return PTR_ERR(ir->reg);
 
@@ -131,7 +137,7 @@ static int meson_ir_probe(struct platform_device *pdev)
 	map_name = of_get_property(node, "linux,rc-map-name", NULL);
 	ir->rc->map_name = map_name ? map_name : RC_MAP_EMPTY;
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
-	ir->rc->rx_resolution = MESON_TRATE;
+	ir->rc->rx_resolution = MESON_RAW_TRATE;
 	ir->rc->min_timeout = 1;
 	ir->rc->timeout = IR_DEFAULT_TIMEOUT;
 	ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
@@ -153,24 +159,28 @@ static int meson_ir_probe(struct platform_device *pdev)
 	}
 
 	/* Reset the decoder */
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, REG1_RESET);
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, 0);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET,
+			   IR_DEC_REG1_RESET);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
 
 	/* Set general operation mode (= raw/software decoding) */
 	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
-		meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
-				  FIELD_PREP(REG1_MODE_MASK, DECODE_MODE_RAW));
+		regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
+				   FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_RAW));
 	else
-		meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
-				  FIELD_PREP(REG2_MODE_MASK, DECODE_MODE_RAW));
+		regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
+				   FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_RAW));
 
 	/* Set rate */
-	meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, MESON_TRATE - 1);
+	regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
+			   FIELD_PREP(IR_DEC_REG0_BASE_TIME,
+				      MESON_RAW_TRATE - 1));
 	/* IRQ on rising and falling edges */
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_IRQSEL_MASK,
-			  FIELD_PREP(REG1_IRQSEL_MASK, REG1_IRQSEL_RISE_FALL));
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
+			   FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
 	/* Enable the decoder */
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, REG1_ENABLE);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
+			   IR_DEC_REG1_ENABLE);
 
 	dev_info(dev, "receiver initialized\n");
 
@@ -184,7 +194,7 @@ static int meson_ir_remove(struct platform_device *pdev)
 
 	/* Disable the decoder */
 	spin_lock_irqsave(&ir->lock, flags);
-	meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, 0);
+	regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
 	spin_unlock_irqrestore(&ir->lock, flags);
 
 	return 0;
@@ -204,14 +214,16 @@ static void meson_ir_shutdown(struct platform_device *pdev)
 	 * bootloader a chance to power the system back on
 	 */
 	if (of_device_is_compatible(node, "amlogic,meson6-ir"))
-		meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
-				  DECODE_MODE_NEC << REG1_MODE_SHIFT);
+		regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
+				   FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_NEC));
 	else
-		meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
-				  DECODE_MODE_NEC << REG2_MODE_SHIFT);
+		regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
+				   FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_NEC));
 
 	/* Set rate to default value */
-	meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, 0x13);
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
