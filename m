Return-Path: <SRS0=3nIP=FZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B40C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 08:15:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C2422C9C
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 08:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09C2422C9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UE7S5tIcu/8hVQPzdHAIX29m8x+mnUEH5onO2LhzM3w=; b=hCMsfR9wgLbeRw8vfT/c9bz3z
	csgx9Gvq3/SUtHjuE39Unq/Nt25rW4+cBP4y1rPoAtx2VytVCUd/XtTRbXsWPpaAmCY8vpkt7JNNZ
	MUFNWoh4s40I0FotCDAR8sGSBaLZyDhN7XXwVupL1os0qem+2rsPg4PtmEThkH6zYG9VpgQdRRv4/
	/WnQC0VSG0xAFZoMwirt0P+SNJBjQMundQyIP9fAI0lIjYTR3ekpEqFR+1JEbnXxhWMkr+3cBQC9u
	DklLN43QUqf3W8iguPEj8fvh9Fffrf2qVYXk2D5Uxwm5kG5M4F40QtMvSdbL3RhYV+uE88FdHQ7ts
	3y7fYlTWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krGLe-0006uY-CH; Mon, 21 Dec 2020 08:15:18 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krGLc-0006uC-6k
 for linux-amlogic@lists.infradead.org; Mon, 21 Dec 2020 08:15:17 +0000
Received: by mail-ej1-x631.google.com with SMTP id w1so12165041ejf.11
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Dec 2020 00:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=xUsvdR/WeGTYf9wm0poC0ggXriA18BQWFkluydsdRYs=;
 b=hVl/2TgZ+0fHUReuJsBEZJ4FWb1VN4U9nO7+L2RWPGo/XxeapDTlLbgvt6onHI2jYI
 M1NEA33irdr0Z8U7rKcsogkfv9Hibo22pIHLnl7NNE1dUcaFZ8b9iDy/lOyEqWJHOiV+
 ZXfyE3MOqPXNW9Tmsp6CoqPv4DRqc1XoV1sAAVXJ6O8hUJRuSaJOphZBzJUSjAfwcucV
 CbzXTMDCtsXriukK2L7yCwSPjYMSSrZo0MDmSNFqxFp3gRt9iv5Zr7bpM5iQUqQSx+zC
 ohbml5gOQwXsPFPNzG/qgzWP7p0o9eBlvKyKjdCz2R99QhqjJYmkYtioBpjJOAMbLMyX
 ovOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=xUsvdR/WeGTYf9wm0poC0ggXriA18BQWFkluydsdRYs=;
 b=nJ4V7htkrY0E9pVnCmkeWVBdG7TEg7usalS+I4S8mgjybRxa8kMGfw+sDr/yPH0V3g
 fv8uSaoOzCVshgvoCK2qWvFJlZHGaUrnhzPD9QbfjwU3ydKuDJpXkUKoWFiTkxptjTGj
 /EevNpcCiDRAcgUPxYDf/NtUg7RSIdouro+vVNyAqNswJfmudYHuCz+WImR741c26TOx
 +RaiuK9kFRgwVeb62IB/H7q72rN5897U+mYjR/BuLM37EvM6K/9OdUN0XNvE9np1hC9w
 FW4M4rKPQUGvxYP7owtdz3z/DnADiuOIgv5Q2rOWqd0JLaypluQbfdk0rNu18ibXtQL0
 SfSQ==
X-Gm-Message-State: AOAM530N/37A87UoR4tGUChBCegE8QM8Kyopyfw91YlZ7pQCE/waiIA4
 lN/W8STCkyww305xM/jPgOoSow==
X-Google-Smtp-Source: ABdhPJwon213LIfdCYvAOzDUqZYJfH9VYNfLieHDt76eK9jdAu/WN2Tc3bo0+Cu83Kc4apAyMMxsYw==
X-Received: by 2002:a17:906:94d4:: with SMTP id
 d20mr14194179ejy.475.1608538513189; 
 Mon, 21 Dec 2020 00:15:13 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id r7sm21421717edh.86.2020.12.21.00.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 00:15:12 -0800 (PST)
References: <20201218154544.25513-1-lars@metafoo.de>
 <1jeejnnko5.fsf@starbuckisacylon.baylibre.com>
 <fa1f3bcc-885a-9258-6653-3d5a5dc4708e@metafoo.de>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: meson: Use managed DMA buffer allocation
In-reply-to: <fa1f3bcc-885a-9258-6653-3d5a5dc4708e@metafoo.de>
Message-ID: <1jbleno9rk.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 21 Dec 2020 09:15:11 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_031516_375090_47870C40 
X-CRM114-Status: GOOD (  13.32  )
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


On Fri 18 Dec 2020 at 18:41, Lars-Peter Clausen <lars@metafoo.de> wrote:

