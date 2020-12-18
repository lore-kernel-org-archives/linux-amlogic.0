Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C227C4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 17:18:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74B7B23B53
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 17:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74B7B23B53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TMYrjC+dq/rdsEx0inAwxodaJwyeJZxLwLTJ4xYne44=; b=YIWZR/RIAv1z+rV4Q0SlBa/xX
	q+x87rv8Nl2J3mK5DHUToSKvCt9WSjOeVfAZGO54H6nYgrFFDnfN3fQatef6yaqGyu1B32xfv/6/d
	XNu/OX9MK90Cvicq0tnOWPftEwcEqtBhhe6nqgC28zbh9h8RhZ+dBg4kfVuHp39CKiUQO/yCpTFNF
	346QT07P5W3JEZMqmxZiFmUSvyjO607oe2WdMJ4l14CHXL3/3/5uU3rWslciSKXjFR01kiH1RSWQ6
	66s0FSk9YH5X1Ev4903JH5N2Hg0LyjBUAjI6KXs3a1Zimznbx8eVyyxpp5lxRbI427mKTLfT7839c
	+5/EqR1lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqJO3-0003mg-RZ; Fri, 18 Dec 2020 17:18:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqJ5m-0001Gu-Dt
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 16:59:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id v14so2980499wml.1
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Dec 2020 08:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=hDH2L+0P9kjAoF52t+jsWol3EBTxZEBQ7riSP+6cwyM=;
 b=sed/+h5lEgewcmpW0voVHGQrAOThkQ7IGs9sM1TAoMI9yNT0sgR6BS3StvKNXW1H25
 Dpc1++5oCp8OAh0C6DFwOVNYwUkS3xqZVGy9S+SmYWq8nAXKBCPuuHNF5tJuoXMZzRoJ
 IsmJASRFv8vmC/aK0JpG84+Md1ASFL6vTXc5FOf+jZ81gExR4K/P8L8ie5ZnhDV8zDhK
 4PqyBF8tkZiXiGUueP3QQQxhWEbFC8GtGRc7ApcGL8qlToLJ/63MyAP1eaVmI1zO+ZNp
 pSMkAPmBNJyfdoTKZKmshKqWjxEFQ8XgOXiTaYZ68D+DCSDdXf6mzIvQTFumpant7Xen
 bDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=hDH2L+0P9kjAoF52t+jsWol3EBTxZEBQ7riSP+6cwyM=;
 b=TREgGH0eThQgJS2mfjeE2+VaFx5DJXHt5KqV90TmiGmvq0m3OqWq1QEPHdcaESYKm5
 cSteJbQ+WVX2gAu09TwtuzbkJnLYLEIFvVyxkW+4x+6fkgg6SUcdZTvixIsl+V9tMcm+
 qYDE2dWtlatN0Hiq1I9VEM9YvtBSXoV++/UCwFh0yesuamSiSGbj3gVOESmIYk0UoLW+
 7/GG1cEldYBkbdCjXG9H+1yYzQ5VX9/wDeKWlLXF+5hZq3Oc48VldB9CWWMHFeNI0QY1
 xzNFiu9u1NmrwpnM8QUVFqBBnYRloqUlR0Fg4QBxsQ1Zjysows8jQhCvWYlEp3tCRI0n
 uOdw==
X-Gm-Message-State: AOAM532mjLkVlk8OrFNeT1QsPHy+Jo2LavqtMZXFaI37CR0E2QhupeY0
 PZPAAaYzHOsDBH52ui1tXZIhH+sJZTVSpcRZ
X-Google-Smtp-Source: ABdhPJz45T2wEeEYk/qdaxwS+D23F+v9yNo/z//yKmz2pRPtTfSHZ34k9nhQCSOL4Q87J7+F7owp9g==
X-Received: by 2002:a05:600c:2219:: with SMTP id
 z25mr5004724wml.27.1608308892494; 
 Fri, 18 Dec 2020 08:28:12 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id o8sm13980950wrm.17.2020.12.18.08.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 08:28:11 -0800 (PST)
