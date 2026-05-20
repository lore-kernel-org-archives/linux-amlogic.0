Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DED5CD4F3D
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 15:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzfbTPWtCUxqfS5PDY4Sf6wcKvWXbY71P4JSsFSWC/g=; b=vgHpIa/jfeR2TJ
	imMf6eQyk32WaVfqCeUugkq0A1r0Gha+iQfI2PhYNTclUAaRSSp52ggvn8wkiMu8PL4quXoqdORfA
	0PPAv9tUlu5X5kXoc8OZScPiyXc7URWQspixW99GQ5N1DMSVecgyis/uPfJPYa6mjG95janRjTPdS
	68i6Txo/HMcW8LxQLJxVxUvtp/J1ny2bLWi7bUgr4oSmH6JX9QH7srbzby2O6uUAUiwQ2f1GGBXUs
	ofOCMSKZlTQNllsQ12LPOWX5obx70R1VHDeqXE8KjYtyeQMsWN8zrJAm927wLXGZciQXvtFez87h8
	QHdP8nhP0qfLfYnHFjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5hU-00000008PGh-2bk0;
	Thu, 21 May 2026 15:52:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5hR-00000008PFa-13rg
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 15:52:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49039a8851fso8994175e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2026 08:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779378759; x=1779983559; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0fd59xd2Em+FBe64KRflWpdgg6Qr9ICe9rTkp6Iams=;
        b=CA/mJ3JjKbf+tV8aJANOjCub2s2PgnFNY2S+KQfCYP/qKL6S1yl3rj6j7Vb9lH6781
         KK18pZ6Stra7WooKcArRM8jxy1xQp2juVWGd3gasx3z7ZrAth2ACV9uoDe3paGJKYEq6
         JvxCwH4pR06stySoiCOfvwu32bUnWl8HmVGSXBZ87aKE1SAhbbgvYYVMYL0me17ssdG1
         kCCkIeSw0aKgZHnomBNXWkeQ/MIWyD6GOPECFw0T45uq/IxkfT7Zq4OMc11xF8vCcKNV
         UKVgTozPTOSURX897CVP+2q2ePr3snGB79RSZDzBrcH0cuGQE/cWW9t0dGOAFgDCi7yI
         jiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378759; x=1779983559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0fd59xd2Em+FBe64KRflWpdgg6Qr9ICe9rTkp6Iams=;
        b=QrpcEV30RqOE1AfA+/9DkB3sXt0mnOURgrfKE/fTsYZLLGy9fzxcK3SB1SoLsgIgbQ
         FgJiYKBS4Mkl3q+XmPAk2KJpaai2fZ80G8xNqh8GGzu6X+rvjyHcHYBiEtuKv1/R9s7n
         rBoHdIO08F3YnLJbVrVem1TnrprvalLa2YHhTbZjbC9gixRYkbm0SqcKPVZURPyGfgg7
         tR+33iwaIsD7MwPwgHwXip3Tx9s3OqPkHYVibyp3zsv0A/HpecGEV5Vos4nrup/qdgDR
         JHnLxmfmDW3gw0mq4wynmiDQcPnjFugpLBapj2Ai3DNsULT0B9gLavrtOr5YJAHgbr5I
         xJMg==
X-Gm-Message-State: AOJu0Yy8tktpHbMvwvtXOlPcBqDXtOAoJvZmHBB2Kc+JmuXRCTir8UuP
	BU1YV7u0qCBWyvmhcOZvZ6yviYhyz1e1MgExziYriduELHjFpskZJ2kFBBzkZMVpzEE=
X-Gm-Gg: Acq92OH3EMxd4vebz52MG284L9eP58l1YXSAciioxidzyBdWEkg6sj05S4JzvN5ZzVt
	FDZZjL+aGW9Fqp3fH5ZwkaWv4C5zepHxHSBKlnD6XESMDmZmDVd3/OaXf2T0IGkyQoFD7E0rIJf
	t0I3pNsNoYTjy/q1d6T2mYmuj6FtiwcSACmvbyWRv6brrLjRWuRY64Z7FFla/HDbpg2YyVq7Dd1
	fCQaIxt3RvfohWDbXZNONAkYxql5VF0B8LeqorvoedcrPGAfy2tkkuXDPyttXXr+Zah0CTMN0Bs
	INctbTrv7/prUIEZ7HMFDvIrRqv7dB5WGNsHuSu1dsiJYqtBV+j4ApVMqDV/7mV+CViLWva0iWS
	J5p3XHNLbtkrqEtmuf+S+/33isktEtixeN8wHNswuxAG/Hv9vNKvp2gL34RYRZKB5ftCxsJIqA9
	smVY5PQaOLRxYDQdXhOsvJhEzquw==
X-Received: by 2002:a05:600c:4e87:b0:490:3b87:be0f with SMTP id 5b1f17b1804b1-4903b87bf47mr35860365e9.23.1779378758957;
        Thu, 21 May 2026 08:52:38 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c99cb43sm34383775e9.4.2026.05.21.08.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 08:52:38 -0700 (PDT)
Message-ID: <a2306afb-eacf-4132-9cd2-ef1bde8cd0a3@baylibre.com>
Date: Wed, 20 May 2026 18:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: meson: gx: add gx-formatter and gx-interface
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
References: <20260515-reshape-aiu-as-axg-v1-1-53b457784ff3@baylibre.com>
 <20260515153651.965F8C2BCB7@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260515153651.965F8C2BCB7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_085241_590352_F807C658 
X-CRM114-Status: GOOD (  13.80  )
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


> 
>> +int gx_stream_start(struct gx_stream *ts)
>> +{
>> +	struct gx_formatter *formatter;
>> +	int ret = 0;
>> +
>> +	mutex_lock(&ts->lock);
>> +
>> +	/* Start all the formatters attached to the stream */
>> +	list_for_each_entry(formatter, &ts->formatter_list, list) {
>> +		ret = gx_formatter_enable(formatter);
>> +		if (ret) {
>> +			pr_err("failed to start tdm stream\n");
>> +			goto out;
> 
> Do we need to disable the formatters that were already successfully enabled
> in previous iterations of this loop before returning?
> 
> The ALSA core does not automatically invoke the STOP trigger when a START
> trigger fails. Returning an error here without rolling back the earlier
> formatters could leave the hardware clocks and registers permanently enabled,
> resulting in leaked resources.
> 

I don't mind adding this check, but I have a question for reviewers for 
sake of knowledge.
I just checked and it seemes to me that actually when 
"soc_pcm_trigger()" fails to SNDRV_PCM_TRIGGER_START it rolls back to 
SNDRV_PCM_TRIGGER_STOP. Sure I'm missing something that Sashiko found, 
but I cannot figure out what. Any help on this?

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
