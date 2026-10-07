Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EFDCA5FFF
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWUvwtXvfIL9hHEY/rpvWtvSGeKulgRGlCPBIP2PZlU=; b=W9DloB2MCrvI09
	v7FxBhtWL7NzLMUmWdvqSdT9HFR4oZeG1iIdV/p+uUcMNudh4Q/gscoTHT3dUL3henHdGVLXs54bV
	S9KgfL8/kGEL9S/0WSCnU+53+lfG0cCmHWGgbKgBzAszfUpFZBhqzcLFsN+W9DadirhyY7i3poc/V
	reTa3i+x75Xt1b/8bUL1ZlS1IzRvYONbwcMuT7kB3i421G/zAEJ2dbt3sihIEaAYPbokxMJpb/PK7
	ns8Pk591y2gNU5iHmWM9QCOo0yGyge8QPYHBZFudUJ5Z3jVbyjdsLOHXfDiGQoeHTX8/zoT4k9xwc
	edUG6ciFWdQ+i3ZSL24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENKY-00000001yvc-1rIT;
	Wed, 07 Oct 2026 08:48:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENKV-00000001yuL-0NhN
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:48:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a17f65ab8bso3159605e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362929; x=1791967729; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3WmTcY7Cx2LB7n34xA1mszrSAOkEucT8groA+9/JLE=;
        b=k4Avs+XVSiqewAFVG40RPgfxh8A2cDUX1HvoZPL8s2yghpmFb+Jdb8AC6RWLjV5iPJ
         1Dv7Wj//BNyJuULcPSEGe1lWaZCh+gQt07CV0OV9MJb/khTkDTUXPjqhWvI/GL3ljqn7
         1qfCzuPBm8BK0UYWFtjxpeBIiWkOdyPfAHUZUYXTKtKV5JHiI5s04qu33HbH0f6hg3C1
         ZdOzpKgOrjwxrsoTUeExLhLSQWfWy52TcXpx8S42Zvwzktpr90l61WSmOVzhcoDCXnF0
         g72DYL4Eb5/TNyhxso9K7mScsM8fOZd/j/U6Ys1oNedF26vCmBhxUZMOORjwVcrl6Oxw
         ht6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362929; x=1791967729;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3WmTcY7Cx2LB7n34xA1mszrSAOkEucT8groA+9/JLE=;
        b=S5wYkxMf6xVOSmMwOSF55dQeC+fwY57iCwLumuQO6wnTNpPupkSn1HiZVHcPobGmpd
         hU9g6aHqWrx2xgtsj5EVINS5VAA1GhqC2vlPQGejlL8A71sl5r1fjX1d/RUxxWh7Gzbf
         zn6VfIoA2GVMRu0QiUhlkk4RwuuCf9mRKBoVRgdaKTYA0fQh0auyulh+U82ZeaXcgrAE
         LvWpUIY99thgze1YzmP3ZMs9EUHKjCgKOW9HeFcAIyJp+llgQ+DVNcPP0bAmoHRIvNMU
         Wd1nOOjev16x6ZyNuXbMVhXXEg9abMtQutSIDrMuyOCy4p3U9SqKl7+BKiPDB1KvlDk4
         O/pw==
X-Forwarded-Encrypted: i=1; AKwUvBwZlIUcVFFWhwSEBAqcDlGSeig83J0h/BghjsIi9SyU2iHg1fk5OH+4Q6dOonjC6/3V4pYn+SgOgE0kHDJP@lists.infradead.org
X-Gm-Message-State: AFuF++mNI/gWo0UHH2i3rjVp8XUOcshZVmvyydHT31/0bcc9jjglqE/s
	3Hi0sPFoN0H/XoEeZRv7/acMANLynv3dpbTKKDeq7C9tYAOHIERcCJDJgFY42P9FqR7IbcG5+NX
	AikdebDg=
X-Gm-Gg: AYBFou3IpYIln4Rh11zqQDy9BblEuLt/xBNQwyLHMZtE9PgmFL1F8+loYNvGGepSqCA
	zx3ZPBpJL020JGQBKQpDwkx1H/HSLgyr+nUiRx9w45fYBD2IYuxLNcVNdVdhYBL8j6sBAJ6T65x
	L2buu2L0PbvZiZrAIw2+0BgpwCRt9kN+Wpxjp0OhiVswJvkBCWQNuXR1IF84D3a2fMLfOa2aP7X
	zS2m9JKnbvi685p3/ZwVbvlx+VxZSXyz77EkquY+ZMfqUEUn4qNrv+rwul80pZ4r8WIWg1XUe2t
	Z82Hiz9P+kScr8dKeXW5fZNTTboPzetGeO3BMMtWtS+OAwL0YtY7E1SFOW5Bd1u1iGgXKdDIXIk
	MSYsUFJLM/aq2B+Yq/BHKN1Y9V5HB9siBb2dYcdp2GVLwdlfwskQN+YcUth9lGsrPoIEL2Wjzps
	htSG/XR9vTgO2g0gbwSBF/NJJwkmGOvHVdP1A7aFDpax71CBAOgwTWX9ldRe1w7uqcMXzRTfdeA
	4S3vAAIAWLb16o=
X-Received: by 2002:a05:600c:4687:b0:4a1:7811:6cc4 with SMTP id 5b1f17b1804b1-4a180650943mr24592905e9.34.1791362929425;
        Wed, 07 Oct 2026 01:48:49 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f558028sm58745425e9.10.2026.10.07.01.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:48:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 5/7] ASoC: meson: aiu: add I2S Capture DAI
In-Reply-To: <20261001-audin-v4-5-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-5-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:48:46 +0200
Message-ID: <1j33uhzyj5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_014851_149750_B8DEAB62 
X-CRM114-Status: GOOD (  21.95  )
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

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Add capture stream to CPU_I2S_ENCODER making it able to handle both
> playback and capture streams. Captured data is formatted from
> "audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
> FIFO and then bulk transmitted into RAM when the FIFO is full.
>
> As for the naming of the stream "I2S Encoder" is kept as base following
> the same pattern used for the playback stream and with the goal to minimize
> changes.
>
> Supported format for capture is currently limited to S16_LE because it's
> the only one that has been tested. According to the manual also S24_LE
> should be supported, but this is kept as follow-up.

---

>
> This capture support also takes advantage of the following commits that
> has recently been merged:
>
> commit df3c987ab3d7 ("ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints")
> commit e82159384a50 ("ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling")
>
> They ensure bs_quirk and rate symmetry across playback and capture streams.
>

I don't think this part of the description is necessary.

Apart from that

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>


> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  sound/soc/meson/aiu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 535fbf7c1639..14d0e20a4bd6 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
>  			.rates = SNDRV_PCM_RATE_8000_192000,
>  			.formats = AIU_FORMATS,
>  		},
> +		.capture = {
> +			.stream_name = "I2S Encoder Capture",
> +			.channels_min = 2,
> +			.channels_max = 2,
> +			.rates = SNDRV_PCM_RATE_8000_192000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +		},
>  		.ops = &aiu_encoder_i2s_dai_ops,
>  		.symmetric_rate = 1,
>  	},
>
> -- 
> 2.47.3
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
