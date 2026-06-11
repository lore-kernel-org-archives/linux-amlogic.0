Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3F2CD98D2
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2N0hmsDuniCE2aKNZW80PkxFhe3BXimrtX8QzrzHhao=; b=49L9G5Yn2XY0Xk
	i5Dd9j/KQ04EdEpTP0gc0j5laU2KruNeZ+pvZOwdjIkW/49c1XburID3PaCbw4foVsEpnQ0EZdypd
	D1PEyb6VZfytCN71OninkZ3hiLEqIKFZJzIlIkRav/621tpAaAHnale8G3KL/U7UqvVofVzRg6f6u
	sjM75+Ft1FR7QvqJGee5Hq4oz1orKF9efqsik1L2ULS+S3/d4S8klrN8CRa7PFSyG8lVuQ9dTm51O
	34efGHE8rVWxNZ4UOFxfy+y73Yh56Kdk8mGFLOf+7VcyXy1iomzBZnSdxaeWIaP6bv1TxEldjEJK9
	aFY6fTQ2XPkhjX6MV2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXab1-00000008z5Y-0Wrw;
	Thu, 11 Jun 2026 08:17:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaaz-00000008z4f-0TiR
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jun 2026 08:17:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490af320e2aso84928525e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 01:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781165819; x=1781770619; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zoiq5NgKRX1DRsdChedCw+S75QetxhREZMAZtFGcN0o=;
        b=Mt/f3udfqYxK4S3tzjocGYhQGm/4cBeiYWIZQQ8o6pMh3fCtou6ovz65uE9SeykZ+p
         gwXF1lID5zVvjuUv61oKfv+1LIJKmgmIIe2vG1AHYMmLLoj8Jt+FyjUGciJNKOC9UC11
         eNo2KV+ikJ4kmowVTrUGeNosbxuG5ZxXL0mCSojWyGu+xB+bCGVFMLNwedsD3kmWI0pX
         iXYYXm8Kj3Ty8xFMyeSz29nmfirIo76vjkYOjQhSGHJJZb3Ggto8TgqQ+0wMeNn2Uwer
         UkIqs+NF4v88NvUa/kDq2KVuK0Igq4kwHy7qB9NJXrUr2hY+PQmLtdxhVI0YXbqK12Ih
         tFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165819; x=1781770619;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zoiq5NgKRX1DRsdChedCw+S75QetxhREZMAZtFGcN0o=;
        b=DTiI+qg3qx9AQXhstAurGrqYQo6/dvWVS3hshT7qaz9mzkaSApMULMb8CCKumWuwLT
         3bYo+AH2xJd3pvl8+tIpZii9e0gLHTXuCqP96DZ6d83JuK5cUeadZ+wg20sBZlEIdgHl
         A8AssvsWoByOt0/wQVXQjayK55c4466imAdOnxZwGibK+WKT6/tEO/Avj41RrOzyWRam
         TkK+QMpuPt2v/KFCc/duz67s9c9P6v7mY6xtLwMhp0xdMiUwKAsiSkhfs9PXok0S/p6q
         6R4ltggD2pMu4p9eU9dq92MIrQ7/dGw09GbSDl6BxdRCK2Utpcp1nF9454fo2FTjFhKI
         Kjmg==
X-Forwarded-Encrypted: i=1; AFNElJ95NFhx3eIHeO+JjmrwwnIBkbsJF+6PGP+8NdbGXuarqGxBV7zP2jqCe5x01Rfc875sondwpMUJwMuYLNsv@lists.infradead.org
X-Gm-Message-State: AOJu0YzO3WbBMNHPNDUji6GnnpmaRccv0eEovGU2r/5oreAlXXULf9qq
	ivA7uQy79vfOZqsz7BTnvApvGFTOgSc/CdPomCU5OXOPoye4R5CFqJteuthXTFn5YHU=
