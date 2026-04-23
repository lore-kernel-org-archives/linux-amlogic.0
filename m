Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC18FF9935A
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2026 09:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQvHcmG+5B+JyrChpTJL9dFS5Oh8bzzI+MDwCuipq6U=; b=jzH/5BOVh9uqWn
	HAg4jeh1rzpR3cgSy65k55LcZe/BBxhxQgEjC443TGJdyYG892f6Kwm9wyJ2/klr9/TE1PRPheM9l
	bsAak0YTIl9f1+IGVdGUy6KLCXp/rOgc1/cd99CCMYS/RyVM+2XQE/6w5z1ItB1wrx4IbFUX8kvaJ
	E5wvFQQD2vuJrRq7plM1/IGGe3ln/7UyUiZQ8jn1bWhqGU9qDFhpBZiMYXoWZDulcjAqflvNz22PW
	3lbe88TDHu2ibl5jGewqU9QuKh6j10C7CqyjU+W+kYN2QOznos4s52CC4vLYI5F8CimfGkXh++HOx
	Tg0VUPAh6RsFE/x26c5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqZm-0000000BPYn-0m02;
	Thu, 23 Apr 2026 09:42:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqZl-0000000BPYX-0Ekh
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Apr 2026 09:42:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 424DC600AE;
	Thu, 23 Apr 2026 09:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36177C2BCAF;
	Thu, 23 Apr 2026 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776937344;
	bh=76X5tEnwODsA5GAy5LEpVlWzJ8DzVKVuT3eaE1uJCoU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=dz+/FFrvsnEeUSer+sgQduz2CdL9tgeQien9tab0mH5QpbluHqf2GfglHy8I9kx3q
	 XM1MoSiWuTgwYZjA2NKCTAr+7xfEpGjis8JqtTMpd9oj8iwTt2dhuqGWOR7Tu2rcc9
	 2jkmXgXSP2KCB1irSWIAYdvH3UXp4R/WwAiP+DA2LAe/Ts0/01KIzQ6ckAhZ/W9q03
	 R1ir4b2Wsm4gILkjJhr1wIEVZmcDKGEgMwRhdjg+xB/w2HxpSdu36hEUyz1mha9856
	 d3K9dbGkHalt0Rxa2yHTq4Q5y88gbAOG+xP62+ytvUAWnC6zkVinP2kzdIKYd4ulrd
	 KL4uHw6PMPJDg==
Message-ID: <57fedac6-cf3a-4a93-a4a9-9746dcbeaeb4@kernel.org>
Date: Thu, 23 Apr 2026 11:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 05/11] ASoC: dt-bindings: amlogic: add schema for
 audin-formatter and audin-toddr
To: Valerio Setti <vsetti@baylibre.com>, linux-amlogic@lists.infradead.org
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
 <20260411-audin-rfc-v2-5-4c8a6ec5fcab@baylibre.com>
 <7d4ec08c-a67c-434c-a1cd-c3ef5b7e3336@kernel.org>
 <71d2d8ab-21e2-4800-ad54-ba40ef2e136a@baylibre.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <71d2d8ab-21e2-4800-ad54-ba40ef2e136a@baylibre.com>
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

On 16/04/2026 23:51, Valerio Setti wrote:
> Hi,
> 
> thanks for your review and the feedbacks.
> 
>>> +examples:
>>> +  - |
>>> +    audio-controller@a040 {
>>> +      compatible = "amlogic,meson-gxbb-audin-decoder-i2s",
>>> +                   "amlogic,meson-gx-audin-decoder-i2s";
>>> +      #sound-dai-cells = <0>;
>>> +      sound-name-prefix = "AUDIN I2S Decoder";
>>> +      reg = <0xa040 0x4>;
>>
>> One register-wide block? I have doubts this is a separate device
> 
> I understand that this might look as weird configuration, so please let 
> me explain what's going on here.
> 
> In this SoC the audio part is split into 2 blocks: AIU for the audio 
> output (already supported in the kernel) and AUDIN for the input (which 
> is what I'm trying to add with this patch series). Unfortunately from 
> the clock management point of view the two of them are not indipendent 
> and interface clocks are in AIU register range. Moreover the two systems 

Two devices of one-register-interface having mixed clock management is a
CLEAR sign these are one device.

> are not in a continguous memory range, so creating a single audio 
> component that implements both is not feasible (unless we want to add 
> some dirty tricks with multiple regmaps, etc).

OK, but then what is between these? Again, register ranges ARE NOT
4-bytes wide on a SoC. On several SoCs they are aligned per page or
0x1000 or more. I have no clue how it is here, but 4 bytes is just plain
warning sign.

> This is where the AXG design comes into play: we use the backend DAI 
> provided from AIU for both playback and capture and then we attach 
> formatters (i.e. the audin-decoder-i2s we're discussing about) to 
> properly format the data.
> This explains why this is a relatively simple device with very few (1) 
> register. To be noted that for example also similar component on the AXG 
> platform (axg-tdmin.c) claims to have a larger register range, but in 
> fact is almost entirely using the 1st register with only 2 occurences 
> for the 2nd and 3rd. IMHO this is not that different from what I'm 
> trying to achieve in this series for the GX platform.
> Also looking at the implementation of "audin-decoder-i2s.c", even though 
> it uses a single register, it really provides functionalities i.e. it's 
> not a useless device and it can also be expanded in the future to 
> support 24-bit sample format.

I understand it is not useless. I claim this is writing bindings per
driver. I claim this is not a correct representation of hardware,
because hardware is not a device with 4 bytes of address space.

> 
> Then the question might be: why not merging this together with 
> audin-fifo? Becuase these are 3 indipendent instances from the interface 
> and each of which can receive data from the interface. Each of them has 
> its own registers range (and optionally also an interrupt - which is not 

4 bytes is not "registers range". It is one register of someone else's
range.


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
