Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A411DC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 11:31:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A8D7206A3
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 11:31:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cZn+d8cz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="i/xJjDC1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="r9mBPI6m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A8D7206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=hBfy/HAGKOshTP3iZ5pgdKcYxpLA3YMYnTddZr/s5Us=; b=cZn
	+d8czspR6OPBls+t3fQRorqoK8oOqiqsecbPFpjZ1Ju+s+FMIdwxov8RS8ZJBdk1E0ka+B12m0TwB
	RYpEuBJF0UOGYi4BvRlzxY9cU+ycILDcEFzm9uleiu6zj8kU8YSz3mBySca4po7CLWWWRaCFE7gij
	eyBbNxJGtaCSD5snvOo896F1G9PD3j9Ld5K2nRdRNNaIwRClV3h3EMEf6xpDwrLy/YvDN8J4Vq5ae
	FlaRoafvvQKaIMNKTV+gB4zPdGDrkQpR5jyZ/LoT8eEVm/ZOo4Eg8HqLSR/t8lPBArSZJZ6q4C5HQ
	GUjfTdiIwmW36YpFU8icGFHR9kGsL5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsmp2-0003ZT-Ms; Wed, 31 Jul 2019 11:31:08 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsmo8-0001ZR-3S; Wed, 31 Jul 2019 11:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Message-Id:In-Reply-To:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x9Az2l9jRA1fvbltqAEskyHx15EQpvhr5JUZPqMPcJg=; b=i/xJjDC1HizgU85F63cVICEeN/
 92wYFgMZDkNRN0c6L4USDGhQNlVH1ixKpDOqg0psw/XF5SbSDVdYSbUAwGGUygYuAG2BLaeZGiqOs
 HGATgPS80a0j3dvJZG9Ei8l/44RyjAAF/yL6uOJGjpia5Yv53yg4j8GHQSp7rlXqNFnHV+gP/pj44
 A+wxrsaa3ReG8Zo0N9AN55y8UQy18lz1QWnZjO5EwO3hnyclIxF7QsNoS7rJ7AoMGs871ZoeYgkfc
 YQEwK7u/GdzZj04XNOJlmS6Ag7gblEmbPBNhOHEShUBFU4Nx7VAOCt87A/VtnXXD6K9T3gVJcEL2W
 L/0o1eoQ==;
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsmo3-0001Nc-Cr; Wed, 31 Jul 2019 11:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=x9Az2l9jRA1fvbltqAEskyHx15EQpvhr5JUZPqMPcJg=; b=r9mBPI6mq1Wt
 9wWcxy04DISQgMzTe9zjN17SICHierskov65a5G/KTGzIPfLYk6OdBqGBKCHjQx/7yuNoZErFaONO
 V34xTi/pyn0mJ38McNc0yybWE278vdQR+qmyytMH/MUuqGWupGkQrfmbWkiNlcMS3ZFiL3ZMZnePy
 8qAow=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmnl-0001ne-1i; Wed, 31 Jul 2019 11:29:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 339E92742C99; Wed, 31 Jul 2019 12:29:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Applied "ASoC: bcm2835-i2s: use devm_platform_ioremap_resource() to
 simplify code" to the asoc tree
In-Reply-To: <20190727150738.54764-10-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190731112948.339E92742C99@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:48 +0100 (BST)
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

   ASoC: bcm2835-i2s: use devm_platform_ioremap_resource() to simplify code

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

From d400b1b30cbff1c0962bbb3f895e839ccd120cb7 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 27 Jul 2019 23:07:13 +0800
Subject: [PATCH] ASoC: bcm2835-i2s: use devm_platform_ioremap_resource() to
 simplify code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190727150738.54764-10-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/bcm/bcm2835-i2s.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 5ef80f3d446a..e6a12e271b07 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -828,7 +828,6 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 {
 	struct bcm2835_i2s_dev *dev;
 	int ret;
-	struct resource *mem;
 	void __iomem *base;
 	const __be32 *addr;
 	dma_addr_t dma_base;
@@ -848,8 +847,7 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	}
 
 	/* Request ioarea */
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, mem);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
