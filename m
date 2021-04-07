Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2CEC433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 14:57:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B63F6113D
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 14:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B63F6113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lbF3WG3W3hrEVLb/3ltcLF28OqEJVKQw7G+OmcageMQ=; b=lhz6LxrlG72JBrQKpYvCKdO+kj
	Iis9TRhIOjxNEjBNR0yiQKmZC3zlTPVIMxXlqMuPVRez0kjkGqsS9rWTa8nsStWjY0/pCOulVgF8P
	QIhnh5pfNkTC7ieEpwuefh8dqSZQzXtVAhFHzZpu5g8tJSI2EaY09hMigu0S7EAs4/dS3mG6aXT26
	QLZy3SSuOG+SA/Sdn/KrCwShr9j8PfKFIKSigBROZWsx8rKs4c1o7DqhCDM2L10yWc6DTm18lPZOP
	0LP7or95cUHeT7uQi0XWdTKkUkSuZPhC6IxQ73TWP57imAC9WAs8FQhdOzzWbAl6gPwu1TZmc+h25
	YS2fwplg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU9cp-005Dc2-Ed; Wed, 07 Apr 2021 14:57:47 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU9ck-005DZm-QO
 for linux-amlogic@lists.infradead.org; Wed, 07 Apr 2021 14:57:45 +0000
Received: by mail-ed1-x52a.google.com with SMTP id k8so13829791edn.6
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Apr 2021 07:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QA9e9N4IOvSwJUEhUzTdNXyCf8iiGr98JuVf3SJbSws=;
 b=JAQF9H0gQEXFL9/pYT2lgmKwCmo/8UEfkLEab3w+3B+f/2dTBlLibW3g3Eepx+nKfg
 jhiSXd2zDe6fNoMhr8cXIQAJWBt056NgQLQ5WfHIL+BDAV10JNXkybazYAdZfM2hASV0
 Qltio+F9iYnQLNESFD5gMQ8WXpGpaGPNnkgf942WWDLAriwHIpFzo2p+j4WGWj2NHGk1
 8ta/ACdwML+eDZa1w6uvpqIT+EaL/F+xWZSGBYygd+j+kJzycS6hX6EaZVpdavH8dnO4
 r17E9jKOpOvZidos86qEA38r/Sijo0poC0OyUBLHBnG0Im/CmuZyvtmQLzBMPPB++k0O
 PsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QA9e9N4IOvSwJUEhUzTdNXyCf8iiGr98JuVf3SJbSws=;
 b=ZwWSqltKz98WLA8Ggj7gQoGNro2bkyiGoHWi0JoqCDDBIXlyrgjUQay0HRMBImnSQH
 8Yb+S7Z4CXaV0MonicbSF1VEvgiWFv9DCCt5LB4/C9vbifWry9Yz4zMjJzzQ2av7w9To
 AM4yGNtOL5nCrdwJPBQ5Yp0e0bqZ5LAQh9Erh+Z1twRft5ETLYfGV6x5kiUl/wXFTQi4
 30OHcb1XEt5YA7ppwPjBfd87mBbFwyyZOsrApyF6LPuH8qgBg7H61APe/78jcjYepxiW
 T9W8TDB2C2xcG3kQOJS5gxyxSrwgBA9mzfJ5nFctCyDNLToTOnSWFRMtB+JyZbqJ6bUg
 BZFQ==
X-Gm-Message-State: AOAM533KoEdCgq450ZLKZ/hH/ZCEQF6OQsNGMR1IAedznJsBLi5320XP
 yNjQmlY6iojiz5HaVkTeDuyJRw==
X-Google-Smtp-Source: ABdhPJxrD/E7UI8yZ+sfbW3oM0l+FNRA5WDYTfCEADpbzEgpOMkZgtqqaQVPNqZsN4PMZL+SMysa6Q==
X-Received: by 2002:aa7:d88b:: with SMTP id u11mr4983769edq.254.1617807460510; 
 Wed, 07 Apr 2021 07:57:40 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id yh6sm3732875ejb.37.2021.04.07.07.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 07:57:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] ASoC: meson: axg-frddr: set fifo depth according to the period
Date: Wed,  7 Apr 2021 16:57:14 +0200
Message-Id: <20210407145714.311138-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_155743_982197_5D6F124F 
X-CRM114-Status: GOOD (  14.18  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When the period is small, using all the FRDDR fifo depth increases the
latency of the playback because the following device won't start pulling
data until the fifo reaches the depth set. We can adjust this depth so trim
it down for small periods.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-frddr.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index c3ae8ac30745..8ed114de0bdf 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 
@@ -46,11 +47,28 @@ static int g12a_frddr_dai_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int axg_frddr_dai_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai)
+{
+	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
+	unsigned int period, depth, val;
+
+	period = params_period_bytes(params);
+
+	/* Trim the FIFO depth if the period is small to improve latency */
+	depth = min(period, fifo->depth);
+	val = (depth / AXG_FIFO_BURST) - 1;
+	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH_MASK,
+			   CTRL1_FRDDR_DEPTH(val));
+
+	return 0;
+}
+
 static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
-	unsigned int val;
 	int ret;
 
 	/* Enable pclk to access registers and clock the fifo ip */
@@ -61,11 +79,6 @@ static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 	/* Apply single buffer mode to the interface */
 	regmap_update_bits(fifo->map, FIFO_CTRL0, CTRL0_FRDDR_PP_MODE, 0);
 
-	/* Use all fifo depth */
-	val = (fifo->depth / AXG_FIFO_BURST) - 1;
-	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH_MASK,
-			   CTRL1_FRDDR_DEPTH(val));
-
 	return 0;
 }
 
@@ -84,6 +97,7 @@ static int axg_frddr_pcm_new(struct snd_soc_pcm_runtime *rtd,
 }
 
 static const struct snd_soc_dai_ops axg_frddr_ops = {
+	.hw_params	= axg_frddr_dai_hw_params,
 	.startup	= axg_frddr_dai_startup,
 	.shutdown	= axg_frddr_dai_shutdown,
 };
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
