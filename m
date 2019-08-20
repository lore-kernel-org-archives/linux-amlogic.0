Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC40C3A59E
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 09:46:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12EA622CF7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 09:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jOg4PK4T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Sc66PKmn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12EA622CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNdsojZQ6t9zEZR8GF7rmVy3AQyW59mj8KEpqoePaxg=; b=jOg4PK4TKQWw3r
	dGEQPq4Xyh67utsqfCgBaK0fdMPbcfo5VMpaQ13E/I2nFcRmVElBAhMweviGalwX2GKD6koUCLGQH
	LGYSo3okSTPRMXVMpo0Bp7164ocFc34agHDgLn09nGZY8eYb+ZUm+p4kopg8rHcPK9Nt9QOlBQvN9
	E+/SbnBTbgDSF+7ej1OydNLNtqRNJLRZZ8pB/jzYdRz1hezULyh7JI39Zqi493agPFa9OTDx2uswG
	sgujDv8aHRu0kXXphshO+ldLw6i0n+YHFH4qjPXkKMNsFVCBsSQC/6B6beejZD7xkzP3yTMLWiLQ6
	lrkjyu/tl3wv73vYGgpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i00it-0002sO-Vz; Tue, 20 Aug 2019 09:46:40 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i00in-0002oC-2I
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 09:46:34 +0000
Received: by mail-wr1-x442.google.com with SMTP id q12so11663807wrj.12
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OCqVb1b3ky6iQzAtUB0i7OFFbduthR84Csc9ahGaOQU=;
 b=Sc66PKmnhvSczvFG4A+2IsY4y788+71RHz17he6fqbGBB7lV2eetN+bT1iC6s+Nt+I
 oJASVWmdfkn7D49IDGS3xpbFWAe29TgnxL50murfoXlijNtsx86Ii1AdRSK/WoGfEIOb
 5DSIIYeFO6ud7bPIe6OaDxaPP6l8lGhXajospvzpWeUst3j1/MMgVdsO2QO0NrRIh7dl
 ACu8TT71vzZ4AIRTucs2hPUGGUzWHSyV68rlhNpZHwXoRRZFm+1G3VoPkwmFsvQj8XcO
 MKxIW4NC7LyvMlfcU3kHRADKDeuleLnsmwJ+AEf38aMAW9o8qZhQdbm1N9KPMY40XrAS
 uT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCqVb1b3ky6iQzAtUB0i7OFFbduthR84Csc9ahGaOQU=;
 b=XZitW/h/ErkYH+2AHJpw53nH1xrfcmlJAtNOEEQtPqOEWGrj6bMKJ9kldNDYz5pW3j
 F0LV2gNwlpYP+bug20ihlXPjLXZpzozTL0RL2aiEz4snP92ezkhq3mCMAhAsFrU7RxTa
 ibTFA9zrfJd4Dzkt/xbt4bmnQdvVBg7ycHAZk/Ak3jK4ZCy4V2A4QSlei/cGLfvJtKWT
 BcLa5Wc0MPnjRogSKKmyTv0WM5dC6CobrWpQZ7C27xnSBN8tO6GeeTxe/ryvIhptCR6I
 B+HG4ahZMX5/7FyiwAFRt3870w0NNUodKPU38kZsf897jL1v5koSG7kC3FwD4xz5x+eN
 2MYg==
X-Gm-Message-State: APjAAAVAN5LfmP7RndEATY14+52GpP1XnGDr5Tjl+5UiJMoPT1cwm94Y
 NUhgB9PNDTHdpSXCLYREkG24ZA==
X-Google-Smtp-Source: APXvYqw3tlq5yvBtrHDp0eeORLI4XXpzdTgTQ9X/0q31O3NVubVX/vqO+if/abH98mEREbLMHw7SNQ==
X-Received: by 2002:a5d:6ad0:: with SMTP id u16mr33820477wrw.84.1566294391450; 
 Tue, 20 Aug 2019 02:46:31 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id o17sm15958305wrx.60.2019.08.20.02.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 02:46:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] reset: meson-audio-arb: add sm1 support
Date: Tue, 20 Aug 2019 11:46:25 +0200
Message-Id: <20190820094625.13455-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820094625.13455-1-jbrunet@baylibre.com>
References: <20190820094625.13455-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_024633_104927_D3D6653C 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the new arb reset lines of the SM1 SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson-audio-arb.c | 28 ++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/reset-meson-audio-arb.c
index c53a2185a039..72d29dbca45a 100644
--- a/drivers/reset/reset-meson-audio-arb.c
+++ b/drivers/reset/reset-meson-audio-arb.c
@@ -30,6 +30,17 @@ static const unsigned int axg_audio_arb_reset_bits[] = {
 	[AXG_ARB_FRDDR_C]	= 6,
 };
 
+static const unsigned int sm1_audio_arb_reset_bits[] = {
+	[AXG_ARB_TODDR_A]	= 0,
+	[AXG_ARB_TODDR_B]	= 1,
+	[AXG_ARB_TODDR_C]	= 2,
+	[AXG_ARB_FRDDR_A]	= 4,
+	[AXG_ARB_FRDDR_B]	= 5,
+	[AXG_ARB_FRDDR_C]	= 6,
+	[AXG_ARB_TODDR_D]	= 3,
+	[AXG_ARB_FRDDR_D]	= 7,
+};
+
 static int meson_audio_arb_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
@@ -82,8 +93,14 @@ static const struct reset_control_ops meson_audio_arb_rstc_ops = {
 };
 
 static const struct of_device_id meson_audio_arb_of_match[] = {
-	{ .compatible = "amlogic,meson-axg-audio-arb", },
-	{}
+	{
+		.compatible = "amlogic,meson-axg-audio-arb",
+		.data = axg_audio_arb_reset_bits,
+	},
+	{
+		.compatible = "amlogic,meson-sm1-audio-arb",
+		.data = sm1_audio_arb_reset_bits
+	}, {}
 };
 MODULE_DEVICE_TABLE(of, meson_audio_arb_of_match);
 
@@ -104,10 +121,15 @@ static int meson_audio_arb_remove(struct platform_device *pdev)
 static int meson_audio_arb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const unsigned int *data;
 	struct meson_audio_arb_data *arb;
 	struct resource *res;
 	int ret;
 
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
 	arb = devm_kzalloc(dev, sizeof(*arb), GFP_KERNEL);
 	if (!arb)
 		return -ENOMEM;
@@ -126,7 +148,7 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
 		return PTR_ERR(arb->regs);
 
 	spin_lock_init(&arb->lock);
-	arb->reset_bits = axg_audio_arb_reset_bits;
+	arb->reset_bits = data;
 	arb->rstc.nr_resets = ARRAY_SIZE(axg_audio_arb_reset_bits);
 	arb->rstc.ops = &meson_audio_arb_rstc_ops;
 	arb->rstc.of_node = dev->of_node;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
