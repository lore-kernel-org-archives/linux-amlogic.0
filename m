Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0217C10DCE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 13:33:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D57F206E7
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 13:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NG9Vn8vt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wsynuXKf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D57F206E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eEoZzXqHm+7HNCapFTJlSNRzGRjCXukrW/zQewqL68=; b=NG9Vn8vtBqID+g
	Nrr5HBEYVlZnF1kSUu+C6F1Pc+v5ECW+lIkNdnTSehca2t2SzWcbJxNMLwJbkCekm/2y8Mgec9lsP
	TPTWtjHj4Ihp+hmgXpu3JoG2AoY/uqnMm5AUCM1x/1FWR/Z3MB869apDnuIlEHrP4tpMWEff4Lh65
	2d8JnW7kATS3s8Ujl2V7dgsYe3xuIQNWDO8UdH/qKGvIykJbASTZFiAFbrYrw1qT12CMqlRkLiZMj
	ET2xE2OAht3OEmpu/L05YJg3A8BBP0zhCpWJ2KlVk4TjPOn3KnZqx9B+eK7PSDJPPPGXxTEiO2iOf
	Wm0ZIDWHUzBNX+eX4gvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCNxl-0005HV-9o; Thu, 12 Mar 2020 13:33:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCNw4-0003TH-5q
 for linux-amlogic@lists.infradead.org; Thu, 12 Mar 2020 13:31:45 +0000
Received: by mail-wm1-x344.google.com with SMTP id 25so6112006wmk.3
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Mar 2020 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Ms2YdO5k0EVt5XUeOtdpO5owQlKe9aj7DW3EQ2czdQ=;
 b=wsynuXKf+8LRAiGr5edsiN+oVxd4LwcjZFjVFVehVshDBPoEu/LOYo2GpeEOsINxk7
 Z2d3eyOvyz0Djl5moa3SRpFv46N+iWJB2oWj6r1pQyKoQHOF+YZLVlTDqi7Zr/8bnmwL
 O+NjuQG5CchBmOoFXn2sctQXG/z3vEHYftSCEf7aT+gGQDB4kPRtJsd3yfHbodn5XHny
 5m6bZUZBVY3adzsjGSZREgQC+5G25tmsh4qI7aSoo0PkaMpY+2CMGg/WsM036/wYi58n
 4gwcU9NpFlwU9MRaxYUKJ9rml59Ufwxh5yK6r/x2Ly/HlP9Vo6E7fY5gu7G8L5g69fk+
 3u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Ms2YdO5k0EVt5XUeOtdpO5owQlKe9aj7DW3EQ2czdQ=;
 b=P67V2FKS1HnujpKi89NxZMFUjxXfnKzS5n4SZetcPcMzGBSJJbZLSAQjAWPBXI9KLf
 P42Nesd784IWRrQtswgNt3ZyR17AcYyhvnwA1aKjOBIjwip1e891pv18NXku300BWDn/
 nN6iMuun1VOgnbKwwDBsIWEHwy9sjqrdho8kD95+R5O+rDoR1hD8YgjFnhemFpPnuq5w
 1qKHeYXQqhUBYLnACwnRjcC00xUsUWvSCfWmW/PKwuIpfebQf2zlOYL5C5JYJqU60H/n
 V9AMFcanmYcIwekEK7yxqb3Jw1dtPycxkpDlySufi+w8D2h9aW7wUw0WllGnUdk1/BNX
 NtFA==
X-Gm-Message-State: ANhLgQ2w7wyPZxiUAMnQ1mSNlg0/zDAJoD8aEkdB49WjY5HqGT9f0Lxz
 KH9wbKSq0/P6FIoM3n9Irjrxkg==
X-Google-Smtp-Source: ADFU+vvsPsVasyfcqJeOjkmoMM5rSz1TNrzHsVfcqIo465gE0QAHRnNAVPKbibT2iiA4aUmK427OsA==
X-Received: by 2002:a1c:29c2:: with SMTP id p185mr5010490wmp.79.1584019897564; 
 Thu, 12 Mar 2020 06:31:37 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m21sm12242885wmi.27.2020.03.12.06.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 06:31:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: broonie@kernel.org
