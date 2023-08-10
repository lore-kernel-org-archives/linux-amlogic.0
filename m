Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2374BC001DE
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Aug 2023 07:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2Wy++i/6TyIJKQ/KvP4FcvJ9hWvwtmlDLFbKaI5XFM=; b=d634jSuPXisVmp
	fwYASRCiFVh6bsDYA+Q/zLwLrSO4X9925tHZK3vAX+t/5epiIdV/1Efpj29Xo5nLTZ+HhR2KD0rx6
	UJmfAr5pyikp4Fxkm62CQP7y72AG+W62ekb1ByOun04TDWG09x2CuWTDN0JFUXco0d9aE32v/ct4j
	sqBvFxcObl1I3bPWpnMl7dYhoo6Rh7TprEOBedPKHDuXjSrz2wNd7SwYsc/u46Ton6SJR2Q+o6LvP
	rEQhuje3wp/Lm9ksx/SdragEXpNH6cex3ZvKNIWyqRKK6ilGCVfmh4PoUjhVPEPtbrXHAxma6Plle
	QLYgmVB+H19owO4dHcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0I1-006lp1-2O;
	Thu, 10 Aug 2023 07:41:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0Hy-006lnu-16
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Aug 2023 07:41:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe4a89e7efso4775505e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Aug 2023 00:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691653256; x=1692258056;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=gE2eDLacDaK6AX9g7TV9Vf/L1NM82eB/CdmYKIBQ0yA=;
        b=4f49vXO7A6Gc22laJ+7VCPltLWc7kgewzD7rQNR7bZkqGKS/AOyyISRqmG1WU0Ohi2
         wHSBViH7T91diiDguLUk/9Zx7Y7AREAjuWTOcvAuvCAxmoJcBVF5ot4Qo+8ppO3RHIVe
         zPqkQ8gIus+gqvKLI3Ek+GR9jWUObFmaGYkVcDPYYaTahfmlhUNSPCe6K9wqvcUzlF0W
         JIoTjqnupVjQaAysnR1UBUyNiW4aSnyisHit2TbeKjzYtkENez+gesZ7l/le0oBcujOc
         70oHShCnOBXZFZal4b/l6CH/37WPgsEBkxQyUkgUR0MWDIf18Z6crIAp9bVmsnwaZkxK
         Iqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691653256; x=1692258056;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE2eDLacDaK6AX9g7TV9Vf/L1NM82eB/CdmYKIBQ0yA=;
        b=Wz1++XsWCU6NDe2EvJeTfKhnkDJdMsMf3GsPYXhDDHP39yAPtHwgQMKYfVxM5JevQX
         p6Wv/9dgzujqIhy6TpIlcX4aFMChJtDQ8koxVs31t1NG4GzOn5EYngieT74FwtSpsill
         D34fqjKSDHAIMgrbeUU3sY5a1XNhVlbsZIvUP5PP9B1GqoRUpaqi9/pboxR544Ki77G2
         i3GNPAYSQXeRjZPKrWT6AluosFvlGccSLc5KuT9k7uhLfyTheCrtIbnKWQF0XmmmPL4z
         V44N4WxnBkEXZistx59ZLMTW5BmtTWiK03py5zWIB9ob3F1kwh3y5MedZ/Us6f6qoZHf
         8PiA==
X-Gm-Message-State: AOJu0YzhqbOnrjblGB1HgYyzDxYi97Sy65W2I9wz4Wx/Q4MhPqffZg/O
	YUnHBF8pYFIf1qyhcnzdxf4t0Q==
X-Google-Smtp-Source: AGHT+IE8Ia4n/NlmCa7gXROhXWJu+aGPVlwNFSbpVUlGZ2/Xb3DQjt4SzY+WI2mGYzsua3kBvb0uow==
X-Received: by 2002:a7b:cd09:0:b0:3f9:c8b2:dfbd with SMTP id f9-20020a7bcd09000000b003f9c8b2dfbdmr1136560wmj.19.1691653256226;
        Thu, 10 Aug 2023 00:40:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6d73:1494:dad2:6a13])
        by smtp.gmail.com with ESMTPSA id c14-20020a05600c0ace00b003fe4548188bsm4113626wmr.48.2023.08.10.00.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 00:40:55 -0700 (PDT)
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
 <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
 <8294548.NyiUUSuA9g@kongar>
 <5c852193-9298-af2e-2b7d-dbba29768fec@linaro.org>
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
Date: Thu, 10 Aug 2023 09:32:09 +0200
In-reply-to: <5c852193-9298-af2e-2b7d-dbba29768fec@linaro.org>
Message-ID: <1jwmy39wfs.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_004058_566217_CA337582 
X-CRM114-Status: GOOD (  17.59  )
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


On Thu 10 Aug 2023 at 08:11, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 09/08/2023 20:44, Alexander Stein wrote:
>> Hi,
>> 
>> Am Mittwoch, 9. August 2023, 15:02:23 CEST schrieb Krzysztof Kozlowski:
>>> On 09/08/2023 08:58, Jerome Brunet wrote:
>>>>>> +      required:
>>>>>> +        - '#reset-cells'
>>>>>
>>>>> else:
>>>>>   properties:
>>>>>     '#reset-cells': false
>>>>> ???
>>>>>
>>>>>
>>>>> You need to constrain the clocks per variant. Probably names are also
>>>>> specific to each one, so the list of names can be moved here and you
>>>>> keep just min/maxItems in the top level property.
>>>>>
>>>>
>>>> input clock names and constraints are the same for all 3 variants.
>>>
>>> Then why do you have this huge, apparently unnecessary, oneOf? If it's
>>> the same, then drop the oneOf and make number of clocks fixed.
>> 
>> But as far as I understand the number of clocks is not fixed. As Jerome pointed 
>> out in the other post, it can have any combination of clocks and range from 1 
>> up to 11, where 'pclk' is always 1st clock.
>> I currently have no idea how to constraint that, despite limiting the number 
>> of clock-names.
>
> The same as in all other clock controllers (was also present on my list
> of useful patterns - Variable length arrays (per variant)):
> https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57

In the example provided, the number and list of clocks required by each
controller variant is fixed, if I'm reading it correctly

Here the controller (regardless of the variant) accepts a maximum 29
clock inputs. Only pclk is required. It is valid to have any of 28
optional clocks at index 2, 3, etc ...

I guess the question is how do you recommend to model that ?
I can think of 'Anyof' with all the optional clocks repeated 28 times
but that would be fairly ugly.

>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