X-Gm-Gg: Acq92OFiEQRrFoXw8dzeZGNQ/CkIlFyWb0mgejKBIvZ6AHAL2L4y5gCYmmGF5oliHPl
	qKzSO7fzaJ8uJkYANsBOYE4FHhIAHevSB9J4CSeypy9IUNmGJ7y8r+aWnsqt1D5uCu5NYonScxO
	ARP/aW1VY8+NwMIhTJISQGh9jvQNcZyIQhKG+0WjZKf1CScw9aqYCj0kJStWoQ+gznzKL+FpOCm
	MXiZoDesq4SsZ/IpMJeymbcgYHmTUksw0Iqqvn/PTTuFLb+brFl2XVkwKAzgC2D/mj+cwrcKtN6
	sdtJ2oEl8a/PrJSXpRwvbkUC3+E5rRhd6nW4QQGmBFHO3hPmwYXD7ulOl/E8X8GgVkKkUjOWhL8
	6Wk4HGR2O3hNs21rglYadPvThkHeZZKaNOzcQ+pb+8rY6VCzIs80iOQ7OorfyKHumVLdBuHNtRz
	6MvKlI1WkqIpSXLaCMzDHHqUo4d1hNVQ4S
X-Received: by 2002:a05:600d:8492:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-490e55e2130mr10999335e9.11.1781165818648;
        Thu, 11 Jun 2026 01:16:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d1b:88ba:5161:3581])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f2dc577sm80589967f8f.3.2026.06.11.01.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:16:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/4] ASoC: meson: aiu-encoder-i2s: prepare for
 multiple streams
