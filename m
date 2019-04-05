Return-Path: <SRS0=88k6=SH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BD8C4360F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 02:43:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36D602171F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 02:43:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZX3xpxs7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="ApCyJIUT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36D602171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=kSdcxPcSAexVfBTegJ0gJ5cdg+CLlx6zDkJjzuYB9II=; b=ZX3
	xpxs7hRU5NLGv4QBOs1NS/fW0oxy5EIDtbRoTH+sHG3WvIRSt3eloyF6PAa5tB9dPZo8DzrNjIXHY
	oOBmZhH3YvGekD4O76zgustjRCxnI5NNYc3DGZCN5hMgVBNWY4fSWhgFIn2R4dhpjg09hgv0duXlr
	6HC4Qnbp+GJxQF3VFM0cFKnO7DaZXbRxG4IEvwPguiMGh8zU6yNcLFORRbdhsdjVlzUqQWxPan3IC
	LY2r7EzhIiUCiSQFnoVJ/Kq90qhImuuk17M7rFK8+TrQfbxwgLkvEdohs8UWiEu8YQ5O2vPGgrYlb
	WZTqK7GMqf21/q6aJGcGf+SlAs7u0mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCEp7-0006Y2-Fa; Fri, 05 Apr 2019 02:43:21 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCEp3-0006X1-JF
 for linux-amlogic@lists.infradead.org; Fri, 05 Apr 2019 02:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=3Adxfw4V9KYe6gzscEgCxBTHFk+e9nP7+1yN6ci5ptw=; b=ApCyJIUTxj8O
 4Qkbo0t0OuwspQTuDYNIuW1VqqkS1TBSpbHBFUct6Gwf2DLz6dn+vnu2tKLFI99pnnZBquEpK7qtR
 sFPYQXKUkR/DUCGZwuOVYTgNxrZCntaCTYgb+LR947VDV8Oeo/aldKrLv7ZPS9P2ceXnwKyA2WYsA
 FNHZ8=;
Received: from [147.50.13.10] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hCEou-0005E7-Jx; Fri, 05 Apr 2019 02:43:08 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 05F38441D3B; Fri,  5 Apr 2019 09:43:06 +0700 (+07)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: axg-tdmout: add g12a support" to the asoc tree
In-Reply-To: <20190404111733.28705-7-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190405024306.05F38441D3B@finisterre.ee.mobilebroadband>
Date: Fri,  5 Apr 2019 09:43:05 +0700 (+07)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_194317_783385_722E780F 
X-CRM114-Status: GOOD (  10.72  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: meson: axg-tdmout: add g12a support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From aa191a37b801be6c5abebe77e67dcec7c5c0faee Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 4 Apr 2019 13:17:33 +0200
Subject: [PATCH] ASoC: meson: axg-tdmout: add g12a support

The axg tdmout driver just need a different skew offset to operate
correctly on the g12a SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-tdmout.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 3984818e2a7c..527bfc4487e0 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -243,10 +243,23 @@ static const struct axg_tdm_formatter_driver axg_tdmout_drv = {
 	},
 };
 
+static const struct axg_tdm_formatter_driver g12a_tdmout_drv = {
+	.component_drv	= &axg_tdmout_component_drv,
+	.regmap_cfg	= &axg_tdmout_regmap_cfg,
+	.ops		= &axg_tdmout_ops,
+	.quirks		= &(const struct axg_tdm_formatter_hw) {
+		.invert_sclk = true,
+		.skew_offset = 2,
+	},
+};
+
 static const struct of_device_id axg_tdmout_of_match[] = {
 	{
 		.compatible = "amlogic,axg-tdmout",
 		.data = &axg_tdmout_drv,
+	}, {
+		.compatible = "amlogic,g12a-tdmout",
+		.data = &g12a_tdmout_drv,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_tdmout_of_match);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
