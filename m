Return-Path: <SRS0=H3eD=OU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDA2C6783B
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 13:47:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F40DB2054F
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 13:47:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AVBlp1rA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OXfs8+T9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F40DB2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IhjsDZ/N3FQ82cPmDbuWOdmmBUz8KAIqN1lMR1S+OE=; b=AVBlp1rABLufDP
	pBKVn4acmRxNpZGyaPnGbaLSZaJQwO05xbYARkbqhZeDcJzdr5rE+fHEeRLHNVvor9I+nYcGP/5m1
	Kapwu+BPMBOWN7nzobKiOadDvC/em1dJTup9mhBOjIHllH+qkgKYBHaEF0YNQr6YTpdxCAK0NGv8g
	NTJUs9XMFaTb/Xpgpe8cXkWDqbg8GBHoimvbuCpk7JNBhY/po2vyQa02mA2rV4RyqibO0caOSONfH
	dN9k/Ye1UhnV1PazC3AKOCJSEirVQ6XsypGM98ahi/rH5zkPydO9QcpX3p5xQlk26FaolW2ji5DMu
	C/CWt0HASE2atRsffESw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWiO0-0001qq-6Y; Tue, 11 Dec 2018 13:47:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWiNt-0001ku-6J
 for linux-amlogic@lists.infradead.org; Tue, 11 Dec 2018 13:47:40 +0000
Received: by mail-wm1-x341.google.com with SMTP id s14so2292409wmh.1
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Dec 2018 05:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8YYSFigv4RU7j7xI4uPHxbxUgrWCBqBqOSREZXXKOw=;
 b=OXfs8+T9xSRXfRguqjtSXuj0tn4XCU7QRhO1JWnm6xRGmRPk/aUY8trzyOiZ0Q0F7y
 PN4TydfL9OAqsgq7sBZupcVyRx15BGuiXi0Oc/d++nAGCwkVxK1fyp8b0ARdGqBa/wVf
 drLKBLygnVw+LRAJ17mTkk/KR5Kt98nDP4+8VPetqEImDdxZpX0iFQWsJscWwiMgbPUX
 l4YC2x8db6i72zVfviAX0PxNW/W6ukVIyhnVl9npVKOp29kKGE8F506KDe/2ndr/0U+1
 VorNZsr0WpJYA+c5MBAoHZ3nQ4+0Qsk1vqumtGIfXmhRy+PXVvudkb3Xr01JsGbRTIdD
 5D8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8YYSFigv4RU7j7xI4uPHxbxUgrWCBqBqOSREZXXKOw=;
 b=mbY4C+kJBUDMbbpneYBhfJm2NCmbosI9itHU602qu9D3YfLcqQJNSS4KPh6Mpc8hW4
 HXaqoEZDY0W7jCsMqJITOFXHA6I5TabmFWSgWGXDd+qk87oXlsweAwKFC5Mhm+kJAnJ6
 SHPAmHdxAkAtvO4UgEtcIYJryCXiV6Xk6Y/redmzUGx06oT9atx1kH3sOSlptmmBhnaq
 yE0oONiKo8IegpMTpmQ9O1I/XY/cFWlFm1/uj5o5qQi7S8iTbZ+s6cV2pBMOwFOlK7sk
 xXdI1SpxjIP7Qsz//SWZjXrqSAxD9h84NagwvyixTHiXgdW0xXrLRQFiLkqBOsrPQLi5
 RVwA==
X-Gm-Message-State: AA+aEWby+CP5avEBzjGKmzg36b84Ux5oeBNrzbSDNlr7qoqzifn254mP
 QG3o0P/7FqkAaUH8wd2Wh9CNnw==
X-Google-Smtp-Source: AFSGD/VjtMarNsJjkvFNpGf48/DDFin3dNqxbhh+q18rKhMb1ew+f2DQPxQ6Zoy2G+AajeDLTaPUOA==
X-Received: by 2002:a7b:cb96:: with SMTP id m22mr2432266wmi.39.1544536045551; 
 Tue, 11 Dec 2018 05:47:25 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id 126sm113768wmd.1.2018.12.11.05.47.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Dec 2018 05:47:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>
Subject: [PATCH 1/4] ASoC: meson: axg-toddr: add support for spdifin backend
Date: Tue, 11 Dec 2018 14:47:10 +0100
Message-Id: <20181211134713.4908-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211134713.4908-1-jbrunet@baylibre.com>
References: <20181211134713.4908-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_054737_403770_0D618555 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

add IEC958_SUBFRAME_LE to the list of format accepted by the fifo frontend.

As opposed to what was initially noted in the toddr dai driver, the spdifin
does not place the msb at bit 28, it just output a whole spdif subframe.

Placing the msb at bit 28 in the toddr driver just filters out the parity,
user, channel status and validity bits. It is better to just provide the
whole spdif subframe to the userspace and let the iec958 plugin deal with
it.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.h  |  3 ++-
 sound/soc/meson/axg-toddr.c | 15 +++++----------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index cb6c4013ca33..d9f516cfbeda 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -25,7 +25,8 @@ struct snd_soc_pcm_runtime;
 					 SNDRV_PCM_FMTBIT_S16_LE |	\
 					 SNDRV_PCM_FMTBIT_S20_LE |	\
 					 SNDRV_PCM_FMTBIT_S24_LE |	\
-					 SNDRV_PCM_FMTBIT_S32_LE)
+					 SNDRV_PCM_FMTBIT_S32_LE |	\
+					 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
 #define AXG_FIFO_BURST			8
 #define AXG_FIFO_MIN_CNT		64
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index c2c9bb312586..0e9ca3882ae5 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -25,6 +25,8 @@
 #define CTRL0_TODDR_LSB_POS_MASK	GENMASK(7, 3)
 #define CTRL0_TODDR_LSB_POS(x)		((x) << 3)
 
+#define TODDR_MSB_POS	31
+
 static int axg_toddr_pcm_new(struct snd_soc_pcm_runtime *rtd,
 			     struct snd_soc_dai *dai)
 {
@@ -36,14 +38,7 @@ static int axg_toddr_dai_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
-	unsigned int type, width, msb = 31;
-
-	/*
-	 * NOTE:
-	 * Almost all backend will place the MSB at bit 31, except SPDIF Input
-	 * which will put it at index 28. When adding support for the SPDIF
-	 * Input, we'll need to find which type of backend we are connected to.
-	 */
+	unsigned int type, width;
 
 	switch (params_physical_width(params)) {
 	case 8:
@@ -66,8 +61,8 @@ static int axg_toddr_dai_hw_params(struct snd_pcm_substream *substream,
 			   CTRL0_TODDR_MSB_POS_MASK |
 			   CTRL0_TODDR_LSB_POS_MASK,
 			   CTRL0_TODDR_TYPE(type) |
-			   CTRL0_TODDR_MSB_POS(msb) |
-			   CTRL0_TODDR_LSB_POS(msb - (width - 1)));
+			   CTRL0_TODDR_MSB_POS(TODDR_MSB_POS) |
+			   CTRL0_TODDR_LSB_POS(TODDR_MSB_POS - (width - 1)));
 
 	return 0;
 }
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
