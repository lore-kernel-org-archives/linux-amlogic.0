Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C65FC19F21
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 09:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYe+CJW60YJg6J2eYlho0UfMi9n7l5YRv0vySPtWSi4=; b=hLqUN7NEcUV7rp
	8/irBXMKQvCs83nKueyaRFEPqYZOAZkypETU0fQ9m+V1r+h96zHhq/8QQRPE+ytDqvBoGsYoJUS51
	8TJOfgr17UhlmVqqezMWDm3Yll2VqCwtta4zKDDwwnirnQGFud7gv4dPc0yoyAi6bye1ALCf7+gxq
	xQFGuDDvl/sHzthKEPTJv/uyUK2HCSrnyf5zxjvzxy7wOgWr1TXJtIu7np9kxIx7qG94ShyT8WUa8
	uMNq8uUbaNFarwBnnZPkf9lMA/S4SyicSV/4d7d+XRqn70+2msUxNV7EI4EUb6cBINNFwaqrY3lHU
	HbEAHdt2WQ8rzvctjPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGzvV-006rNP-Ma; Thu, 28 Jul 2022 09:35:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGzvR-006r9t-O9
	for linux-amlogic@lists.infradead.org; Thu, 28 Jul 2022 09:35:28 +0000
Received: by mail-wm1-x332.google.com with SMTP id 8-20020a05600c024800b003a2fe343db1so750268wmj.1
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Jul 2022 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:subject:date:in-reply-to:message-id
         :mime-version;
        bh=k3WJMzc4VlzWe028CTMpp0rc55xqANnpObGj9ASfF4g=;
        b=kOiWRnnN6mtieKOLjkH8T/0NvwhYzh0u+fsDATST0slwNj6In1/nzfpCUEkvXm7Pyk
         O/2OKtZs1s4n4YFLLn78mYDpEhfEGHm62+fkQZWOyUz/SEbcaUnE9VKWANHVfee0vKD+
         QQjzOWZVkRGBmbP+ld5BkAyuZbQ/CaVT+aAvvbFHaNer0Hr8ncc99WZ3ua5goVCC6Ahw
         XG+RS0KBxgVyH7uiruCjp6x3+yowOOT+5dFJZtNdB5qeEcDKQLfrMMlq4WQ5CUxQUJte
         Y7aQe6ROKacO/PpnXLfb8LmfCkEGVkvsb1YrN9d9+qwOmZeKKUz3Mu43NYu27HJBzICF
         QTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:subject:date
         :in-reply-to:message-id:mime-version;
        bh=k3WJMzc4VlzWe028CTMpp0rc55xqANnpObGj9ASfF4g=;
        b=kRtSHS8EC02mwpBYtBD/C9gBMoxPWK++/tNT+fHPJlOqjFl/d+dXGjjOjaFcvJ4TnD
         SHhsz+sdYMlZVsXLoPQ8RZxTchcfzuMkTjpj9rLEYL0bA51uh4fKzjRYE6xJ8gYEK5z6
         otwyLbUJo+sAnonzIUbC2Eu11APQ2s1uQuNAUxnW2LLc63mFy6GrpzLhDjAlYwiion8P
         PasMyV82tM+6BWDSsqtAXgVy3v8aVPk57E/zZzIAtlOZ7C5aAbeGJsNTxLFwCt1Sy71T
         +atKofHSvqODfJK2glKuZXrtb607LaGrvju/0z5hdhDCNRdJCz3w940g5b58gk2NZRlC
         1g/g==
X-Gm-Message-State: AJIora85XXg/1+6IusfOEaaPuK6iQMWuGzQjh4tkMczjGwE4gd/Elapt
	NQXrJ1a3XTwcEXRt5XiIBP2hwA==
X-Google-Smtp-Source: AGRyM1urGG1USTxB/ciyzDD0khYnDOQsI8Zs2PyCwuGAPjHdiKK1K1HzIvms+8txwfUegpyR48kRGg==
X-Received: by 2002:a1c:2783:0:b0:3a2:fd82:bf46 with SMTP id n125-20020a1c2783000000b003a2fd82bf46mr5863699wmn.29.1659000923324;
        Thu, 28 Jul 2022 02:35:23 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c19cd00b003a2e1883a27sm6126778wmq.18.2022.07.28.02.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 02:35:22 -0700 (PDT)
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <20220728054202.6981-2-yu.tu@amlogic.com>
 <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
 <1jv8rhfw8h.fsf@starbuckisacylon.baylibre.com>
 <367cf98b-ef06-8f44-76c8-9099a1ec13dc@linaro.org>
User-agent: mu4e 1.8.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yu Tu
 <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V2 1/3] dt-bindings: clk: meson: add S4 SoC clock
 controller bindings
Date: Thu, 28 Jul 2022 11:09:52 +0200
In-reply-to: <367cf98b-ef06-8f44-76c8-9099a1ec13dc@linaro.org>
Message-ID: <1jmtctfuli.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_023525_811237_AEAD7E68 
X-CRM114-Status: GOOD (  21.61  )
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


On Thu 28 Jul 2022 at 11:02, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 28/07/2022 10:50, Jerome Brunet wrote:
>> 
>> On Thu 28 Jul 2022 at 10:41, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> 
>>> On 28/07/2022 07:42, Yu Tu wrote:
[...]
>>>> +/*
>>>> + * CLKID index values
>>>> + */
>>>> +
>>>> +#define CLKID_FIXED_PLL			1
>>>> +#define CLKID_FCLK_DIV2			3
>>>> +#define CLKID_FCLK_DIV3			5
>>>> +#define CLKID_FCLK_DIV4			7
>>>> +#define CLKID_FCLK_DIV5			9
>>>> +#define CLKID_FCLK_DIV7			11
>>>
>>> Why these aren't continuous? IDs are expected to be incremented by 1.
>>>
>> 
>> All clocks have IDs, it is one big table in the driver, but we are not exposing them all.
>> For example, with composite 'mux / div / gate' assembly, we usually need
>> only the leaf.
>
> I understand you do not expose them all, but that is not the reason to
> increment ID by 2 or 3... Otherwise these are not IDs and you are not
> expected to put register offsets into the bindings (you do not bindings
> in such case).

Why is it not an IDs if it not continuous in the bindings ?

If there is technical reason, we'll probably end up exposing everything. It
would not be a dramatic change. I asked for this over v1 because we have
done that is the past and I think it makes sense.

I'm happy to be convinced to do things differently. Just looking for the
technical reason that require contiuous exposed IDs.

The other IDs exists, but we do not expose them as bindings.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/gxbb.h#n125

>
>
>> Same has been done for the other AML controllers:
>> For ex:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/clock/gxbb-clkc.h
>
> This cannot be fixed now, but it is very poor argument. Like saying "we
> had a bug in other driver, so we implemented the bug here as well".

I agree, "done before" is not a good argument. I was trying to provide a
better picutre. I'm just surprised to have this new requirement that IDs
have to be incremented by 1 (in the bindings) and I'd like to understand
why what we had done could be considered a bug now.

For example the simple-reset driver compute the reset offset from the IDs:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/reset/reset-simple.c
There might be holes in the IDs if not all bits have reset maps.
I don't think that would be a bug either.

>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
