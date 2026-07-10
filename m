Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7116DC43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShfWHfN0Dcr+RJFm8bDYqnL6VBqPkIkzQqaOVceQzsY=; b=b6SmNtEv64cGq3
	j3kq6HDcI47DgC3vtr+uPx18L5RNrO164W/DKjCiAqoudP4RC+fU3Tjx7rb1tD/FAXI5eljVsn2Ne
	v2GWrq0YgTuocz9jKnVHmKrwQWT3nHjq+6eXVnm8QKhPMwPml4Q2KKl95WLnqI7KdFD0n2vgenas+
	/4YZnMMFbLcWO9hphkJtQfV8YtuywIs7W/jeMN1MaaItCisbEJzmSXG4K6nqM/u3NWRTnu9X/nmZl
	78xHHGPdJIu5dRkaIFkxQccOSUZ5ybI3wa8VaAG7kKkPHxwOzkCoErvVM6rg7Pxfad0qrPQW7Yw1q
	wx8ydJLCOWJrq347iwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIU4-00000005luj-3EI4;
	Fri, 10 Jul 2026 21:10:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIU3-00000005lsk-0M3K
	for linux-amlogic@bombadil.infradead.org;
	Fri, 10 Jul 2026 21:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ps4p5IybPBy32zLyRvRZQao81FR1W1ML5zodf2gwZ7A=; b=U4keJzwz5y81WqrDmqspxL7H24
	Ntm8Y1QiNOZlEteC/5ZLBz5i5h1vjsuLdtWTSOP58YnieoiXxemfQjp01weRzHO/yhhIugew6a6H2
	7EdOMpKrc5DI9+mndYjB5iilIUo6BUh/Nsf0AEvFenx4GESqkk9uzGew8SV6HsXN1TSL4BFOGQjOm
	G88HCq/lP2Bg6X3VGrcPJRnQPI5u8d/MWxA03sLySwYvJdQICmTRF/OAHqljOPzfNysmXb91YvVId
	pwC1BkPGWYtkXOPyY2zyxUH6I/v+rh6BH51mN4K6weJmzUs0HXbK+cb7y+5HwbLbZetUWEcZQVck0
	V/HIspww==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wiITs-0000000AKS9-2erE
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 21:10:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1353517f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jul 2026 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783717794; x=1784322594; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ps4p5IybPBy32zLyRvRZQao81FR1W1ML5zodf2gwZ7A=;
        b=M4LOTPibWFZiDwJ4+tOFH2l6awZ11fkpyigFlEMMfML9sWwTZQEpt3ZDZZs9hwU3Tu
         f4EnY7D1qXswJfQymrmbFXGzvURk6e9fU/LjPYKhDXQmaEFMyalxZDwJYUFCHHsB/lfu
         YRzsgu5Rz9j5KyFIKkfKlQF45afx2aQD2PYZlJtFBHxB2ymtqhjoI3enYUCgicHa8WPa
         slVPCmKTA2FQ+Zs1qtkquoK8kjl/Gi1r7WVHMujkABVwYu20AM6wRHxKlw6l6cUnxcFv
         a3pNoHFBkozQe8wuhbVknA+ks/AYpDNkn34O9JaDXPd5GsqLaQ7x2Dxn8PONWZUv0xhG
         VM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717794; x=1784322594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ps4p5IybPBy32zLyRvRZQao81FR1W1ML5zodf2gwZ7A=;
        b=oMb8GxE1oCO4+L6oWee06fjQ5QQCkOfiIsSdZ67jyxAi1nV24phYzREPmXYy2fcFpF
         nMxQokqHkIDQy6I7c/mgc8ajZ5k7i2rkh/hIrwi1XqlnR6PziZxYJjDg8PNAnrIKhBv9
         H3RBOObNGXWgVfLAsb6r0MoR079VMsra5tM1W9ujQZMsmzMUUiaDmrUik7l/ybVF0hPh
         BJXj5D1b5nye8E385MFGCR+V90sSvvUgFcc7I93nv5p/pTuQ35QoKoET6Srvc2eb0ZAD
         TDs8G3JRfGV/QfcaxJxr/LfB1Qs13ujyz64D3nJlPHrVoQG4id79/SRl2WdfkWvqFqoe
         /0qg==
