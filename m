Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90661C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Dec 2021 23:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtBmfzY1nMCkI9tXjBe8zaHB8NeoLTySg80yZMGGkjY=; b=yK5Vw+K7APq5pR
	y/jxcxPaKx1x3v+WZC0JAyXuoA+ja8euGw3Vs+24hi+jYF34pAWLeTbQTlAYKmHtD2U+jBN0A+rYu
	NaJSEmGUXvoX4eNKPajwiS4RoVapLt+iu52aFStN2Uu9bU3J5nObs8DgqRt+BApHo6Bqc7Vmc1Wq6
	+QT3gl1CiCmsCRs5i0gH3DGJfKkvIeQ8ua50HEfPN8J8776KiSAWCGUsm2nXKL0g/7kUxKECbR2Ks
	iIEUxxIz3Q09xnvxBTdm4t1i92azLyKFZPjvYiFjg+TItZAN8fngJxHzSTXlZG0sMkOYCZcAZrwi2
	+5enF7II25nZGjHSB1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mu0yI-002BiV-87; Sun, 05 Dec 2021 23:31:06 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu0yE-002Bi6-Vo; Sun, 05 Dec 2021 23:31:04 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id b192so5629503vkf.3;
 Sun, 05 Dec 2021 15:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=d3zLncXG+PQsNSIxNxS/1QO1tpBEgTzG8HllI/EvpGk=;
 b=dSMO9H3SxhTocvFK5d8bl+J79twoNQ0iC0uPVdJqHI4++QnpeSPAMR5T3lfGY84tqh
 dtREvaT3bI+mU3CEnhiAShUceQyh74lFofIK6QPrkwaKPMf7yGebjLAdsX17yJI17in/
 PdxqAu0ZDWdgOdOXVKPvX9xWpj2WYhPa7DfxNoxRJujs48KfKmUOUOso1HHK3OVmLyF0
 504+9T0qcUvckUC6+0q0F2HOOYkEuXPWOPNwoiPLWtWuDLglyLDmIdhlC7oqldrg+KWK
 93j3BlSRLdPz9CLx8n062Siv50h2+xHB0kEPGGwgqpoIP5wNrn+k7WDE6rz3QGHP6C2M
 e50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d3zLncXG+PQsNSIxNxS/1QO1tpBEgTzG8HllI/EvpGk=;
 b=PDbz4mL3uvPv6lBGNooZgudk03GQBjbyHMF0NG2c7+aVeNBJ5z4kF3OhEhukY6DM7O
 OmQA2pZbEjoKOn8CoALG+rfw9M2hONuWIgg9c2vz+gdmNLaPMXJbGQ6bTSGVYXXtY6/R
 6p8eA+Paob5KPu9KZYY+OZQnCWKEAoVCk1AAVLOn3t/kXNOGXGV1TFDHdb6P7kB1YVTV
 P4I499thE37E9ovwvjl34GlMVeqOUMnnPIyjNv6O1Sv+Hx0M5BkRHdFhsCiqJ4c1fsdx
 8bQ4tcjDulZ3yyFsOtSNkZnugNO1rsbheTPC5/ekl73E6tdvx84kGTvO9IL/A0q0T/Ke
 M63g==
X-Gm-Message-State: AOAM530NB53OPqQje3arO8qEhzsLCsgVsxZfDc4ADekq3cY7S1jNKCVv
 PlTY+Uv4dm9oo5A/YY9uxus=
X-Google-Smtp-Source: ABdhPJxDBYmOEWl6jseDDRbSpn7ysh4nlGhWuahlraDnJXYwXOCg3ynzr95WzAR6FUF7+kJJghyO8Q==
X-Received: by 2002:a1f:3f4f:: with SMTP id m76mr39515074vka.1.1638747060135; 
 Sun, 05 Dec 2021 15:31:00 -0800 (PST)
Received: from geday ([2804:7f2:8006:9290:f481:1c3e:161e:f26d])
 by smtp.gmail.com with ESMTPSA id y7sm3315969uad.2.2021.12.05.15.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 15:30:59 -0800 (PST)
Date: Sun, 5 Dec 2021 20:30:51 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH RFC v1 2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold
 setting to aiu-fifo-i2s
Message-ID: <Ya1Lq1ZLccxetJwx@geday>
References: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
 <20211205180816.2083864-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211205180816.2083864-3-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_153103_081014_D65DEF1E 
X-CRM114-Status: GOOD (  26.51  )
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

