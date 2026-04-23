Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB05F9936C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2026 11:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8UyDQChEDk3puG2MNpjKr4MzXVqbYkUpMGbwJXS1nzI=; b=3oqTeyXKtaXrI5
	kV+8mvspKZYYCtrWP0P+J7PL8LwbWv22FymP4IumJtzXw4S4qJy8cLUx2TUemSdtdAYlehS7hrhht
	QydiwIgTw/tnQWDZehE/dmot7ltsEdJ2veqZnfNtXOBEUQJ0gElYSdTa2Px7Q069ZvWObQXYgG6pX
	VSfzEvoTEOuR/qmcAMlzyrTy6K6yoKRvjaZP6a6k/gtodFi4qNhe/y7Htij/48GLWZcwXBAIABFAK
	k5TNeGyVIwVpPD7GbzHW6VM076Tw4M3LQkln2nJnrBdwVBNzqIn6eyNJ7JIv+Fb36vVBnvZ50Cw9J
	1+iGyVWj2XwD9K1ZKqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFroR-0000000BVvq-0j67;
	Thu, 23 Apr 2026 11:01:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFroL-0000000BVvQ-2qII
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Apr 2026 11:01:38 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so62610825e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776942091; x=1777546891; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3XEbKDid+VhvsDtW6S8EWHqlxVF/e4KkyBs7jXbUELY=;
        b=xv17r6v7VMmiqklU3btQE3msiYyDcWOOB0e0ru7DSa0TjDAovTuePH8BH/dpKQwgCs
         KQ6YrWDgpS02n8z5FeS80jaUD+vD150HmHCOc28vdn86UeGU/cxvfkrXDCMCVmiZEufE
         4/h1COqwCPpwJlgLyk2eC3ldefh9Q4O/4ARIz450skOh4881Jc3+ox7Hk0UF3NzdBRo1
         7zDzx5TWIX6cxcH/9nMOLdbOSQahoKFx5MOv+YW0MgSD2qMFD9xF8gkLB5QGTqZfjy64
         0srFsOFA74Fv+8KyzvfO6ufolgEBVTAssxlK1z59hUTowgK5UOj05BA7Fh/Ie9EXAELf
         +YhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776942091; x=1777546891;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3XEbKDid+VhvsDtW6S8EWHqlxVF/e4KkyBs7jXbUELY=;
        b=H0rzNXu52Y+/ka+Wq9QmSeCu/1RDV0eJvVvAUZolO5k4tjWHCpKpfd+vSxyNgrWDS3
         ULfPhAybtVEonKkukMTEwIqX5/R7iZRuUDD4nA19hW+TFJGqVcwXNWnEVKg4xLfP/+I6
         R9sZqe/v8JkWJ08aTnbZX5wKI8FWPZ7GEL8oXCif1QT5stQVG+GQnG3OrLJMFoBJ1Wpy
         vwoHdx5LveEwfnKsroboGUiFCWU3sleHX4lmTzxxBUas/O+LbL06jwU2GCoiVwsA7nQ1
         kSIb5IdmXUzy3PKe6BvNOiVblB+aAgRld+6CRKIBYDox7CET/h6gFWwFYOYSLlFOPGsn
         l2zQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IJOvpd6m8rMublfhFxgofRRTvEYAxouxREAJG5iFYuLcNDBcIxcRs3FZvL/Fc3KIXfcRsJyO2FSWoiz/d@lists.infradead.org
X-Gm-Message-State: AOJu0YxPJRuWsDruy5/wa8Ri0N299V5+FUmU6vATJWBlH+CJx2oukKu3
	4B0QrJ60suU1FnwUodMygLGM2EqegJkEBZJ5aZOkupDKAhAZPaB0q9GGyXfFLI1X6Rs=
X-Gm-Gg: AeBDietGaqmx7ktqeEPJTCreguHv04izzs9Y4CrUXuWE6kzPTBQAiWn+bu6yPbGVWCj
	M57TPGy6GZ6LoqOP/nXcNEhxLdCvKUk9QVSUF3HJiDITjxTnNHFzrVC+Zvtu9C9aKmC+5fh3fda
	g7xmn/gYGt492FLYYClxnATng1m+ybw44hxgXqDLH+YJI31pULuVqOKCMQWMoGmd8qfIMpZBcXv
	GyUtkkf0LGUHeM74GN9lcOGyzRh5DDb9FRh9mMt+ukakyhndaGnQHJ16FmD9PgKT9g3XR+nC3k4
	/aKfWpOFhbuPyOI6GZtoJbrQtBUrJOct58qvujos9BG4xUMk5GbeG1d1M0PKejdj5mX5mr7sUTk
	IJO9sD/JdGrrAM9CiQ98AFG+aHBdTf3sIaAroUu5p+7fqIDex3KZ8bGAjT38Y3UCGU5W0rkQD8P
	0+swye9cXS3ghtTgYb24m+19MfFYWElpXE