Subject: [PATCH 3/9] spi: meson-spicc: add a linear clock divider support
Date: Thu, 12 Mar 2020 14:31:25 +0100
Message-Id: <20200312133131.26430-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200312133131.26430-1-narmstrong@baylibre.com>
References: <20200312133131.26430-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_063140_298861_09E43130 
X-CRM114-Status: GOOD (  18.48  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sunny Luo <sunny.luo@amlogic.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Sunny Luo <sunny.luo@amlogic.com>

The SPICC controller in Meson-AXG SoC is capable of using
a linear clock divider to reach a much fine tuned range of clocks,
while the old controller only use a power of two clock divider,
result at a more coarse clock range.

Also convert the clock registration into Common Clock Framework.

Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/spi/Kconfig           |   1 +
 drivers/spi/spi-meson-spicc.c | 204 +++++++++++++++++++++++++++-------
 2 files changed, 165 insertions(+), 40 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index d6ed0c355954..7f86e591fba3 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -415,6 +415,7 @@ config SPI_FSL_ESPI
 
 config SPI_MESON_SPICC
 	tristate "Amlogic Meson SPICC controller"
+	depends on COMMON_CLK
 	depends on ARCH_MESON || COMPILE_TEST
 	help
 	  This enables master mode support for the SPICC (SPI communication
diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index ba70ef94a82a..bd434d9055d9 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -116,6 +116,9 @@
 #define SPICC_DWADDR	0x24	/* Write Address of DMA */
 
 #define SPICC_ENH_CTL0	0x38	/* Enhanced Feature */
+#define SPICC_ENH_CLK_CS_DELAY_MASK	GENMASK(15, 0)
+#define SPICC_ENH_DATARATE_MASK		GENMASK(23, 16)
+#define SPICC_ENH_DATARATE_EN		BIT(24)
 #define SPICC_ENH_MOSI_OEN		BIT(25)
 #define SPICC_ENH_CLK_OEN		BIT(26)
 #define SPICC_ENH_CS_OEN		BIT(27)
@@ -130,6 +133,7 @@
 
 struct meson_spicc_data {
 	bool				has_oen;
+	bool				has_enhance_clk_div;
 };
 
 struct meson_spicc_device {
@@ -137,6 +141,7 @@ struct meson_spicc_device {
 	struct platform_device		*pdev;
 	void __iomem			*base;
 	struct clk			*core;
+	struct clk			*clk;
 	struct spi_message		*message;
 	struct spi_transfer		*xfer;
 	const struct meson_spicc_data	*data;
@@ -322,40 +327,6 @@ static irqreturn_t meson_spicc_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static u32 meson_spicc_setup_speed(struct meson_spicc_device *spicc, u32 conf,
-				   u32 speed)
-{
-	unsigned long parent, value;
-	unsigned int i, div;
-
-	parent = clk_get_rate(spicc->core);
-
-	/* Find closest inferior/equal possible speed */
-	for (i = 0 ; i < 7 ; ++i) {
-		/* 2^(data_rate+2) */
-		value = parent >> (i + 2);
-
-		if (value <= speed)
-			break;
-	}
-
-	/* If provided speed it lower than max divider, use max divider */
-	if (i > 7) {
-		div = 7;
-		dev_warn_once(&spicc->pdev->dev, "unable to get close to speed %u\n",
-			      speed);
-	} else
-		div = i;
-
-	dev_dbg(&spicc->pdev->dev, "parent %lu, speed %u -> %lu (%u)\n",
-		parent, speed, value, div);
-
-	conf &= ~SPICC_DATARATE_MASK;
-	conf |= FIELD_PREP(SPICC_DATARATE_MASK, div);
-
-	return conf;
-}
-
 static void meson_spicc_setup_xfer(struct meson_spicc_device *spicc,
 				   struct spi_transfer *xfer)
 {
@@ -364,9 +335,6 @@ static void meson_spicc_setup_xfer(struct meson_spicc_device *spicc,
 	/* Read original configuration */
 	conf = conf_orig = readl_relaxed(spicc->base + SPICC_CONREG);
 
-	/* Select closest divider */
-	conf = meson_spicc_setup_speed(spicc, conf, xfer->speed_hz);
-
 	/* Setup word width */
 	conf &= ~SPICC_BITLENGTH_MASK;
 	conf |= FIELD_PREP(SPICC_BITLENGTH_MASK,
@@ -375,6 +343,8 @@ static void meson_spicc_setup_xfer(struct meson_spicc_device *spicc,
 	/* Ignore if unchanged */
 	if (conf != conf_orig)
 		writel_relaxed(conf, spicc->base + SPICC_CONREG);
+
+	clk_set_rate(spicc->clk, xfer->speed_hz);
 }
 
 static int meson_spicc_transfer_one(struct spi_master *master,
@@ -481,9 +451,6 @@ static int meson_spicc_unprepare_transfer(struct spi_master *master)
 	/* Disable all IRQs */
 	writel(0, spicc->base + SPICC_INTREG);
 
-	/* Disable controller */
-	writel_bits_relaxed(SPICC_ENABLE, 0, spicc->base + SPICC_CONREG);
-
 	device_reset_optional(&spicc->pdev->dev);
 
 	return 0;
@@ -502,6 +469,152 @@ static void meson_spicc_cleanup(struct spi_device *spi)
 	spi->controller_state = NULL;
 }
 
+/*
+ * The Clock Mux
+ *            x-----------------x   x------------x    x------\
+ *        |---| pow2 fixed div  |---| pow2 div   |----|      |
+ *        |   x-----------------x   x------------x    |      |
+ * src ---|                                           | mux  |-- out
+ *        |   x-----------------x   x------------x    |      |
+ *        |---| enh fixed div   |---| enh div    |0---|      |
+ *            x-----------------x   x------------x    x------/
+ *
+ * Clk path for GX series:
+ *    src -> pow2 fixed div -> pow2 div -> out
+ *
+ * Clk path for AXG series:
+ *    src -> pow2 fixed div -> pow2 div -> mux -> out
+ *    src -> enh fixed div -> enh div -> mux -> out
+ */
+
+static int meson_spicc_clk_init(struct meson_spicc_device *spicc)
+{
+	struct device *dev = &spicc->pdev->dev;
+	struct clk_fixed_factor *pow2_fixed_div, *enh_fixed_div;
+	struct clk_divider *pow2_div, *enh_div;
+	struct clk_mux *mux;
+	struct clk_init_data init;
+	struct clk *clk;
+	struct clk_parent_data parent_data[2];
+	char name[64];
+
+	memset(&init, 0, sizeof(init));
+	memset(&parent_data, 0, sizeof(parent_data));
+
+	init.parent_data = parent_data;
+
+	/* algorithm for pow2 div: rate = freq / 4 / (2 ^ N) */
+
+	pow2_fixed_div = devm_kzalloc(dev, sizeof(*pow2_fixed_div), GFP_KERNEL);
+	if (!pow2_fixed_div)
+		return -ENOMEM;
+
+	snprintf(name, sizeof(name), "%s#pow2_fixed_div", dev_name(dev));
+	init.name = name;
+	init.ops = &clk_fixed_factor_ops;
+	init.flags = 0;
+	parent_data[0].hw = __clk_get_hw(spicc->core);
+	init.num_parents = 1;
+
+	pow2_fixed_div->mult = 1,
+	pow2_fixed_div->div = 4,
+	pow2_fixed_div->hw.init = &init;
+
+	clk = devm_clk_register(dev, &pow2_fixed_div->hw);
+	if (WARN_ON(IS_ERR(clk)))
+		return PTR_ERR(clk);
+
+	pow2_div = devm_kzalloc(dev, sizeof(*pow2_div), GFP_KERNEL);
+	if (!pow2_div)
+		return -ENOMEM;
+
+	snprintf(name, sizeof(name), "%s#pow2_div", dev_name(dev));
+	init.name = name;
+	init.ops = &clk_divider_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	parent_data[0].hw = &pow2_fixed_div->hw;
+	init.num_parents = 1;
+
+	pow2_div->shift = 16,
+	pow2_div->width = 3,
+	pow2_div->flags = CLK_DIVIDER_POWER_OF_TWO,
+	pow2_div->reg = spicc->base + SPICC_CONREG;
+	pow2_div->hw.init = &init;
+
+	clk = devm_clk_register(dev, &pow2_div->hw);
+	if (WARN_ON(IS_ERR(clk)))
+		return PTR_ERR(clk);
+
+	if (!spicc->data->has_enhance_clk_div) {
+		spicc->clk = clk;
+		return 0;
+	}
+
+	/* algorithm for enh div: rate = freq / 2 / (N + 1) */
+
+	enh_fixed_div = devm_kzalloc(dev, sizeof(*enh_fixed_div), GFP_KERNEL);
+	if (!enh_fixed_div)
+		return -ENOMEM;
+
+	snprintf(name, sizeof(name), "%s#enh_fixed_div", dev_name(dev));
+	init.name = name;
+	init.ops = &clk_fixed_factor_ops;
+	init.flags = 0;
+	parent_data[0].hw = __clk_get_hw(spicc->core);
+	init.num_parents = 1;
+
+	enh_fixed_div->mult = 1,
+	enh_fixed_div->div = 2,
+	enh_fixed_div->hw.init = &init;
+
+	clk = devm_clk_register(dev, &enh_fixed_div->hw);
+	if (WARN_ON(IS_ERR(clk)))
+		return PTR_ERR(clk);
+
+	enh_div = devm_kzalloc(dev, sizeof(*enh_div), GFP_KERNEL);
+	if (!enh_div)
+		return -ENOMEM;
+
+	snprintf(name, sizeof(name), "%s#enh_div", dev_name(dev));
+	init.name = name;
+	init.ops = &clk_divider_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	parent_data[0].hw = &enh_fixed_div->hw;
+	init.num_parents = 1;
+
+	enh_div->shift	= 16,
+	enh_div->width	= 8,
+	enh_div->reg = spicc->base + SPICC_ENH_CTL0;
+	enh_div->hw.init = &init;
+
+	clk = devm_clk_register(dev, &enh_div->hw);
+	if (WARN_ON(IS_ERR(clk)))
+		return PTR_ERR(clk);
+
+	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return -ENOMEM;
+
+	snprintf(name, sizeof(name), "%s#sel", dev_name(dev));
+	init.name = name;
+	init.ops = &clk_mux_ops;
+	parent_data[0].hw = &pow2_div->hw;
+	parent_data[1].hw = &enh_div->hw;
+	init.num_parents = 2;
+	init.flags = CLK_SET_RATE_PARENT;
+
+	mux->mask = 0x1,
+	mux->shift = 24,
+	mux->reg = spicc->base + SPICC_ENH_CTL0;
+	mux->hw.init = &init;
+
+	spicc->clk = devm_clk_register(dev, &mux->hw);
+	if (WARN_ON(IS_ERR(spicc->clk)))
+		return PTR_ERR(spicc->clk);
+
+	return 0;
+}
+
 static int meson_spicc_probe(struct platform_device *pdev)
 {
 	struct spi_master *master;
@@ -533,6 +646,10 @@ static int meson_spicc_probe(struct platform_device *pdev)
 		goto out_master;
 	}
 
+	/* Set master mode and enable controller */
+	writel_relaxed(SPICC_ENABLE | SPICC_MODE_MASTER,
+		       spicc->base + SPICC_CONREG);
+
 	/* Disable all IRQs */
 	writel_relaxed(0, spicc->base + SPICC_INTREG);
 
@@ -584,6 +701,12 @@ static int meson_spicc_probe(struct platform_device *pdev)
 
 	meson_spicc_oen_enable(spicc);
 
+	ret = meson_spicc_clk_init(spicc);
+	if (ret) {
+		dev_err(&pdev->dev, "clock registration failed\n");
+		goto out_master;
+	}
+
 	ret = devm_spi_register_master(&pdev->dev, master);
 	if (ret) {
 		dev_err(&pdev->dev, "spi master registration failed\n");
@@ -618,6 +741,7 @@ static const struct meson_spicc_data meson_spicc_gx_data = {
 
 static const struct meson_spicc_data meson_spicc_axg_data = {
 	.has_oen		= true,
+	.has_enhance_clk_div	= true,
 };
 
 static const struct of_device_id meson_spicc_of_match[] = {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
