Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15608C35242
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 20:56:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4D12222C2
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 20:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hP3tecAE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4D12222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=6e0vmrxvYSvvOw5/tVrN0jMNkEHADvNY3cVFTHBiBxA=; b=hP3
	tecAEZUG6wG0U0TFdQRwayaUUOFZHXWut7sOjwN5tqUL26XCQTIAFuZKkIsohUgvrsWRi9MXnYoQq
	TzxVDR4V+PEm/q+bLNDcRulQWnBiA+GlZW2DXt6WBgjfPIiPN/TJV5eix6YrQ2tU2kENIKgt1OsJx
	sGQDoztfjYnFSdGsjocBD/XyE/aRZnOYzot9/4AG66rGkDFV2T+yI1vxvh/Nv56urmcEfn4iom61M
	GbAQ2QFT80DDNbp3VDqWRGYU6FB4EI/657Vx2Y09m2JLP4Skr2xt80rSnKIQNBPBYHXRCs//sf5y0
	YuMXjZCUp1DgXs+g/Cm1h1d61Xio4ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2i0l-0002Es-Fz; Fri, 14 Feb 2020 20:56:31 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2i0i-0002D1-RK
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 20:56:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8681930E;
 Fri, 14 Feb 2020 12:56:27 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A7363F68F;
 Fri, 14 Feb 2020 12:56:26 -0800 (PST)
Date: Fri, 14 Feb 2020 20:56:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: aiu: fix irq registration" to the asoc tree
In-Reply-To: <20200214131350.337968-4-jbrunet@baylibre.com>
Message-Id: <applied-20200214131350.337968-4-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_125628_937276_794F59A7 
X-CRM114-Status: GOOD (  15.89  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild test robot <lkp@intel.com>, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: meson: aiu: fix irq registration

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

From 6e700f0672199f773ad645c2b7e886c1d2e2046e Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 14 Feb 2020 14:13:48 +0100
Subject: [PATCH] ASoC: meson: aiu: fix irq registration

The aiu stored the irq in an unsigned integer which may have discarded an
error returned by platform_get_irq_byname(). This is incorrect and should
have been a signed integer.

Also drop the irq error traces from the probe function as this is already
done by platform_get_irq_byname().

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200214131350.337968-4-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/aiu.c | 8 ++------
 sound/soc/meson/aiu.h | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index de678a9d5cab..34b40b8b8299 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -314,16 +314,12 @@ static int aiu_probe(struct platform_device *pdev)
 	}
 
 	aiu->i2s.irq = platform_get_irq_byname(pdev, "i2s");
-	if (aiu->i2s.irq < 0) {
-		dev_err(dev, "Can't get i2s irq\n");
+	if (aiu->i2s.irq < 0)
 		return aiu->i2s.irq;
-	}
 
 	aiu->spdif.irq = platform_get_irq_byname(pdev, "spdif");
-	if (aiu->spdif.irq < 0) {
-		dev_err(dev, "Can't get spdif irq\n");
+	if (aiu->spdif.irq < 0)
 		return aiu->spdif.irq;
-	}
 
 	ret = aiu_clk_get(dev);
 	if (ret)
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index a65a576e3400..097c26de7b7c 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -26,7 +26,7 @@ enum aiu_clk_ids {
 struct aiu_interface {
 	struct clk_bulk_data *clks;
 	unsigned int clk_num;
-	unsigned int irq;
+	int irq;
 };
 
 struct aiu {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