X-Forwarded-Encrypted: i=1; AHgh+RoJa/v9VZobEg+wAM7v9Dek/4QHEfCoiTOslSb/WmCF26fur96T9nBbXcbc8YD3TX5ASDz2t8cmu2Md5UrN@lists.infradead.org
X-Gm-Message-State: AOJu0YypjhKk0JoC9gvnjNv1Db72QzzHzZ4TYiYJK1KlhsVep8TiOVaA
	szJSIGiZPFzxFJ8RsFzHDqnr5B7dEf/O/OyfZsDDfl/vDhB9/jh7jgUb8ah0BDez6N8=
X-Gm-Gg: AfdE7cn4TZA/UrxCJoVwjJ77y3I3oAZa6vPcA8+icET9j0x0SCid/KwdJBWyN5ZIVWm
	2cdTtc6tDnS+jxcM+vjZd184deSIszgr0T6NHvseFUQVX9neAxMcubkj0fuwR/wci7iBZa3r5VA
	DrBkb3zCvcJiUJIebLe81UYXJLjF5lO2Jz41q0KfezXmTk2PLpPD5ptNuUxumxMs3/IJYBxsEs/
	VTkhjMLpNGTE55Bt0YeIp58IIQzZ5X3IUBrQSExYsIVdXJ8hCdpK2Y4ZzyJ+7ItUXVVcJWYNsGg
	dqwd/ZeitU9YAO1r3aW4+koiTq73JRIhJ3QCcgCojVwYG4/vdXwCnowAphXCbl4LC+4CjTw8Iqn
	Td1MBvxgcyT9J0O5lXo5WrRYwwr8HY1AczL4zQHV2pzVAsrzam88Z/B0I0TCiSYFEDOVLiymIjn
	bAPbSDnptijQ==
X-Received: by 2002:a05:6000:481a:b0:472:fe1a:1ee9 with SMTP id ffacd0b85a97d-47f2dcb5afbmr430808f8f.20.1783717794169;
        Fri, 10 Jul 2026 14:09:54 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm64274135f8f.22.2026.07.10.14.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:09:53 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 10 Jul 2026 23:09:50 +0200
Subject: [PATCH 2/3] ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw
 constraints
MIME-Version: 1.0
Message-Id: <20260710-aiu-improve-quirk-check-v1-2-2fdd1b6f8896@baylibre.com>
References: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
In-Reply-To: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5327; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=B280B5d4ZrqByaPY29NZv8op05nWwjy/iX6IvPafOwY=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmB8fN4TkYKKXVy+ubGSOYxhHa33lzAKb/gseizPwry3
 jOvl7N0lLIwiHExyIopsrBMv/e7oFTtoXHCyQKYOaxMIEMYuDgFYCJrrBn+Z1ovncn1efe6hf95
 qpfqMc1mUPzZw2z38+TfXdNeL1b7b8/IcLu05LjCYXexkykJP6LtGvh+rdR9tP1Yy4zVLGVOEQ/
 V2AA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_220957_866708_6C3577E1 
X-CRM114-Status: GOOD (  24.87  )
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

Currently the only check for bs-quirk is implemented in hw_params(), but
this is too late: nothing in the refined hw parameters hints at the
restriction, so userspace has no way to know the configuration is
invalid until the setup fails, as Jerome pointed out during review [1].

Add hw rules on CHANNELS and SAMPLE_BITS at startup() so that the
restriction shows up during parameter refinement instead. The rules
are refined against the committed configuration of the opposite
stream:

- if it uses the quirk, the current stream is narrowed to the same
  8ch/16-bit configuration;
- otherwise, selecting a 16-bit physical width limits the stream to
  2 channels, and selecting 8 channels requires a physical width
  larger than 16 bits.

