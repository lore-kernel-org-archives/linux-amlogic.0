Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC08C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:48:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC3CA2083E
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:48:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UiBWuDoN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="n+OxTPRi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC3CA2083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ja1pLL+BmyVndmIrFPnyqrTYkaoRSSelITNzr0CQrso=; b=UiBWuDoNzOhZI2w++7fVxqMFn
	+TLQUBzgajHr8OzGWPJkYnwMtApD74A2nnG5WHJdAEkFa+t3HK88gQo3fAbSDx3NkwZ7DTBKqwFJX
	gIz7p8typ6AdMk5N+LkiQiTMwH3m8ixNjZ41D7F9IkMXx/D0bkWpNPUcfV5zssz4RKUxA1hmq3wfu
	qKy93kySJfSPsyV5ZRlHQbr8LesUdvHtAOZfhVqpkyCDhIH2m+xWyNtCTsBBEVMpEAsXpVoQIgnEN
	b2BfD001xCcm2xST2byKlrIzhm13JBdbETe8FX/9H2zwpddCXWSj301cNZA9q6AdB9LRumkQjBjGx
	S38Y65Lzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0oJM-0003U6-4f; Wed, 29 Jul 2020 15:48:08 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0oJJ-0003Tm-Oa
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 15:48:06 +0000
Received: by mail-wr1-x443.google.com with SMTP id a15so22093961wrh.10
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2020 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36JMClzoi7h93LvxaQw3joeoIat/KioNOebe1PCxRfY=;
 b=n+OxTPRilig3haxEVJ5AhEQGmEPmRUF1YiywGsBdl5Z+XrM+gmIBqBlJw6szHy+r2A
 wuuM3o0C5jxjVER9hXK/E9j+AWnICQXWRAVe3M0VfvHE45ZgFE8ixPDfuLGsZgmaQziM
 Sqir7xV7BPs1bG13tLiBw1wwQOG8oGgoP7IejuwPWVa2zKp7+qgGxcYFzmDHye5Obg/K
 Bgsq6xYOiRMDuPU5bBPYXtaUpByB0ilY0FtTffIUubB7vuRRwNe5jFtEwjt8691LkdEz
 bfkADdUcJyZ24AizWb9313N2o3wNGuuLzOnY4T2WdPx3Dd23zfy4uxlH7EvBNYvL/lqB
 znTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=36JMClzoi7h93LvxaQw3joeoIat/KioNOebe1PCxRfY=;
 b=GaCzqhdlNQCLp2edWPEiiY3tqIeBS7logamRobsiE1R20A7yUWEbfiCopRmtGSZG0v
 Wj5iFPQbbb+23BjgqhiczRiulZQVCfa5u8Ib+Nz8lLTCntS/8AhTFz+uiazcvyHp/O59
 224T/i4FGx/Oz4dhcpyeuZSoE3cR10bLn9WA5wTgom4kz5qn71vOFF0Tp56bwyfvbeh9
 f1BGPVVvDdvScVd4QTvkcCliHBW6/+atHCYcOc0kygvW1qq8VhTpIHeukZoT6V3Eno63
 xrUnXT5BqFYT7/SXjjIKUhseqEq2e23w3PiYyHzHeM+adMTnlyXdUY/LK2aadUdRvcA6
 eNyg==
X-Gm-Message-State: AOAM532R57Tc4LsKzsv/kIucEFktt6DThbBQVkgi/db/AOC+LKj8823N
 XkUOfOSWtWeV4LkW+PYz2+JSSQ==
X-Google-Smtp-Source: ABdhPJyrcNry8P8JgzRYvpG5FsopA4iFS5SUa/WXhOO/PIw8l2gzCtCcunQ+sUCAiMde/GxaIvpDdg==
X-Received: by 2002:a5d:5486:: with SMTP id h6mr28823589wrv.136.1596037684667; 
 Wed, 29 Jul 2020 08:48:04 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t2sm6224808wmb.28.2020.07.29.08.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:48:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: core: restore dpcm flags semantics
Date: Wed, 29 Jul 2020 17:46:39 +0200
Message-Id: <20200729154639.1983854-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_114806_174810_289E9EC3 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 zhangn1985@outlook.com, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

commit b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
changed dpcm_playback and dpcm_capture semantic by throwing an error if
these flags are not aligned with DAIs capabilities on the link.

The former semantic did not force the flags and DAI caps to be aligned.
The flag previously allowed card drivers to disable a stream direction on
a link (whether or not such feature is deemed useful).

With change ('ASoC: core: use less strict tests for dailink capabilities')
an error is thrown if the flags and and the DAI caps are not aligned. Those
parameters were not meant to aligned initially. No technical reason was
given about why cards should now be considered "broken" in such condition
is not met, or why it should be considered to be an improvement to enforce
that.

Forcing the flags to be aligned with DAI caps just make the information
the flag carry redundant with DAI caps, breaking a few cards along the way.

This change drops the added error conditions and restore the initial flag
semantics.

Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi Mark,

 Because b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
 introduced more than one problem, the change
 "ASoC: core: use less strict tests for dailink capabilities" [0] is still
 necessary but the change of semantic remains a problem with it.

 This patch applies on top of it.

 sound/soc/soc-pcm.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 00ac1cbf6f88..2e205b738eae 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2749,13 +2749,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 					break;
 				}
 			}
-
-			if (!playback) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support playback for stream %s\n",
-					rtd->dai_link->stream_name);
-				return -EINVAL;
-			}
 		}
 		if (rtd->dai_link->dpcm_capture) {
 			stream = SNDRV_PCM_STREAM_CAPTURE;
@@ -2766,13 +2759,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 					break;
 				}
 			}
-
-			if (!capture) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support capture for stream %s\n",
-					rtd->dai_link->stream_name);
-				return -EINVAL;
-			}
 		}
 	} else {
 		/* Adapt stream for codec2codec links */
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
