Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C18C021A2
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Feb 2025 09:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0T/8nIVHweT0KFmnRcNAagohIvgJMcAcWOgJnrfO1s=; b=Sw8fMfR9hZQsXc
	Ha8Aa7JYeeDEkabEUmVTHKH4O/8p0K5cK59EPrQr/ZtGSg3SawScg4PHda6+0YZymKyjKbFhsN5Nr
	dNf6HPxpQ9SlJFRr0ys8nk4JXDxDhzRoTz2p5SImOmuzTP9iJdOx7JXNp88TE4v+1IpIwbh66kMW+
	H6GNygNdOGeLMvE8KswfWXq5VuPxZiytD1DUT98xQQkvFzD34RHFrDiWPO9Sk9+oaojsgtVwrZfmB
	OJ7lX1sVCqAbdvus07puKdIYPggdLcUK8OJpxoaRSOctAtm7Tntjs13EWWH9P85r6EUeC7RhtVvoM
	y8SQYmuhkz9dJcZ6HlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmSy-000000039DC-3RbI;
	Tue, 11 Feb 2025 09:22:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmSu-000000039C8-1ekB
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Feb 2025 09:22:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so2461043f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Feb 2025 01:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739265718; x=1739870518; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OSBpqskqYl6ayQw41rOB3r8d7agUuaMpsP1NtvCEbRc=;
        b=aIPfpnJQFH8aRH8cDRO5NWkEzahH2mSHkMJBDAITLKXgweeDE7chQat6TnEycNbjpc
         Nns3UzdRK5Jl/B04h2rNlvyQF0M6zqG/zSMJlr4Vf+GVjdrq1NOgh48tZ/23ztUyfjRv
         ttynPnPIOPhzb5kAUU175cdK4MrX2yYxvhy+hjLpsVMMaFGWBXnTlmWNVtdSLGWeb6Wc
         Z0uogQTH3pDx2rIVWZqMfJ2sq5P4DSTI0QbWN8tnwCOVfDJu/wdluNmdm/AUXaWyNWZH
         djPF81rx/l+UyliSBO+7UiFqiQyFQW50tpF/oLl5NvVv6I0pjMAkH9uUJ9GdwlGMPApx
         gWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265718; x=1739870518;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSBpqskqYl6ayQw41rOB3r8d7agUuaMpsP1NtvCEbRc=;
        b=dftIrCOs1OBmRNi/208LEGo5shMw+Ci3Wa+0Xu7sS6oKf3C1TUz0qSBCr0z5E3RmKt
         w6JJz2iWaKdblX3ymqEIP7Z2suVDWP9ZprnKGB+7rG0YOPpwgOExh3td0KUtAmbaiu8D
         FzbtfE0eDk50CqUY5Kx7VgfylHkYE7vpSGq8GVgYgxtXog4F7kdl4ptMYERA3LkLusue
         0O1Wt3BtqtUMjCHgg+/CP6VSCIZ2X/1fydcHoV52UTJIXF+dO/Gogb40h5XsTuPOjxU1
         HN0aG3fa5ZTCzQmm0Cxghve1nofTYs06t7wz2cFxsdAfq+vd6rDs4YnD+kXXag58kZY6
         TWlg==
X-Forwarded-Encrypted: i=1; AJvYcCVqS7EJZ/STTRXScrGm974fR54H5OMBdklKqflU0eQ4jkuwnx39cLjXDYg17Fn2asJiqX3QHEtk+5lZjKdd@lists.infradead.org
X-Gm-Message-State: AOJu0YzAfE3i27es7JoiRfVvwL4JmoZhavisSWZJNMiIUwWXu4R/YKAn
	ZmbKBeVCvcTrh4KzWSCK69a46YUehPReO6eOlVtNEfos9xlCOKvbZUKWV47RMVU=
X-Gm-Gg: ASbGncv59On4KSdBB2q+WotJcwG1gsNy5xV+GkG8fFiKa0ewuidBEpoLJgVCwjpU1dq
	NL3FlisV3kz739P/VHhI07bkYD2uFzLnGcqvk4VEzlu2Txx5o6678IumVVzx7TSryrvyq1FWNEd
	50o9uhUeFTzWurC47Yz5cf7AR3XuE81uoJd5t9Ntc2CXUqcax4/DWlG8v/9l93GGChBlc1OtIK5
	cnkpOC8NIYwITqe+vJ03F8ueEUkZxaTChcq8MN6rIXn4rYdVMBGo2erDtKmy7jl7EAvIhu7EAJN
	kPWpLHQGZkwFtug=
X-Google-Smtp-Source: AGHT+IF4hEwsFKeJpPrmLZYz/Yncvp3n/x/5YGURrCAI98wNozr/rpnT1nZBmPeXy33oo82tc678GQ==
X-Received: by 2002:a5d:64c9:0:b0:38d:dd70:d705 with SMTP id ffacd0b85a97d-38ddd70e0a0mr7069935f8f.15.1739265717969;
        Tue, 11 Feb 2025 01:21:57 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcef5c9c6sm10465902f8f.86.2025.02.11.01.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:21:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: neil.armstrong@linaro.org,  khilman@baylibre.com,
  martin.blumenstingl@googlemail.com,  linux-amlogic@lists.infradead.org,
  linux-sound@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/6] ASoC: meson: add AUDIN driver
In-Reply-To: <20250210150129.40248-4-vsetti@baylibre.com> (Valerio Setti's
	message of "Mon, 10 Feb 2025 16:01:26 +0100")
References: <20250210150129.40248-1-vsetti@baylibre.com>
	<20250210150129.40248-4-vsetti@baylibre.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Tue, 11 Feb 2025 10:21:56 +0100
Message-ID: <1jr04425vv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_012200_656700_F4C057C9 
X-CRM114-Status: GOOD (  42.43  )
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

On Mon 10 Feb 2025 at 16:01, Valerio Setti <vsetti@baylibre.com> wrote:

> Add support for the AUDIN driver which provides audio input capabilities
> to the Amlogic GXBB platform. As of now it is composed by:
> - I2S decoder which receives I2S audio samples from some external codec;
> - toddr module which transfers collected audio samples to an internal
>   FIFO first and then to RAM.
>
> I2S is the only supported audio source as of now, but others are possible
> and can be added in the future.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  sound/soc/meson/Kconfig             |   6 +
>  sound/soc/meson/Makefile            |   4 +
>  sound/soc/meson/aiu-encoder-i2s.c   |   2 +-
>  sound/soc/meson/audin-decoder-i2s.c | 247 +++++++++++++++++
>  sound/soc/meson/audin-toddr.c       | 403 ++++++++++++++++++++++++++++
>  sound/soc/meson/audin.c             | 321 ++++++++++++++++++++++
>  sound/soc/meson/audin.h             | 119 ++++++++

