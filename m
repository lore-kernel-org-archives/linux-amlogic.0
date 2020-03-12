Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFCCC10DCE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 17:39:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D6F2067C
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 17:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4Wsw0CD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D6F2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=fkwy9ZrINGa56xZsnQBWyUeiwVm/4i4NSMih8PrhSzI=; b=l4W
	sw0CDiZECzDCcrvvqDvTLIi66Z9uZ3Rs+dXZGo10stgOSCwz09NyIvnUli0OuPTz0i4deZ7w/pXqM
	redsTuZWT0djfGau+cu2o7UpLRbVr28D3PA/nK1Xw84TGxbcVXRaTuZBxUM4fs13KoevCI0MNxhh+
	m+FJ/EqDdavoTlo5UKSvqRuQBf6tR9/GZMCZb3G/q32yBfbJSQxEmrRYaEzIGNp6w+IdW5KYCwgBU
	YIZpS1MuXlKcO9BEaQEesYaN4+zjpuirq9x4AGElfG5GGffC8ZZLA8vRxO7KfFdNaOb7mxuBqSH+4
	U3YoNXGqjldKhSGfwgrxEGZXO8Acu0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCRnd-0003Ws-M6; Thu, 12 Mar 2020 17:39:13 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCRnT-0003K5-7w; Thu, 12 Mar 2020 17:39:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25CBD30E;
 Thu, 12 Mar 2020 10:39:02 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C7843F6CF;
 Thu, 12 Mar 2020 10:39:01 -0700 (PDT)
Date: Thu, 12 Mar 2020 17:39:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Applied "spi: meson-spicc: add support for Amlogic G12A" to the spi
 tree
In-Reply-To: <20200312133131.26430-10-narmstrong@baylibre.com>
Message-Id: <applied-20200312133131.26430-10-narmstrong@baylibre.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_103903_374870_73AD5A57 
X-CRM114-Status: GOOD (  18.90  )
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
Cc: linux-amlogic@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   spi: meson-spicc: add support for Amlogic G12A

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 4e3d322058a5e5afda100005a94ec7f0bf509d43 Mon Sep 17 00:00:00 2001
From: Neil Armstrong <narmstrong@baylibre.com>
Date: Thu, 12 Mar 2020 14:31:31 +0100
Subject: [PATCH] spi: meson-spicc: add support for Amlogic G12A

Add support for the SPICC controllers on the Amlogic G12A SoCs family.

