Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F4FCD5BAC
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 15:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTL8vgbuwcrnm305eiMa0CTcUe1Ze6uX+gUhu/GsSLo=; b=oQIH4QIGIYS4qL
	Mrq0NH+vGqNfV7/YS/rk2Ed5Z48Z2t00WXkzpgkZ/C8A3H47wdWGeCjL7qpwBl/DrEaJdGdDCaDsW
	Bq0RkU7YU9/muGxM5Gk24ZywocHCnRZFmikzjv7irVsFMl9RplOenSZ2MsZ0VlQxVmLqaFpE0nZqb
	ECsDqZC67dCqj+du9okMPzrcPq5/IcNgltmiAl+tnDbfUGsmPiZl6Z4nE9x7KQY0F/NwRFVaTIWMH
	ir+QONveOa5wfVCsiyR0FCfeCmTaukT6QWBsYgb5J8hY2jsD5BAV4E37tvmcOg2yU4sj7MVfzjNcI
	QQXxWqsPMBj4RXBN1PPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5hW-00000008PHL-2oP1;
	Thu, 21 May 2026 15:52:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5hU-00000008PGe-3BS8
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 15:52:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so36110465e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2026 08:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779378763; x=1779983563; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkuwrL+8sdByToUa06iwqboK6E1NO0C0KpcSpGWRRog=;
        b=ZOv84rnuUvkIKUJxvLi+jBX/YzAeXw2/I0DNf5XTPEy2DNDw08CIgaVO6x/BORY3zY
         Y3w2q5JUpRJfr8PKSViHQUF7z52EV8uxY4tcIRSQbEZkm7m7C4LoSDQjyFGCG+xIT6FK
         hVwWdfSEsk8OcIzhgAl+0wo2ZmLlW7xlb8dtoAo+ytM7Bhfwc3HpMNhl1lPkw+UxNyjI
         4gO4SpiWoPoDo61znzVaM/kOqnh3PIHAKPVFPbHbKo/F5ElZCCd4dUnb9/ig+dzXHeon
         WnhJvj8uGBQoQ/ZsvvEEHnSUyGREnwuwqEOYtUNKNbHA5W7z9iDLMDutSSutfsv8jKSd
         zxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378763; x=1779983563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkuwrL+8sdByToUa06iwqboK6E1NO0C0KpcSpGWRRog=;
        b=NRyj44k0GIK+g3YAXCQoAZbodtDuGIBAtUvhqHvOUDLiHkgr2ypLzrM+W7rFAUfbMH
         kcNI5e7oEx08wwu9wJ06L65BwMs9Kw/u72+38Bgk8BepVzrVZNn7CwDUqHBDbljUQsks
         LKmTqmPi/YfER42P/syBurtyoavLrUuqC+frkn/1wg5Oik99RAT0v7R+GQv09rpS9duh
         WV/a2fWx5KRmeUtTWr1VpmLEjD/1z8bO5tH0y6pU2D/TPkCaQ+l+bLLWYcE444AJ6XKn
         ondRK6tenH9/laXj0F094vKhVN8T66TwJeCV+a1ePBsEZabfIi5tq4FaxwLaF3vCwIjh
         8L1g==
X-Forwarded-Encrypted: i=1; AFNElJ/cQqaGHuvJeM6zxo15txJUyTardIN2Rh6/jSVWJiBWsWWYaXdEd24RQZ3thBj1pS0Zb1YEhaGG9ilfzxLp@lists.infradead.org
X-Gm-Message-State: AOJu0YxVLIlVnMuWL3HBchT8XICw4oh70YOALm2vBKK5TFJZgXirEEQC
	JesalHDH4u4qmhQYfl/xvMXIfX1YiUBIIXmkFLGP/FxGV1of2kbYA4u7dem2lUOAOzo=
