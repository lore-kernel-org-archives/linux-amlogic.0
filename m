Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3A8CA5FD4
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2026 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1a0vsijL6QfFVEwTOA2dlfdSrDFB/qqgQUfco2J6Ii0=; b=gsPDCSTTM7XqMu
	VNv56PSQsM9lbStyTDalPOFVWNQPeehGjXKdr2GpALPaZfq+4Z3FTOSjy7i438g8qZ+avO5rHB3xb
	fPwTKu4Kn/iGTBOmbp9XdjH+7ZlZormnxcabBfBhQcwhfHajO0H5KGQw2zz09TCK9fFpigtXxpWBz
	yfiz5GAN/PgLUv2WXrtRFSDUD5Vtp6sAgMh4VabRGH+MpZFXVlXnHsCJHcKSadFIoCvPMKgT0+YLT
	b0LZdPvR4Bk51wCQf17WfFTT3oMSI4wNDYMS7hNUG5XOFubvIxAq5FJm0Evcg2MSvAFQ06ACms/15
	dF+m3kmyylwVLMJL926A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJJ1-00000009dsF-248V;
	Thu, 01 Oct 2026 16:06:47 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIv-00000009dlm-2qt1
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Oct 2026 16:06:43 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so40044725e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Oct 2026 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870800; x=1791475600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=MK7LpCuISTY5fbirjHepBI0V56Ais4Y22FGbqJr9mv9WJZR8e9XPPOLLoeYIUamuaS
         HuvVORcriW8N21AuNrKzNHoXeao/YtZGFMFQmYN90yoEdHcHeVezGMrYEIkZMWqh6U7V
         Ys+cGioB4neNPT8z82H3ZFtB0tlny0opMlb+QzECP4pBQ65RteB7ltmNFpGesmn0n26j
         iFXS85gBW5l2VCjN5DTlBOI620LMD3C5r85uBthUiC+0c3n74YesV9NGTp74nsr8GBw4
         vDG89ClbTpy9UK9goONxHK46rGyu0CiOmE0qVZRDLsxxwLu48+JLKDObH+0HJ7GEv1aa
         rDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870800; x=1791475600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5u7/CkWfak8RB/d8dqpu9NxHBzNm4GVmQxeKd8aK80=;
        b=H6pbPujYqVPMQjbVkOoz02BZft2aEIPThnVe5Si9bRO95/y+hwt8AVjoHjsjor7AzQ
         HqnXvhvIXzDPs9JPOmGLU8WZ8CGrOJYlwV0AhC1FIVkwZg+ezRl+Dyutlob3VdCwijI3
         72/5uSpqFEdjtBScgDUHICDWBy4efse21lGNaBIa5p+n5L8+LcItLfOCXkJbYErZXCWr
         9MA22krgQDJqC+j2zwblVmIOupNmqjvZQrtjOe/f180Qkgti4frxx27HZBXalm00a7yx
         Xf2BqOLnPhK47bYs75zYVWBOH0JCt58H2ZIN5pn9FIFI3YgZBAKx+EACKMPSxK/4Mjmi
         K97A==
X-Forwarded-Encrypted: i=1; AKwUvBwONG0OjbioQO3CSrrwFB0Mz6rchO2sYuu6sXbNkvTkJmKilOIaMnfCaxs+YTLWa5N+1rKI9v/2uuwLClyk@lists.infradead.org
X-Gm-Message-State: AFuF++nO8AWIcCc+9I3A79AYN28vp7ZrRUi1Y4l35g7Hd/QMqRWVx1Ot
	LbNnJkUsknf9oKCWNkW0eJFTkUvM1QNFpco55O0rhSTX5hQ0FBQwXN/FhosRaVbeeH4=
X-Gm-Gg: AYBFou0kEOq0VxgXQd0eB4p2T3B0cgK01SvCTVYiWsx45681gOo5J0yB+2iNKmTx6uS
	Ij/Fmf2KbMgGjrflsrB3fuNSCAAMrQQdK+kKlhc3EP7r0dnqyEV0AY7mMYikz+Bv/D/3aoeSQyL
	s2y1oPJOGr6uClDw8zHktWoWEfL+eKGaEzffUe+XMWMyhHcgo9Q5J7K33kBQ3uehWP2iEMN5Rf3
	ZujKkaQ0HbE6JFJ3g2gZbnDkjIbtUQ/dpGD0V7OmheulvIihyMttPJuPIOwj4FKhX7K6sJes0ix
	5yB7ROkYMHVo+rts/qbyz5B8nj/OuTPoxq9/ZT/p16hwv3Qgg4UbYgJJw7NsxaZPB4P2rNjkyUd
	AwjVbdJgwGQE5PpVKtcALb94oPQ0xFU2DnlfEilz6zPEUTUNHs+u1+sLfOymdXXuVYKyDkWQNrj
	Dw+d9efjgZDUv2FjWDvjHjrbaelBhJBKVcVPmy+Vgi3M705Uop+pymylKjZZWFDrqo
X-Received: by 2002:a05:600c:470d:b0:4a0:276e:9efb with SMTP id 5b1f17b1804b1-4a0276e9f23mr1133685e9.4.1790870800021;
        Thu, 01 Oct 2026 09:06:40 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:39 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:28 +0200
Subject: [PATCH v4 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
MIME-Version: 1.0
Message-Id: <20261001-audin-v4-3-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=USKlfavDbggOjZS2/SFDHhmHPla3alh2Tu6lzPN+798=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrl71S8qlvn0bxGeEN9lfjP73UHdr75XPB8q9PeJP
 Vb/M/NXRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACbSqMPwP3Zr7cr4t3OXGOnE
 /GjefIf1tdJuvt731pMSJVp2XKiZksPwv/CLslLal9xVD8qXetZzrpPXXSg+1ydibuup3vY2vkm
 SrAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090641_770045_74249E3B 
X-CRM114-Status: GOOD (  17.50  )
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

A recent Sashiko review [1] on this code revealed the following problem:

  If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2,
  and explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
  snd_soc_dai_active(dai) remains 2. This skips disabling the clock
  divider.
  When the streams are subsequently closed, the ALSA core skips invoking
  hw_free again because the state was already changed to
  SNDRV_PCM_STATE_OPEN. This would leave the clock divider permanently
  enabled, potentially draining battery or blocking system suspend.

This commit resolves this problem by using the 'clk_enabled' field of
'struct gx_stream'. In particular when 'hw_free()' is called on a stream
the code check what is the status of the other stream and then only if
both are off the clock divider is disabled.

[1]: https://lore.kernel.org/all/20260917212019.4ECE61F00893@smtp.kernel.org/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 58dce9f08c9d..70ea39c77b32 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -219,16 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct gx_stream *other = snd_soc_dai_dma_data_get(dai, !substream->stream);
 	struct snd_soc_component *component = dai->component;
 
-	/*
-	 * If this is the last substream being closed then disable the i2s
-	 * clock divider.
-	 */
-	if (snd_soc_dai_active(dai) <= 1)
-		aiu_encoder_i2s_divider_enable(component, 0);
-
 	if (ts->clk_enabled) {
+		/* Disable the clk divider only if also the other stream is not using it */
+		if (!other || !other->clk_enabled)
+			aiu_encoder_i2s_divider_enable(component, false);
+
 		clk_disable_unprepare(ts->iface->mclk);
 		ts->clk_enabled = false;
 	}

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
