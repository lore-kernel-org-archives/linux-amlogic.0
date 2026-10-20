Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB99F606A327
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2026 13:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D+tLtSvI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=g5YzQuww
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+cGOicZxo2wRrnkZV5ChP6zFdIcW0FptVxp0rsUAf4=; b=D+tLtSvIk62d9H
	WbD6v7hfoaXG6qOQHZk7u6u7GSYV5pFN95SQJzAU3yNE58sux9EQnpYjdgWo1fUNUv3pBmgWie/iR
	Yi1jlVrMht/YrCOquvDAMkqKPAdUIIjTLvhWodasPkhAlFAvseNcJw52rv8jo04J3kshQh39tPsc9
	bwcD8okf7j21arOf8sH6FQCusS/f0Vw/WdxZ/FcF2tAokpIw6BCs94GU8QIgssOmMfg6rNzKOMMvx
	q9q8TV1t/GIsGlvd00FhSY8fNQ3gO78KdX8EGhDeflLcLq8YYi9TQadqHu9U37BUiiTkN7wPRxXcD
	ut0hMwnkJy0oNnIlDM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Ug-00000009jdM-17TI;
	Tue, 20 Oct 2026 13:03:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Ua-00000009jcY-1wj3
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Oct 2026 13:03:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so41062125e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2026 06:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792501378; x=1793106178; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0a4Pwd8R1+O9SK5iUfsvWfZnTNOS5ycC0m0fIp9lm0=;
        b=g5YzQuwwD3Ugt9z9ANLxNOZHAJbFMj5rq5Weg8sQi8Ww3YrN3BN/FuQEQW73l3veTo
         XVRRIFHQYJUpVYZCVOMscVbLmJfrYbNIpTNSTs7L/DhxZKOeeYrB9dJZ9t5dCvt0sW/w
         fNpNuAnWXEdSCCNuAI7N8MA2cc9TzBlIFw461CrAfcON0twZPy5R0v0imVjbTkmPrxXg
         xtlxFzWWl5RrypzsJ9+fT16Xm5B5OfEsk10xb2tPK5jSSciSLAHj+OXMZhNibVQkMZRO
         /H1uvG0YLiRUV0JtGT3APfE+AJZO2SFle3B49DejD2f/w949YRI0V7UmAfTJe5v2tzo5
         HgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501378; x=1793106178;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0a4Pwd8R1+O9SK5iUfsvWfZnTNOS5ycC0m0fIp9lm0=;
        b=j3yiYQcHLJD40r/ygF/SZboDTw4Lu99KazETAYheK5ibviRsuftX/j7+qTVEHE/T+b
         gNB4Sk6hiMSA31Fz+2U4PH5Oq3oxO8dujGY3dnzjYpmg/uJlSjhLeggxeuYqjJoeyJ4e
         aHV9JTyO++cYkGXwGveE8u+KN6WmVBH5MrwRuCjCffHtF07uhn0FpEsCwpO/LeCwpcqb
         zGc4migU4xFVC/IxMPnyX0771egMfXJCFB6KotcP9X1S2cby99bEOjiiP7JQISkyr8CM
         laQvUs9o73lBXcqvZmr07vdTBlRZYLTzqL+V/tE7b2n7tLcjDRXRhXjB3r2y/6BLhqfG
         mI5w==
X-Forwarded-Encrypted: i=1; AKwUvBzxqTWAKXGFpj4/q3H9pm1dw4vkG8zobnglSKo03dFyYJK3hlBb0oZD0LZz+wki6DYL2FHX+BwedW7hu6pC@lists.infradead.org
X-Gm-Message-State: AFq9FYKD0lc18FSGNuhNe4txyLQsEnhBOhZ/NxZFH/QexQEXNEBtuk4I
	CpqsAqt19w2njjHGLsyT0xKVx8tZsJAbhrum4wK3fPw6MNG20irbyFN+mot7ykfJy44=
