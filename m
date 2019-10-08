Return-Path: <SRS0=0688=YB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA80C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 07:48:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C00722053B
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 07:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3hdczUV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="njdKTP+w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C00722053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJ8Up96SVXUwZUssamgr6VQFYamhDTNNW/8Y8MHGfLw=; b=X3hdczUVJhyCpB
	igpFEpHPqEOIHIVGBM+GVdRa+h1ozShAJXQFtBz6GjR3z8Q/6hH0ddaoxFn3GQSy80rDy2e1GEVRc
	Tg31JumIkI9GrNU3PNj1TRNYXvj3eXG/LRH6QXm+chTwLuEekpsAdHVZTkYjujFLVWSUI28/y61gw
	Os/cGBieU1fzUfdiJvYaJpKbxnLdxEFFP3lv/F1Mrbzg10dnrNmr8eT7fogjcLmcEOH1Js7mm6fHF
	ZSw1w01AWyifabAJBgkrjh7vOgDRQWsOlDD60SwpmVNgXnoV+jlv235vxuHY/cakfbWJD7fW8DMKw
	CeD5r3fYLCjUfUKERRZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHkEX-0002nO-DD; Tue, 08 Oct 2019 07:48:37 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHkEU-0002mj-E2
 for linux-amlogic@lists.infradead.org; Tue, 08 Oct 2019 07:48:36 +0000
Received: by mail-wr1-x444.google.com with SMTP id w12so18149669wro.5
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2019 00:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QF+MCcIV1ioc5xu/kdZzoZqX+5uryu1YOTjuH3YAzmA=;
 b=njdKTP+whTSV+mcB9q7dhAIpZnAyy0fro9oO2CPh+rloMlvbWTMbB5cfxgC9GvyqhX
 ZRaqd/rimHnJ9Hew49gEUX2JBHi4fgw3XV/25BDbuCpvXGlqtmEiRB2kTpU1Tamqv7j8
 9oX2Tv+qq1s9z6DWN7aZSblW1b2nXs3PRNMkKOVuseLJv/flPlLugBC7EAn6ozKHwB1o
 Ix8lRe+ugvrmj2a/N/QF8iWB/uztDnCc+wCzs0hbs+WcSTIyHPT4uFw2izTsaVwxuHR4
 K424lMZRT6+Qw0ENTcU/X3pYg0gJqbmUJsVoAwH3trlCos26JfFdH3kF6gK4nsubd378
 ZZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QF+MCcIV1ioc5xu/kdZzoZqX+5uryu1YOTjuH3YAzmA=;
 b=GH3vmCQZUYcSJbztDqDGOJtDyL7/t0cXQhkbO7vwM9sLXeQahAr8mND1ucfjurU7cc
 rXDEUUssHBneux70KyUOYClpq08uqu1kbnaFQkZCeGEEshQygPUXMH4zPPwva4R/Pjw5
 bH/z5mqXMvpdiBv4ljBLEDfO+3o8EzPq5HJ/nPsMKtaN/j9Csa68np/0vj9VSfF1pt8L
 IEBIsDQBP0ufwJJPtGfdNJXBq2jGk/gHJgwhMz0czxA7zau5d3RPb34cAJWu1dasvRzl
 nwzu+qppKx3GHOZs7vP2IVLAHITeSnScXl9I+TfFpuC9GJbtd7UnWwMILRWhlWK8lxni
 xYhQ==
X-Gm-Message-State: APjAAAXqLDcZQn2Vw7VncqTyBqTDM1QD6h0lL49y2VzytqUkcomrc+Qu
 LP5tl9oubAZkNlziFgK9n77UdbnS/9GgAA==
X-Google-Smtp-Source: APXvYqwdRrGqQkg+5BHEgo4ci1/p+vaJqkBfzpIWnIhpQnIJ4SA4i83A298Sr3JG2hyf2fe352ZO0w==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr12464952wrv.2.1570520912500; 
 Tue, 08 Oct 2019 00:48:32 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o4sm36817536wre.91.2019.10.08.00.48.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 00:48:31 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Handle resetting on timeout better
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
References: <20191007125014.12595-1-steven.price@arm.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <769293a3-e244-a2a9-98fa-afdfd92c5cf4@baylibre.com>
Date: Tue, 8 Oct 2019 09:48:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007125014.12595-1-steven.price@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_004834_475418_7A92A24E 
X-CRM114-Status: GOOD (  21.87  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/10/2019 14:50, Steven Price wrote:
> Panfrost uses multiple schedulers (one for each slot, so 2 in reality),
> and on a timeout has to stop all the schedulers to safely perform a
> reset. However more than one scheduler can trigger a timeout at the same
> time. This race condition results in jobs being freed while they are
> still in use.
> 
> When stopping other slots use cancel_delayed_work_sync() to ensure that
> any timeout started for that slot has completed. Also use
> mutex_trylock() to obtain reset_lock. This means that only one thread
> attempts the reset, the other threads will simply complete without doing
> anything (the first thread will wait for this in the call to
> cancel_delayed_work_sync()).
> 
> While we're here and since the function is already dependent on
> sched_job not being NULL, let's remove the unnecessary checks, along
> with a commented out call to panfrost_core_dump() which has never
> existed in mainline.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> This is a tidied up version of the patch orginally posted here:
> http://lkml.kernel.org/r/26ae2a4d-8df1-e8db-3060-41638ed63e2a%40arm.com
> 
>  drivers/gpu/drm/panfrost/panfrost_job.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index a58551668d9a..dcc9a7603685 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -381,13 +381,19 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
>  		job_read(pfdev, JS_TAIL_LO(js)),
>  		sched_job);
>  
> -	mutex_lock(&pfdev->reset_lock);
> +	if (!mutex_trylock(&pfdev->reset_lock))
> +		return;
>  
> -	for (i = 0; i < NUM_JOB_SLOTS; i++)
> -		drm_sched_stop(&pfdev->js->queue[i].sched, sched_job);
> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +		struct drm_gpu_scheduler *sched = &pfdev->js->queue[i].sched;
> +
> +		drm_sched_stop(sched, sched_job);
> +		if (js != i)
> +			/* Ensure any timeouts on other slots have finished */
> +			cancel_delayed_work_sync(&sched->work_tdr);
> +	}
>  
> -	if (sched_job)
> -		drm_sched_increase_karma(sched_job);
> +	drm_sched_increase_karma(sched_job);
>  
>  	spin_lock_irqsave(&pfdev->js->job_lock, flags);
>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> @@ -398,7 +404,6 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
>  	}
>  	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
>  
> -	/* panfrost_core_dump(pfdev); */
>  
>  	panfrost_devfreq_record_transition(pfdev, js);
>  	panfrost_device_reset(pfdev);
> 

It ran successfully 10 dEQP tests without crashing the Amlogic S912 with Mali T820:
Tested-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
