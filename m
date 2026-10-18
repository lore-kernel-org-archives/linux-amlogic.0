Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BBFCCA490
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Oct 2026 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GSJH1dEn+RLeaPrjcOOpAwSXh5A8elTlye7pgKmOW8=; b=rw8JYxLU1yjIex
	iFvBLNLoz+CAlEATx9kZTa1z1KzbecPH/55nkymejtjpsCFeAfazYgNHJvmITOMullvurYE+MFOWm
	R5pqUPFdQfezOh7Emt1dNxy/fQx8M3zJKaZmJOWQbLpUFsIHHrrb9MFVCoXxsOkYqAUKDu5tJ1ucM
	7u0LUt1kdK+m1oOebsRrctEJsRViBiLFVgCHrDGRE9zwio+sWb1eOYUUkbD0ckYNQhQBuUUH77rDE
	uoesuvMjs1o7DnfKTXa0JC3yFaPj/WMhglzRLpAII4ux8PDtjAJW5zszgsr7MxfiXwvvVLzztq5c1
	A5z/qnrFzWhOxHBmW5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINye-00000005jnF-3EvN;
	Sun, 18 Oct 2026 10:18:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xINyW-00000005jfj-10LR
	for linux-amlogic@lists.infradead.org;
	Sun, 18 Oct 2026 10:18:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e0d885929so642959f8f.3
        for <linux-amlogic@lists.infradead.org>; Sun, 18 Oct 2026 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318722; x=1792923522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQNZ6Re7mqkz64OCBvW/WYYm6ii+FqgQ5/P5td06ppY=;
        b=awlNT6VNfr3PSsRQg3/GMsDcZ9eGf14mrPnCZG1+V9Hjd54jcZaEknFrV6cYGn89Ce
         RkBeMzoy2dn7H1RPphCRST39cWn6gkA/T6zcdDClItAtCo1oPUjl0N9dDFNXwo1dGRUj
         qyRJ6VjAuw3cghiXuyabhgbJreTtTmzJ4QSYs0ITYVsx8ato7Jd3A1mWcgwEmiA5LVL+
         q4QY9s2RwTPNRFmZOyByKHIj/+DVXviN7nw5/RZSuFguEsNKM/O+1bo2BusIPRUySBu7
         UvTpl46v1C6R2+pQuOIJOcf5HNl/2v9Sene0cKtJlBv+A2cxRJpJvjyyuA/IKP/5Slk6
         9Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318722; x=1792923522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQNZ6Re7mqkz64OCBvW/WYYm6ii+FqgQ5/P5td06ppY=;
        b=jD+bCnJe20pUtj8BkEMsKjJWbAAj8QmJXzn7fZ3jmGzvHCVmI9NxqFy5i2ekbb0uUv
         osENnU9E2jJH9o6/euaDw7iGYoBljClH9QPk2oL3BzEcpBbl8nS35LhJ7G+mHAT+SIKD
         3XKIJtgOMe8JGlt2AMo4DB9+N1xYkE6YvfOx+vCk/TOqQy0b0KSd5rc0LU+52CNnMXHw
         gMvFPttvmuFXdrSh/KyLiWk7pp4qrRBDKadPx14d1BCW+KrTAZpSJ8CXEvTurRjcerHL
         m6E5gpCX5et37beuJ8zsXdEKbEkBHU6Us5WlV6vMb+EMxgQK2UoNU8j1kaguCTPHFyRa
         QhfA==
X-Forwarded-Encrypted: i=1; AKwUvBwJBOQbPI2VXMYPKQfYPR1M6L+eQKR2uUxCv9IWIhz/EO51GMi+pUkOMSTm+KbuVmWXJc0psYZXa4oleA2b@lists.infradead.org
X-Gm-Message-State: AFq9FYJiiFbrIhTMz1R89dyP2GB7T8na0KL3Bz2dUniaoV05JUItJ/AM
	E6/aBpyZEgMYL7GXE0eyjhh8QfZYYs21z+FT4aVKR+kx5Mw0GPPiGXdwxeVoBx8lmQc=
X-Gm-Gg: AYBFou1rmLFbgttTualMqYQSmwdR+WUzYHJAs1CNBcTifWbzxmYj19sPaL3veLo7emX
	r9DzDhs320kG3GV/EGvLWFvS052AaHTMtGtkncZ3IznitKOFEzGo3PSg3plbCYE2Wk/5zqr85ET
	A8OJo3lUNqoMgN42zb88Y9hSDNJ41wkKXZbuvYtAf5eum6KbsbBwCsNSm5CRG6Rm/bBiAm7QkWq
	XI1Ro0TKB8HkmIX4C5THueeYekWwwbt9gqpbkxRviLZpsUXLDMgt18qzwWFfaO8oDKXua4eSyfh
	mswho7fxL88gReCBKFI6i4TkKL07g91jlOdosw8Q6nJ5CNI9oe7+5aygX+d+ZOMDiwtM0vMsghK
	WbhR/9c8euQaOPPeUyOVF3/m/aDLazTEuyt6xuhJSdDgQZhfigL/vjq9rI4Q27N7VUkQXcAhPT0
	L1nk02iPER5/Ugp89hIVDBppWxU7WbyCO5hUoPIc26YSvR/rNY1iGylIUBTX2pDrA6pGnu2Ttd9
	tuTZNc=
X-Received: by 2002:adf:f8d1:0:b0:487:27f9:834 with SMTP id ffacd0b85a97d-48e07faba02mr6857938f8f.41.1792318722254;
        Sun, 18 Oct 2026 03:18:42 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:41 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:00 +0200
Subject: [PATCH v5 3/7] ASoC: meson: aiu-encoder-i2s: ensure clk divider
 gets disabled in hw_free
MIME-Version: 1.0
Message-Id: <20261018-audin-v5-3-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Qk2A3Ng49JvEP4XBMLZ/d8qcgAPxfwhjjFg0wL1puf4=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vx+EWnIz63dfPL3z2jti6pr5KfoJl68WJOeJRBh7
 XW3dMK2jlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExE8D4jQ7ODszx/o9TVn4E6
 i0vfrDTQ/e1VIPk1T8lh9kzuRZ7HfBn+6cdnxNoXdBupWPpFRPELfb++0FJJdKV5Ydfp2K8XvYv
 ZAQ==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_031844_318809_2B739B99 
X-CRM114-Status: GOOD (  18.87  )
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

This patch is unchanged compared to v4 because, as I mentioned in my
reply [2], based on my understanding the race condition should not happen.
In case I missed some corner case please let me know and I'll be glad
to fix it.

[2]: https://lore.kernel.org/all/d90324be-c43d-4d28-9f1a-e28e437031e8@baylibre.com/
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
