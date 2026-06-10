Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF73CD8CB2
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2026 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQyaIVCVGxUQVLxQqOS2aPwpTMN3SDK97F0pWPu2fGY=; b=c8Drn0YalDV3H3
	CO0l5Ots0v4icmP0/HPmNhAr0laYIppK3N4LVX95YuftE8Zqi1wa2OMEDYUpqg3HMVcFi4X5WIh+l
	X4S8HD7wndjrE2DsoZ3R+zZZ9iUz/8VjbOJsK0VzSJRX4iR6/BSrzP7ierJLHMXlvt4UCfAlm6xyj
	lw1adBvnmljV4aLQkrPfJ9wvZYkIavOPOlfh1eqA40jVXJTsHKCN4glhu6f4p/gXP312SQl7U332C
	Wwxoc39FUGyv6RVXRaBRmNJ0mPimzUAI6V1ZG2VnTZJIQiedYoD9rpfcaxs/Lnvzbpdy52wBsnQuV
	SSsoPvMQdxZAQWzg1qOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIis-00000007huc-1ePn;
	Wed, 10 Jun 2026 13:11:58 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIip-00000007htW-1qcS
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jun 2026 13:11:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45eee266c6cso5451176f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jun 2026 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781097113; x=1781701913; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWeLdZGLAbv8traSRmiJQZdTRZXFTjlEWYlcA7s+fFg=;
        b=miSWhSif2EiNrh019twJGiW2cf56S2GVJK73rx8T7Q1nMPJFDkO7e/ZZ2Rfj+QHMcb
         9gTIi4mbD15CUlEJlp1NIuV6//aq7HhZ6D65bhgTOmkaOYTvPRu2xcoUIUMcnCO38cpL
         mCcsJLsXTUSFH2tXZn8WCZ16csAMCiWH4kt2vhOkUFfyqIcDrlOAB8Eo6fdDi/TGq5mA
         dNyKT7tnBc6nTsCm76Vz6PtlHZESjOtf+GAkkeX84BpScEntLSyQif76pwPGKALNrESn
         bLsFehjYk75WVTmY8x77wnsKjTGo3EWLcsuGE/SWYKKrK/WknuILbnboHidJabTX+3dn
         EZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097113; x=1781701913;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nWeLdZGLAbv8traSRmiJQZdTRZXFTjlEWYlcA7s+fFg=;
        b=oOwJUrY1Ha8/kH/6YiVvu4Bb+aTmm7V077Fy1PLKRxXf1es9jeE63FBkPw8BzYW/KB
         JhlwKJ7W7SZeb2/6yOJBN+zwX9AhYupqNWRwDR5RzIKbLsOiUY5dA/TyraQrwUbiZc/S
         PkRJa5/fpPiO5iav9etF0HEXBDXgLPtOpTY2xsoUBJX8XB8xZHyv6gkgcDde6j69uBoe
         yODT+rDndos0pUV+6igTXqvPtvzKifctcQ133s2sB35GLowfQTRfnu6FLaOKUnffrQCc
         +eRsSTRo0G39EYhec//cFIkSKgH45kTu+HapfHUFjEBte4rowHsXQowwgtaKEzrxpnkU
         MlEg==
X-Forwarded-Encrypted: i=1; AFNElJ8gkF2uY90YdHEfaAXUjGwJCeIAdwR3YhCu6q84T/mtLlxxnp14slRbJcdVf2n1oHcjyavUZyOaCVJS6YTp@lists.infradead.org
X-Gm-Message-State: AOJu0YxCxX9LoVPoO3DYKWzyf0pq9z5xLY7IgYtMvc5KO9jOBlSxC1w/
	kYvUeTJHkRS8d5NZWNnBVzebQishzXtnQlXOAWg+JXokdZOe8ySD6oc4OnQ7r5kOyaE=
X-Gm-Gg: Acq92OEfMnyAy4syDHtvkYUPuhZaZOK1Y/hEFyjAljw+vD54MhjgaXjtwR94qm/k6MQ
	VIJd8AngfOs9y7Gi/l85RiBL7z6m6Q9JpvOIx8b4JM3BaI0R9O4e7bFhqs1aKPSvmXWBmT7kPAn
	BxigT7GIPQSPvFGyVn6Cl8FwEk0qUdKNZuRScZ2Gy9vWRXB/+27W+MTUX13KOm5HXbGCotd+087
	YGByRIAVo17484STqRLhbZpGHbTVrYKN7A8XjXkAwVpRPvoWjEVMxQOCpxA02YqXJjOIuSa9+b+
	7APjHzKhavHsdoUWpbokpG6oLl1R26vROHyCQF7blCsyjU6SJn3slNRta7+FLHPAVIPKnFzJAuI
	R3XrzeAssRo02m0vOQlWdY+6VNRqjlKXTx+EllLABlLdufTUFMvgESrKTW/5dKEs+pzIkr3Mb/G
	cioUbIzKa6Qr8iT1EIpbtnELS7E38/Knfk