X-Gm-Gg: AYBFou1Jr8IzSAP4MIkMEgOzP4qEchGp0ytM5PVWNtIoR9rCMAGx6ToSZO3gbiQpUA7
	16BNmHFi1w+0hWwzLQCS25kxtVwct1DC0FP2DGOwtfjz/GunPJj27KQL2cgowWQY7aW89lRZYRG
	gqID/NvDhSEevqXXyvzPqHdKUTvWDTrcMMftdkb47bLzWuSjK8fyUPZznzGhGbjTDYU4/D1Ixqy
	9njsEdynVJQ13CKMnDY1YXBCRuM2mwCwuL1DGw9mhvocPc28coWClzJSRGzbh4eIDH2uH61PRr1
	K5epX/qEtHJWP8xUikpYyhy8KRQ5b3BYPCD5qofuS012z5OtLbMhxs8XppXpwlkv++PywaCafDN
	7YQbxtsKRg1jY79P2J9QMzswBkff9hsOPnjvLQFvW+87UKZB/BH0uTRpIKSKnpTf2LSDbn8vfyG
	D0+HZsrwbTkfOBYdg+OHWq2r79c+1gpY44hvk72ocP1Paj8LuN/icl7AU7X3jIxgwmzVEASc8zm
	A==
X-Received: by 2002:a05:600c:3b22:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a1d7615cb9mr232401775e9.17.1792501377669;
        Tue, 20 Oct 2026 06:02:57 -0700 (PDT)
Received: from [192.168.3.100] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d1e8ebsm65821575e9.3.2026.10.20.06.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:02:56 -0700 (PDT)
Message-ID: <257ab6d8-4990-4e58-9eaf-9cac3cb29b01@baylibre.com>
Date: Tue, 20 Oct 2026 15:02:56 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
 <sashiko-outbox-176054@kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <sashiko-outbox-176054@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_060300_842005_8E60EF56 
