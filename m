Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAE4C10DCE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 13:34:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FE2206E7
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 13:34:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PWl9fA/e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="v6+dB29X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55FE2206E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmGsOlaXEMd/ESihY3dXi7dNr+JC4buDqa6l9n5Npls=; b=PWl9fA/ec6XYUG
	GwyqZTc0e8T/rFQbjp/Aydqw6i9F4hlJzzSQbwFQbdQ+4MZ/gRY8H5vndA3Af5pjknuuUi6morITw
	kBgapBYrt7/p/W3+0rUopnuZsPNyfiXjy+guvgJBYmqPHVel+I6NKJ+8jtaJk6cIbumbWCd4eDpw1
	3254CBovvBqcCe44rfs5k3h2SAEmXQGpDsYhiGf7gW/i/aBiW/2my43bQ3nJ5aPVwisOzOMmAeBj2
	4og7vDCSBODTaeEGnbmfMW4Ru0faHwdekDlNetbGUp3XwOj92FsXoeEKFDA/AM890EPe4BJxJmbdY
	msE1VLN2jWR0wcwe2ckw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCNys-0006SJ-DL; Thu, 12 Mar 2020 13:34:34 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCNw9-0003Zv-Me
 for linux-amlogic@lists.infradead.org; Thu, 12 Mar 2020 13:31:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id a25so7509007wrd.0
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Mar 2020 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ysgTmW9ZLhpEDIjfoCrSPsioEcbHMMnVx5neQlx80G8=;
 b=v6+dB29Xyenrhk4NaFR7iQNJZSWzKs/Zq9VWJ4o/maiRmzn1FJJiRssz44fuqooP6z
 191ZSbVzN+ZfzSIMcwPPQ5izObfW1BF7Qk1QO8Gdpqyu7uiVRpID+pfhATIeu61fRmGX
 kJmfYt3XZagBYOUJGUxz0aiM80wIeM1ZYD9BbZT9fLoxsvQznfd9IKVaBUsszl/CQjnA
 WuRnGkJyY5H8Uz9p/gWzt0TDCrpVcEwZO7IbCEpc97w+PuG4jmHk8im0QEqo9Ear0Ipo
 2LQYb9VSrQqme4gk+K3GF1vbgfQsT9Y5pb7YOCsSw/Bb09uhhP4njCzkH0K6vC5R/JMv
 9ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ysgTmW9ZLhpEDIjfoCrSPsioEcbHMMnVx5neQlx80G8=;
 b=WHljE5NFwjyas8x+EoWDYF96KrgIninrkYbRuWBwzEiu5VsJ13MK/yj+P93iQ/SFqH
 RKjE+9QuJoerAW0TKN/YV8CIn1uJjGUJ90Uyd7gWM0pCYiJQhGiHrghIvnTwwCjuMdr1
 TSUkppPApvpVLtluH0pQl76G5Iv/Zq7tDONhBY6Vuc3x5IRHWeK+Pm/enEI34SndBsWO
 kHwe+/KIAiJHhXlydK6lz20lGe26lLB1wKruvqdrMiii4xTky4gNglY0crDf9XIdx1CM
 4fdS150dhmDP9A67hQ/A/BG0Ar6NYPwCJNYyiGDMmQNB+6HW290F7Q5D3nkok/uBJxkd
 /rAw==
X-Gm-Message-State: ANhLgQ2JdqMAyiHV3W0XJEo1HEECDb+ZDmEbj5GMgH1MCI9MpIpIs7Lr
 s1fnelUqZ5pn2gd6M4OmF6XMhQ==
X-Google-Smtp-Source: ADFU+vurnjaYzt7zIZenRaisc19C05PAgySImkcj7ODdYzNCIV8i6gly0uLMljAD0nLyCFdeF3tr6Q==
X-Received: by 2002:adf:94c2:: with SMTP id 60mr11120426wrr.396.1584019903410; 
 Thu, 12 Mar 2020 06:31:43 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m21sm12242885wmi.27.2020.03.12.06.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 06:31:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: broonie@kernel.org
Subject: [PATCH 9/9] spi: meson-spicc: add support for Amlogic G12A
Date: Thu, 12 Mar 2020 14:31:31 +0100
Message-Id: <20200312133131.26430-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200312133131.26430-1-narmstrong@baylibre.com>
References: <20200312133131.26430-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_063145_856699_13AEA45F 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the SPICC controllers on the Amlogic G12A SoCs family.

The G12A SPICC controllers inherit from the AXG enhanced registers but
takes an external pclk for the baud rate generator and can achieve up to
166MHz SCLK.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
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
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