X-Gm-Gg: Acq92OEkfHYE0MX+Yz0holuCE0cwLMeMBDQWXr62J05T2G88WcfTQwSDMAWkH11Zr+9
	+DYIv9XkYzO9tAvlfvIOJocI+ow7h4SSN/5V0AN40CxWFuEyVInRAh9HpENDOnK4yjHPV6JYug2
	Z0+W5Nfl1+mS0FBLwF5s6seeSeHikuDywTQfD1ZYDZbJHbaItymrDG4GzGkZc/P5yd/0OMFiWgv
	hFBi+nxuAvVczqwcbh78X+0i8H24Duq+ZHoFHRw+VV+p2Cf8x4L94N6cQgFpnTgNCpVtmismtub
	v7hTaZTLBNljxk65xCuqLMPzrh/gLJ5OTKBc1GZkNRv3fq0eSF5WeCv1mVNZ3jci5zQrhvMeHbX
	R7FtOviy9ZU3Vx+0sZpBrd0Tvdt6nRm7NpkaAKl6aIoY/8kFSKplgXIzG4NjbyADKy0KuDaBiuT
	hwG3/mSc7x3xc+odws6OuJcXRfgQ==
X-Received: by 2002:a05:600c:621a:b0:48d:50a:6ef4 with SMTP id 5b1f17b1804b1-490360ae7e3mr40140425e9.11.1779378763182;
        Thu, 21 May 2026 08:52:43 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c99cb43sm34383775e9.4.2026.05.21.08.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 08:52:42 -0700 (PDT)
Message-ID: <b274a43d-de3a-420d-911d-6b233b4294ed@baylibre.com>
Date: Thu, 21 May 2026 16:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: meson: aiu-encoder-i2s: use gx_iface and
 gx_stream structures
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
References: <20260515-reshape-aiu-as-axg-v1-2-53b457784ff3@baylibre.com>
 <20260515161047.C0701C2BCF7@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260515161047.C0701C2BCF7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_085244_821634_F4AF5B62 
X-CRM114-Status: GOOD (  20.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


>>   static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
>>   				     struct snd_soc_dai *dai)
>>   {
>>   	struct aiu *aiu = snd_soc_component_get_drvdata(dai->component);
>> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
>> +	struct gx_iface *iface = ts->iface;
>> +
>> +	if (!snd_soc_dai_active(dai))
>> +		iface->rate = 0;
> 
> The ASoC core invokes the shutdown callback before decrementing the stream's
> active count.
> 
> Because of this, does snd_soc_dai_active(dai) always evaluate to at least 1
> during the shutdown of the final stream?
> 
> If so, iface->rate will never be reset to 0, which would cause subsequent
> streams with different sample rates to permanently fail with -EINVAL until
> the driver is reloaded.
> 

I might be missing something also here, but I don't think this is 
correct. It seems to me that when 'aiu_encoder_i2s_shutdown' is called 
the number of active streams have already been decreased so everything 
works as expected.
In support of my hypothesis I have tried this patch series together with 
the upcoming one adding also capture stream and I didn't experience 
problems, so I think that 'iface->date' is correctly reset when expected.

>> +static int aiu_encoder_i2s_trigger(struct snd_pcm_substream *substream,
>> +				   int cmd,
>> +				   struct snd_soc_dai *dai)
>> +{
>> +	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
>> +	int ret;
>> +
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_RESUME:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		ret = gx_stream_start(ts);
>> +		break;
>> +	case SNDRV_PCM_TRIGGER_SUSPEND:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +	case SNDRV_PCM_TRIGGER_STOP:
>> +		gx_stream_stop(ts);
>> +		ret = 0;
>> +		break;
> 
> The PCM trigger callback typically executes in an atomic context with the
> PCM stream spinlock held and hardware interrupts disabled, unless the DAI
> is explicitly marked with nonatomic = 1.
> 
> Looking at gx_stream_start() and gx_stream_stop(), they both unconditionally
> acquire a sleeping lock via mutex_lock(&ts->lock).
> 
> Does acquiring a mutex in this atomic context trigger a scheduling while
> atomic kernel panic?
> 

This is one of the parts that has been copied from AXG. I would say that 
the problem highlighted here would only appear in case two formatters 
are started/stopped on same stream concurrently. If that's the case then 
this is not a problem for GX because we're going to have 1 single 
formatter per stream.

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
