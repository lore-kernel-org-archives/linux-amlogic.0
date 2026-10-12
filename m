Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD79CA9EC5
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6usih0H4NlcLKMFogi38LDOlZcwWokNL5SpHRWKcxD4=; b=XXyw7hs46gHQVN
	Oqae59zKagwmSTl+vuMCkKN8CQ1/9ZuBsSp9/GsP0Zxq94Ev2EM0aq5a3MngEPWT+6hxtbyZhkwqo
	QvAYZdjfD48Rj1B8a3s8WF5vgaGOn+1ItCgTk4n99CjK50Liwe+pLi/CtmKRskECOly61Lam43U8p
	4ckaig/kQICtoA77AFvncsT3ig0ENjOOcB6fo81cloZKhEMwSH6oHvjpsJTKGkFaVv4mOVR+Mjxni
	k0RKMAPJgpaSFjTA3RVZmGPc/xCeBFcBArqunurU+JAqe6dhJRs6I0Im0IZUk7KTOlYlsR+/NnRCR
	nIhmICtKIUoaY/c+9VfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHul-0000000AnXQ-1t14;
	Mon, 12 Oct 2026 15:26:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHui-0000000AnWW-3VQ3
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 15:26:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-487049569b6so1431222f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 08:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791818767; x=1792423567; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1MniahAvg/Rvn/u502QsbwvNOCgBbmXAK/xR/xwvXg=;
        b=Zr9Hp/QoWOqfgn/5NjN759Y5Ax9ajFZ45xNYHGvcozHbpGSiXc/EdHDwF+THdGR2L2
         DfZaKqstRo36Lh1Vi/KyNshr0/49S957FoBD+gnQLL7zCz/T2I7fODJ8FwKTrCLuOOkF
         vobNN8gxVLKrtza++Pn7OElge00YARkjlEVtW1n15u/BgiZ/ZuN2bTt7GHHkLlzCDDXc
         zomNL0v7vn0ofyjKA/Z+Q+PGWD1sqdfmjv42yRS2jvIkhDEMaoi7kurOrTw4ptcpVKZ8
         HkrbDAEy1NCwY8us6J44Ghuf2YyAH5qIvbHw6hm42WiXnzdDghUqW0epIvISFhfUA4ZH
         ffHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818767; x=1792423567;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1MniahAvg/Rvn/u502QsbwvNOCgBbmXAK/xR/xwvXg=;
        b=ecs2xNrdm32p9eT/Z+Uc40nlKAfQOk6kZiBZ2KmxP09cAnQbwT9LsCGCnOzuPmLWeA
         XjQdn/QUiiSsiTsxaxFaDtLWlnveXOE5CnFVxnxkY/OuuVthmwcSDEweno1d0bCppEE2
         m2q1FlDZc+2GUtbe9Qo4BXv9I2cVGMI0APvuNb/yss32RlYNrjvaUqYCe1ZPNrqqb3cx
         tcTq8SfXWv72Crm1+ScuSqrttsWrtFEkAfhWtC3MkJ3/aweMOk+U31Ld0WEfOqpYJMOo
         6KT++4kOeOG2zriM7XrIfbyNXT6OLneyf1tnQ7hXN0YtysAoPwMZti5cF3TGAnn3SZBs
         L6JA==
X-Forwarded-Encrypted: i=1; AKwUvByKiRNlkfdk/mTYo8THIXymlgIH2WQLptjSw7PC9or+LAkYre6Mb8YuMJ4/3LMHdBfk5DwwvvJaXyIUJqsW@lists.infradead.org
X-Gm-Message-State: AFq9FYLbz7zzF+kVehTeGHv0rAUvAk8Iq0K9ziaI1DxfIoEXDYMQpqnZ
	//X8J1IzDTj60Yf4VYtCv/Yre+5jo28CwicPpVFnDSUWUURtTf8mLizwS+qtJKdEW7s=
X-Gm-Gg: AYBFou0iU0LxGxaybSBUT1W+KaESNb9fXkbnGXGbi5+fn6iXGLxMfYxj+UT+Lsd4FEk
	veIvYnSCrJMQqU1+8dtthn+E+YIxgCe+aNNG++804Pf3oF6rehtrvLWkQerRTmVjXTR5uRMhyYC
	qr19qt7xpkBlFqFiKWo/vsVQryp/1q5n1yajCQrMZohVHQcBW9nM8gbEtnuPOVGsKrS8BqpctO1
	r8nrKRw8HrZgSR0shtCd6Kuo2ieBia270AbXs8iAE9cIL4KQ5cDl4HywCajpWHDzsPXPP+w+aWm
	LkMtRKCO8iEiosIRxoG1J8+qQtHLf3WM6cqes+DzEMSE6Y69O4xl2nc+YVFCLbUQmz94Jr1xJrF
	NAx/N3pRFujSiyfUyZfdXRMJCoZ8UtSx8RbqwCWGZoxDELSWPjzFrpNpJKvflE1RLiXnvl5X0qk
	3cw1uHs31tSgAP3DsTrDtJuMbxaCyanOnuS69YFxTbTkIpUz7ePB8nfRGES5H2CxXTa08lZIsr4
	IJx2gRsnmCd
