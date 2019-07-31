Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9A5C433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 11:30:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F61D208E4
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 11:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q+uSB6ac";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="TZ07R/Bq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F61D208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=lQtIVgwZ561zDa/eVhOMFYsHOl26SbtMmjtE2RU/fRg=; b=Q+u
	SB6acRpG+3XyNd0RMrwslYN1C2m422XQ7fFtYGVOju/amR16pA9rB3es0TGm4gRVmrdLmWCnGs6Xm
	IH4kP5BJogldW3+MNKXbb8qmAGn86cqK3tjz4cWZpOUDPNVg51LO0afUzpAp7bEreNedrIjB4xApZ
	+ac11Fz2KJOJv9G/D2oS+KTQsG+f2W6kydrQH28b7lHAJXAi1q5XYHU6AIwqVMN5JuJNQr2u+UauY
	wfKxKSG1T8mfA/WFVxHXjGDM+Aohs4UmHgzqVx6Y8CuzUfGuVtZBMWrcwOXdaeClYG7Vm0DzQLpPH
	7Yp+CT94WoZsNK8lLzB3kwJsDNnrukw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsmoP-0002WS-0p; Wed, 31 Jul 2019 11:30:29 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsmnv-0000rn-HK; Wed, 31 Jul 2019 11:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PdT/eIhyr6y3H0l5rgN8DPLYN6B+GE6VkE6u1jqDo4M=; b=TZ07R/Bq7JWG
 Ug2noyqlEHi+TCjSinpappZdtelQXXTyvbK6HZcYFXfRlljPKDvtVgXjP/llSeESoLlOCz0StuOsP
 FyV+rxxYGy6DNICaVt50U83yMZmtA6sOxnRx/vk/uDnHFmbCie3Z1kPaBA8INm45YgOOwpr5gwiHO
 n1b4k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmnf-0001lY-2E; Wed, 31 Jul 2019 11:29:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8BDF32742C99; Wed, 31 Jul 2019 12:29:42 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Applied "ASoC: stm32: sai: use devm_platform_ioremap_resource() to
 simplify code" to the asoc tree
In-Reply-To: <20190727150738.54764-16-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190731112942.8BDF32742C99@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:42 +0100 (BST)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_042959_598902_61B833B2 
X-CRM114-Status: GOOD (  12.30  )
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

   ASoC: stm32: sai: use devm_platform_ioremap_resource() to simplify code

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

From 1c63223cda84fb10643938e4e4eb02110f8ae9a2 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 27 Jul 2019 23:07:19 +0800
Subject: [PATCH] ASoC: stm32: sai: use devm_platform_ioremap_resource() to
 simplify code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190727150738.54764-16-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_sai.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index 63f68e663676..1ac5103cea78 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -152,7 +152,6 @@ static int stm32_sai_probe(struct platform_device *pdev)
 {
 	struct stm32_sai_data *sai;
 	struct reset_control *rst;
-	struct resource *res;
 	const struct of_device_id *of_id;
 	u32 val;
 	int ret;
@@ -161,8 +160,7 @@ static int stm32_sai_probe(struct platform_device *pdev)
 	if (!sai)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	sai->base = devm_ioremap_resource(&pdev->dev, res);
+	sai->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sai->base))
 		return PTR_ERR(sai->base);
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