The G12A SPICC controllers inherit from the AXG enhanced registers but
takes an external pclk for the baud rate generator and can achieve up to
166MHz SCLK.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lore.kernel.org/r/20200312133131.26430-10-narmstrong@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-meson-spicc.c | 54 +++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 351ccd8dd2c2..77f7d0e0e46a 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -147,6 +147,7 @@ struct meson_spicc_data {
 	unsigned int			fifo_size;
 	bool				has_oen;
 	bool				has_enhance_clk_div;
+	bool				has_pclk;
 };
 
 struct meson_spicc_device {
@@ -154,6 +155,7 @@ struct meson_spicc_device {
 	struct platform_device		*pdev;
 	void __iomem			*base;
 	struct clk			*core;
+	struct clk			*pclk;
 	struct clk			*clk;
 	struct spi_message		*message;
 	struct spi_transfer		*xfer;
@@ -514,6 +516,10 @@ static void meson_spicc_cleanup(struct spi_device *spi)
  * Clk path for AXG series:
  *    src -> pow2 fixed div -> pow2 div -> mux -> out
  *    src -> enh fixed div -> enh div -> mux -> out
+ *
+ * Clk path for G12A series:
+ *    pclk -> pow2 fixed div -> pow2 div -> mux -> out
+ *    pclk -> enh fixed div -> enh div -> mux -> out
  */
 
 static int meson_spicc_clk_init(struct meson_spicc_device *spicc)
@@ -542,7 +548,10 @@ static int meson_spicc_clk_init(struct meson_spicc_device *spicc)
 	init.name = name;
 	init.ops = &clk_fixed_factor_ops;
 	init.flags = 0;
-	parent_data[0].hw = __clk_get_hw(spicc->core);
+	if (spicc->data->has_pclk)
+		parent_data[0].hw = __clk_get_hw(spicc->pclk);
+	else
+		parent_data[0].hw = __clk_get_hw(spicc->core);
 	init.num_parents = 1;
 
 	pow2_fixed_div->mult = 1,
@@ -589,7 +598,10 @@ static int meson_spicc_clk_init(struct meson_spicc_device *spicc)
 	init.name = name;
 	init.ops = &clk_fixed_factor_ops;
 	init.flags = 0;
-	parent_data[0].hw = __clk_get_hw(spicc->core);
+	if (spicc->data->has_pclk)
+		parent_data[0].hw = __clk_get_hw(spicc->pclk);
+	else
+		parent_data[0].hw = __clk_get_hw(spicc->core);
 	init.num_parents = 1;
 
 	enh_fixed_div->mult = 1,
@@ -648,7 +660,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 {
 	struct spi_master *master;
 	struct meson_spicc_device *spicc;
-	int ret, irq, rate;
+	int ret, irq;
 
 	master = spi_alloc_master(&pdev->dev, sizeof(*spicc));
 	if (!master) {
@@ -697,12 +709,26 @@ static int meson_spicc_probe(struct platform_device *pdev)
 		goto out_master;
 	}
 
+	if (spicc->data->has_pclk) {
+		spicc->pclk = devm_clk_get(&pdev->dev, "pclk");
+		if (IS_ERR(spicc->pclk)) {
+			dev_err(&pdev->dev, "pclk clock request failed\n");
+			ret = PTR_ERR(spicc->pclk);
+			goto out_master;
+		}
+	}
+
 	ret = clk_prepare_enable(spicc->core);
 	if (ret) {
 		dev_err(&pdev->dev, "core clock enable failed\n");
 		goto out_master;
 	}
-	rate = clk_get_rate(spicc->core);
+
+	ret = clk_prepare_enable(spicc->pclk);
+	if (ret) {
+		dev_err(&pdev->dev, "pclk clock enable failed\n");
+		goto out_master;
+	}
 
 	device_reset_optional(&pdev->dev);
 
@@ -715,6 +741,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 				     SPI_BPW_MASK(8);
 	master->flags = (SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX);
 	master->min_speed_hz = spicc->data->min_speed_hz;
+	master->max_speed_hz = spicc->data->max_speed_hz;
 	master->setup = meson_spicc_setup;
 	master->cleanup = meson_spicc_cleanup;
 	master->prepare_message = meson_spicc_prepare_message;
@@ -722,10 +749,6 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	master->transfer_one = meson_spicc_transfer_one;
 	master->use_gpio_descriptors = true;
 
-	/* Setup max rate according to the Meson datasheet */
-	master->max_speed_hz = min_t(unsigned int, rate >> 1,
-				     spicc->data->max_speed_hz);
-
 	meson_spicc_oen_enable(spicc);
 
 	ret = meson_spicc_clk_init(spicc);
@@ -744,6 +767,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 
 out_clk:
 	clk_disable_unprepare(spicc->core);
+	clk_disable_unprepare(spicc->pclk);
 
 out_master:
 	spi_master_put(master);
@@ -759,6 +783,7 @@ static int meson_spicc_remove(struct platform_device *pdev)
 	writel(0, spicc->base + SPICC_CONREG);
 
 	clk_disable_unprepare(spicc->core);
+	clk_disable_unprepare(spicc->pclk);
 
 	return 0;
 }
@@ -777,6 +802,15 @@ static const struct meson_spicc_data meson_spicc_axg_data = {
 	.has_enhance_clk_div	= true,
 };
 
+static const struct meson_spicc_data meson_spicc_g12a_data = {
+	.max_speed_hz		= 166666666,
+	.min_speed_hz		= 50000,
+	.fifo_size		= 15,
+	.has_oen		= true,
+	.has_enhance_clk_div	= true,
+	.has_pclk		= true,
+};
+
 static const struct of_device_id meson_spicc_of_match[] = {
 	{
 		.compatible	= "amlogic,meson-gx-spicc",
@@ -786,6 +820,10 @@ static const struct of_device_id meson_spicc_of_match[] = {
 		.compatible = "amlogic,meson-axg-spicc",
 		.data		= &meson_spicc_axg_data,
 	},
+	{
+		.compatible = "amlogic,meson-g12a-spicc",
+		.data		= &meson_spicc_g12a_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, meson_spicc_of_match);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