On Sun, Dec 05, 2021 at 07:08:16PM +0100, Martin Blumenstingl wrote:
> The out-of-tree vendor driver uses the following approach to set the
> AIU_I2S_MISC register:
> 1) write AIU_MEM_I2S_START_PTR and AIU_MEM_I2S_RD_PTR
> 2) configure AIU_I2S_MUTE_SWAP[15:0]
> 3) write AIU_MEM_I2S_END_PTR
> 4) set AIU_I2S_MISC[2] to 1 (documented as: "put I2S interface in hold
>    mode")
> 5) set AIU_I2S_MISC[4] to 1 (depending on the driver revision it always
>    stays at 1 while for older drivers this bit is unset in step 4)
> 6) set AIU_I2S_MISC[2] to 0
> 7) write AIU_MEM_I2S_MASKS
> 8) toggle AIU_MEM_I2S_CONTROL[0]
> 9) toggle AIU_MEM_I2S_BUF_CNTL[0]
> 
> Additional testing shows that when AIU_I2S_MISC[2] is set to 1 then no
> interrupts are generated anymore. The way this bit is managed by the
> vendor driver as well as not getting any interrupts can mean that it's
> related to the FIFO and not the encoder.
> 
> Move setting the AIU_I2S_MISC[2] bit to aiu_fifo_i2s_hw_params() so it
> closer resembles the flow in the vendor kernel. While here also
> configure AIU_I2S_MISC[4] (documented as: "force each audio data to
> left or right according to the bit attached with the audio data")
> similar to how the vendor driver does this. This fixes the infamous and
> long-standing "machine gun noise" issue (a buffer underrun issue).
>

Tested-by: Geraldo Nascimento <geraldogabriel@gmail.com>

---

About the test setup:

Board is from H96Pro+ TV BOX, Amlogic S912 with 3G RAM, 32GB eMMC and a
QCA9377 SDIO wifi chip. Sticker in the underside of the board says
CZ-S32-V6 which I suppose is the manufacturer's name/revision of the
PCB.

Tested with Audacious, audio output is ALSA without any plugins such as
dmix, etc.

First I made sure the problem was reproducible. Just skipping the track
on Audacious from one point to another would result in severe noise. I
then applied Martin's patch and noise is gone for good.

Thanks,
Geraldo Nascimento

> Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Reported-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  sound/soc/meson/aiu-encoder-i2s.c | 33 -------------------------------
>  sound/soc/meson/aiu-fifo-i2s.c    | 12 +++++++++++
>  2 files changed, 12 insertions(+), 33 deletions(-)
> 
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index 932224552146..67729de41a73 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -18,7 +18,6 @@
>  #define AIU_RST_SOFT_I2S_FAST		BIT(0)
>  
>  #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
> -#define AIU_I2S_MISC_HOLD_EN		BIT(2)
>  #define AIU_CLK_CTRL_I2S_DIV_EN		BIT(0)
>  #define AIU_CLK_CTRL_I2S_DIV		GENMASK(3, 2)
>  #define AIU_CLK_CTRL_AOCLK_INVERT	BIT(6)
> @@ -36,37 +35,6 @@ static void aiu_encoder_i2s_divider_enable(struct snd_soc_component *component,
>  				      enable ? AIU_CLK_CTRL_I2S_DIV_EN : 0);
>  }
>  
> -static void aiu_encoder_i2s_hold(struct snd_soc_component *component,
> -				 bool enable)
> -{
> -	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> -				      AIU_I2S_MISC_HOLD_EN,
> -				      enable ? AIU_I2S_MISC_HOLD_EN : 0);
> -}
> -
> -static int aiu_encoder_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
> -				   struct snd_soc_dai *dai)
> -{
> -	struct snd_soc_component *component = dai->component;
> -
> -	switch (cmd) {
> -	case SNDRV_PCM_TRIGGER_START:
> -	case SNDRV_PCM_TRIGGER_RESUME:
> -	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -		aiu_encoder_i2s_hold(component, false);
> -		return 0;
> -
> -	case SNDRV_PCM_TRIGGER_STOP:
> -	case SNDRV_PCM_TRIGGER_SUSPEND:
> -	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		aiu_encoder_i2s_hold(component, true);
> -		return 0;
> -
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
>  static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
>  				      struct snd_pcm_hw_params *params)
>  {
> @@ -353,7 +321,6 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
>  }
>  
>  const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
> -	.trigger	= aiu_encoder_i2s_trigger,
>  	.hw_params	= aiu_encoder_i2s_hw_params,
>  	.hw_free	= aiu_encoder_i2s_hw_free,
>  	.set_fmt	= aiu_encoder_i2s_set_fmt,
> diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
> index 2388a2d0b3a6..d0a1090d6465 100644
> --- a/sound/soc/meson/aiu-fifo-i2s.c
> +++ b/sound/soc/meson/aiu-fifo-i2s.c
> @@ -20,6 +20,8 @@
>  #define AIU_MEM_I2S_CONTROL_MODE_16BIT	BIT(6)
>  #define AIU_MEM_I2S_BUF_CNTL_INIT	BIT(0)
>  #define AIU_RST_SOFT_I2S_FAST		BIT(0)
> +#define AIU_I2S_MISC_HOLD_EN		BIT(2)
> +#define AIU_I2S_MISC_FORCE_LEFT_RIGHT	BIT(4)
>  
>  #define AIU_FIFO_I2S_BLOCK		256
>  
> @@ -90,6 +92,10 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
>  	unsigned int val;
>  	int ret;
>  
> +	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> +				      AIU_I2S_MISC_HOLD_EN,
> +				      AIU_I2S_MISC_HOLD_EN);
> +
>  	ret = aiu_fifo_hw_params(substream, params, dai);
>  	if (ret)
>  		return ret;
> @@ -117,6 +123,12 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
>  	snd_soc_component_update_bits(component, AIU_MEM_I2S_MASKS,
>  				      AIU_MEM_I2S_MASKS_IRQ_BLOCK, val);
>  
> +	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> +				      AIU_I2S_MISC_FORCE_LEFT_RIGHT,
> +				      AIU_I2S_MISC_FORCE_LEFT_RIGHT);
> +	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> +				      AIU_I2S_MISC_HOLD_EN, 0);
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