X-Received: by 2002:a5d:604b:0:b0:43d:69ff:6898 with SMTP id ffacd0b85a97d-460302e6f06mr31561787f8f.9.1781097113561;
        Wed, 10 Jun 2026 06:11:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f344558sm68667084f8f.18.2026.06.10.06.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:11:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: phucduc.bui@gmail.com,  sashiko-reviews@lists.linux.dev,
  neil.armstrong@linaro.org,  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
In-Reply-To: <20260610103210.2ACAC1F00893@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 10 Jun 2026 10:32:09
	+0000")
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
	<20260610103210.2ACAC1F00893@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 15:11:51 +0200
Message-ID: <1j33yufsko.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_061155_514334_17859C80 
X-CRM114-Status: GOOD (  30.47  )
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

On mer. 10 juin 2026 at 10:32, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] If `axg_tdm_formatter_attach()` fails to enable the formatter
> (e.g. when trying to catch up to an already running stream), it returns an
> error and skips `list_add_tail()`. However, the DAPM framework will log the
> error but still mark the widget as powered up. Later, during teardown or
> routing changes, DAPM will call `axg_tdm_formatter_dettach()`, which
> blindly executes `list_del(&formatter->list)`. Since the list head is
> zero-initialized by `devm_kzalloc` and was never added to the list,
> `list_del()` will dereference NULL pointers, causing a kernel crash.
> - [High] The return value of `axg_tdm_stream_start()` is completely ignored
> in `axg_tdm_iface_trigger()`. If the stream fails to start (for example,
> due to a failure in `axg_tdm_formatter_enable()`), `axg_tdm_stream_start()`
> correctly returns an error code. However, `axg_tdm_iface_trigger()` drops
> this error and unconditionally returns 0.
> --
>
> commit d9e23c7e7ade1061d83943c614a45fe952dec33d
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
>
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
>
>> diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
>> --- a/sound/soc/meson/axg-tdm-formatter.c
>> +++ b/sound/soc/meson/axg-tdm-formatter.c
>> @@ -157,20 +157,19 @@ static int axg_tdm_formatter_attach(struct axg_tdm_formatter *formatter)
>>  	struct axg_tdm_stream *ts = formatter->stream;
>>  	int ret = 0;
>>  
>> -	mutex_lock(&ts->lock);
>> +	guard(mutex)(&ts->lock);
>>  
>>  	/* Catch up if the stream is already running when we attach */
>>  	if (ts->ready) {
>>  		ret = axg_tdm_formatter_enable(formatter);
>>  		if (ret) {
>>  			pr_err("failed to enable formatter\n");
>> -			goto out;
>> +			return ret;
>>  		}
>>  	}
>>  
>>  	list_add_tail(&formatter->list, &ts->formatter_list);
>> -out:
>> -	mutex_unlock(&ts->lock);
>> +
>>  	return ret;
>>  }
>
> [Severity: High]
> This is a pre-existing issue, but if axg_tdm_formatter_enable() fails,
> this error path returns early and skips list_add_tail().

This is path the very few have tested since it only happens when
someone is playing around the routing kcontrol on a running
stream. Still it is supposed to work.

>
> If the DAPM framework logs the error but still marks the widget as powered
> up, it might later call axg_tdm_formatter_dettach() during teardown or
> routing changes.

Ok but the IF is important here.

A widget that failed PRE_PMU event should not receive a PRE_PMD one.
so it makes to unwind anything on error.

>
> Since axg_tdm_formatter_dettach() blindly executes:
>
>     scoped_guard(mutex, &ts->lock)
>         list_del(&formatter->list);
>
> Does this result in a NULL pointer dereference because the list head is
> zero-initialized and was never actually added to the list?
>
> [ ... ]
>> @@ -330,7 +328,7 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
>>  	struct axg_tdm_formatter *formatter;
>>  	int ret = 0;
>>  
>> -	mutex_lock(&ts->lock);
>> +	guard(mutex)(&ts->lock);
>>  	ts->ready = true;
>>  
>>  	/* Start all the formatters attached to the stream */
>> @@ -338,12 +336,10 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
>>  		ret = axg_tdm_formatter_enable(formatter);
>>  		if (ret) {
>>  			pr_err("failed to start tdm stream\n");
>> -			goto out;
>> +			return ret;
>>  		}
>>  	}
>>  
>> -out:
>> -	mutex_unlock(&ts->lock);
>>  	return ret;
>>  }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is it possible for the
> return value of axg_tdm_stream_start() to be lost?
>
> Looking at axg_tdm_iface_trigger() in sound/soc/meson/axg-tdm-interface.c:
>
>     switch (cmd) {
>     case SNDRV_PCM_TRIGGER_START:
>     case SNDRV_PCM_TRIGGER_RESUME:
>     case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>         axg_tdm_stream_start(ts);
>         break;
>
> If axg_tdm_stream_start() returns an error code here, the error isn't
> propagated back to ALSA. Does this mask the initialization failure and
> cause the framework to silently fail, leaving applications to hang while
> waiting for period elapsed events?

2 things here:

1) This is a DPCM backend so no "period elapsed events" here. This would
happen on the FIFO frontends

2) The return code is a grey area here. There could be multiple
formatters attached, this is mostly why the error code is ignored, so a
working backend would continue to operate if another fail. That's the
idea at least. 

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
