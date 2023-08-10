Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1081C001B0
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Aug 2023 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=adjhtQmz3q+nQwi3cuutt9SrCOBbmc1mTv4AjcVuE2k=; b=mF2O8Atc0THt1L
	hSXVnkTc5xM7WjG6k8cgGLFuEVmIbVkg3qBuMxgHW4xCwX9jWO2XTyuzDV7s0H9NAHk/s+WvfcLYf
	vFyghCXBcCG2smZr3nMqOMQ+DT49qqVT+YZAvcyIfOkRbUhuF+dlQmSl9hhH5asZdfANmhdkeTYW8
	jfBChVCPeW/rp1wDVgFnT6LCqSKya+98ElvIEpZZ39vKIA1rvk2zPDYU9+HyPB/fPcnsLYp1eLtHr
	4TRsr8yDAuhR6xmy+aDXASeEhHff0ztF3Hcvh2nULQasyP+sp825ch4wL6SAhX5/pNkWc9mXK2+fS
	1jUAInrSSg9AXVItkU5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0l0-006p1r-2L;
	Thu, 10 Aug 2023 08:10:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0kx-006p0I-2C
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Aug 2023 08:10:57 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe2d218eedso5591055e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Aug 2023 01:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691655053; x=1692259853;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=fg9G7GnbTJdewMNTEJgW8SVAuCvIfpPe9RrCKJ5D/9Y=;
        b=Cpqy3BQE7SssOGVas3hMwLeiIStGEE7Qe9/cLT8ypZtDwg0UG1Q+RyEi05SbHAh+Kv
         1QzfJlwk601kP+S1nO3a34c42TioVjLHU+kRMghX/F9PHtFWO6fPvR9IHidyqvgS8eg6
         UcGY6qARGxDkUv+y+wBD2Dxd6+dVEqvWHY2tOAeh+pwCxJnyLCqUrP8Ic+/oQkAOUJ7L
         pgtEDe5C2pnjSMaENbVVR7PeUbaNdtK7AqnMggRowEAXbRb8bInWYwpkZqAuLGlGsidy
         TUvGm3aTUc1nQ1ZjkZwXBQLwyVlugTwN0LwErZVSOZFLWW+t6BX5MJhNX2P3hghUEtIW
         ODhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655053; x=1692259853;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fg9G7GnbTJdewMNTEJgW8SVAuCvIfpPe9RrCKJ5D/9Y=;
        b=T2UVVl8ixVf5OiAmGFvVOr2Xb0r9A7g8NTfXeC6JXsYCJWifPBAV4XAiS93e4OAXpM
         JsFejC/tSJEsEhlnXbudroShezJh312pZDl3iJRAA6cVy0w/isBb1soBVCmc2m3zzD8G
         yhRiEAUFhwc0GN7ljZBkLIjF2BbvCNF69yI5+vy3AHmdADQJGK1wf0kfyHtM3ilsTiZF
         76Xx1Y1oYN3ayhSuJLgCHuL+CzAlFVpvg3dP+9PyhIOjDZnXO4gw/p8gUw1o0g1jWec9
         S5609z9QbMjc6DB/La39pPRnVaDnAqbqVKH8VGH3jbdnHaZfNT73fiiEX+19TCDJlIbF
         rwJg==
X-Gm-Message-State: AOJu0Yzslk8qCqZcusKHCIHqLXH+vxBETY4DFv6Pg+YgmItJK3KchOwd
	MH6PU4zwcmVftAto/eTBjFpgBg==
X-Google-Smtp-Source: AGHT+IHHhqKUVDFFOmKZ02JBpZrS7ui+XZ8GK1HCkhmr+1iBQmxRUOM6/BB4osdTAuK20h4BxV3HbA==
X-Received: by 2002:adf:f08a:0:b0:316:f3f3:a1db with SMTP id n10-20020adff08a000000b00316f3f3a1dbmr1344948wro.32.1691655053267;
        Thu, 10 Aug 2023 01:10:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6d73:1494:dad2:6a13])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6283000000b00317643a93f4sm1272988wru.96.2023.08.10.01.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 01:10:52 -0700 (PDT)
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
 <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
 <8294548.NyiUUSuA9g@kongar>
 <5c852193-9298-af2e-2b7d-dbba29768fec@linaro.org>
 <1jwmy39wfs.fsf@starbuckisacylon.baylibre.com>
 <d2225b8a-a622-3936-1e43-d5a9801c2cd7@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexander Stein
 <alexander.stein@mailbox.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc
 to YAML format
Date: Thu, 10 Aug 2023 09:51:05 +0200
In-reply-to: <d2225b8a-a622-3936-1e43-d5a9801c2cd7@linaro.org>
Message-ID: <1jsf8r9v1v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_011055_716938_E883F8E4 
X-CRM114-Status: GOOD (  19.62  )
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


On Thu 10 Aug 2023 at 09:46, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 10/08/2023 09:32, Jerome Brunet wrote:
>>>>> Then why do you have this huge, apparently unnecessary, oneOf? If it's
>>>>> the same, then drop the oneOf and make number of clocks fixed.
>>>>
>>>> But as far as I understand the number of clocks is not fixed. As Jerome pointed 
>>>> out in the other post, it can have any combination of clocks and range from 1 
>>>> up to 11, where 'pclk' is always 1st clock.
>>>> I currently have no idea how to constraint that, despite limiting the number 
>>>> of clock-names.
>>>
>>> The same as in all other clock controllers (was also present on my list
>>> of useful patterns - Variable length arrays (per variant)):
>>> https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57
>> 
>> In the example provided, the number and list of clocks required by each
>> controller variant is fixed, if I'm reading it correctly
>> 
>> Here the controller (regardless of the variant) accepts a maximum 29
>> clock inputs. Only pclk is required. It is valid to have any of 28
>> optional clocks at index 2, 3, etc ...
>
> I actually doubt that it is optional. These are valid clock inputs. I
> could imagine they are optional depending on the use-case, like some
> block being turned off or on... but then still the clock is there, just
> not actively used.
>
> Aren't you now describing existing Linux driver?

They are valid inputs but not required. It is valid (and expected) to
have a fair share of them not connected. The slave clocks just don't exist
most of the time, and the IP can totally accept unwired master clock
inputs on SoC variant. Nothing is going to break down if some are
missing.

From the controller perspective, the description given here is correct
and the inputs are optional.

The more generic question is how do we deal with multiple,
independent and optional ressources ? Because then, the order in which
they appear cannot be predicted.

>
>> I guess the question is how do you recommend to model that ?
>> I can think of 'Anyof' with all the optional clocks repeated 28 times
>> but that would be fairly ugly.
>
>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
