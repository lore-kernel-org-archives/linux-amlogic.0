Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80940C77B75
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 16:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aw33mqBVMAF1sTqPFMaMzQ9WKvtdwteigjtFoA3xJtc=; b=vlISX0MLDqFMzQvgFoFkaTWsNq
	/+3XZfRg0O60QBEj/wGYf4Jx6gDMd9djXQwU26pOMaHcjvqd4VZuPQ25jP5uN+cSHpVlnmd/Jhuf5
	EA2iJFRxGG6c9j212OLnu1bY87irprqCY+F2Bwg4JK1zyhyZlHHlEqV9/Cf8SoDQdHnzKgKJ24Nd2
	lXDuu+nGU7JkmVIn0EEvm/SvfWlAt0fTkWREFV/P+8lSbJ1EaIYRpqGwzslr0BrEnU4ZVZG6CtVZA
	UAXSCsqfbCrqLBkO4YgQYvDoiTFlb5QjnW+aA0zDUeIgo+8NsgPVaybv+8DL4ENS9GMAysEsNxuyq
	UMNDLlhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyb44-002kuP-36;
	Mon, 15 May 2023 16:28:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyb41-002ks2-2E
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 16:28:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f4249b7badso90525885e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 15 May 2023 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684168124; x=1686760124;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0EEEgIKjrzXriSIZ47448RB5cvvZ9f5tDK/8irMyJ0A=;
        b=q+6DFdEJ9P6y6gOzW1Amd/ymELg/jIXWBJNSmQSpi/fDkwod/uEA41cAt0DT+rXDgR
         ke33N+i5dCKM0/P2JhM/9MEY5E1bi4U+Iq0vWxU8BCc6Pjf4fxCmxEo6RbO8629K9qT0
         Az65ViRhzQSDrYqSeOXa8lkXrLTkcxhkVDjR0CbySgGeN29S0/BRdQFAOAZ5qfZvw6QN
         rIIEaev5SmOQxj+nuZBy8HqF4f4iv5q8qvDaL1D27MUur1oSZZ3R/UEU3+4nV2FCNwmB
         I4JbiHRS0HIMLtqwIWW9pHJeHUlq7/cjJ3WS69iYg8SXXG/37NP4P6t1RJytRyhy6MGF
         bH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684168124; x=1686760124;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EEEgIKjrzXriSIZ47448RB5cvvZ9f5tDK/8irMyJ0A=;
        b=A+WA5zDH8rUdTqAuPVoBPvjMrmDy023ULANDNnR7ttBfU7lQlGFkK1pNQ3wwRzU+0D
         FZLHjHTpCLU1H0XGEakoQiWd59WSPatiriY4AZwim2FeNavaBwYxf1JbDrBtpwjliGER
         cdCnAkqP+FEOoCemG0Ndo2YnAa5FnnrfWs60emo1CX0H+APStF/15+udDNpW+6NTuAGo
         akwrEFCKmB9OnnNUPRa1afUsD1DYiT2BfBq42FLj7COSjC5+QD06NrLmt6m965xqnW8p
         4lrzFYvZYnl2EUmyDVzWAEX0oVgMhFaRefyFRxqco/F/79bdEMH6n6UjXukVAyvszUkt
         s10g==
X-Gm-Message-State: AC+VfDy71nIp86armyMSP22oU2D68W77tbu2vHCKQoC8nzaJWeUbdofI
	ZuQJ0P4IAefv4OZPjcDG8FG+nQ==
X-Google-Smtp-Source: ACHHUZ4keKZPJ3OsaATsIDklN6VcscEM8Q+RmelGpy5mLTn+dW5HEPELp7rHCx1oGcdaks1d2wvlwQ==
X-Received: by 2002:adf:ef8c:0:b0:306:8034:b2e4 with SMTP id d12-20020adfef8c000000b003068034b2e4mr23192900wro.69.1684168123493;
        Mon, 15 May 2023 09:28:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ee7:a396:6195:bb56? ([2a01:e0a:982:cbb0:ee7:a396:6195:bb56])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003f07ef4e3e0sm30127103wmo.0.2023.05.15.09.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:28:43 -0700 (PDT)
Message-ID: <14405799-9b56-6767-4a35-51ab8ae636a9@linaro.org>
Date: Mon, 15 May 2023 18:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 04/13] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-4-2592c29ea263@linaro.org>
 <fe2f22c7-8c39-faf3-bc65-a7c089200134@linaro.org>
 <eaa3ecd0-dcf0-01d8-b3ea-9dd900215839@linaro.org>
 <80da6b9e-ba82-d2c9-2854-b444635150fd@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <80da6b9e-ba82-d2c9-2854-b444635150fd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_092845_787663_4AF40744 
X-CRM114-Status: GOOD (  21.93  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 15/05/2023 18:22, Krzysztof Kozlowski wrote:
> On 15/05/2023 18:15, Neil Armstrong wrote:
>> On 13/05/2023 20:32, Krzysztof Kozlowski wrote:
>>> On 12/05/2023 15:11, Neil Armstrong wrote:
>>>> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
>>>> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI Glue
>>>> on the same Amlogic SoCs.
>>>
>>> Please wrap commit message according to Linux coding style / submission
>>> process (neither too early nor over the limit):
>>> https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586
>>
>> This message may be automatic, but context is always important when reviewing,
>> this commit message is a re-spin on v3 that was reviewed by rob but I decided to remove the review
>> tags since I added a new clock and did some other cleanups.
>>
>> While the process describes "how the patch itself *should* be formatted", it's a best effort
>> and not a blocker.
> 
> Other issues are blockers.

I agree with that

> 
>>
>> I'll fix the wrapping since you pointed out, but referring to the submitting-patches.rst
>> file (from a very old v5.18-rc4 version) is kind of childish.
> 
> It's just a link stored in automated responses, what's here childish?
> It's still valid in current cycle! Look:
> 
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
> What's the difference? Srsly, I can point you to submitting patches
> without reference to specific line if you wish... Or you can check by
> yourself.
> 
> I give the same reviews to so many people that have templates and Elixir
> happens to be the only place allowing bookmarking specific line. Which
> is helpful for beginners because the entire doc is huge.
> 
> I can make an exception for you and never paste direct links.

I value those kind of links for beginners and newcomers, really, it's a good
thing to do and we should all do the same.

But I always take in account who I'm reviewing, and adapt my comments,
I think it's sane to not appear as rude because we all forget to check
some stuff when send patches upstream, or at least I often forget...

Anyway, don't make exceptions or change your process for me, I'll live with it.

Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
