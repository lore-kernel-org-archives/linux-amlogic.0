Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E5BFDEE27
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2026 16:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8a5WAIYz0tVhHprHQDVu13HhVerqQqjel1wj/B8HXRE=; b=Hc8H/2xgKJDvPh
	VotsZEXxpdlz/BZPK+5Z5yE8jUJGXSOIZYdwYhuJHha3bWz300QnulQ79Qz4obWdkofYTjSQ5k8jo
	8bc9Mpf9+0/IDhgW17eHEZ8VQFpsjWc+njxuJehGUREodyYR4x+aKjUSL+zPLVFyn2kucGLyuAyCP
	CSjEYHNu8lLQ/F1rzYL9MgvHxBjyUaF8CSboCZGpY3yZUqhF3LWnRzjWFtjexPSa1V/etFLXPF1+w
	e+RdmsPWaX+0U5RNwzz7HWmSn2ZsRFmLHXTzZ2Oz4t8UaSVpOtu44Eq2KtLMGm//tL6H/tOMHMDPm
	X5Mb2pCaz4VDJO0jaeDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFx0M-0000000ByLB-43s8;
	Thu, 23 Apr 2026 16:34:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFx0J-0000000ByKF-1WbZ
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Apr 2026 16:34:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso49704755e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 09:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776962053; x=1777566853; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCxF1tnHPF+l0IJcYbvi9JKm3Wp/kM6jg4D7Flri0tM=;
        b=I+ajsO14YztlWC1SoWS2IC3qkC3NJGk8gPOXWx3crVNx3Nlu9OXd6FPcMOacQ8SWla
         sAhavjg503+v8e5l+fLyQ00MrQrXzp+JJjlcDDzpUmbFxIucQrRF/F8JyZMKk5n+Z4Mz
         mHboCkfMtOeGI+BbOSy8VGkKCh0kLmTqzTo81T4XJfvOl3fJonbhpZg2EyXgQXsfWtoe
         wXrtB6eZlb4eyQKF9fnQPccjyemaK0tLlWK99Oc6LwbhVId4qU2oRSdU0Oe+DKo5ZDrf
         1tQCT4odZCcfZSCDMQMNE0w+QZSrRhcGSTLteqB+jxa6+0F2RLtOIfIekL2/UZymGCGP
         jX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776962053; x=1777566853;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCxF1tnHPF+l0IJcYbvi9JKm3Wp/kM6jg4D7Flri0tM=;
        b=fuo3EtOISLx8H+RfSQibPbEGANDpUmpPjgnMivoCk2IiVlme6mRMJ3o0Eet3Ggtwzf
         DmiIIbg25FyjMrV1LNEptrVrKsZp+vC2628M2fI04lzW+cjoOqNJ0YJB2nNLqXFtxYSj
         6SjwrHyA0fDyhPI24HcHQz5p5eFCEJBCrqDiDdo6v0mJIYZ6AuAM7JrAtyjycFW6qdKq
         YQOPXKhHSjw+FCK0qMZToFv1lTht0rzwTYU1mAF3UzfIyiFr59fHX6rpXw4zYe1L4vf7
         /Al36fc9Vz/lEsvTnGX4JcHYWLgxwlBUsRz+5d0ZPDcNUOAS/vJyWr9sxryuOhjC/byY
         I2mg==
X-Gm-Message-State: AOJu0YyFL0PANl3+v3qS40zAqryok1pwTfX+DHcmVcGEUN9Tp1EHYlNZ
	HIJB2rcHfko8RKP7Nxpp8le6UFxJRQJQy8MmgdJrkDphbLKtWIfPZC8BSnlcKpjjXLISgfbymkV
	AO22y
