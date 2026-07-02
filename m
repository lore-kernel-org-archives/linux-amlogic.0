Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D200C43602
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi+7c87bfgUm/31A2qsTOhCqHHKIqQphqY6jNddOV/A=; b=yv9TITuYmKAvVW
	2UY5D6gxaPd1JrjLL4R8DpMo6C5MZ5QqKugXFAzUSChAQ2XoFDYDkX4m1rImbHGRp0Y3BuzfjSdBY
	Aq1WqvEw8X/Doz7MNbE7omVMyLddYkS69qJGD4oIEJ4KhCYg3QP2Qih/v03O0u1etTrVN14DFNE5J
	O51+xDSvEiT4ZjZRPuUkfiX5QPlErwX37KzjJYOTBT7T6lUSahfb4ycb+2d2OzluX5R9fdAzRyi1t
	3uyNBRNoiGDHnqC1IpJPGkNeJoddnlNVNyrX9KP2o1axEhjpVXFExmK/S2Cyip721QAZBuxx1nhFQ
	r2Mu8nI5fXkU2TmpZh+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF6K-00000004F8o-2gw6;
	Thu, 02 Jul 2026 10:57:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF6I-00000004F57-04Vw
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 10:56:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so8769775e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2026 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782989816; x=1783594616; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgDVuxY1KD6XzliacX6/nWGKC8dFyYuIdBWxcG4BfyI=;
        b=RTEFWXbnndFg6TcmHQLbRlwaxs8ECYC6R7K3eOYJ4WxNneWRCBadyb40pJZWPrlgLX
         7vCiGM34sezGh6DNx78dtv+bby23lAgnhFAMs0sMrnWDaW88Zb20lj7eFCefvIbIDo5m
         TlTom4R0gBoGOPt+vklzEF1RjYoCm9LkkjWQAc2T97I3tAoEVybvii15i8/pEsoQb8tt
         hSIILGv6eENVP9jrS08UYwm8reiz4cZheGLgXDINy8rTZ4k4x7TD9xshtwiBy+IF8/JE
         sFo/2ByPAOZzLKO4BgH9k1E4fdvdm+F1qvN6q+DDzie1IsPSNttGGZLZGKY4RNnUS0lD
         mDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989816; x=1783594616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgDVuxY1KD6XzliacX6/nWGKC8dFyYuIdBWxcG4BfyI=;
        b=kxfvy7ZXWuMNfGfjCFyc7SSRDjLqM3Obm50WHrXhjv13ElZZCexHhP+OJg62u8zTEZ
         8A8h4L1Xp1XuPLpnmJEgqIvHd6TFSDDu0Gtc4fmimana0eSoaJNUn92l7OqLAqDGyurw
         yLjPHFAokdF/1VB0CQkgWvaU8inML4doQ5DmHcpLE7OPV8dtZpz1CNPNyFqFAvfDSpkC
         osYtRr+xI+HBz+/Y6tPoX9P+O5w7X6ruwTfy3CK7bnHrbu6hR7D6QxMHbjcr4Ye4wcw/
         9AlJQOdvKfJ+3vz5lX69d37H7TOatVQeyDQOUsaV/75qtR2qoEg4BnTr/kdJlT/w9wt/
         TZOg==
X-Forwarded-Encrypted: i=1; AFNElJ+34CZ9I0m3mPpVx/huCXv9LHKKYh0Ak6NuRjGQJbfT7iWpQTU/bupk+BdnwM2rF4I67V6fWXWpJ1avx8mL@lists.infradead.org
X-Gm-Message-State: AOJu0YzzjKJuwhg22sTn4gw1tZf1AAbrMVFYAg/wy9veZxx6eLXKqCdy
	VBlpyXetTjJX4fxmJ7vbNLvWSHKNirG0QXX9fL1TkpsJk0YxpxMLrJGTKIzTYZR67MY=
X-Gm-Gg: AfdE7cm/O58wkU5COhG/D8XKOaTkDK0d2BDUHmwJaRERzJmmldF0xvPsk4P5xVabxs3
	0cWbPanodCyr37xHRLUf8HwHI2s9xNhd2tW+cZh1Y88A8JYCvSXZvuS8AQYAjxwLBd5Jw39HIOG
	84rlwyq1fOARhawcxRoZcksQW9dQVLLkgbia/4iPcPMOFTCwsxWPoFVEmSoOPuiTRNy8d2vrvy4
	5yAwV5HoVbSBDE2gHI+X0W053ixtKR41TE1cQ27qrgQ+8P2ghpQs86lR4mGbdNV24gI8UuXC1C7
	5Y5MKYuAZuDiQhU2vKRrK/q/X/fZBrV0JA7ihwDm2BLzK8HNb3YhZrYmPog+K5+NYBdCdJ6xfnE
	20ubnEpzcYYHvLVJCcRpsIfmoQHPgCr+juig+fKrYp8wCUn/o4XKH/J97ZmVf5N/TO2uhMRw/uV
	mQGv0wysIVKw==
X-Received: by 2002:a05:600c:c3cd:10b0:493:b7c8:6530 with SMTP id 5b1f17b1804b1-493c2b56d6dmr58237385e9.16.1782989816159;
        Thu, 02 Jul 2026 03:56:56 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6372a31sm42649685e9.13.2026.07.02.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:56:55 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 02 Jul 2026 12:56:41 +0200
Subject: [PATCH 2/2] ASoC: meson: aiu-formatter: remove pipeline reset from
 prepare
MIME-Version: 1.0
Message-Id: <20260702-fix-24-bit-i2s-playback-v1-2-bcd3a43fe32a@baylibre.com>
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
In-Reply-To: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=4RUGcMFAUmz4WZn+oUeIShFgv+Faz7ysyRFbheUvpog=;
 b=kA0DAAoW3kuTbdE6AQAByyZiAGpGQ/Sgr43tFvQDLVWfktUEH2N4EZ4yRZb+Gfs4KRffN0R+h
 4h1BAAWCgAdFiEEBJfe+3B1JuEzYMlw3kuTbdE6AQAFAmpGQ/QACgkQ3kuTbdE6AQD5mAD/Qntp
 SFISL2mv7knxonSk71KphYdR6KENd59KnmN+luUBAP3VB++RaKUjr3VxQ0tqKnyc3ANTCrvX31+
 XLiMN8doF
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_035658_091857_A2812D0A 
X-CRM114-Status: GOOD (  12.46  )
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

'aiu-formatter-i2s' already performs the very same reset in
'aiu_fifo_i2s_trigger' for all relevant trigger scenarios. There is no
need to duplicate the operation in the formatter.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-formatter-i2s.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
index b4604734fe88..cb554c2e7ce4 100644
--- a/sound/soc/meson/aiu-formatter-i2s.c
+++ b/sound/soc/meson/aiu-formatter-i2s.c
@@ -13,7 +13,6 @@
 #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
 #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
 #define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
-#define AIU_RST_SOFT_I2S_FAST		BIT(0)
 
 #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
 
@@ -55,11 +54,11 @@ static int aiu_formatter_i2s_prepare(struct regmap *map,
 {
 	/* Always operate in split (classic interleaved) mode */
 	unsigned int desc = 0;
-	unsigned int tmp;
 
-	/* Reset required to update the pipeline */
-	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
-	regmap_read(map, AIU_I2S_SYNC, &tmp);
+	/*
+	 * Pipeline reset is already implemented in aiu_fifo_i2s_trigger() at
+	 * trigger time.
+	 */
 
 	switch (ts->physical_width) {
 	case 16: /* Nothing to do */

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
