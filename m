Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EFFC98302
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2026 16:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QMBMiOoinV/BR7B4GhvzYDxcRxj8h019L1u4mFOZZfE=; b=CNhdQ+lvZxyB1T
	mGtjvWve/9I+0Y1GrlaMCf58ZiQAogNNExB5aW22GGh1yKnF2UeREBilWpsC+20j8WIXogJTuFi0Q
	dmrI6/uhZd4eAJOYl2s+ybByw+2T9ibIOzQCyOkejUZO8E3NDuiLNokzFpxcuASspG1VUWaA2SUZc
	5nRBkntaEMlDKNFdVxvyey2M4bVfE2aCl8xRfzRcyKR27JPQ1AWsCGS8msFM6QwxK2U2hzwbpYYvh
	genCJQVo0bm5koEi7LjHqKsNwzdwMkGa6BbOJ+I//aVAPX9zMVJX9fEIB+Rg2oR+pm7rBEYoHyCzf
	rtE/6e2vVKQh98EUO3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92wN-00000005yfh-3Cow;
	Tue, 22 Sep 2026 16:01:55 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92w7-00000005yXl-05Tq
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Sep 2026 16:01:40 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f633ecdeso77407f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Sep 2026 09:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092897; x=1790697697; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=EHiq/oLofesx1lhyYiCRTFhSWQtkWB9t4gqWV5hvHf0kT1j05/dUa3yNsHJ/jaiZdI
         4v6RQUHbvYcIwl3zO5pX9Yu5uBHd/hq2cB6x0ip5DqBj1jvnza/VqceFtjgRS8FQJqrH
         LnLiFTqVE3jfLV0rXVTBEZjjDVKk9afsyzKpeM78Sc2XU391GmTL4kN7MP5aiKwqkd+W
         hQTRLwZu+ixi9bflN1T0FcytmXTbRWT8jakUkbbnJ7fvxBA8YV13VXQOEIDwqj6SkLxa
         dOatdkKE6+WeLwzVz0oL7RzLCp1+hAqKNbnH75kGJCi9N/eMHEKogHCI/LUwPgr4Mo+4
         T5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092897; x=1790697697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=heF7bbj8dLDx/SyM2sQZjqJziysSzs0u3oLEoyTeXiQDsPWRyGdqjoDI2ZQRlBU7R1
         QCkc8U3cwKsKUQuqM84TlfMWlzLkVkPtJwWt+VkzJ0L8jk60Pif+ui/Y3GEhOOn6Xg1i
         R/moZElTxWtnWfBpi8hgOKOcIGGSa04sCifANLZ6vpg77uk8gz8n90Kr1uMXh/CgwUVa
         MhODSHILUMpBN+0DCbLpFJ2vRVdZ4h0pJm5+aox0qWhCHk88vna3LmcwXKijk0Re2vO4
         VtqXFGl6MCqoh1RCc/h5KEtLHhU7UrQHCFuYSkvblVoJjZrkY7F9HqYYjDcLF7ENzdUk
         Wckg==
X-Forwarded-Encrypted: i=1; AKwUvByXbA5qQVtPtH/CC0YofZACKgtoZenqyvEmQMvsqa6zYpBxtX++vCApY2ip3pX88slobcmc9etvrwXHDL3B@lists.infradead.org
X-Gm-Message-State: AFuF++l+vAXkDKHkYoEaZDVWIrGE4qqQvV5hzm7cfuRkC7qcrcZTYz9q
	CvTNG06pC5jDG/AC2ZmrnBfvmpCPttk18iiRzP5ZpeINKqx1GMIwtPgWDj8CUIe3WbY=
X-Gm-Gg: AYBFou0GPhuZ9xAx9U3L6RpgEk2gO+i4TAsCNsEP0eo0VEIBgV5K6QogILBPW6GpMCq
	XLRzNSj2XpJrqCGYy4cvCwAnxaO7Ux+pRI9/X60HEOZytjAt/FFcwAF/N6NWn81Zorxv9yRuelZ
	Vhba/l/taiI1JqghFkEDZzuOn4vJJHdxwMIx5xJj9JCHRb5lkSd33iEq3fXlZIZTUc025H42UmW
	eoIj9TpMlW7QdfM379DF5Mu+ElLQxDthEIGbVDJMFiNAQCTrqHSSAHtYxkHa4n56Hy5C+qBTulB
	ofXzD5zx5ocf1nJQf3UaB/SbVJ2Njg0bFdvtxOHOR9HuHJax8mql0bEyFOpfV5lAuiWvHsdqcpr
	yokbOClPphuSjoXciO1a5Oaq2o2YGYORkvFlXG4IYeAqTfLr1uENxFjZR/xNDqAvWQfJ+om4zfA
	NUaLFtJ+hveejhTbUhEzeBSg/coYve34oOTQ1oaCCwU2+hMGdYQbWkZAvRRqo+kFPBiA==
X-Received: by 2002:a05:6000:400c:b0:487:951:20 with SMTP id ffacd0b85a97d-4886709c990mr52052f8f.46.1790092897354;
        Tue, 22 Sep 2026 09:01:37 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:37 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:51 +0200
Subject: [PATCH v3 6/7] ASoC: meson: gx-card: add support for audin FIFO
MIME-Version: 1.0
Message-Id: <20260922-audin-v3-6-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=vu+Bm1uBGIa5rQR0KJvCXwwxy1648qk7OnTjRUBnopY=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkV9nDbpoPCsi3wfGe85eb//3veLqzqv8vL9f77H5
 Bb1XNC36ShlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEnh5jZJh8PLx+x5Kkf4En
 tx3hcQq7ZN6dfHP+huW255scDDPPzZrM8M/y5f8Fz2ObGJ+5Zcr1de14Pev+GRfHepXq9HTff82
 2HxgB
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090139_125934_A5549B69 
X-CRM114-Status: GOOD (  12.48  )
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

Slightly modify "gx_card_cpu_identify()" by making the compatible matching
string an input parameter. This allows to easily support also AUDIN's FIFO
with minimal changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..35bc47254752 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -66,10 +66,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				const char *compatible_match, const char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -96,21 +96,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		return  meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gx-audin", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
 	/* Or apply codec to codec params if necessary */
-	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "CODEC CTRL")) {
 		dai_link->c2c_params = &codec_params;
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