X-Gm-Gg: AeBDiev8z7Es/eHnZJYKoE5Z7f5XdyO8g4z8PASpmgcykYd7vvCgPXc3KhTKMIKf/lJ
	fYQzIE8rzLe6+xdq1eOvOOawkAlKYAVZGGhtonGm7i5usUnsYFoI+M8kOGc+zF/ZJfe+Sj2DVP5
	JnAnn2/xZE9lxv+1ExhH2C4n/xxCM59UqzaFsBJUUha8NBB0v7DjhyrKzPdJcwChRXmfJV1Juxr
	jeoBjSoQAuBGv7/B4/TqUgnKFmD6kJciLy4CIkb4JBvA69vZk3xIH2Y2XGZw4L9SUUg8Bxb+/jT
	PlMFRa/Mj+77Bos9PnCm/4LWwAqw6h9/4xMY8XN8S46KP2Mybq4YB2N8KfpmWBl9mFQ9LvFx2VE
	mkrpbgAPb6awg1A0JHvj2Tw88x+SdrmwmkJnb3P8c9FAdRVw1x80p8lcOSxCj/F67cXAOiJ5hdn
	yx11qF6+Lgy9pC81woUWkVLeyJexcihvy/wJ3d
X-Received: by 2002:a05:600c:a30a:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48a581c113cmr122795605e9.10.1776962052713;
        Thu, 23 Apr 2026 09:34:12 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55dc9f58sm465548275e9.6.2026.04.23.09.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 09:34:12 -0700 (PDT)
Message-ID: <7fd88ec7-2ac0-454c-868b-cd1eca1fbe99@baylibre.com>
Date: Thu, 23 Apr 2026 18:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 05/11] ASoC: dt-bindings: amlogic: add schema for
 audin-formatter and audin-toddr
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
 <20260411-audin-rfc-v2-5-4c8a6ec5fcab@baylibre.com>
 <7d4ec08c-a67c-434c-a1cd-c3ef5b7e3336@kernel.org>
 <71d2d8ab-21e2-4800-ad54-ba40ef2e136a@baylibre.com>
 <57fedac6-cf3a-4a93-a4a9-9746dcbeaeb4@kernel.org>
 <1j8qaerldi.fsf@starbuckisacylon.baylibre.com>
 <b556ad94-373d-4a1c-83e6-055cfd3d9557@kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <b556ad94-373d-4a1c-83e6-055cfd3d9557@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_093415_674126_71D8685C 
X-CRM114-Status: GOOD (  19.59  )
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

On 4/23/26 15:17, Krzysztof Kozlowski wrote:

>>>> Then the question might be: why not merging this together with
>>>> audin-fifo? Becuase these are 3 indipendent instances from the interface
>>>> and each of which can receive data from the interface. Each of them has
>>>> its own registers range (and optionally also an interrupt - which is not
>>>
>>> 4 bytes is not "registers range". It is one register of someone else's
>>> range.
>>
>> Yes, exactly like the AXG family which had an "audio bus" with reg and
>> ranges property of length 0x2000, like you are describing, and a
>> collection of smaller devices with very specific and targeted functions,
>> using the range in question.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-axg.dtsi?h=v6.8#n1317
>>
>> The registers length of devices in this examples are in then 0x10 to
>> 0x40 length. I honestly do not see the fundamental difference between 1
>> and 10 regs to define what is a device and what is not.
> 
> And that example above is probably also not right if you only looked at
> register range, but the difference is that you have distinctive other
> resource - clocks.
> 
> And just to remind the old antipattern - each clock is also a "separate"
> device and there is even old SoC architecture which did it. One clock
> per device node. Since some years this is not allowed.
> 
> This device has no other distinctive resources. Only 4 bytes wide IO
> range. So let me a bit clarify my previous statements:
>
> A device having only one resource - four bytes MMIO range - and nothing
> else, and being tightly coupled with other devices, almost certainly is
> not separate enough to be called a separate device node.

Wait, I re-checked the manual of this SoC and I realized that I missed a 
reset line for this formatter device. Sorry for that.
Also I was probably too conservative for the MMIO range because I 
limited it to cover only the features that I'm using in the driver. 
However I can extend it further to cover all formatting related 
registers: they are not used for now in the driver but they might be in 
the future.
This should overcome the above mentioned limitations and qualify the 
formatter as a standalone device, right?

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
