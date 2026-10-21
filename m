Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C35560A4AD8
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2026 15:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PvewL+kf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=olo2HQe5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PLIiv38+tnRs118rqJra22fkY5MR2lfxmOn4roreJA=; b=PvewL+kf3urcbR
	LJHYtZbstKUrRbzcBg4jUqCsZSnXcRhJrCSHgGwL7vRKDcugAFgN7qSUg7MjxeWgHdJleAW0Jv9BB
	UvbDN2hkbFkta4bP49SG+rEAJ39zHxG2k2CZy/RbwrgmksAEpI99jKWMmLYT0mQtqttBy3+20Q5sF
	kLDbk/mjeIaTOFGYTabsRZ3a02KbMRjzkcUTGed43zgkJf2yqs3trwZAMNNUUbUWoCUA7jbgHL2Tk
	j8gZQ7nde76kQF28k9M3w0eoKdHTFuP5zgZwH2aBSXC038wI+vaEYJrhnd1/nQJNuK9rLZetauo3J
	5TTSs+10AyxyX9YjOoEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXvS-0000000CCd9-3oUw;
	Wed, 21 Oct 2026 15:08:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXvP-0000000CCbU-3a94
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Oct 2026 15:08:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso11216005e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Oct 2026 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792595298; x=1793200098; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m0Hjc8l32fjqZfSZIiJhNxKSLbC3uFZbj2Kv1jpon6Y=;
        b=olo2HQe5NOoTVr7+NsHeWpF/OYC/mE8558cPVdOlmKzaIbmnLjY5fdTQIGVbgYSSmH
         19X/GF49X1GTYkvUZJnsXg9jS9BkMpmWzAsUD1Kb+Y417Nc/BySZ7qDV3RND34rBGvIx
         YXA1dCfvpjgZd1PzR+mhIlWH/PCzT3AOuvjjeRIN41/AEijOsD9aEyh2FM29fbelMjaq
         A2XEiNmfYsxUSijCyVfOdpfvJZiw3p8gjz3vFX5HM7+pnKScanMoy1iZKV1G3dfXYEiG
         EqzifzhYK3ngcCbkEUK8tNsT9gJqqWpWnWneY3bmIaO3U6P8VCKl5mYx0pV4t8geOQ09
         xGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595298; x=1793200098;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0Hjc8l32fjqZfSZIiJhNxKSLbC3uFZbj2Kv1jpon6Y=;
        b=WAXk6Y7mw3I+KYt9YowBLxWgEkGuylXr3dq+qcv5cNohl29shDtFjQBATDpXm0t1Et
         pS48vvpIi31b60JlAT0iQSYgg9PvQ4JRNMRYrcZ94FXcLGRIsdgsrXEWCSTX+xaVJ632
         qddNlNA4ExXqixeENOUKT/ybSLrStaZOnAJak/1GjMCngE7puNLpLc2/fkZ9MxpVzraF
         e4V6dQePt7v5z+zPaOK6tlTFd1XEh/24zExANNPAr/6YejYte8krElEov/hvsTJTEx3h
         Td9Irg9Z4pN4vFbPqjdfOtWRqtqKoHcPJPUsPp9QWJg2k2kLdtaoyHvtg6p9t4/WR7UR
         UYig==
X-Forwarded-Encrypted: i=1; AKwUvByq+jbl0puyWGtLN9zaLiOf4yqHBh9wPyQYZ84mUF7gT4tm6jdxV691spYP8VxQqZ1l8NochNM5UXhN4Wq/@lists.infradead.org
X-Gm-Message-State: AFq9FYKr4pdI6VprNhB3H9q2ObKMxA00FYiLB1I77KREMyq3e7iksa5s
	6ALaRDOLddBoU45MUlC+hKwGCx+Fv5RZMLOvIrB3KIUQJhE3/YD10ZtwHlA9luy3ylE=