The rules key on the physical width while the quirk is defined on the
significant bits. This is safe because S16_LE is the only format
supported by the encoder where both are 16 bits.

The check in aiu_encoder_i2s_set_clocks() is kept as the last backstop:
both streams may be refined concurrently before either commits its
configuration.

The rules are only registered on GX platforms where the bs-quirk exists
and only when the DAI has a stream in the opposite direction.

[1] https://lore.kernel.org/r/1jik7pebk7.fsf@starbuckisacylon.baylibre.com/

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index c2a280bfdfe2..4c62ea41d7e8 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -147,6 +147,13 @@ static int aiu_encoder_i2s_set_clocks(struct snd_pcm_substream *substream,
 	bs = fs / 64;
 
 	if (aiu->platform->has_clk_ctrl_more_i2s_div) {
+		/*
+		 * The hw rules added in startup() make this unreachable in the
+		 * sequential case, but both streams may be refined concurrently
+		 * before either commits its config, since only ops->hw_params
+		 * runs under the card's pcm_mutex. Re-check against the committed
+		 * state of the other stream, which is stable under that mutex.
+		 */
 		if (aiu_encoder_check_bs_quirk(substream, params, dai)) {
 			dev_err(dai->dev, "bclk requirements incompatible with other stream\n");
 			return -EINVAL;
@@ -333,10 +340,45 @@ static const struct snd_pcm_hw_constraint_list hw_channel_constraints = {
 	.mask = 0,
 };
 
+static int aiu_encoder_i2s_pcm_hw_rule(struct snd_pcm_hw_params *params,
+				       struct snd_pcm_hw_rule *rule)
+{
+	struct gx_stream *other = rule->private;
+	struct snd_interval *ch = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	/*
+	 * The quirk is technically based on the significant bits whereas here
+	 * we're using the physical width for simplicity. This works because
+	 * S16_LE is the only format supported by this encoder that has:
+	 * significant bits = physical width = 16-bits
+	 */
+	struct snd_interval *phys_width = hw_param_interval(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS);
+	struct snd_interval new_i;
+
+	if (other->channels == 0)
+		return 0;
+
+	snd_interval_any(&new_i);
+
+	if (rule->var == SNDRV_PCM_HW_PARAM_CHANNELS) {
+		if (aiu_encoder_is_bs_quirk(other->channels, other->width))
+			new_i.min = new_i.max = 8;
+		else if (snd_interval_single(phys_width) && phys_width->min == 16)
+			new_i.max = 2; /* Force 2ch */
+	} else { /* SNDRV_PCM_HW_PARAM_SAMPLE_BITS */
+		if (aiu_encoder_is_bs_quirk(other->channels, other->width))
+			new_i.min = new_i.max = 16;
+		else if (snd_interval_single(ch) && ch->min == 8)
+			new_i.min = 17; /* Request physical width > 16 bits */
+	}
+
+	return snd_interval_refine(hw_param_interval(params, rule->var), &new_i);
+}
+
 static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
+	struct gx_stream *other_stream = snd_soc_dai_dma_data_get(dai, !substream->stream);
 	int ret;
 
 	/* Make sure the encoder gets either 2 or 8 channels */
@@ -348,6 +390,31 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	/*
+	 * If DAI supports both playback and capture streams ensure the bs-quirk is
+	 * handled correctly.
+	 * This is only valid for GX platforms (has_clk_ctrl_more_i2s_div=true).
+	 */
+	if (aiu->platform->has_clk_ctrl_more_i2s_div && other_stream) {
+		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_CHANNELS,
+					  aiu_encoder_i2s_pcm_hw_rule,
+					  other_stream,
+					  SNDRV_PCM_HW_PARAM_CHANNELS,
+					  SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
+		if (ret)
+			return ret;
+
+		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
+					  aiu_encoder_i2s_pcm_hw_rule,
+					  other_stream,
+					  SNDRV_PCM_HW_PARAM_CHANNELS,
+					  SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * Enable only clocks which are required for the interface internal
 	 * logic. MCLK is enabled/disabled from the formatter and the I2S

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