X-Received: by 2002:a05:6000:4553:b0:487:106f:ee31 with SMTP id ffacd0b85a97d-48dbaae8703mr13003907f8f.27.1791818766936;
        Mon, 12 Oct 2026 08:26:06 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4f34sm45018f8f.28.2026.10.12.08.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:26:06 -0700 (PDT)
Message-ID: <37f751f6-1bf6-4e31-9439-1145d930b746@baylibre.com>
Date: Mon, 12 Oct 2026 17:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] ASoC: meson: add AUDIN driver
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, neil.armstrong@linaro.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-4-2476646118b5@baylibre.com>
 <20261001162313.4333D1F000FF@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20261001162313.4333D1F000FF@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_082608_913298_91C91CAF 
X-CRM114-Status: GOOD (  20.49  )
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

>> +static int audin_fifo_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>> +				  struct snd_soc_dai *dai)
>> +{
>> +	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
>> +	struct snd_soc_component *component = dai->component;
>> +
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_RESUME:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		snd_soc_component_update_bits(component, dai->driver->base + AUDIN_FIFO_CTRL,
>> +					      AUDIN_FIFO_CTRL_EN,
>> +					      AUDIN_FIFO_CTRL_EN);
>> +		WRITE_ONCE(data->running, true);
>> +		hrtimer_start(&data->polling_timer,
>> +			      audin_fifo_bytes_to_ns(data, data->period_bytes),
>> +			      HRTIMER_MODE_REL_SOFT);
> 
> [Severity: High]
> Does this blindly re-enqueue the timer without synchronizing with a potentially
> running callback?
> 
> If a user rapidly toggles SNDRV_PCM_IOCTL_PAUSE, PAUSE_PUSH uses a
> non-blocking hrtimer_try_to_cancel(). If the timer is running and skips
> snd_pcm_period_elapsed() (e.g. because delta < period_bytes), it won't take
> the PCM stream lock and will execute hrtimer_forward_now() concurrently with
> PAUSE_RELEASE.
> 
> PAUSE_RELEASE then blindly calls hrtimer_start(), which enqueues the timer.
> When the running callback in audin_fifo_timer_cb() reads running=true, it
> returns HRTIMER_RESTART, resulting in a double enqueue of the same timer
> which can corrupt the hrtimer rbtree.

This looks correct. I will send an update for this.

>> +static int audin_fifo_dai_remove(struct snd_soc_dai *dai)
>> +{
>> +	kfree(snd_soc_dai_dma_data_get_capture(dai));
>> +
>> +	return 0;
>> +}
> 
> [Severity: High]
> Does this free the DAI data without waiting for the polling timer to finish?
> 
> If the driver is unbound while an audio stream is open, the ALSA core triggers
> a stream stop which uses a non-blocking hrtimer_try_to_cancel(). If the timer
> callback is running concurrently, it will write to this freed memory.
> 

This and the following issue look a bit of corner case to me (i.e. 
unbouding a driver while record is ongoing), but I agree that's a weak 
point so I will fix it.

>> +int audin_fifo_sync_stop(struct snd_soc_component *component, struct snd_pcm_substream *substream)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
>> +
>> +	hrtimer_cancel(&data->polling_timer);
> 
> [Severity: High]
> Could this deferred callback access the freed data pointer?
> 
> If the driver was unbound and audin_fifo_dai_remove() freed the DAI data,
> when the file descriptor is eventually closed this deferred sync_stop callback
> will access the freed data pointer to cancel the timer.
> 
>> +	WRITE_ONCE(data->running, false);
>> +
>> +	return 0;
>> +}
>> diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
>> new file mode 100644
>> index 0000000000000..808e7d4fd31a2
>> --- /dev/null
>> +++ b/sound/soc/meson/audin.c
> [ ... ]
>> +static const struct regmap_config audin_regmap_cfg = {
>> +	.reg_bits	= 32,
>> +	.val_bits	= 32,
>> +	.reg_stride	= 4,
>> +	.max_register	= 0x148,
>> +};
> 
> [Severity: Medium]
> Will hardware state like the channel mask and endianness be lost across
> system suspend and resume cycles?
> 
> ALSA calls the driver's prepare() callback to recover a suspended stream,
> but not hw_params(). Because this regmap lacks a cache configuration, it
> cannot automatically restore the register state configured during hw_params()
> when the system resumes.

This was already answered by Jerome [1] (thanks!) so that's out of scope 
for this series.

[1]: 
https://lore.kernel.org/all/1jbj95zz8o.fsf@starbuckisacylon.baylibre.com/

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