X-CRM114-Status: GOOD (  31.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>> +static enum hrtimer_restart audin_fifo_timer_cb(struct hrtimer *timer)
>> +{
>> +	struct audin_fifo_dai_data *data =
>> +		container_of(timer, struct audin_fifo_dai_data, polling_timer);
>> +	struct snd_pcm_substream *substream = data->substream;
>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>> +	unsigned int curr_pos;
>> +	unsigned int delta, elapsed_periods_bytes, extra_bytes, sleep_bytes;
>> +
>> +	/*
>> +	 * Take the stream lock to prevent userspace from issuing a quick
>> +	 * PAUSE_PUSH -> PAUSE_RELEASE transition while we're running this
>> +	 * callback. Doing so would cause "hrtimer_forward_now()" to be called
>> +	 * (see below) while the timer is already enqueued.
>> +	 */
>> +	guard(pcm_stream_lock_irqsave)(substream);
>> +
>> +	/* Stopped, or a trigger already re-armed the timer while we waited. */
>> +	if (!READ_ONCE(data->running) || hrtimer_is_queued(timer))
>> +		return HRTIMER_NORESTART;
>> +
>> +	curr_pos = audin_fifo_pos(data->dai, runtime);
>> +	delta = (curr_pos >= data->last_pos) ?
>> +		curr_pos - data->last_pos :
>> +		(runtime->dma_bytes - data->last_pos) + curr_pos;
>> +	extra_bytes = delta % data->period_bytes;
>> +	elapsed_periods_bytes = delta - extra_bytes;
>> +
>> +	/* Report only when the period is completed. */
>> +	if (delta >= data->period_bytes) {
>> +		data->last_pos = data->last_pos + elapsed_periods_bytes;
>> +		if (data->last_pos >= runtime->dma_bytes)
>> +			data->last_pos %= runtime->dma_bytes;
>> +		snd_pcm_period_elapsed_under_stream_lock(substream);
>> +	}
> [ ... ]
>> diff --git a/sound/soc/meson/audin-formatter-i2s.c b/sound/soc/meson/audin-formatter-i2s.c
>> new file mode 100644
>> index 0000000000000..8bbb5cdb52dc8
>> --- /dev/null
>> +++ b/sound/soc/meson/audin-formatter-i2s.c
> [ ... ]
>> +static struct gx_stream *
>> +audin_formatter_i2s_get_stream(struct snd_soc_dapm_widget *w)
>> +{
>> +	struct snd_soc_dai *be = audin_formatter_i2s_get_be(w);
>> +
>> +	if (!be)
>> +		return NULL;
>> +
>> +	return snd_soc_dai_dma_data_get_capture(be);
>> +}
> 
> [Severity: High]
> Does binding the AUDIN formatter to gx_stream lead to sleeping in atomic and
> softirq contexts during PCM trigger operations?
> 
> In audin_fifo_dai_probe(), polling_timer is set up with HRTIMER_MODE_REL_SOFT,
> so audin_fifo_timer_cb() runs in softirq context and acquires
> guard(pcm_stream_lock_irqsave)(substream). This requires substream->pcm->nonatomic
> to be false, otherwise _snd_pcm_stream_lock_irqsave() would attempt to acquire
> substream->self_group.mutex from softirq context.
> 
> However, with nonatomic set to false on the FE and BE substreams, PCM trigger
> operations hold spin_lock_irqsave on the PCM stream locks (for example via
> dpcm_be_dai_trigger()). This also occurs in softirq context when an XRUN is
> detected:
> 
> audin_fifo_timer_cb()
>    -> snd_pcm_period_elapsed_under_stream_lock()
>      -> snd_pcm_update_hw_ptr0()
>        -> snd_pcm_stop()
>          -> dpcm_fe_dai_trigger()
>            -> dpcm_be_dai_trigger()
>              -> aiu_encoder_i2s_trigger()
>                -> gx_stream_stop()
> 
> Because audin_formatter_i2s_get_stream() attaches the AUDIN formatter to the
> backend DAI's struct gx_stream, starting or stopping the capture stream calls
> aiu_encoder_i2s_trigger() -> gx_stream_start() or gx_stream_stop(), both of
> which acquire the sleeping mutex ts->lock:
> 
> sound/soc/meson/gx-formatter.c:gx_stream_start() {
> 	mutex_lock(&ts->lock);
> 
> 	/* Start all the formatters attached to the stream */
> 	list_for_each_entry(formatter, &ts->formatter_list, list) {
> 		ret = gx_formatter_enable(formatter);
> ...
> }
> 
> sound/soc/meson/gx-formatter.c:gx_stream_stop() {
> 	mutex_lock(&ts->lock);
> 	ts->ready = false;
> 
> 	/* Stop all the formatters attached to the stream */
> 	list_for_each_entry(formatter, &ts->formatter_list, list) {
> 		gx_formatter_disable(formatter);
> 	}
> 
> 	mutex_unlock(&ts->lock);
> }
> 
> Won't calling mutex_lock(&ts->lock) while holding the PCM stream spinlocks with
> interrupts disabled (and from softirq context on XRUN) trigger a sleeping in
> atomic context bug?
> 

The analysis is technically correct, but let me share my analysis first
and then gather some feedback.

The issue is not introduced by this series. gx_stream_start() and
gx_stream_stop() have been called from aiu_encoder_i2s_trigger() since
commit 9335117a221a ("ASoC: meson: aiu-encoder-i2s: prepare for
multiple streams"), which is already upstream. GX links are atomic, so
the playback path already takes the 'gx_stream->lock' mutex with the PCM
stream spinlock held. This patch only extends the same pattern to the
capture path.

Now back to the issue. Taking 'gx_stream->lock' mutex in trigger means
taking a sleeping lock in atomic context which, of course, cannot sleep.
For the sleep to happen it requires the mutex to be contended:
- trigger vs. trigger cannot contend, since dpcm_be_dai_trigger() holds
   the BE substream lock around the BE trigger, which serializes all
   calls on the same gx_stream (even with multiple AUDIN FIFOs sharing
   the BE);
- the formatter attach/detach from the DAPM widget events also takes
   the mutex. This normally happens in prepare/hw_free, when the stream
   is not running, but a mixer change (e.g. "FIFOx Input Source" moved
   away from I2S) powers the formatter down under the DAPM mutex only,
   while the BE is still running. A trigger on another CPU at that
   moment (userspace or XRUN) would find the mutex held.
   However since AUDIN FIFO only supports I2S for now, I don't see a real
   reason for this switch to happen in practice.

Now the solution. Moving the gx-card links to be nonatomic seems a bit too
much intrusive to me. I think the best solution is to change
'gx_stream->lock' to be a spinlock. This is fine for GX formatter because
all ops are pure MMIO regmap accesses, so they shouldn't sleep.

Finally the question. As I said, since the issue described by Sashiko
seems a bit hard to hit, I think the fix can be postponed to a quick
follow-up series. However if reviewers deem that it's absolutely mandatory
to fix the issue before this series lands, I will either prepare a small
pre-requisite series or add a new commit to this one (I would like to
know what's the reviewers preference on this case).

Thanks in advance for the replies! :)

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
