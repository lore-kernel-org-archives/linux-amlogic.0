Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FC5C43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 20:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE802176D
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 20:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWNY1UUU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE802176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=BPvp8bguj8TbFXgBU75wPxA/4pot/HZ/MuyQxIxukgQ=; b=iWN
	Y1UUU1+uUfi1nvAI1i7KSGPhiEsl5FwYFjbQohJJTHVzqNBE+8hFdxnYj+SH4KTKHC40iP04GDvAf
	/cbVl2f1F6x7FcDKmzJAHBIvZZc+JvZcf54AbD9U46njvDs/F4znJ7XTGzORgYaeTd1pe46SWiqVr
	JqAnfwGkRAjcG0ap+de1l3cKUNYGhqX3/0KIdKawoIhHcTX6kd3LDHHJKr1d78APC7PspOaeo2oYO
	3ZHbHCGT205PXNuuAkocBdAdqMEvYG22lWyKK+fN/99FcuFZRKeUPVih5qnpG318PwwDH6TAHcFhj
	JSTGvKm+obztU7l2RB3TvK3qNmUOgug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihfZl-0006RF-Gn; Wed, 18 Dec 2019 20:05:41 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihfZj-0006QU-5P
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 20:05:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CD7311B3;
 Wed, 18 Dec 2019 12:05:38 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FC0D3F67D;
 Wed, 18 Dec 2019 12:05:37 -0800 (PST)
Date: Wed, 18 Dec 2019 20:05:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: axg-fifo: relax period size constraints" to the
 asoc tree
In-Reply-To: <20191218172420.1199117-5-jbrunet@baylibre.com>
Message-Id: <applied-20191218172420.1199117-5-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_120539_292222_9EFB7884 
X-CRM114-Status: GOOD (  14.15  )
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
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: meson: axg-fifo: relax period size constraints

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 42b5ac832b0c3bf5b0bf98ea6d99efa5fb5d5075 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 18 Dec 2019 18:24:20 +0100
Subject: [PATCH] ASoC: meson: axg-fifo: relax period size constraints

Now that the fifo depths and thresholds are properly in the axg-fifo
driver, we can relax the constraints on period. As long as the period is a
multiple of the fifo burst size (8 bytes) things should be OK.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20191218172420.1199117-5-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-fifo.c | 8 ++++----
 sound/soc/meson/axg-fifo.h | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index c2742a02d866..c12b0d5e8ebf 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -34,7 +34,7 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 	.rate_max = 192000,
 	.channels_min = 1,
 	.channels_max = AXG_FIFO_CH_MAX,
-	.period_bytes_min = AXG_FIFO_MIN_DEPTH,
+	.period_bytes_min = AXG_FIFO_BURST,
 	.period_bytes_max = UINT_MAX,
 	.periods_min = 2,
 	.periods_max = UINT_MAX,
@@ -227,17 +227,17 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 
 	/*
 	 * Make sure the buffer and period size are multiple of the FIFO
-	 * minimum depth size
+	 * burst
 	 */
 	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-					 AXG_FIFO_MIN_DEPTH);
+					 AXG_FIFO_BURST);
 	if (ret)
 		return ret;
 
 	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
-					 AXG_FIFO_MIN_DEPTH);
+					 AXG_FIFO_BURST);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index 521b54e98fd3..b63acd723c87 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -31,8 +31,6 @@ struct snd_soc_pcm_runtime;
 					 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
 #define AXG_FIFO_BURST			8
-#define AXG_FIFO_MIN_CNT		64
-#define AXG_FIFO_MIN_DEPTH		(AXG_FIFO_BURST * AXG_FIFO_MIN_CNT)
 
 #define FIFO_INT_ADDR_FINISH		BIT(0)
 #define FIFO_INT_ADDR_INT		BIT(1)
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