I'd suggest to split this into more changes if you can

>  7 files changed, 1101 insertions(+), 1 deletion(-)
>  create mode 100644 sound/soc/meson/audin-decoder-i2s.c
>  create mode 100644 sound/soc/meson/audin-toddr.c
>  create mode 100644 sound/soc/meson/audin.c
>  create mode 100644 sound/soc/meson/audin.h
>
> diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
> index 6458d5dc4902..3a86c6be08aa 100644
> --- a/sound/soc/meson/Kconfig
> +++ b/sound/soc/meson/Kconfig
> @@ -12,6 +12,12 @@ config SND_MESON_AIU
>  	  Select Y or M to add support for the Audio output subsystem found
>  	  in the Amlogic Meson8, Meson8b and GX SoC families
>  
> +config SND_MESON_AUDIN
> +	tristate "Amlogic AUDIN"
> +	help
> +	  Select Y or M to add support for the Audio input subsystem found
> +	  in the Amlogic GXBB SoC family.
> +
>  config SND_MESON_AXG_FIFO
>  	tristate
>  	select REGMAP_MMIO
> diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
> index af75f386feda..e4869af72811 100644
> --- a/sound/soc/meson/Makefile
> +++ b/sound/soc/meson/Makefile
> @@ -9,6 +9,9 @@ snd-soc-meson-aiu-y += aiu-encoder-spdif.o
>  snd-soc-meson-aiu-y += aiu-fifo.o
>  snd-soc-meson-aiu-y += aiu-fifo-i2s.o
>  snd-soc-meson-aiu-y += aiu-fifo-spdif.o
> +snd-soc-meson-audin-y := audin.o
> +snd-soc-meson-audin-y += audin-toddr.o
> +snd-soc-meson-audin-y += audin-decoder-i2s.o
>  snd-soc-meson-axg-fifo-y := axg-fifo.o
>  snd-soc-meson-axg-frddr-y := axg-frddr.o
>  snd-soc-meson-axg-toddr-y := axg-toddr.o
> @@ -28,6 +31,7 @@ snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
>  snd-soc-meson-t9015-y := t9015.o
>  
>  obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
> +obj-$(CONFIG_SND_MESON_AUDIN) += snd-soc-meson-audin.o
>  obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
>  obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
>  obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index d469ff429177..b4d5311eb3c5 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -240,7 +240,7 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
>  	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
>  
>  	clk_disable_unprepare(aiu->i2s_extra.clks[AOCLK_DIV_GATE].clk);
> -	
> +

?

