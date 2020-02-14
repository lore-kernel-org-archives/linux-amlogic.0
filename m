Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB5BC3F68F
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 20:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED9D222C2
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 20:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UYqO1sE8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED9D222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=uRNBwivRzAfSqBcbCfc5553jGrl8nnhMEuzV4W7fRzA=; b=UYq
	O1sE8BG7ytCIvhLHIOnpHBuzjF+hOyEe+IVAC1FPUnKvQvHXWkrwuZSPULj03avCRsJtPu6Hrbj/I
	teQdsAdxQDYo7gDriBybVPUM+2b2fjo3LZnk/f5Ms9lP/bw1+pA31l+j4YOPDfg3iAc0QAheHyIF/
	fwLzfY/SpP0KUXK9Xs3pY1K8b0OaCk6af8+INpoNc39CkRCc3Mo3rF2NwRHUXkW/WrFC0CgJtmy9V
	1CaCKxfWmGf/X77PZdb56NOlE8XLvCMeu0z/PWtHpGgiGCWZ8Ouvbh8YNob50uefi2vRzmGw0yt6c
	V0zxF2yZM+CzLHOFAzHTB72esiQbQ1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2i0f-00029t-21; Fri, 14 Feb 2020 20:56:25 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2i0c-00028v-JK
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 20:56:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6467E30E;
 Fri, 14 Feb 2020 12:56:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D73A53F68F;
 Fri, 14 Feb 2020 12:56:17 -0800 (PST)
Date: Fri, 14 Feb 2020 20:56:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: codec-glue: fix pcm format cast warning" to the
 asoc tree
In-Reply-To: <20200214131350.337968-6-jbrunet@baylibre.com>
Message-Id: <applied-20200214131350.337968-6-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_125622_681625_B4A25CC2 
X-CRM114-Status: GOOD (  13.93  )
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

   ASoC: meson: codec-glue: fix pcm format cast warning

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

From 3cd23f021e2e5f3350125abcb39f12430df87d06 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 14 Feb 2020 14:13:50 +0100
Subject: [PATCH] ASoC: meson: codec-glue: fix pcm format cast warning

Clarify the cast of snd_pcm_format_t and fix the sparse warning:
restricted snd_pcm_format_t degrades to integer

Fixes: 9c29fd9bdf92 ("ASoC: meson: g12a: extract codec-to-codec utils")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200214131350.337968-6-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/meson-codec-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index 97bbc967e176..524a33472337 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -74,7 +74,7 @@ int meson_codec_glue_input_hw_params(struct snd_pcm_substream *substream,
 	data->params.rates = snd_pcm_rate_to_rate_bit(params_rate(params));
 	data->params.rate_min = params_rate(params);
 	data->params.rate_max = params_rate(params);
-	data->params.formats = 1 << params_format(params);
+	data->params.formats = 1ULL << (__force int) params_format(params);
 	data->params.channels_min = params_channels(params);
 	data->params.channels_max = params_channels(params);
 	data->params.sig_bits = dai->driver->playback.sig_bits;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