In-Reply-To: <20260610-reshape-aiu-as-axg-v2-2-cac3663a8b51@baylibre.com>
	(Valerio Setti's message of "Wed, 10 Jun 2026 23:29:26 +0200")
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
	<20260610-reshape-aiu-as-axg-v2-2-cac3663a8b51@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 11 Jun 2026 10:16:56 +0200
Message-ID: <1jik7pebk7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_011701_237461_06CF664A 
X-CRM114-Status: GOOD (  35.21  )
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

On mer. 10 juin 2026 at 23:29, Valerio Setti <vsetti@baylibre.com> wrote:

> aiu-encoder-i2s is going to be the interface that handles both playback
> and capture, so this commit does all the required changes to prepare
> for that since so far it only handled playback:
> - probe/remove functions are added to allocate/free per stream data,
>   respectively.
> - 'struc gx_iface' and 'struct gx_stream' are used to store interface or
>   stream associated data, respecively.
> - interface wide rate symmetry is enforced.
> - quirks on bclk are also enforced if/when necessary.
>
> Clock-wise instead of bulk enabling all the clocks on startup and disabling
> them on shutdown, only the peripheral's internal ones are enabled/disabled
> in those functions, whereas MCLK and I2S clock divider are handled in
> prepare/hw_free.
>
> Finally a trigger() callback is also added to start/stop the associated
> I2S data formatter.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  sound/soc/meson/aiu-encoder-i2s.c | 207 ++++++++++++++++++++++++++++++++++----
>  sound/soc/meson/aiu.h             |   3 +
>  2 files changed, 193 insertions(+), 17 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index 3b4061508c18047fe8d6f3f98061720f8ce238f2..f50b03824ad280afabb31eecc20ccb855defa11e 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -10,6 +10,8 @@
>  #include <sound/soc-dai.h>
>  
>  #include "aiu.h"
> +#include "gx-formatter.h"
> +#include "gx-interface.h"
>  
>  #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
>  #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
> @@ -112,6 +114,9 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
>  					struct snd_pcm_hw_params *params,
>  					unsigned int bs)
>  {
> +	struct aiu *aiu = snd_soc_component_get_drvdata(component);
> +	struct gx_iface *iface = &aiu->i2s.iface;
> +
>  	/*
>  	 * NOTE: this HW is odd.
>  	 * In most configuration, the i2s divider is 'mclk / blck'.
> @@ -126,6 +131,18 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
>  			return -EINVAL;
>  		}
>  		bs += bs / 2;
> +		iface->bs_quirk = true;
> +	} else {
> +		/*
> +		 * If the bs quirk is currently applied for one stream and another
> +		 * ones tries to setup a configuration for which the quirk is
> +		 * not required, then fail.
> +		 */
> +		if (iface->bs_quirk) {
> +			dev_err(component->dev,
> +				"bclk requirements are incompatible with active stream\n");
> +			return -EINVAL;

This comment is not blocking thing IMO, more a request for future
improvments.

What I do not like here is the user may get an unexpected failure while
setting up the stream, because of something that did not show up the
contrainst we provided. IOW, it is kind of too late.

The problem is not new to this driver, the same applies to the error
returned if bs is not a multiple of 2 :(

It would be nice if this problem could be reflected in the contraints
to avoid returning an error this late in the stream setup.


> +		}
>  	}
>  
>  	/* Use CLK_MORE for mclk to bclk divider */
> @@ -145,14 +162,15 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
>  				      struct snd_pcm_hw_params *params)
>  {
>  	struct aiu *aiu = snd_soc_component_get_drvdata(component);
> +	struct gx_iface *iface = &aiu->i2s.iface;
>  	unsigned int srate = params_rate(params);
>  	unsigned int fs, bs;
>  	int ret;
>  
>  	/* Get the oversampling factor */
> -	fs = DIV_ROUND_CLOSEST(clk_get_rate(aiu->i2s.clks[MCLK].clk), srate);
> +	fs = DIV_ROUND_CLOSEST(iface->mclk_rate, srate);
>  
> -	if (fs % 64)
> +	if ((fs % 64) || (fs == 0))
>  		return -EINVAL;
>  
>  	/* Send data MSB first */
> @@ -188,24 +206,59 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
>  				     struct snd_pcm_hw_params *params,
>  				     struct snd_soc_dai *dai)
>  {
> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
> +	struct gx_iface *iface = ts->iface;
>  	struct snd_soc_component *component = dai->component;
>  	int ret;
>  
> -	/* Disable the clock while changing the settings */
> -	aiu_encoder_i2s_divider_enable(component, false);
> +	/*
> +	 * Enforce interface wide rate symmetry only if there is more than
> +	 * 1 stream active.
> +	 */
> +	if (snd_soc_dai_active(dai) > 1) {
> +		if (iface->rate && iface->rate != params_rate(params)) {
> +			dev_err(dai->dev, "can't set iface rate (%d != %d)\n",
> +				iface->rate, params_rate(params));
> +			return -EINVAL;
> +		}
> +	}
>  
>  	ret = aiu_encoder_i2s_setup_desc(component, params);
>  	if (ret) {
> -		dev_err(dai->dev, "setting i2s desc failed\n");
> +		dev_err(dai->dev, "setting i2s desc failed: %d\n", ret);
>  		return ret;
>  	}
>  
>  	ret = aiu_encoder_i2s_set_clocks(component, params);
>  	if (ret) {
> -		dev_err(dai->dev, "setting i2s clocks failed\n");
> +		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
>  		return ret;
>  	}
>  
> +	iface->rate = params_rate(params);
> +	ts->physical_width = params_physical_width(params);
> +	ts->width = params_width(params);
> +	ts->channels = params_channels(params);
> +
> +	return 0;
> +}
> +
> +static int aiu_encoder_i2s_prepare(struct snd_pcm_substream *substream,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
> +	struct snd_soc_component *component = dai->component;
> +	int ret;
> +
> +	if (ts->clk_enabled)
> +		return 0;
> +
> +	ret = clk_prepare_enable(ts->iface->mclk);
> +	if (ret)
> +		return ret;
> +
> +	ts->clk_enabled = true;
> +
>  	aiu_encoder_i2s_divider_enable(component, true);
>  
>  	return 0;
> @@ -214,9 +267,24 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
>  static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>  				   struct snd_soc_dai *dai)
>  {
> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
> +	struct gx_iface *iface = ts->iface;
>  	struct snd_soc_component *component = dai->component;
>  
> -	aiu_encoder_i2s_divider_enable(component, false);
> +	/*
> +	 * If this is the last substream being closed then disable the i2s
> +	 * clock divider and clear 'iface->rate'.
> +	 */
> +	if (snd_soc_dai_active(dai) <= 1) {
> +		aiu_encoder_i2s_divider_enable(component, 0);
> +		iface->rate = 0;
> +		iface->bs_quirk = false;
> +	}
> +
> +	if (ts->clk_enabled) {
> +		clk_disable_unprepare(ts->iface->mclk);
> +		ts->clk_enabled = false;
> +	}
>  
>  	return 0;
>  }
> @@ -224,6 +292,8 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>  static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  {
>  	struct snd_soc_component *component = dai->component;
> +	struct aiu *aiu = snd_soc_component_get_drvdata(component);
> +	struct gx_iface *iface = &aiu->i2s.iface;
>  	unsigned int inv = fmt & SND_SOC_DAIFMT_INV_MASK;
>  	unsigned int val = 0;
>  	unsigned int skew;
> @@ -255,9 +325,12 @@ static int aiu_encoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  		skew = 0;
>  		break;
>  	default:
> +		dev_err(dai->dev, "unsupported dai format\n");
>  		return -EINVAL;
>  	}
>  
> +	iface->fmt = fmt;
> +
>  	val |= FIELD_PREP(AIU_CLK_CTRL_LRCLK_SKEW, skew);
>  	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
>  				      AIU_CLK_CTRL_LRCLK_INVERT |
> @@ -272,6 +345,7 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>  				      unsigned int freq, int dir)
>  {
>  	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
> +	struct gx_iface *iface = &aiu->i2s.iface;
>  	int ret;
>  
>  	if (WARN_ON(clk_id != 0))
> @@ -280,11 +354,15 @@ static int aiu_encoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>  	if (dir == SND_SOC_CLOCK_IN)
>  		return 0;
>  
> -	ret = clk_set_rate(aiu->i2s.clks[MCLK].clk, freq);
> -	if (ret)
> -		dev_err(dai->dev, "Failed to set sysclk to %uHz", freq);
> +	ret = clk_set_rate(iface->mclk, freq);
> +	if (ret) {
> +		dev_err(dai->dev, "Failed to set sysclk to %uHz: %d", freq, ret);
> +		return ret;
> +	}
>  
> -	return ret;
> +	iface->mclk_rate = freq;
> +
> +	return 0;
>  }
>  
>  static const unsigned int hw_channels[] = {2, 8};
> @@ -305,15 +383,35 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
>  					 SNDRV_PCM_HW_PARAM_CHANNELS,
>  					 &hw_channel_constraints);
>  	if (ret) {
> -		dev_err(dai->dev, "adding channels constraints failed\n");
> +		dev_err(dai->dev, "adding channels constraints failed: %d\n", ret);
>  		return ret;
>  	}
>  
> -	ret = clk_bulk_prepare_enable(aiu->i2s.clk_num, aiu->i2s.clks);
> -	if (ret)
> -		dev_err(dai->dev, "failed to enable i2s clocks\n");
> +	/*
> +	 * Enable only clocks which are required for the interface internal
> +	 * logic. MCLK is enabled/disabled from the formatter and the I2S
> +	 * divider is enabled/disabled in "hw_params"/"hw_free", respectively.
> +	 */
> +	ret = clk_prepare_enable(aiu->i2s.clks[PCLK].clk);
> +	if (ret) {
> +		dev_err(dai->dev, "failed to enable PCLK: %d\n", ret);
> +		return ret;
> +	}
> +	ret = clk_prepare_enable(aiu->i2s.clks[MIXER].clk);
> +	if (ret) {
> +		dev_err(dai->dev, "failed to enable MIXER: %d\n", ret);
> +		clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
> +		return ret;
> +	}
> +	ret = clk_prepare_enable(aiu->i2s.clks[AOCLK].clk);
> +	if (ret) {
> +		dev_err(dai->dev, "failed to enable AOCLK: %d\n", ret);
> +		clk_disable_unprepare(aiu->i2s.clks[MIXER].clk);
> +		clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
> +		return ret;
> +	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
> @@ -321,14 +419,89 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
>  {
>  	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
>  
> -	clk_bulk_disable_unprepare(aiu->i2s.clk_num, aiu->i2s.clks);
> +	clk_disable_unprepare(aiu->i2s.clks[AOCLK].clk);
> +	clk_disable_unprepare(aiu->i2s.clks[MIXER].clk);
> +	clk_disable_unprepare(aiu->i2s.clks[PCLK].clk);
> +}
> +
> +static int aiu_encoder_i2s_trigger(struct snd_pcm_substream *substream,
> +				   int cmd,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
> +	int ret;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		ret = gx_stream_start(ts);
> +		break;
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +	case SNDRV_PCM_TRIGGER_STOP:
> +		gx_stream_stop(ts);
> +		ret = 0;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int aiu_encoder_i2s_remove_dai(struct snd_soc_dai *dai)
> +{
> +	int stream;
> +
> +	for_each_pcm_streams(stream) {
> +		struct gx_stream *ts;
> +
> +		ts = snd_soc_dai_dma_data_get(dai, stream);
> +		if (ts)
> +			gx_stream_free(ts);
> +
> +		snd_soc_dai_dma_data_set(dai, stream, NULL);
> +	}
> +
> +	return 0;
> +}
> +
> +static int aiu_encoder_i2s_probe_dai(struct snd_soc_dai *dai)
> +{
> +	struct aiu *aiu = snd_soc_dai_get_drvdata(dai);
> +	struct gx_iface *iface = &aiu->i2s.iface;
> +	int stream;
> +
> +	for_each_pcm_streams(stream) {
> +		struct gx_stream *ts;
> +
> +		if (!snd_soc_dai_get_widget(dai, stream))
> +			continue;
> +
> +		ts = gx_stream_alloc(iface);
> +		if (!ts) {
> +			aiu_encoder_i2s_remove_dai(dai);
> +			return -ENOMEM;
> +		}
> +		snd_soc_dai_dma_data_set(dai, stream, ts);
> +	}
> +
> +	iface->mclk = aiu->i2s.clks[MCLK].clk;
> +	iface->mclk_rate = clk_get_rate(iface->mclk);
> +
> +	return 0;
>  }
>  
>  const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
> +	.probe		= aiu_encoder_i2s_probe_dai,
> +	.remove		= aiu_encoder_i2s_remove_dai,
>  	.hw_params	= aiu_encoder_i2s_hw_params,
> +	.prepare	= aiu_encoder_i2s_prepare,
>  	.hw_free	= aiu_encoder_i2s_hw_free,
>  	.set_fmt	= aiu_encoder_i2s_set_fmt,
>  	.set_sysclk	= aiu_encoder_i2s_set_sysclk,
>  	.startup	= aiu_encoder_i2s_startup,
>  	.shutdown	= aiu_encoder_i2s_shutdown,
> +	.trigger	= aiu_encoder_i2s_trigger,
>  };
> diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
> index 0f94c8bf608181112d78402532b832eb50c2d409..68310de0bdf7a97d8de2ff306c159248ee9b0ede 100644
> --- a/sound/soc/meson/aiu.h
> +++ b/sound/soc/meson/aiu.h
> @@ -7,6 +7,8 @@
>  #ifndef _MESON_AIU_H
>  #define _MESON_AIU_H
>  
> +#include "gx-formatter.h"
> +
>  struct clk;
>  struct clk_bulk_data;
>  struct device;
> @@ -25,6 +27,7 @@ struct aiu_interface {
>  	struct clk_bulk_data *clks;
>  	unsigned int clk_num;
>  	int irq;
> +	struct gx_iface iface;
>  };
>  
>  struct aiu_platform_data {

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