References: <20201218154544.25513-1-lars@metafoo.de>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: meson: Use managed DMA buffer allocation
In-reply-to: <20201218154544.25513-1-lars@metafoo.de>
Message-ID: <1jeejnnko5.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 18 Dec 2020 17:28:10 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_115900_728521_A04C0493 
X-CRM114-Status: GOOD (  16.82  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 18 Dec 2020 at 16:45, Lars-Peter Clausen <lars@metafoo.de> wrote:

> Using a managed buffer will pre-allocate the buffer using
> snd_pcm_lib_preallocate_pages() and automatically free it when the PCM is
> destroyed.
>
> In addition it will call snd_pcm_lib_malloc_pages() before the driver's
> hw_params() callback and snd_pcm_lib_free_pages() after the driver's
> hw_free() callback.
>
> This slightly reduces the boilerplate code of the driver.
>
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>  sound/soc/meson/aiu-fifo-i2s.c   |  1 -
>  sound/soc/meson/aiu-fifo-spdif.c |  1 -
>  sound/soc/meson/aiu-fifo.c       | 18 ++----------------
>  3 files changed, 2 insertions(+), 18 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
> index d91b0d874342..2388a2d0b3a6 100644
> --- a/sound/soc/meson/aiu-fifo-i2s.c
> +++ b/sound/soc/meson/aiu-fifo-i2s.c
> @@ -124,7 +124,6 @@ const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops = {
>  	.trigger	= aiu_fifo_i2s_trigger,
>  	.prepare	= aiu_fifo_i2s_prepare,
>  	.hw_params	= aiu_fifo_i2s_hw_params,
> -	.hw_free	= aiu_fifo_hw_free,
>  	.startup	= aiu_fifo_startup,
>  	.shutdown	= aiu_fifo_shutdown,
>  };
> diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
> index 44eb6faacf44..2fb30f89bf7a 100644
> --- a/sound/soc/meson/aiu-fifo-spdif.c
> +++ b/sound/soc/meson/aiu-fifo-spdif.c
> @@ -158,7 +158,6 @@ const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops = {
>  	.trigger	= fifo_spdif_trigger,
>  	.prepare	= fifo_spdif_prepare,
>  	.hw_params	= fifo_spdif_hw_params,
> -	.hw_free	= aiu_fifo_hw_free,
>  	.startup	= aiu_fifo_startup,
>  	.shutdown	= aiu_fifo_shutdown,
>  };
> diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
> index aa88aae8e517..4ad23267cace 100644
> --- a/sound/soc/meson/aiu-fifo.c
> +++ b/sound/soc/meson/aiu-fifo.c
> @@ -99,11 +99,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_component *component = dai->component;
>  	struct aiu_fifo *fifo = dai->playback_dma_data;
>  	dma_addr_t end;
> -	int ret;
> -
> -	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
> -	if (ret < 0)
> -		return ret;
>  
>  	/* Setup the fifo boundaries */
>  	end = runtime->dma_addr + runtime->dma_bytes - fifo->fifo_block;
> @@ -124,12 +119,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> -int aiu_fifo_hw_free(struct snd_pcm_substream *substream,
> -		     struct snd_soc_dai *dai)
> -{
> -	return snd_pcm_lib_free_pages(substream);
> -}
> -
>  static irqreturn_t aiu_fifo_isr(int irq, void *dev_id)
>  {
>  	struct snd_pcm_substream *playback = dev_id;
> @@ -187,15 +176,12 @@ void aiu_fifo_shutdown(struct snd_pcm_substream *substream,
>  int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
>  		     struct snd_soc_dai *dai)
>  {
> -	struct snd_pcm_substream *substream =
> -		rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>  	struct snd_card *card = rtd->card->snd_card;
>  	struct aiu_fifo *fifo = dai->playback_dma_data;
>  	size_t size = fifo->pcm->buffer_bytes_max;
>  
> -	snd_pcm_lib_preallocate_pages(substream,
> -				      SNDRV_DMA_TYPE_DEV,
> -				      card->dev, size, size);
> +	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
> +				       card->dev, size, size);

Hi Lars-Peter,

These FIFOs only do playback so to avoid wasting memory
s/snd_pcm_set_managed_buffer_all/snd_pcm_set_managed_buffer ?

>  
>  	return 0;
>  }


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