>  	return 0;
>  }
>  
> diff --git a/sound/soc/meson/audin-decoder-i2s.c b/sound/soc/meson/audin-decoder-i2s.c
> new file mode 100644
> index 000000000000..a6c01399af0c
> --- /dev/null
> +++ b/sound/soc/meson/audin-decoder-i2s.c
> @@ -0,0 +1,247 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2025 BayLibre, SAS.
> +// Author: Valerio Setti <vsetti@baylibre.com>
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +
> +#include "audin.h"
> +
> +static int audin_decoder_i2s_setup_desc(struct snd_pcm_hw_params *params,
> +					struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	int val;
> +
> +	/* I2S decoder always outputs 24bits to the FIFO according to the

Looks like you are using the network comment style. It's not the one we
use in ASoC

> +	 * manual. The only thing we can do is mask some bits as follows:
> +	 * - 0: 16 bit
> +	 * - 1: 18 bits (not exposed as supported format)
> +	 * - 2: 20 bits (not exposed as supported format)
> +	 * - 3: 24 bits
> +	 *
> +	 * We force 24 bit output here and filter unnecessary ones at the FIFO
> +	 * stage.

That's something I have seen on the axg series and it was not the best.
I'd prefer if you properly setup this element, if possible.

> +	 * Note: data is left-justified, so in case of 16 bits samples, this
> +	 *       means that the LSB is to be discarded at FIFO level and the
> +	 *       relevant part is in bits [23:8].
> +	 */
> +	switch (params_width(params)) {
> +	case 16:
> +	case 24:
> +		val = 3;
> +		break;
> +	default:
> +		dev_err(dai->dev, "Error: wrong sample width %d",
> +			params_physical_width(params));
> +		return -EINVAL;
> +	}
> +	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK, val);
> +	snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
> +				      AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK, val);
> +
> +	/* The manual claims that this platform supports up to 4 streams
> +	 * (8 channels), but only 1 stream (2 channels) is supported ATM.
> +	 */
> +	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK, 1);
> +	snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
> +				      AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK, val);
> +
> +	return 0;
> +}
> +
> +static int audin_decoder_i2s_set_clocks(struct snd_soc_component *component,
> +					struct snd_pcm_hw_params *params,
> +					struct snd_soc_dai *dai)
> +{
> +	struct audin *audin = snd_soc_component_get_drvdata(component);
> +	unsigned int sample_rate = params_rate(params);
> +	unsigned long mclk;
> +	int ret;
> +
> +	mclk = clk_get_rate(audin->bulk_clks[MCLK].clk);
> +
> +	/* Set mclk to bclk ratio.
> +	 * We're going to use the new/finer clock divider (BCLK_MORE_DIV) for
> +	 * this, so let's keep the legacy one (BCLK_DIV) as passthrough.
> +	 */
> +	ret = clk_set_rate(audin->aoclk_basic_div, mclk);
> +	if (ret) {
> +		dev_err(dai->dev, "Failed to set aoclk_basic_div %d\n", ret);
> +		return ret;
> +	}

The clocks are shared with the playback part, so you'll have to take
care of that

I suspect there will be a need to use clk_set_rate_exclusive() around
here, otherwise you risk wrecking an ongoing playback. You'll have to
update the playback part too to use it.


> +
> +	/* We're going for a fixed bclk to lrclk ratio of 64. */
> +	ret = clk_set_rate(audin->aoclk_more_div, sample_rate * 64UL);

Why ? you support only 16 and 24 bits samples that is odd.
I'd recommend using the regular TDM parameters for this, such as the slot-width.

> +	if (ret) {
> +		dev_err(dai->dev, "Failed to set aoclk_more_div %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_set_rate(audin->lrclk_div, sample_rate);
> +	if (ret) {
> +		dev_err(dai->dev, "Failed to set lrclk_div %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

To properly handle the sharing of the clocks, I'm starting to think
something similar to the AXG is going to be needed.

On the AXG, rather than exporting the clocks, 1 compoment is
responsible for the interface (owning the pad and setting the clocks)
and others are responsible for the actual work, the formatters.

On this platform, the i2s AIU would provide both the interface and the
formatter but the organisation would be the same. That would take of
possible clock conflict.

Making such change will be tricky DT wise, but I think it might be
possible w/o breaking the ABI

> +
> +static int audin_decoder_i2s_hw_params(struct snd_pcm_substream *substream,
> +				       struct snd_pcm_hw_params *params,
> +				       struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct audin *audin = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	ret = audin_decoder_i2s_setup_desc(params, dai);
> +	if (ret) {
> +		dev_err(dai->dev, "setting i2s desc failed\n");
> +		return ret;
> +	}
> +
> +	ret = audin_decoder_i2s_set_clocks(component, params, dai);
> +	if (ret) {
> +		dev_err(dai->dev, "setting i2s clocks failed\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(audin->aoclk_div_gate);
> +	if (ret)
> +		return ret;

Since this driver should 'care' which clock can gate, you should
actually enable them all, not only this one.

If you had to enable only one, it would be the lrclk one since it is the
leaf of this clock tree.

> +
> +	return 0;
> +}
> +
> +static int audin_decoder_i2s_hw_free(struct snd_pcm_substream *substream,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct audin *audin = snd_soc_component_get_drvdata(dai->component);
> +
> +	clk_disable_unprepare(audin->aoclk_div_gate);
> +
> +	return 0;
> +}
> +
> +static int audin_decoder_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	unsigned int val = 0;
> +
> +	/* Only CPU Master / Codec Slave supported ATM */
> +	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_BP_FP)
> +		return -EINVAL;
> +
> +	/* Use clocks from AIU and not from the pads since we only want to
> +	 * support master mode.
> +	 */
> +	val = AUDIN_I2SIN_CTRL_I2SIN_CLK_SEL |
> +	      AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SEL |
> +	      AUDIN_I2SIN_CTRL_I2SIN_DIR;
> +	snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL, val, val);
> +
> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +	case SND_SOC_DAIFMT_IB_NF:
> +		val = AUDIN_I2SIN_CTRL_I2SIN_POS_SYNC;
> +		break;
> +	case SND_SOC_DAIFMT_NB_NF:
> +		val = 0;
> +		break;
> +	default:
> +		dev_err(dai->dev, "Error: unsupported format %x", fmt);
> +		return -EINVAL;
> +	}
> +	snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
> +				      AUDIN_I2SIN_CTRL_I2SIN_POS_SYNC, val);
> +
> +	/* MSB data starts 1 clock cycle after LRCLK transition, as per I2S
> +	 * specs.
> +	 */

What about TDM ?

> +	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK, 1);
> +	snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
> +				      AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV |
> +				      AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK,
> +				      val);
> +
> +	return 0;
> +}
> +
> +static int audin_decoder_i2s_trigger(struct snd_pcm_substream *substream,
> +				     int cmd, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
> +					      AUDIN_I2SIN_CTRL_I2SIN_EN,
> +					      AUDIN_I2SIN_CTRL_I2SIN_EN);
> +		break;
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +	case SNDRV_PCM_TRIGGER_STOP:
> +		snd_soc_component_update_bits(component, AUDIN_I2SIN_CTRL,
> +					      AUDIN_I2SIN_CTRL_I2SIN_EN, 0);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int audin_decoder_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
> +					unsigned int freq, int dir)
> +{
> +	struct audin *audin = snd_soc_component_get_drvdata(dai->component);
> +	int ret;
> +
> +	if (WARN_ON(clk_id != 0))
> +		return -EINVAL;
> +
> +	if (dir == SND_SOC_CLOCK_IN)
> +		return 0;
> +
> +	ret = clk_set_rate(audin->bulk_clks[MCLK].clk, freq);
> +	if (ret)
> +		dev_err(dai->dev, "Failed to set sysclk %d", ret);
> +
> +	return ret;
> +}
> +
> +static int audin_decoder_i2s_startup(struct snd_pcm_substream *substream,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct audin *audin = snd_soc_component_get_drvdata(dai->component);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(audin->bulk_clks_num, audin->bulk_clks);
> +	if (ret)
> +		dev_err(dai->dev, "Failed to enable bulk clocks %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void audin_decoder_i2s_shutdown(struct snd_pcm_substream *substream,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct audin *audin = snd_soc_component_get_drvdata(dai->component);
> +
> +	clk_bulk_disable_unprepare(audin->bulk_clks_num, audin->bulk_clks);
> +}
> +
> +const struct snd_soc_dai_ops audin_decoder_i2s_dai_ops = {
> +	.hw_params	= audin_decoder_i2s_hw_params,
> +	.hw_free	= audin_decoder_i2s_hw_free,
> +	.set_fmt	= audin_decoder_i2s_set_fmt,
> +	.set_sysclk	= audin_decoder_i2s_set_sysclk,
> +	.startup	= audin_decoder_i2s_startup,
> +	.shutdown	= audin_decoder_i2s_shutdown,
> +	.trigger	= audin_decoder_i2s_trigger,
> +};
> diff --git a/sound/soc/meson/audin-toddr.c b/sound/soc/meson/audin-toddr.c
> new file mode 100644
> index 000000000000..14db8b9587e8
> --- /dev/null
> +++ b/sound/soc/meson/audin-toddr.c
> @@ -0,0 +1,403 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2025 BayLibre, SAS.
> +// Author: Valerio Setti <vsetti@baylibre.com>
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <sound/pcm_params.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/hrtimer.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include <dt-bindings/sound/meson-audin.h>
> +
> +#include "audin.h"
> +
> +struct fifo_regs {
> +	unsigned int start;
> +	unsigned int end;
> +	unsigned int ptr;
> +	unsigned int intr;
> +	unsigned int rdptr;
> +	unsigned int ctrl;
> +	unsigned int ctrl1;
> +	unsigned int wrap;
> +};
> +
> +struct fifo_regs_bit_masks {
> +	unsigned int overflow_en;
> +	unsigned int addr_trigger_en;
> +	unsigned int overflow_set;
> +	unsigned int addr_trigger_set;
> +};
> +
> +#define AUDIN_FIFO_COUNT	3
> +
> +struct fifo_regs audin_fifo_regs[AUDIN_FIFO_COUNT] = {
> +	[0] = {
> +		.start	= AUDIN_FIFO0_START,
> +		.end	= AUDIN_FIFO0_END,
> +		.ptr	= AUDIN_FIFO0_PTR,
> +		.intr	= AUDIN_FIFO0_INTR,
> +		.rdptr	= AUDIN_FIFO0_RDPTR,
> +		.ctrl	= AUDIN_FIFO0_CTRL,
> +		.ctrl1	= AUDIN_FIFO0_CTRL1,
> +		.wrap	= AUDIN_FIFO0_WRAP,
> +	},
> +	[1] = {
> +		.start	= AUDIN_FIFO1_START,
> +		.end	= AUDIN_FIFO1_END,
> +		.ptr	= AUDIN_FIFO1_PTR,
> +		.intr	= AUDIN_FIFO1_INTR,
> +		.rdptr	= AUDIN_FIFO1_RDPTR,
> +		.ctrl	= AUDIN_FIFO1_CTRL,
> +		.ctrl1	= AUDIN_FIFO1_CTRL1,
> +		.wrap	= AUDIN_FIFO1_WRAP,
> +	},
> +	[2] = {
> +		.start	= AUDIN_FIFO2_START,
> +		.end	= AUDIN_FIFO2_END,
> +		.ptr	= AUDIN_FIFO2_PTR,
> +		.intr	= AUDIN_FIFO2_INTR,
> +		.rdptr	= AUDIN_FIFO2_RDPTR,
> +		.ctrl	= AUDIN_FIFO2_CTRL,
> +		.ctrl1	= AUDIN_FIFO2_CTRL1,
> +		.wrap	= AUDIN_FIFO2_WRAP,
> +	}
> +};
> +
> +struct fifo_regs_bit_masks audin_fifo_regs_bit_masks[AUDIN_FIFO_COUNT] = {
> +	[0] = {
> +		.overflow_en = AUDIN_INT_CTRL_FIFO0_OVERFLOW,
> +		.addr_trigger_en = AUDIN_INT_CTRL_FIFO0_ADDR_TRIG,
> +		.overflow_set = AUDIN_FIFO_INT_FIFO0_OVERFLOW,
> +		.addr_trigger_set = AUDIN_FIFO_INT_FIFO0_ADDR_TRIG,
> +	},
> +	[1] = {
> +		.overflow_en = AUDIN_INT_CTRL_FIFO1_OVERFLOW,
> +		.addr_trigger_en = AUDIN_INT_CTRL_FIFO1_ADDR_TRIG,
> +		.overflow_set = AUDIN_FIFO_INT_FIFO1_OVERFLOW,
> +		.addr_trigger_set = AUDIN_FIFO_INT_FIFO1_ADDR_TRIG,
> +	},
> +	[2] = {
> +		.overflow_en = AUDIN_INT_CTRL_FIFO2_OVERFLOW,
> +		.addr_trigger_en = AUDIN_INT_CTRL_FIFO2_ADDR_TRIG,
> +		.overflow_set = AUDIN_FIFO_INT_FIFO2_OVERFLOW,
> +		.addr_trigger_set = AUDIN_FIFO_INT_FIFO2_ADDR_TRIG,
> +	},

This looks like you are putting multiple instance of the same thing into
a single file. It would be better to have dideciated FIFO driver and
instanciate 3 times through DT instead.

> +
> +};
> +
> +/* This is the size of the FIFO (i.e. 64*64 bytes). */
> +#define AUDIN_FIFO_I2S_BLOCK		4096
> +
> +static struct snd_pcm_hardware toddr_pcm_hw = {
> +	.info = (SNDRV_PCM_INFO_INTERLEAVED |
> +		 SNDRV_PCM_INFO_MMAP |
> +		 SNDRV_PCM_INFO_MMAP_VALID |
> +		 SNDRV_PCM_INFO_PAUSE),
> +	.formats = AUDIN_FORMATS,
> +	.rate_min = 5512,
> +	.rate_max = 192000,
> +	.channels_min = 2,
> +	.channels_max = 2,
> +	.period_bytes_min = 2*AUDIN_FIFO_I2S_BLOCK,
> +	.period_bytes_max = AUDIN_FIFO_I2S_BLOCK * USHRT_MAX,
> +	.periods_min = 2,
> +	.periods_max = UINT_MAX,
> +
> +	/* No real justification for this */
> +	.buffer_bytes_max = 1 * 1024 * 1024,
> +};
> +
> +struct audin_fifo {
> +	const struct fifo_regs *reg;
> +	const struct fifo_regs_bit_masks *reg_bit_masks;
> +	struct snd_pcm_hardware *pcm_hw;
> +	struct clk *pclk;
> +
> +	/* The AUDIN peripheral has an IRQ to signal when data is received, but
> +	 * it cannot grant a periodic behavior. The reason is that the register
> +	 * which holds the address which triggers the IRQ must be updated
> +	 * continuously. Therefore we use a periodic timer.
> +	 */
> +	struct hrtimer polling_timer;
> +	int poll_time_ns;
> +	struct snd_pcm_substream *substream;
> +};
> +
> +static int audin_toddr_trigger(struct snd_pcm_substream *substream, int cmd,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		snd_soc_component_update_bits(component, fifo->reg->ctrl,
> +					      AUDIN_FIFO_CTRL_EN,
> +					      AUDIN_FIFO_CTRL_EN);
> +		break;
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +	case SNDRV_PCM_TRIGGER_STOP:
> +		snd_soc_component_update_bits(component, fifo->reg->ctrl,
> +					      AUDIN_FIFO_CTRL_EN, 0);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int audin_toddr_prepare(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	dma_addr_t dma_end = runtime->dma_addr + runtime->dma_bytes - 8;
> +	unsigned int val;
> +
> +	/* Setup memory boundaries */
> +	snd_soc_component_write(component, fifo->reg->start, runtime->dma_addr);
> +	snd_soc_component_write(component, fifo->reg->ptr, runtime->dma_addr);
> +	snd_soc_component_write(component, fifo->reg->end, dma_end);
> +
> +	/* Load new addresses */
> +	val = AUDIN_FIFO_CTRL_LOAD | AUDIN_FIFO_CTRL_UG;
> +	snd_soc_component_update_bits(component, fifo->reg->ctrl, val, val);
> +
> +	/* Reset */
> +	snd_soc_component_update_bits(dai->component, fifo->reg->ctrl,
> +				      AUDIN_FIFO_CTRL_RST,
> +				      AUDIN_FIFO_CTRL_RST);
> +
> +	return 0;
> +}
> +
> +static int audin_toddr_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
> +	unsigned int val;
> +
> +	switch (params_width(params)) {
> +	case 16:
> +		/* FIFO is filled line by line and each of them is 8 bytes. The
> +		 * problem is that each line is filled starting from the end,
> +		 * so we need to properly reorder them before moving to the
> +		 * RAM. This is the value required to properly re-order 16 bits
> +		 * samples.
> +		 */
> +		val = FIELD_PREP(AUDIN_FIFO_CTRL_ENDIAN_MASK, 6);
> +		snd_soc_component_update_bits(component, fifo->reg->ctrl,
> +					      AUDIN_FIFO_CTRL_ENDIAN_MASK, val);
> +
> +		/* The I2S input decoder passed 24 bits of left-justified data
> +		 * but samples were 16 bits. Therefore we drop the LSB.
> +		 */

Ok I see

> +		val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_POS_01_MASK, 1);
> +		snd_soc_component_update_bits(component, fifo->reg->ctrl1,
> +					      AUDIN_FIFO_CTRL1_DIN_POS_01_MASK,
> +					      val);
> +
> +		/* Set sample size to 2 bytes (16 bit) */
> +		val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK, 1);
> +		snd_soc_component_update_bits(component, fifo->reg->ctrl1,
> +					      AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK,
> +					      val);
> +		break;
> +	case 24:
> +		/* The same as above but in this case we need to reorder 32 bits
> +		 * samples (because 24 bits samples are stored as 32 bits).
> +		 */

Huu ... now I'm lost. I thought you were always passing 24 bits from the
decoder ?

> +		val = FIELD_PREP(AUDIN_FIFO_CTRL_ENDIAN_MASK, 4);
> +		snd_soc_component_update_bits(component, fifo->reg->ctrl,
> +					      AUDIN_FIFO_CTRL_ENDIAN_MASK,
> +					      val);
> +
> +		val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_POS_01_MASK, 0);
> +		snd_soc_component_update_bits(component, fifo->reg->ctrl1,
> +					      AUDIN_FIFO_CTRL1_DIN_POS_01_MASK,
> +					      val);
> +
> +		/* Set sample size to 3 bytes (24 bit) */
> +		val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK, 2);
> +		snd_soc_component_update_bits(component, fifo->reg->ctrl1,
> +					      AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK,
> +					      val);
> +		break;
> +	default:
> +		dev_err(dai->dev, "Unsupported physical width %u\n",
> +			params_physical_width(params));
> +		return -EINVAL;
> +	}
> +
> +	/* This is a bit counterintuitive. Even though the platform has a single pin
> +	 * for I2S input which would mean that we can only support 2 channels,
> +	 * doing so would cause samples to be stored in a weird way into the FIFO:
> +	 * all the samples from the 1st channel on the 1st half of the FIFO, then
> +	 * samples from the 2nd channel in the other half. Of course extra work
> +	 * would be required to properly interleave them before returning to the
> +	 * userspace.
> +	 * Setting a single channel mode instead solves the problem: samples from
> +	 * 1st and 2nd channel are stored interleaved and sequentially in the FIFO.
> +	 */
> +	val = FIELD_PREP(AUDIN_FIFO_CTRL_CHAN_MASK, 1);
> +	snd_soc_component_update_bits(component, fifo->reg->ctrl,
> +				      AUDIN_FIFO_CTRL_CHAN_MASK, val);
> +
> +	/* Setup the period for the polling timer. */
> +	fifo->poll_time_ns = 1000000000 / params_rate(params) *
> +			     params_period_size(params);
> +
> +	return 0;
> +}
> +
> +static enum hrtimer_restart timer_cb(struct hrtimer *timer)
> +{
> +	struct audin_fifo *fifo = container_of(timer, struct audin_fifo,
> +				  polling_timer);
> +	snd_pcm_period_elapsed(fifo->substream);
> +	hrtimer_forward_now(timer, fifo->poll_time_ns);
> +	return HRTIMER_RESTART;
> +}
> +
> +static int audin_toddr_startup(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
> +	int ret;
> +
> +	snd_soc_set_runtime_hwparams(substream, fifo->pcm_hw);
> +
> +	/* Check runtime parameters */
> +	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> +					 AUDIN_FIFO_I2S_BLOCK);
> +	if (ret) {
> +		dev_err(dai->dev, "Failed to set runtime constraint %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
> +					 AUDIN_FIFO_I2S_BLOCK);
> +	if (ret) {
> +		dev_err(dai->dev, "Failed to set runtime constraint %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(fifo->pclk);
> +	if (ret) {
> +		dev_err(dai->dev, "Failed to enable PCLK %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Start the reporting timer */
> +	fifo->substream = substream;
> +	hrtimer_start(&fifo->polling_timer, fifo->poll_time_ns,
> +		      HRTIMER_MODE_REL);
> +
> +	return ret;
> +}
> +
> +static void audin_toddr_shutdown(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
> +
> +	hrtimer_cancel(&fifo->polling_timer);
> +	clk_disable_unprepare(fifo->pclk);
> +}
> +
> +snd_pcm_uframes_t audin_toddr_pointer(struct snd_soc_component *component,
> +				      struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	unsigned int start, ptr;
> +
> +	start = snd_soc_component_read(component, fifo->reg->start);
> +	ptr = snd_soc_component_read(component, fifo->reg->ptr);
> +
> +	return bytes_to_frames(runtime, ptr - start);
> +}
> +
> +static int audin_toddr_dai_probe(struct snd_soc_dai *dai)
> +{
> +	struct audin *audin = snd_soc_component_get_drvdata(dai->component);
> +	struct audin_fifo *fifo;
> +
> +	fifo = kzalloc(sizeof(*fifo), GFP_KERNEL);
> +	if (!fifo)
> +		return -ENOMEM;
> +
> +	if (dai->id >= AUDIN_FIFO_COUNT) {
> +		dev_err(dai->dev, "Invalid DAI ID %d\n", dai->id);
> +		kfree(fifo);
> +		return -EINVAL;
> +	}
> +
> +	fifo->reg = &audin_fifo_regs[dai->id];
> +	fifo->reg_bit_masks = &audin_fifo_regs_bit_masks[dai->id];
> +	fifo->pcm_hw = &toddr_pcm_hw;
> +	fifo->pclk = audin->bulk_clks[PCLK].clk;
> +	hrtimer_init(&fifo->polling_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +	fifo->polling_timer.function = timer_cb;
> +
> +	snd_soc_dai_dma_data_set_capture(dai, fifo);
> +
> +	return 0;
> +}
> +
> +static int audin_toddr_dai_remove(struct snd_soc_dai *dai)
> +{
> +	kfree(snd_soc_dai_dma_data_get_capture(dai));
> +
> +	return 0;
> +}
> +
> +static int audin_toddr_pcm_new(struct snd_soc_pcm_runtime *rtd,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_card *card = rtd->card->snd_card;
> +	struct audin_fifo *fifo = snd_soc_dai_dma_data_get_capture(dai);
> +	size_t size = fifo->pcm_hw->buffer_bytes_max;
> +	int ret;
> +
> +	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(dai->dev, "Failed to set DMA mask %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
> +					     card->dev, size, size);
> +	if (ret) {
> +		dev_err(dai->dev, "Failed to set PCM managed buffer %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +const struct snd_soc_dai_ops audin_toddr_dai_ops = {
> +	.trigger	= audin_toddr_trigger,
> +	.prepare	= audin_toddr_prepare,
> +	.hw_params	= audin_toddr_hw_params,
> +	.startup	= audin_toddr_startup,
> +	.shutdown	= audin_toddr_shutdown,
> +	.pcm_new	= audin_toddr_pcm_new,
> +	.probe		= audin_toddr_dai_probe,
> +	.remove		= audin_toddr_dai_remove,
> +};
> diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
> new file mode 100644
> index 000000000000..254d646260f1
> --- /dev/null
> +++ b/sound/soc/meson/audin.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2025 BayLibre, SAS.
> +// Author: Valerio Setti <vsetti@baylibre.com>
> +
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include <dt-bindings/sound/meson-audin.h>
> +
> +#include "audin.h"
> +
> +static const char * const audin_fifo_input_sel_texts[] = {
> +	"SPDIF", "I2S", "PCM", "HDMI", "Demodulator"
> +};
> +
> +static SOC_ENUM_SINGLE_DECL(audin_fifo0_input_sel_enum, AUDIN_FIFO0_CTRL,
> +			    AUDIN_FIFO_CTRL_DIN_SEL_OFF,
> +			    audin_fifo_input_sel_texts);
> +
> +static const struct snd_kcontrol_new audin_fifo0_input_sel_mux =
> +	SOC_DAPM_ENUM("FIFO0 SRC SEL", audin_fifo0_input_sel_enum);
> +
> +static SOC_ENUM_SINGLE_DECL(audin_fifo1_input_sel_enum, AUDIN_FIFO1_CTRL,
> +			    AUDIN_FIFO_CTRL_DIN_SEL_OFF,
> +			    audin_fifo_input_sel_texts);
> +
> +static const struct snd_kcontrol_new audin_fifo1_input_sel_mux =
> +	SOC_DAPM_ENUM("FIFO1 SRC SEL", audin_fifo1_input_sel_enum);
> +
> +static SOC_ENUM_SINGLE_DECL(audin_fifo2_input_sel_enum, AUDIN_FIFO2_CTRL,
> +			    AUDIN_FIFO_CTRL_DIN_SEL_OFF,
> +			    audin_fifo_input_sel_texts);
> +
> +static const struct snd_kcontrol_new audin_fifo2_input_sel_mux =
> +	SOC_DAPM_ENUM("FIFO2 SRC SEL", audin_fifo2_input_sel_enum);
> +
> +static const struct snd_soc_dapm_widget audin_cpu_dapm_widgets[] = {
> +	SND_SOC_DAPM_MUX("FIFO0 SRC SEL", SND_SOC_NOPM, 0, 0,
> +			 &audin_fifo0_input_sel_mux),
> +	SND_SOC_DAPM_MUX("FIFO1 SRC SEL", SND_SOC_NOPM, 0, 0,
> +			 &audin_fifo1_input_sel_mux),
> +	SND_SOC_DAPM_MUX("FIFO2 SRC SEL", SND_SOC_NOPM, 0, 0,
> +			 &audin_fifo2_input_sel_mux),
> +};
> +
> +static const struct snd_soc_dapm_route audin_cpu_dapm_routes[] = {
> +	{ "FIFO0 SRC SEL", "I2S", "I2S Decoder Capture" },
> +	{ "FIFO1 SRC SEL", "I2S", "I2S Decoder Capture" },
> +	{ "FIFO2 SRC SEL", "I2S", "I2S Decoder Capture" },
> +	{ "TODDR 0 Capture", NULL, "FIFO0 SRC SEL" },
> +	{ "TODDR 1 Capture", NULL, "FIFO1 SRC SEL" },
> +	{ "TODDR 2 Capture", NULL, "FIFO2 SRC SEL" },
> +};
> +
> +static int audin_cpu_of_xlate_dai_name(struct snd_soc_component *component,
> +				       const struct of_phandle_args *args,
> +				       const char **dai_name)
> +{
> +	struct snd_soc_dai *dai;
> +	int id;
> +
> +	if (args->args_count != 1) {
> +		dev_err(component->dev, "Wrong number of arguments %d\n",
> +			args->args_count);
> +		return -EINVAL;
> +	}
> +
> +	id = args->args[0];
> +
> +	if (id < 0 || id >= component->num_dai) {
> +		dev_err(component->dev, "Invalid ID %d\n", id);
> +		return -EINVAL;
> +	}
> +
> +	for_each_component_dais(component, dai) {
> +		if (id == 0)
> +			break;
> +		id--;
> +	}
> +
> +	*dai_name = dai->driver->name;
> +
> +	return 0;
> +}
> +
> +static int audin_cpu_component_probe(struct snd_soc_component *component)
> +{
> +	struct audin *audin = snd_soc_component_get_drvdata(component);
> +
> +	/* Required for the FIFO Source control operation */
> +	return clk_prepare_enable(audin->bulk_clks[INPUT].clk);
> +}
> +
> +static void audin_cpu_component_remove(struct snd_soc_component *component)
> +{
> +	struct audin *audin = snd_soc_component_get_drvdata(component);
> +
> +	clk_disable_unprepare(audin->bulk_clks[INPUT].clk);
> +}
> +
> +static const struct snd_soc_component_driver audin_cpu_component = {
> +	.name			= "AUDIN CPU",
> +	.dapm_widgets		= audin_cpu_dapm_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(audin_cpu_dapm_widgets),
> +	.dapm_routes		= audin_cpu_dapm_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(audin_cpu_dapm_routes),
> +	.of_xlate_dai_name	= audin_cpu_of_xlate_dai_name,
> +	.pointer		= audin_toddr_pointer,
> +	.probe			= audin_cpu_component_probe,
> +	.remove			= audin_cpu_component_remove,
> +#ifdef CONFIG_DEBUG_FS
> +	.debugfs_prefix		= "audin-cpu",
> +#endif
> +};
> +
> +static struct snd_soc_dai_driver audin_cpu_dai_drv[] = {
> +	[CPU_AUDIN_TODDR_0] = {
> +		.name = "TODDR 0",
> +		.capture = {
> +			.stream_name	= "TODDR 0 Capture",
> +			.channels_min	= 2,
> +			.channels_max	= 2,
> +			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
> +			.rate_min	= 5512,
> +			.rate_max	= 192000,
> +			.formats	= AUDIN_FORMATS,
> +		},
> +		.ops = &audin_toddr_dai_ops,
> +	},
> +	[CPU_AUDIN_TODDR_1] = {
> +		.name = "TODDR 1",
> +		.capture = {
> +			.stream_name	= "TODDR 1 Capture",
> +			.channels_min	= 2,
> +			.channels_max	= 2,
> +			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
> +			.rate_min	= 5512,
> +			.rate_max	= 192000,
> +			.formats	= AUDIN_FORMATS,
> +		},
> +		.ops = &audin_toddr_dai_ops,
> +	},
> +	[CPU_AUDIN_TODDR_2] = {
> +		.name = "TODDR 2",
> +		.capture = {
> +			.stream_name	= "TODDR 2 Capture",
> +			.channels_min	= 2,
> +			.channels_max	= 2,
> +			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
> +			.rate_min	= 5512,
> +			.rate_max	= 192000,
> +			.formats	= AUDIN_FORMATS,
> +		},
> +		.ops = &audin_toddr_dai_ops,
> +	},
> +	[CPU_I2S_DECODER] = {
> +		.name = "I2S Decoder",
> +		.capture = {
> +			.stream_name = "I2S Decoder Capture",
> +			.channels_min = 2,
> +			.channels_max = 2,
> +			.rates = SNDRV_PCM_RATE_8000_192000,
> +			.formats = AUDIN_FORMATS,
> +		},
> +		.ops = &audin_decoder_i2s_dai_ops,
> +	},
> +};
> +
> +static const struct regmap_config audin_regmap_cfg = {
> +	.reg_bits	= 32,
> +	.val_bits	= 32,
> +	.reg_stride	= 4,
> +	.max_register	= 0x308,
> +};
> +
> +static const char * const clk_bulk_ids[] = {
> +	"i2s_pclk",
> +	"i2s_aoclk",
> +	"i2s_mclk",
> +	"i2s_mixer",
> +	"i2s_input_clk",
> +};
> +
> +static int audin_clk_single_get(struct device *dev, const unsigned char *id,
> +				bool enable, struct clk **clk)
> +{
> +	*clk = devm_clk_get(dev, id);
> +	if (IS_ERR(*clk)) {
> +		dev_err(dev, "Failed to get %s clock %ld\n", id, PTR_ERR(*clk));
> +		return PTR_ERR(*clk);
> +	}
> +
> +	if (enable)
> +		return clk_prepare_enable(*clk);
> +
> +	return 0;
> +}
> +
> +static int audin_clk_get(struct device *dev)
> +{
> +	struct audin *audin = dev_get_drvdata(dev);
> +	struct clk *pclk;
> +	int i, ret;
> +
> +	ret = audin_clk_single_get(dev, "pclk", true, &pclk);
> +	if (ret)
> +		return ret;
> +
> +	audin->bulk_clks_num = ARRAY_SIZE(clk_bulk_ids);
> +	audin->bulk_clks = devm_kcalloc(dev, audin->bulk_clks_num,
> +					sizeof(struct clk_bulk_data),
> +					GFP_KERNEL);
> +	if (!audin->bulk_clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(clk_bulk_ids); i++)
> +		audin->bulk_clks[i].id = clk_bulk_ids[i];
> +
> +	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(clk_bulk_ids),
> +				audin->bulk_clks);
> +	if (ret) {
> +		dev_err(dev, "Failed to get bulk clocks %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = audin_clk_single_get(dev, "i2s_aoclk_div_gate", false,
> +				   &audin->aoclk_div_gate);
> +	if (ret)
> +		return ret;
> +
> +	ret = audin_clk_single_get(dev, "i2s_aoclk_basic_div", false,
> +				   &audin->aoclk_basic_div);
> +	if (ret)
> +		return ret;
> +
> +	ret = audin_clk_single_get(dev, "i2s_aoclk_more_div", false,
> +				   &audin->aoclk_more_div);
> +	if (ret)
> +		return ret;
> +
> +	ret = audin_clk_single_get(dev, "i2s_lrclk_div", false,
> +				   &audin->lrclk_div);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int audin_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	void __iomem *regs;
> +	struct regmap *map;
> +	struct audin *audin;
> +	int ret;
> +
> +	audin = devm_kzalloc(dev, sizeof(*audin), GFP_KERNEL);
> +	if (!audin)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, audin);
> +
> +	ret = device_reset(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to reset device\n");
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	map = devm_regmap_init_mmio(dev, regs, &audin_regmap_cfg);
> +	if (IS_ERR(map)) {
> +		dev_err(dev, "failed to init regmap: %ld\n",
> +			PTR_ERR(map));
> +		return PTR_ERR(map);
> +	}
> +
> +	ret = audin_clk_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = snd_soc_register_component(dev, &audin_cpu_component,
> +					 audin_cpu_dai_drv,
> +					 ARRAY_SIZE(audin_cpu_dai_drv));
> +	if (ret) {
> +		dev_err(dev, "Failed to register cpu component\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void audin_remove(struct platform_device *pdev)
> +{
> +	snd_soc_unregister_component(&pdev->dev);
> +}
> +
> +static const struct of_device_id audin_of_match[] = {
> +	{ .compatible = "amlogic,audin-gxbb", .data = NULL },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, audin_of_match);
> +
> +static struct platform_driver audin_pdrv = {
> +	.probe = audin_probe,
> +	.remove = audin_remove,
> +	.driver = {
> +		.name = "meson-audin",
> +		.of_match_table = audin_of_match,
> +	},
> +};
> +module_platform_driver(audin_pdrv);
> +
> +MODULE_DESCRIPTION("Meson AUDIN Driver");
> +MODULE_AUTHOR("Valerio Setti <vsetti@baylibre.com>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/meson/audin.h b/sound/soc/meson/audin.h
> new file mode 100644
> index 000000000000..eb1dbbaeabcc
> --- /dev/null
> +++ b/sound/soc/meson/audin.h
> @@ -0,0 +1,119 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2025 BayLibre, SAS.
> + * Author: Valerio Setti <vsetti@baylibre.com>
> + */
> +
> +#ifndef _MESON_AUDIN_H
> +#define _MESON_AUDIN_H
> +
> +struct clk;
> +struct clk_bulk_data;
> +struct device;
> +struct of_phandle_args;
> +struct snd_soc_dai;
> +struct snd_soc_dai_ops;
> +
> +enum audin_bulk_clks_id {
> +	PCLK = 0,
> +	AOCLK,
> +	MCLK,
> +	MIXER,
> +	INPUT,
> +};
> +
> +struct audin {
> +	struct clk_bulk_data *bulk_clks;
> +	unsigned int bulk_clks_num;
> +	struct clk *aoclk_div_gate;
> +	struct clk *aoclk_basic_div;
> +	struct clk *aoclk_more_div;
> +	struct clk *lrclk_div;
> +};
> +
> +/* I2SIN_CTRL register and bits */
> +#define AUDIN_I2SIN_CTRL	0x040	/* Reg index = 0x10 */
> +	#define AUDIN_I2SIN_CTRL_I2SIN_DIR		BIT(0)
> +	#define AUDIN_I2SIN_CTRL_I2SIN_CLK_SEL		BIT(1)
> +	#define AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SEL	BIT(2)
> +	#define AUDIN_I2SIN_CTRL_I2SIN_POS_SYNC		BIT(3)
> +	#define AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK	GENMASK(6, 4)
> +	#define AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV	BIT(7)
> +	#define AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK	GENMASK(9, 8)
> +	#define AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK	GENMASK(13, 10)
> +	#define AUDIN_I2SIN_CTRL_I2SIN_EN		BIT(15)
> +
> +/* FIFO0 registers */
> +#define AUDIN_FIFO0_START	0x080	/* Reg index = 0x20 */
> +#define AUDIN_FIFO0_END		0x084	/* Reg index = 0x21 */
> +#define AUDIN_FIFO0_PTR		0x088	/* Reg index = 0x22 */
> +#define AUDIN_FIFO0_INTR	0x08C	/* Reg index = 0x23 */
> +#define AUDIN_FIFO0_RDPTR	0x090	/* Reg index = 0x24 */
> +#define AUDIN_FIFO0_WRAP	0x0C4	/* Reg index = 0x31 */

Do you really need these definition in multiple drivers ?
If not, they do not need to be in header

> +
> +/* FIFO1 registers */
> +#define AUDIN_FIFO1_START	0x0CC	/* Reg index = 0x33 */

No need to repeat the reg index thing ... just add one comment about the
4 multiplication if you must

> +#define AUDIN_FIFO1_END		0x0D0	/* Reg index = 0x34 */
> +#define AUDIN_FIFO1_PTR		0x0D4	/* Reg index = 0x35 */
> +#define AUDIN_FIFO1_INTR	0x0D8	/* Reg index = 0x36 */
> +#define AUDIN_FIFO1_RDPTR	0x0DC	/* Reg index = 0x37 */
> +#define AUDIN_FIFO1_WRAP	0x110	/* Reg index = 0x44 */
> +
> +/* FIFO2 registers */
> +#define AUDIN_FIFO2_START	0x114	/* Reg index = 0x45 */
> +#define AUDIN_FIFO2_END		0x118	/* Reg index = 0x46 */
> +#define AUDIN_FIFO2_PTR		0x11C	/* Reg index = 0x47 */
> +#define AUDIN_FIFO2_INTR	0x120	/* Reg index = 0x48 */
> +#define AUDIN_FIFO2_RDPTR	0x124	/* Reg index = 0x49 */
> +#define AUDIN_FIFO2_WRAP	0x140	/* Reg index = 0x50 */
> +
> +/* FIFOx CTRL registers and bits */
> +#define AUDIN_FIFO0_CTRL	0x094	/* Reg index = 0x25 */
> +#define AUDIN_FIFO1_CTRL	0x0E0	/* Reg index = 0x38 */
> +#define AUDIN_FIFO2_CTRL	0x128	/* Reg index = 0x4a */
> +	#define AUDIN_FIFO_CTRL_EN		BIT(0)
> +	#define AUDIN_FIFO_CTRL_RST		BIT(1)
> +	#define AUDIN_FIFO_CTRL_LOAD		BIT(2)
> +	#define AUDIN_FIFO_CTRL_DIN_SEL_OFF	3
> +	#define AUDIN_FIFO_CTRL_DIN_SEL_MASK	GENMASK(5, 3)
> +	#define AUDIN_FIFO_CTRL_ENDIAN_MASK	GENMASK(10, 8)
> +	#define AUDIN_FIFO_CTRL_CHAN_MASK	GENMASK(14, 11)
> +	#define AUDIN_FIFO_CTRL_UG		BIT(15)
> +
> +/* FIFOx_CTRL1 registers and bits */
> +#define AUDIN_FIFO0_CTRL1	0x098	/* Reg index = 0x26 */
> +#define AUDIN_FIFO1_CTRL1	0x0E4	/* Reg index = 0x39 */
> +#define AUDIN_FIFO2_CTRL1	0x12C	/* Reg index = 0x4b */
> +	#define AUDIN_FIFO_CTRL1_DIN_POS_2		BIT(7)
> +	#define AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK	GENMASK(3, 2)
> +	#define AUDIN_FIFO_CTRL1_DIN_POS_01_MASK	GENMASK(1, 0)
> +
> +/* INT_CTRL register and bits */
> +#define AUDIN_INT_CTRL		0x144	/* Reg index = 0x51 */
> +	#define AUDIN_INT_CTRL_FIFO0_OVERFLOW		BIT(0)
> +	#define AUDIN_INT_CTRL_FIFO0_ADDR_TRIG		BIT(1)
> +	#define AUDIN_INT_CTRL_FIFO1_OVERFLOW		BIT(2)
> +	#define AUDIN_INT_CTRL_FIFO1_ADDR_TRIG		BIT(3)
> +	#define AUDIN_INT_CTRL_FIFO2_OVERFLOW		BIT(11)
> +	#define AUDIN_INT_CTRL_FIFO2_ADDR_TRIG		BIT(12)
> +
> +/* FIFO_INT register and bits */
> +#define AUDIN_FIFO_INT		0x148	/* Reg index = 0x52 */
> +	#define AUDIN_FIFO_INT_FIFO0_OVERFLOW		BIT(0)
> +	#define AUDIN_FIFO_INT_FIFO0_ADDR_TRIG		BIT(1)
> +	#define AUDIN_FIFO_INT_FIFO1_OVERFLOW		BIT(2)
> +	#define AUDIN_FIFO_INT_FIFO1_ADDR_TRIG		BIT(3)
> +	#define AUDIN_FIFO_INT_FIFO2_OVERFLOW		BIT(11)
> +	#define AUDIN_FIFO_INT_FIFO2_ADDR_TRIG		BIT(12)
> +
> +#define AUDIN_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
> +		       SNDRV_PCM_FMTBIT_S24_LE)
> +
> +extern const struct snd_soc_dai_ops audin_toddr_dai_ops;
> +extern const struct snd_soc_dai_ops audin_decoder_i2s_dai_ops;
> +extern struct device_attribute dev_attr_dump_regs;
> +
> +snd_pcm_uframes_t audin_toddr_pointer(struct snd_soc_component *component,
> +				   struct snd_pcm_substream *substream);
> +
> +#endif /* _MESON_AUDIN_H */

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
