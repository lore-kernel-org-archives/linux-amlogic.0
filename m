Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C91C76190
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:43:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D49A422BEF
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U8XtJOTU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="Lys2mjZW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D49A422BEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=CzLVlvjz20WpvfypESNswGBUF0Qagwz6vPLYEAajHRI=; b=U8X
	tJOTUTHiUnhN2b+Y2bH3dSqRH+FyiZ+KqZc4G9/uExBgwEEfAdIudHfzylEMdthGj68HtnQkSM4XG
	Iipb+Eh0mWowitXkyV7JD/GOja+OCfoAwU6dE0CyMDJSdWhhRaDMtUTSL8tdUPROP0yqRHaisCgHk
	NgXiEH8/OeL5V2dYLBcCX7P8aqAT078W65XGvnVg7lRIDhi0gLbkmupELhasuwPHbeHdA2P+kr3TM
	dDp3rOO4D5vXOwF+gxEiUhruUWs4Ova+pzPQNVS0EZbhmxU1Y29Kvjf+biIhdIhVko4lAHASqkNSv
	sQ0HJ1RrTqJPRAsVcIGrGAGiJXUgv1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqhmQ-0006h5-40; Thu, 25 Jul 2019 17:43:50 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqhmL-0006eH-81
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 17:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=vJGclLg2/SizjBD0uAOxWAOde9Sqq4M2mnEoGMzJw7w=; b=Lys2mjZWqvWr
 Hs817Rj0fgrtTWOrJhgUlHo165JjvMORPDK2B8fErlTc2L0VSjqEC/n0YKGevhLFGdQxthtntl+yb
 D0jWSXgMEGqvVWKI0D4pEhwSABaz15QK7to7pa+G8QGRms8BAZXxZSxd5EYyrfXxR6Q/Lkaz9oit+
 JkKEA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqhmG-0003NI-Qc; Thu, 25 Jul 2019 17:43:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F005E2742B63; Thu, 25 Jul 2019 18:43:39 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: codec2codec: run callbacks in order" to the asoc tree
In-Reply-To: <20190725165949.29699-2-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190725174339.F005E2742B63@ypsilon.sirena.org.uk>
Date: Thu, 25 Jul 2019 18:43:39 +0100 (BST)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_104345_317170_654178A7 
X-CRM114-Status: GOOD (  13.49  )
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

   ASoC: codec2codec: run callbacks in order

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

From 68c907f10cd816cad2287167a1a1d77914a6d466 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 25 Jul 2019 18:59:44 +0200
Subject: [PATCH] ASoC: codec2codec: run callbacks in order

When handling dai_link events on codec to codec links, run all .startup()
callbacks on sinks and sources before running any .hw_params(). Same goes
for hw_free() and shutdown(). This is closer to the behavior of regular
dai links

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190725165949.29699-2-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 1d04612601ad..034b31fd2ecb 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3835,11 +3835,6 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 				goto out;
 			}
 			source->active++;
-			ret = snd_soc_dai_hw_params(source, &substream, params);
-			if (ret < 0)
-				goto out;
-
-			dapm_update_dai_unlocked(&substream, params, source);
 		}
 
 		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
@@ -3853,6 +3848,23 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 				goto out;
 			}
 			sink->active++;
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		snd_soc_dapm_widget_for_each_source_path(w, path) {
+			source = path->source->priv;
+
+			ret = snd_soc_dai_hw_params(source, &substream, params);
+			if (ret < 0)
+				goto out;
+
+			dapm_update_dai_unlocked(&substream, params, source);
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+
 			ret = snd_soc_dai_hw_params(sink, &substream, params);
 			if (ret < 0)
 				goto out;
@@ -3889,9 +3901,18 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
-
 			snd_soc_dai_hw_free(source, &substream);
+		}
+
+		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+			snd_soc_dai_hw_free(sink, &substream);
+		}
 
+		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		snd_soc_dapm_widget_for_each_source_path(w, path) {
+			source = path->source->priv;
 			source->active--;
 			snd_soc_dai_shutdown(source, &substream);
 		}
@@ -3899,9 +3920,6 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
-
-			snd_soc_dai_hw_free(sink, &substream);
-
 			sink->active--;
 			snd_soc_dai_shutdown(sink, &substream);
 		}
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
