Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84722CCA476
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Oct 2025 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfn3gFSMWzx1eakslhbJj2o0Ae37RV4z5/HgI390qdo=; b=jz3xhDhx8kVkLY
	z9FYmrtuhdLFQpSoqiCBRjO2oqtO3Q4WC6InIBUH8mZVwLJ3jPoIBHRlcz4CQoWN77RNpDWat9uwU
	/NYi3UJsVd6F8c2O6oIIO3+EaaVz/0GXWzX5fXQwPdPhh4U4GBOaYuq2qQaXaxZ66qRInAs+h8Pxf
	B7dnX2/IS86b6pt//PUg48pEEuNIfsR8pTAhYEui6Pa0gMOIR92L6CY0o04acYtpAgGN9zWE2QpMI
	3KFs/B5f2b6wijDxQbdBuxiYNTMbYcDlr4FnoLbVLa6tKRTaOqGTwInzJodlPiKXWLuIrdhLue52d
	yc//b0gwwHCSYj7f9rVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63ht-00000001fx8-1kdb;
	Tue, 07 Oct 2025 09:10:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v63ho-00000001ftT-3LBw
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Oct 2025 09:10:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so4891929f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Oct 2025 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759828199; x=1760432999; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aX/zzAIxKfdHs3b6O5o4Lrj7f6DfCZwLY5Z3Ozvbs3M=;
        b=Qo/78vr1+mCvxco5rVDppQweK54WGIvdkKgPtolAPcO6jovHryCqeldIdZuvaPaFy2
         taJmBN79LOn10O4kagyvGsrepYGGZ4MA2j/uBSrUQrWpznz3z18IZwe+/6Oi/VQsOGjC
         yjNmfctac4HZQcCvlX4FW06LW+jxEqWajyra2BrKz7nz7GkdF7RQQl4LcgS356XhLcem
         GxwujEbl3qQT1GCeudi9E007iVWQX5Cu0MaNrQ4am5cdgmD9oAWRc/RQXTUQWJMkr+D9
         kYDeaed+J8hemWlsNjGXe+LRCzxKOZwL0FHQBrJqSehnGCSNdaiQ0hxOLlnYVQY5Cev/
         KyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828199; x=1760432999;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX/zzAIxKfdHs3b6O5o4Lrj7f6DfCZwLY5Z3Ozvbs3M=;
        b=N7WGbu7dstZQNpswz0ZxFPsSYu1+IdiWPfd2FFERkqVmBBgD0KmsPX1jT27jVF27rG
         2XxIE5Wq+bO+X4oMjYMhwMYftDluKPy5xxWoO+OLYH/gy0/ewXWFINGUGJS/4xuV57Go
         zgXR6aBKKAQoHuuvpnOH/P80Oq5JtNT4ORGIMmd1DuBG1CgsdoYdATOcknY1//uD0OQL
         SIz2vyawtdn0knMnq+EkRqmfD5LMFxkiG7S0GnMaeXcUkMjsnrZun9tA0CdUeq2xhu9q
         HXsrXKPRVN2Q1aMRDWiKMK3/2Vp4Lq91nZyAUG2zFhppBr2XPSdARHkp5RCLJWUmGybx
         Wurw==
X-Forwarded-Encrypted: i=1; AJvYcCU2eSoDUE26e2/fx2Q+K1MKrX68xD0CdEDQlJTidHMoGEyVtBc9G9T+kn0y+ym2OcbwTsMfzDUzR0zTMLxx@lists.infradead.org
X-Gm-Message-State: AOJu0YxHnqu6B4ORJntCny6h4msqG5bPRvfORFuWULfvMlm/59NMKDis
	25rfRrBbNZY0yZjDwsY0KF1oiD6vcdgUG4tF0r10NBBLH+bxpmvOS9qtxMPiT6lAfbo=
X-Gm-Gg: ASbGnctt/V9d4EpFsRsenhyWS35ZYkit/f4AfQS1tJ9mcJFWhX4B7I+ad95ZODK9pJr
	PoszyUXPMZP1HYBnt0uwKt0DYcuLnAIDiZeo+FwrXajtMnWMlrRNKWDpGK7vDR4uoKPaHUfhUkg
	FQ98msSTvLtm/xD00Fq5zbeBlhj4iu7QK14J0iJYNYgZZ/LQEikXWsnjjN8JR8jnE9V/F4tch3u
	l8i0rOfUsCDHTInLGcDDEM25cm4LES8jS+BRVZ3EUva39bf02UU2syvPLKdAypwyoix4TxZ7SBP
	y3E6WgLtrJQ3JNA6eWqPjRT8PDrgT2q/p3EOJjxbu05sMI5G+5GxA8LUH8m9+XgGKJ9QVufD+vo
	k7AltZ5M3Y+lTykiakxXm3ES2JJKCGg8MMzQCfNWjhY9twg==
X-Google-Smtp-Source: AGHT+IF130TGahKPPoII82+V1/81eeS1iNZCVCSTkdS9QhSxObU5gtpJPCiviLrBgBxmw1J7M2QzJw==
X-Received: by 2002:a05:6000:26d1:b0:3ec:db87:ff53 with SMTP id ffacd0b85a97d-425829bf154mr1925989f8f.12.1759828198634;
        Tue, 07 Oct 2025 02:09:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:513d:7ba9:7d81:1c37])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8f01absm24412592f8f.44.2025.10.07.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:09:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  vsetti@baylibre.com,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: aiu-encoder-i2s: fix bit clock polarity
In-Reply-To: <20251007-fix-i2s-polarity-v1-1-86704d9cda10@baylibre.com>
	(Valerio Setti via's message of "Tue, 07 Oct 2025 00:12:19 +0200")
References: <20251007-fix-i2s-polarity-v1-1-86704d9cda10@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 07 Oct 2025 11:09:57 +0200
Message-ID: <1jplaz3wnu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_021001_164114_D132E407 
X-CRM114-Status: GOOD (  19.67  )
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

On Tue 07 Oct 2025 at 00:12, Valerio Setti via B4 Relay <devnull+vsetti.baylibre.com@kernel.org> wrote:

> From: Valerio Setti <vsetti@baylibre.com>
>
> According to I2S specs audio data is sampled on the rising edge of the
> clock and it can change on the falling one. When operating in normal mode
> this SoC behaves the opposite so a clock polarity inversion is required
> in this case.
>
> This was tested on an OdroidC2 (Amlogic S905 SoC) board.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Tested on the libretech cc s905x (GXL)

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/aiu-encoder-i2s.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index a0dd914c8ed13616fbcbc0828e36418cfd255391..3b4061508c18047fe8d6f3f98061720f8ce238f2 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -236,8 +236,12 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	    inv == SND_SOC_DAIFMT_IB_IF)
>  		val |= AIU_CLK_CTRL_LRCLK_INVERT;
>  
> -	if (inv == SND_SOC_DAIFMT_IB_NF ||
> -	    inv == SND_SOC_DAIFMT_IB_IF)
> +	/*
> +	 * The SoC changes data on the rising edge of the bitclock
> +	 * so an inversion of the bitclock is required in normal mode
> +	 */
> +	if (inv == SND_SOC_DAIFMT_NB_NF ||
> +	    inv == SND_SOC_DAIFMT_NB_IF)
>  		val |= AIU_CLK_CTRL_AOCLK_INVERT;
>  
>  	/* Signal skew */
> @@ -328,4 +332,3 @@ const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
>  	.startup	= aiu_encoder_i2s_startup,
>  	.shutdown	= aiu_encoder_i2s_shutdown,
>  };
> -
>
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20251006-fix-i2s-polarity-d744338fa223
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