X-Received: by 2002:a05:600c:5295:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-488fb77facemr378270735e9.21.1776942091214;
        Thu, 23 Apr 2026 04:01:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fd46:86fc:6cfc:870b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-489201cde98sm271979975e9.7.2026.04.23.04.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:01:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Valerio Setti <vsetti@baylibre.com>,  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RFC v2 05/11] ASoC: dt-bindings: amlogic: add schema for
 audin-formatter and audin-toddr
In-Reply-To: <57fedac6-cf3a-4a93-a4a9-9746dcbeaeb4@kernel.org> (Krzysztof
	Kozlowski's message of "Thu, 23 Apr 2026 11:42:21 +0200")
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
	<20260411-audin-rfc-v2-5-4c8a6ec5fcab@baylibre.com>
	<7d4ec08c-a67c-434c-a1cd-c3ef5b7e3336@kernel.org>
	<71d2d8ab-21e2-4800-ad54-ba40ef2e136a@baylibre.com>
	<57fedac6-cf3a-4a93-a4a9-9746dcbeaeb4@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 23 Apr 2026 13:01:29 +0200
Message-ID: <1j8qaerldi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_040133_862394_31EDF2BC 
X-CRM114-Status: GOOD (  33.70  )
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

On jeu. 23 avril 2026 at 11:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 16/04/2026 23:51, Valerio Setti wrote:
>> Hi,
>> 
>> thanks for your review and the feedbacks.
>> 
>>>> +examples:
>>>> +  - |
>>>> +    audio-controller@a040 {
>>>> +      compatible = "amlogic,meson-gxbb-audin-decoder-i2s",
>>>> +                   "amlogic,meson-gx-audin-decoder-i2s";
>>>> +      #sound-dai-cells = <0>;
>>>> +      sound-name-prefix = "AUDIN I2S Decoder";
>>>> +      reg = <0xa040 0x4>;
>>>
>>> One register-wide block? I have doubts this is a separate device
>> 
>> I understand that this might look as weird configuration, so please let 
>> me explain what's going on here.
>> 
>> In this SoC the audio part is split into 2 blocks: AIU for the audio 
>> output (already supported in the kernel) and AUDIN for the input (which 
>> is what I'm trying to add with this patch series). Unfortunately from 
>> the clock management point of view the two of them are not indipendent 
>> and interface clocks are in AIU register range. Moreover the two systems 
>
> Two devices of one-register-interface having mixed clock management is a
> CLEAR sign these are one device.

That's clear sign they belong to the same subsystem, nodoby has hidden
the fact there is a subsystem called "audin", which provide a collection
of devices.

>
>> are not in a continguous memory range, so creating a single audio 
>> component that implements both is not feasible (unless we want to add 
>> some dirty tricks with multiple regmaps, etc).
>
> OK, but then what is between these? Again, register ranges ARE NOT
> 4-bytes wide on a SoC. On several SoCs they are aligned per page or
> 0x1000 or more. I have no clue how it is here, but 4 bytes is just plain
> warning sign.

On several SoC, more than 0x1000 ?? This is quite an arbitrary limit you are
setting here. There is vast number of valid devices in the linux kernel or
the bindings than have way less registers than that. We even have
devices with no register at all.

I agree that SoC buses are usually at least that long, those are a
class of devices, that is certainly not the case for *all* devices.

A device is something that has defined inputs, outputs and function
and that can possibly be replicated for more instances.

>
>> This is where the AXG design comes into play: we use the backend DAI 
>> provided from AIU for both playback and capture and then we attach 
>> formatters (i.e. the audin-decoder-i2s we're discussing about) to 
>> properly format the data.
>> This explains why this is a relatively simple device with very few (1) 
>> register. To be noted that for example also similar component on the AXG 
>> platform (axg-tdmin.c) claims to have a larger register range, but in 
>> fact is almost entirely using the 1st register with only 2 occurences 
>> for the 2nd and 3rd. IMHO this is not that different from what I'm 
>> trying to achieve in this series for the GX platform.
>> Also looking at the implementation of "audin-decoder-i2s.c", even though 
>> it uses a single register, it really provides functionalities i.e. it's 
>> not a useless device and it can also be expanded in the future to 
>> support 24-bit sample format.
>
> I understand it is not useless. I claim this is writing bindings per
> driver. I claim this is not a correct representation of hardware,
> because hardware is not a device with 4 bytes of address space.

This has nothing to do with driver consideration but proper abstraction
of the HW tends to produce cleaner architecture, yes.

>
>> 
>> Then the question might be: why not merging this together with 
>> audin-fifo? Becuase these are 3 indipendent instances from the interface 
>> and each of which can receive data from the interface. Each of them has 
>> its own registers range (and optionally also an interrupt - which is not 
>
> 4 bytes is not "registers range". It is one register of someone else's
> range.

Yes, exactly like the AXG family which had an "audio bus" with reg and
ranges property of length 0x2000, like you are describing, and a
collection of smaller devices with very specific and targeted functions,
using the range in question.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-axg.dtsi?h=v6.8#n1317

The registers length of devices in this examples are in then 0x10 to
0x40 length. I honestly do not see the fundamental difference between 1
and 10 regs to define what is a device and what is not.

>
>
> Best regards,
> Krzysztof
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