X-Gm-Gg: AYBFou3VSAGC5CE80eT0Vuv7dsO1AyNT4VKw4KPVLGkyxkUlfLCoRU0Z4Y+L0vHtgtN
	PI6zPINFC0Ih/GMFKPWM26/LU2yS2XpgHqsYfyAUWB82+djeixwq/LLQUCz1EoTUiVlH29wcMJ7
	d0MSdz09sAb1Dpn5YUW5ssCluL8RjH1b/WozSTvbd43T2U62heoJyj6WsR3n82DOz6SNZ/WvMQR
	I45oMl0IoSGcSJlL8AZ5K8sAEtvB06JHcXyZ2uaWaBmheaDjrZNgSo9Ueq7VadrSANYLfrPOX0p
	Lr7hAi3JoT4C4L1NinrThHP+psOdD1gHeFN5i32/wb1FwVeqmEUcVA3HQKqOKOg+odBGlm3ykHP
	4WB3/xsb/7CjwOLTyYJo50cfNeaoG+icD/wg2quzGLyUApfEPXOHRu4txIgwoxw2irdIVZlkLC+
	7/HPNRnt5jiXIMq6JXwzuQW4jW+f/ahOCeMSXBog09IGMYzWhz301m4UFYZ0z5n3NMxGJ9wqoAJ
	BkpvVFR1Dba6ktc7EJmI8q1CQBN3NLNOaY4ZHtlGCcUiUUbMwKcRlwE3fRRXR9dimxdUdQTF9Y=
X-Received: by 2002:a05:600c:6296:b0:4a1:df50:5758 with SMTP id 5b1f17b1804b1-4a1fd8cb920mr50004785e9.1.1792595297894;
        Wed, 21 Oct 2026 08:08:17 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm36794605e9.11.2026.10.21.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:17 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec
 driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, jian.xu@amlogic.com, shuai.li@amlogic.com, 
 zhe.wang@amlogic.com
In-Reply-To: <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
Date: Wed, 21 Oct 2026 17:08:09 +0200
Message-Id: <179259528986.4070168.179126639869298765.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=aT/Bvwr1IC3lec+0KVaFiCrr+0v7baOk1896xqidnfQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk3rsaXnu399Vj82hve2avywriU/6z0t5/K4BMyhdGpI
 sSP9cedjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenANzkp4wMLxVKdWfazw34tVSo
 LJAvcne0rSDrowsXO4PktqyfL6b0h+GvXKuDmBjT5pJZ+eztVi5G+Y/WXk2b/XTul0jV5CObErW
 ZAQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_080819_914356_5A4DFF1A 
X-CRM114-Status: GOOD (  16.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The S4 requires additional clock control bits to be turn on while enabled.
> The S4 has 8 TDM lanes, instead of 4 on previous SoC.
> Update the widget accordingly.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 49 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 21941ee552c5..9cfed3702354 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -41,6 +41,9 @@
>  #define  CTRL0_BCLK_SEL_LSB		4
>  #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
>  
> +#define CTRL0_BCLK_ENABLE_SHIFT		30
> +#define CTRL0_MCLK_ENABLE_SHIFT		29

Please follow the indentation convention in place (2 spaces)

> +
>  #define TOACODEC_OUT_CHMAX		2
>  
>  struct g12a_toacodec {
> @@ -141,6 +144,16 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
> +			    &g12a_toacodec_out_enable),
> +	SND_SOC_DAPM_SUPPLY("I2S BCLK Gate", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0, NULL, 0),
> +	SND_SOC_DAPM_SUPPLY("I2S MCLK Gate", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0, NULL, 0),

BCLK Gate => BCLK EN, same for MCLK

> +
> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -226,6 +239,16 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  	{ "OUT Capture", NULL, "OUT EN" },
>  };
>  
> +static const struct snd_soc_dapm_route s4_toacodec_routes[] = {
> +	{ "SRC", "I2S A", "IN A Playback" },
> +	{ "SRC", "I2S B", "IN B Playback" },
> +	{ "SRC", "I2S C", "IN C Playback" },
> +	{ "OUT EN", "Switch", "SRC" },
> +	{ "OUT Capture", NULL, "OUT EN" },
> +	{ "OUT EN", NULL, "I2S BCLK Gate" },
> +	{ "I2S BCLK Gate", NULL, "I2S MCLK Gate" },

Audio signal does not go through those Gate elements
They should be supply path connected to OUT EN.

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
