Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD91C433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 11:31:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83B01214DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 11:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DlvjTPSI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cTCLdRly";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="ihT25jHU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83B01214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=KQZoAJZV0y43+F6gZF4w4Cv6i1zPHuJtwsBdoEHV+6g=; b=Dlv
	jTPSIhS5xybu2mmhQvkT5beH/NSJsVqYA70aL046iGa5ZH3Y1OcrJbfNrLKCie9LggYmEKKgdfXib
	HlmJIqd77Os2xXCOSKUkGFT0VczymxFHhrJDED+zGN929kJxtySm8BhIZ0ZIYGETYSvueb7f8R/lK
	KS7LU/CORErL9PkI6YI3G0tIwnaJ2ymxp7Lb48NJpavm4qByVyqbynbelT3tl+YbDibooXwxPj7HJ
	ZEtP1ayEgZpjEqxgXrGTbJZSy4boRKDzd7wOJNoPzXBl+6b6I1ptKJ6v/M012+L2nk6Ay0k2IrpU+
	+GbNIFe3NNdFqFZl4nm9X9jRbnC8HTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsmp9-0003lw-Or; Wed, 31 Jul 2019 11:31:15 +0000
Received: from merlin.infradead.org ([205.233.59.134])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsmo8-0001h6-Mc; Wed, 31 Jul 2019 11:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Message-Id:In-Reply-To:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cK1vz8+0xV+/8vIYWcrTtuW8y1HSMdiwgDBudDrZFN8=; b=cTCLdRlyBkBasXEwkgktE6NX8y
 TNVIkazF9LJxp+1yuP6mFecvrj31sR2DWWHtdInWTfcNEI171CZLlhxTc7pQXK4LzT/d7kaYLPNn4
 2g2+QpuExVo5B8hv4qfSy364JxjUZYK7FFI0ejflTGPaSFklRXZd1YyanTkQ4aaNKlHGaS5KqNXCr
 rS108C6TPVu3Jbc81y/HlDRqaiiv6jCHsgsYyReUmHccCpkSd7m7ezZRkzPm2RgFG0JZBsTXvEJqC
 kk5rqdh18a6xD6nPlLeP0PnZr1pz9gQbEhkq5oC694/bqI+NENmE1CoNstRXDQVzlIlEAkWO1oyB1
 B2ODC9qg==;
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsmo2-0001NT-N3; Wed, 31 Jul 2019 11:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=cK1vz8+0xV+/8vIYWcrTtuW8y1HSMdiwgDBudDrZFN8=; b=ihT25jHUakqo
 m+HFL4SyxvJXKRT/G8kxavz5W8YywsONCdMYHWemT134FPdywioslbidwAvOZXyu5Cp1Pk19YCwzV
 GCgoTvjM12/rEEBRqdoOdLXc5gX2JeDPOAGij7d6dbwCN9eeAPZvKuX9YgMpE0tCc+sCFCi0lU0vv
 fH66s=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmnf-0001lb-I1; Wed, 31 Jul 2019 11:29:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id EDB972742CC3; Wed, 31 Jul 2019 12:29:42 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Applied "ASoC: sun8i-codec: use devm_platform_ioremap_resource() to
 simplify code" to the asoc tree
In-Reply-To: <20190727150738.54764-35-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190731112942.EDB972742CC3@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:42 +0100 (BST)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
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
Cc: mripard@kernel.org, alsa-devel@alsa-project.org, olivier.moysan@st.com,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, paul@crapouillou.net,
 jcmvbkbc@gmail.com, thierry.reding@gmail.com, shawnguo@kernel.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, f.fainelli@gmail.com, khilman@baylibre.com,
 tiwai@suse.com, michal.simek@xilinx.com, jonathanh@nvidia.com,
 Hulk Robot <hulkci@huawei.com>, wens@csie.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 s.hauer@pengutronix.de, matthias.bgg@gmail.com, linux-xtensa@linux-xtensa.org,
 alexandre.torgue@st.com, yamada.masahiro@socionext.com, rjui@broadcom.com,
 robert.jarzmik@free.fr, haojian.zhuang@gmail.com, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, perex@perex.cz,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 baohua@kernel.org, timur@kernel.org, sbranden@broadcom.com, eric@anholt.net,
 gregkh@linuxfoundation.org, arnaud.pouliquen@st.com, lgirdwood@gmail.com,
 wahrenst@gmx.net, kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
 daniel@zonque.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: sun8i-codec: use devm_platform_ioremap_resource() to simplify code

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 790b36578e23264ff05be2ba8466ebcf7d3db38a Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 27 Jul 2019 23:07:38 +0800
Subject: [PATCH] ASoC: sun8i-codec: use devm_platform_ioremap_resource() to
 simplify code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190727150738.54764-35-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun8i-codec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 0e0e8ebaa571..55798bc8eae2 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -533,7 +533,6 @@ static const struct regmap_config sun8i_codec_regmap_config = {
 
 static int sun8i_codec_probe(struct platform_device *pdev)
 {
-	struct resource *res_base;
 	struct sun8i_codec *scodec;
 	void __iomem *base;
 	int ret;
@@ -556,8 +555,7 @@ static int sun8i_codec_probe(struct platform_device *pdev)
 		return PTR_ERR(scodec->clk_bus);
 	}
 
-	res_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res_base);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(&pdev->dev, "Failed to map the registers\n");
 		return PTR_ERR(base);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
