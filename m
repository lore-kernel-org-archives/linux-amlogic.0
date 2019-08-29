Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A879C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 16:16:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D14B821874
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 16:16:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TptGxRIO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CekDSk1M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D14B821874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjF4Um+8l3IvnVq81rvKYYy2aJRpf1WRXlgPQrY9oxg=; b=TptGxRIOYVoivM
	FhdfQwNIP9d4fsBKlgXxqZFB2giL7OeUEmv6+/KdPT/34XOLk54mEAk3QCYJjTm7YUhfUyQVRbUDE
	aGoSVte2TXPiZUYidgBBKbtt2y2ukj4s4rjONzcLXuVkGtTPd9+OhNyWZW4fd2xafwEprz19xYUlo
	xZv3Ottav8UsBFkz7c7d3+bOjOkhjfYmo1iyZ/N+sW6p1k11wj90AXC4ajtL73Bl00ML8yQX+zCQ8
	cGAWtWh002dL3Ifr+z8uAttb3zsCsxye4dRJTOccy0j/pJxM/z/1cExtfKlJiptjQEHe5WZ6P21lI
	0QMOPypxayN3BkNNJCCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3N6O-0006jX-MQ; Thu, 29 Aug 2019 16:16:48 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3N6J-0006fY-Go
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 16:16:45 +0000
Received: by mail-wr1-x442.google.com with SMTP id t16so4045554wra.6
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 09:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FmQNGjfdBr23Vmw3dpbgVM+854E1+2Ni006e4CpQSgY=;
 b=CekDSk1MPgdxFAqrz1dEv+g1t2FTomSfKP/jYE1idgSG7KmFCCtNEyZc7vH42ZBlS9
 Or3PdpMJCqcTW2Mx3mB0L8GJa7gIiIRgr3jtSv1GXBrUyC5sRpcfiliB/O8qni3mzeel
 Ju7dY8ketTieBboXb9Bmka2yeL5/TOTWVI3MeG4JxlD2dcowilUc1SfVRIjio+rgC6Db
 +l972o4mx3vVJ/MWdwqFV1uxCsBFKdyTue0yOBEJE1MdunO466r0PuAyDYc3ozOVqwmO
 w5ZEyyXz+Ymwb63qClokwIOCNCvVTs+212NUm/KtGK8+pdwxqrFTqD+TJeb7kR1RfaCg
 rHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FmQNGjfdBr23Vmw3dpbgVM+854E1+2Ni006e4CpQSgY=;
 b=LXGgaRViZHIGQsuR7Pmr/m9VtL0ktAdqsFms6o15KaDM8G6oCdMWO94lK42k755LEX
 d0drDRWEFOiZPoUmW/S/LCRORpXgBJnsMZ92UhXUTSjJdCB+sTJBbviUJNzZIv+bxGqu
 ILFmlNAh9xAbk231KyIvv+SmJO1pV4tJRrKS5zwlYKEpfwz/p2SRBsK851ulbzEjiKcO
 On2eY5moXY2bcE9m1LLs6dDkudnPEwvgac2olnqy5SNSXeAkBphyNIFM+flcor9Zz1gY
 sZSya0Daq8qzXTUaeatv005nQv1IqjHpcA1Nvla+IvGrYjrTI06XZ4bc8QaS0cg58tcN
 apUg==
X-Gm-Message-State: APjAAAWwdm+cOFLYy90rintGxCI0uatC6oB15ZbCotBiXY+U6/ZdW+XH
 VHXyBdM8CUqCyGyeWBWdSaMURw==
X-Google-Smtp-Source: APXvYqw9HoPeh2heiRIRHpSaq/sXvvhz1CoOdRYhphaq4Jy0pWXgJH5XT5V8jwGkKhMIclcrP3x0tg==
X-Received: by 2002:adf:bace:: with SMTP id w14mr13278467wrg.283.1567095401578; 
 Thu, 29 Aug 2019 09:16:41 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id q13sm3915424wmq.30.2019.08.29.09.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:16:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] irqchip/meson-gpio: Add support for meson sm1 SoCs