> On 12/18/20 5:28 PM, Jerome Brunet wrote:
>> On Fri 18 Dec 2020 at 16:45, Lars-Peter Clausen <lars@metafoo.de> wrote:
>>
>>> Using a managed buffer will pre-allocate the buffer using
>>> snd_pcm_lib_preallocate_pages() and automatically free it when the PCM is
>>> destroyed.
>>>
>>> In addition it will call snd_pcm_lib_malloc_pages() before the driver's
>>> hw_params() callback and snd_pcm_lib_free_pages() after the driver's
>>> hw_free() callback.
>>>
>>> This slightly reduces the boilerplate code of the driver.
>>>
>>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>>> ---
>>>   sound/soc/meson/aiu-fifo-i2s.c   |  1 -
>>>   sound/soc/meson/aiu-fifo-spdif.c |  1 -
>>>   sound/soc/meson/aiu-fifo.c       | 18 ++----------------
>>>   3 files changed, 2 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
>>> index d91b0d874342..2388a2d0b3a6 100644
>>> --- a/sound/soc/meson/aiu-fifo-i2s.c
>>> +++ b/sound/soc/meson/aiu-fifo-i2s.c
>>> @@ -124,7 +124,6 @@ const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops = {
>>>   	.trigger	= aiu_fifo_i2s_trigger,
>>>   	.prepare	= aiu_fifo_i2s_prepare,
>>>   	.hw_params	= aiu_fifo_i2s_hw_params,
>>> -	.hw_free	= aiu_fifo_hw_free,
>>>   	.startup	= aiu_fifo_startup,
>>>   	.shutdown	= aiu_fifo_shutdown,
>>>   };
>>> diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
>>> index 44eb6faacf44..2fb30f89bf7a 100644
>>> --- a/sound/soc/meson/aiu-fifo-spdif.c
>>> +++ b/sound/soc/meson/aiu-fifo-spdif.c
>>> @@ -158,7 +158,6 @@ const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops = {
>>>   	.trigger	= fifo_spdif_trigger,
>>>   	.prepare	= fifo_spdif_prepare,
>>>   	.hw_params	= fifo_spdif_hw_params,
>>> -	.hw_free	= aiu_fifo_hw_free,
>>>   	.startup	= aiu_fifo_startup,
>>>   	.shutdown	= aiu_fifo_shutdown,
>>>   };
>>> diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
>>> index aa88aae8e517..4ad23267cace 100644
>>> --- a/sound/soc/meson/aiu-fifo.c
>>> +++ b/sound/soc/meson/aiu-fifo.c
>>> @@ -99,11 +99,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>>>   	struct snd_soc_component *component = dai->component;
>>>   	struct aiu_fifo *fifo = dai->playback_dma_data;
>>>   	dma_addr_t end;
>>> -	int ret;
>>> -
>>> -	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
>>> -	if (ret < 0)
>>> -		return ret;
>>>     	/* Setup the fifo boundaries */
>>>   	end = runtime->dma_addr + runtime->dma_bytes - fifo->fifo_block;
>>> @@ -124,12 +119,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>>>   	return 0;
>>>   }
>>>   -int aiu_fifo_hw_free(struct snd_pcm_substream *substream,
>>> -		     struct snd_soc_dai *dai)
>>> -{
>>> -	return snd_pcm_lib_free_pages(substream);
>>> -}
>>> -
>>>   static irqreturn_t aiu_fifo_isr(int irq, void *dev_id)
>>>   {
>>>   	struct snd_pcm_substream *playback = dev_id;
>>> @@ -187,15 +176,12 @@ void aiu_fifo_shutdown(struct snd_pcm_substream *substream,
>>>   int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
>>>   		     struct snd_soc_dai *dai)
>>>   {
>>> -	struct snd_pcm_substream *substream =
>>> -		rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>>>   	struct snd_card *card = rtd->card->snd_card;
>>>   	struct aiu_fifo *fifo = dai->playback_dma_data;
>>>   	size_t size = fifo->pcm->buffer_bytes_max;
>>>   -	snd_pcm_lib_preallocate_pages(substream,
>>> -				      SNDRV_DMA_TYPE_DEV,
>>> -				      card->dev, size, size);
>>> +	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
>>> +				       card->dev, size, size);
>> Hi Lars-Peter,
>>
>> These FIFOs only do playback so to avoid wasting memory
>> s/snd_pcm_set_managed_buffer_all/snd_pcm_set_managed_buffer ?
>
> snd_pcm_set_managed_buffer_all() will skip substreams that do not
> exist. E.g. if the there is not capture support it wont allocate
> memory for it.

Indeed, Thanks !

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

>
> To keep things simple I prefer snd_pcm_set_managed_buffer_all(). snd_pcm_set_managed_buffer() only makes sense if you have a different DMA device for capture and playback or you want different buffer sizes.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
