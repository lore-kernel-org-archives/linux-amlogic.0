Return-Path: <SRS0=naQK=AN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BA1C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 15:11:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AE12206B7
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 15:11:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IK2CWKzm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jt8Etg9o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AE12206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=msumPNb5lOjHSRo6AC9ewipO5o87XjBJj10tHXXmDU0=; b=IK2CWKzmWD4V06cdjFv8+Q6ct
	dfrTg0IxEAnVmsUQHCgX8QxHEdx7qSECrZYiTA9oKmQ9UNhalnO76dgRE7cZ0To++sfEBfr9r+ZnL
	JZ6pk1he3hWfTtWzDtyNAzR4ikdPNvBoFZvK8c3ZmpMnZqwtiN9cYdPsRLbJPkso9JmG01R88lA8e
	i6u1ttaxqYd9yxA8JUlYYPO1rZNtDz1rZ2U/OZs/0IcAXTHdkXYiEBzYzRot3YHfmq15meygazXT2
	y6p0lNTtKSo1QCs3gdJK2q1dWhAb2cKYVO7gOY2JE3fV8sw3FPr25wVOGTHOnkFiGN6OMihlFg5ax
	KPWdNrfzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr0sH-00029d-DE; Thu, 02 Jul 2020 15:11:41 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr0s3-00024L-UE
 for linux-amlogic@lists.infradead.org; Thu, 02 Jul 2020 15:11:39 +0000
Received: by mail-wr1-x444.google.com with SMTP id r12so28879864wrj.13
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2020 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DBWhACDKwhiMcSq12rSb/6pR9WWhOz55a8SkJngOw2k=;
 b=jt8Etg9oo0YuoQAa8gYyRw5JsYFJzlskk6y5e+OuG1GhqXJZo8nA5/S14BeeQ/tZJT
 A4e4ty60subeGSQ0+r8i9wVLVb8L5Kwvgm4EfX4tPK7JM9FjhqdxIVURKF7IeOQRob2i
 NJLFloQHpHTVwiizOES5bjBZJsx0oF18SfY+DzsfSvV+dgggAej1lXmgGZZ3onAsmmBV
 9+kd/dlKnj96wDT8r/MOzYd7WAmKMRpQjQf4OGOav3ScYGFiATjrBw0vb/Xz0i5WLD6Z
 w+GwMYO5qntjJ/o6BXeEhTlckcAs+bBeacYTUa9Ic7GTu1/w1u1QlJVxZ89PxLPoypN9
 0ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DBWhACDKwhiMcSq12rSb/6pR9WWhOz55a8SkJngOw2k=;
 b=j47JB3ChX28Ny0tZcmwlV9pij78ySEe0P0WL69h3rEzkrCVmtMFrzBxkMQ7KnCcScb
 vfQ3SShYviMEK3WEzoWOV09/7sb5xf07jIW37ApWQsX+OQlmrjhNBjiLDwx3Td9OOLRJ
 BP11wxWBKx0uw2vqoKFLC0bgNXnmYcxXletPqckhSopQGBd4p2oFeXWFFu3lYdf/IAmS
 xe1PqZbvuYf8NjVCwJgbSKbW7l+GXql3bqlKJ+TU/5klvvmb69bRAaEUQ1x3xh1Q2tVL
 ABiMXUkpZtj0uKAR4oSv+Tu9X3e4kU363A5CrpCgBhkDRNbsTbZm+v1aTnFFR/nqaj1s
 bO5w==
X-Gm-Message-State: AOAM531mwv1SzeCpvoceVZiF/Kh+iNTZvdxn1lUIWhhZr/E/eh+Az1y4
 J9lHQtO5lctvxV70bmE6D0fQJw==
X-Google-Smtp-Source: ABdhPJwTWa999NDGp4TVG9u+j+V7T/4dGcct7H0GFFf8YnI8CbpzrH6elcaklm99m5yDJEbBqHDqtA==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr29071427wrs.306.1593702686749; 
 Thu, 02 Jul 2020 08:11:26 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g13sm11740482wro.84.2020.07.02.08.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 08:11:25 -0700 (PDT)
Subject: Re: [PATCH v8 1/6] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200702074759.32356-1-narmstrong@baylibre.com>
 <20200702074759.32356-2-narmstrong@baylibre.com>
 <8cBfZpkc4pHBLhihlvJMD_Hq1DEsNRcSY4Y8JaGwklMWcxiYzUMVEx7wH9f_DuCBMVUhXvOR0PcHVslILtKI2wdw79Nfih0N3VnrxfMQd08=@emersion.fr>
 <20200702131834.GZ3278063@phenom.ffwll.local>
 <044964ad-b927-57d7-9361-beda5c8d99a8@baylibre.com>
 <CAKMK7uHa4ajC5_SA_fFUhB-Amxcbt7T9UZ+pvRhqDeUeX9Ez6A@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <190ac909-c78b-81e0-35a1-353cd24e9f44@baylibre.com>
Date: Thu, 2 Jul 2020 17:11:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHa4ajC5_SA_fFUhB-Amxcbt7T9UZ+pvRhqDeUeX9Ez6A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_111128_219515_93BFE9A9 
X-CRM114-Status: GOOD (  19.15  )
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
Cc: "jianxin.pan@amlogic.com" <jianxin.pan@amlogic.com>,
 Simon Ser <contact@emersion.fr>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 02/07/2020 16:15, Daniel Vetter wrote:
> On Thu, Jul 2, 2020 at 3:34 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> On 02/07/2020 15:18, Daniel Vetter wrote:
>>> On Thu, Jul 02, 2020 at 09:23:11AM +0000, Simon Ser wrote:
>>>> On Thursday, July 2, 2020 9:47 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>
>>>>> Finally is also adds the Scatter Memory layout, meaning the header contains IOMMU
>>>>> references to the compressed frames content to optimize memory access
>>>>> and layout.
>>>>>
>>>>> In this mode, only the header memory address is needed, thus the content
>>>>> memory organization is tied to the current producer execution and cannot
>>>>> be saved/dumped neither transferrable between Amlogic SoCs supporting this
>>>>> modifier.
>>>>
>>>> Still not sure how to handle this one, since this breaks fundamental
>>>> assumptions about modifiers.
>>>
>>> I wonder whether we should require special allocations for these, and then
>>> just outright reject mmap on these buffers. mmap on dma-buf isn't a
>>> required feature.
>>
>> Yes, it's the plan to reject mmap on these buffers, but it can't be explained
>> in the modifiers description and it's a requirement of the producer, not the
>> consumer.
> 
> Hm I think worth to add that as a note to the modifier. Just to make
> sure. And avoids questions like the one from Simon.

Something like:

 /*
  * Amlogic FBC Scatter Memory layout
  *
  * Indicates the header contains IOMMU references to the compressed
  * frames content to optimize memory access and layout.
  *
  * In this mode, only the header memory address is needed, thus the
  * content memory organization is tied to the current producer
  * execution and cannot be saved/dumped neither transferrable between
  * Amlogic SoCs supporting this modifier.
+ *
+ * Due to the nature of the layout, these buffers are not expected to
+ * be accessible by the user-space clients but only accessible by the
+ * hardware producers and consumers.
+ *
+ * The user-space clients should expect a failure while trying to mmap
+ * the DMA-BUF handle returned by the producer.
  */

Thanks,
Neil

> -Daniel
> 
>>
>>>
>>> That would make sure that userspace cannot look at them.
>>>
>>> Also I'm kinda suspecting that there's not unlimited amounts of this magic
>>> invisible storage available anyway.
>>> -Daniel
>>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