Date: Thu, 29 Aug 2019 18:16:35 +0200
Message-Id: <20190829161635.25067-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829161635.25067-1-jbrunet@baylibre.com>
References: <20190829161635.25067-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_091643_558173_D497A533 
X-CRM114-Status: GOOD (  17.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The meson sm1 SoCs uses the same type of GPIO interrupt controller IP
block as the other meson SoCs, A total of 100 pins can be spied on:

- 223:100 undefined (no interrupt)
- 99:97   3 pins on bank GPIOE
- 96:77   20 pins on bank GPIOX
- 76:61   16 pins on bank GPIOA
- 60:53   8 pins on bank GPIOC
- 52:37   16 pins on bank BOOT
- 36:28   9 pins on bank GPIOH
- 27:12   16 pins on bank GPIOZ
- 11:0    12 pins in the AO domain

Mapping is the same as the g12a family but the sm1 controller
allows to trig an irq on both edges of the input signal. This was
not possible with the previous SoCs families

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/irqchip/irq-meson-gpio.c | 52 +++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index dcdc23b9dce6..829084b568fa 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -24,14 +24,25 @@
 #define REG_PIN_47_SEL	0x08
 #define REG_FILTER_SEL	0x0c
 
-#define REG_EDGE_POL_MASK(x)	(BIT(x) | BIT(16 + (x)))
+/*
+ * Note: The S905X3 datasheet reports that BOTH_EDGE is controlled by
+ * bits 24 to 31. Tests on the actual HW show that these bits are
+ * stuck at 0. Bits 8 to 15 are responsive and have the expected
+ * effect.
+ */
 #define REG_EDGE_POL_EDGE(x)	BIT(x)
 #define REG_EDGE_POL_LOW(x)	BIT(16 + (x))
+#define REG_BOTH_EDGE(x)	BIT(8 + (x))
+#define REG_EDGE_POL_MASK(x)    (	\
+		REG_EDGE_POL_EDGE(x) |	\
+		REG_EDGE_POL_LOW(x)  |	\
+		REG_BOTH_EDGE(x))
 #define REG_PIN_SEL_SHIFT(x)	(((x) % 4) * 8)
 #define REG_FILTER_SEL_SHIFT(x)	((x) * 4)
 
 struct meson_gpio_irq_params {
 	unsigned int nr_hwirq;
+	bool support_edge_both;
 };
 
 static const struct meson_gpio_irq_params meson8_params = {
@@ -54,6 +65,11 @@ static const struct meson_gpio_irq_params axg_params = {
 	.nr_hwirq = 100,
 };
 
+static const struct meson_gpio_irq_params sm1_params = {
+	.nr_hwirq = 100,
+	.support_edge_both = true,
+};
+
 static const struct of_device_id meson_irq_gpio_matches[] = {
 	{ .compatible = "amlogic,meson8-gpio-intc", .data = &meson8_params },
 	{ .compatible = "amlogic,meson8b-gpio-intc", .data = &meson8b_params },
@@ -61,11 +77,12 @@ static const struct of_device_id meson_irq_gpio_matches[] = {
 	{ .compatible = "amlogic,meson-gxl-gpio-intc", .data = &gxl_params },
 	{ .compatible = "amlogic,meson-axg-gpio-intc", .data = &axg_params },
 	{ .compatible = "amlogic,meson-g12a-gpio-intc", .data = &axg_params },
+	{ .compatible = "amlogic,meson-sm1-gpio-intc", .data = &sm1_params },
 	{ }
 };
 
 struct meson_gpio_irq_controller {
-	unsigned int nr_hwirq;
+	const struct meson_gpio_irq_params *params;
 	void __iomem *base;
 	u32 channel_irqs[NUM_CHANNEL];
 	DECLARE_BITMAP(channel_map, NUM_CHANNEL);
@@ -168,14 +185,22 @@ static int meson_gpio_irq_type_setup(struct meson_gpio_irq_controller *ctl,
 	 */
 	type &= IRQ_TYPE_SENSE_MASK;
 
-	if (type == IRQ_TYPE_EDGE_BOTH)
-		return -EINVAL;
+	/*
+	 * New controller support EDGE_BOTH trigger. This setting takes
+	 * precedence over the other edge/polarity settings
+	 */
+	if (type == IRQ_TYPE_EDGE_BOTH) {
+		if (!ctl->params->support_edge_both)
+			return -EINVAL;
 
-	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
-		val |= REG_EDGE_POL_EDGE(idx);
+		val |= REG_BOTH_EDGE(idx);
+	} else {
+		if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
+			val |= REG_EDGE_POL_EDGE(idx);
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
-		val |= REG_EDGE_POL_LOW(idx);
+		if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
+			val |= REG_EDGE_POL_LOW(idx);
+	}
 
 	spin_lock(&ctl->lock);
 
@@ -199,7 +224,7 @@ static unsigned int meson_gpio_irq_type_output(unsigned int type)
 	 */
 	if (sense & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
 		type |= IRQ_TYPE_LEVEL_HIGH;
-	else if (sense & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
+	else
 		type |= IRQ_TYPE_EDGE_RISING;
 
 	return type;
@@ -328,15 +353,13 @@ static int __init meson_gpio_irq_parse_dt(struct device_node *node,
 					  struct meson_gpio_irq_controller *ctl)
 {
 	const struct of_device_id *match;
-	const struct meson_gpio_irq_params *params;
 	int ret;
 
 	match = of_match_node(meson_irq_gpio_matches, node);
 	if (!match)
 		return -ENODEV;
 
-	params = match->data;
-	ctl->nr_hwirq = params->nr_hwirq;
+	ctl->params = match->data;
 
 	ret = of_property_read_variable_u32_array(node,
 						  "amlogic,channel-interrupts",
@@ -385,7 +408,8 @@ static int __init meson_gpio_irq_of_init(struct device_node *node,
 	if (ret)
 		goto free_channel_irqs;
 
-	domain = irq_domain_create_hierarchy(parent_domain, 0, ctl->nr_hwirq,
+	domain = irq_domain_create_hierarchy(parent_domain, 0,
+					     ctl->params->nr_hwirq,
 					     of_node_to_fwnode(node),
 					     &meson_gpio_irq_domain_ops,
 					     ctl);
@@ -396,7 +420,7 @@ static int __init meson_gpio_irq_of_init(struct device_node *node,
 	}
 
 	pr_info("%d to %d gpio interrupt mux initialized\n",
-		ctl->nr_hwirq, NUM_CHANNEL);
+		ctl->params->nr_hwirq, NUM_CHANNEL);
 
 	return 0;
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
