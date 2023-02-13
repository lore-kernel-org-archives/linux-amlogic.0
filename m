Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF290C636D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdNweTYm0z/fgO41k/IbF8nI3g4EpcK7d0KSDE/Jovc=; b=g7BY/3RFtXw65Ba3cbkGc2OchC
	+QuGVVGm+sP51q3AZ7CdLh0FFi5KPoUb6FZFRa0xrZA5nqWg16k31S9cu4A6vQ+QTYTPfeHjUK8w7
	Gwn34qdDq5rlUcjpFtVWo4wkH14eOHpeMTsxSZlHzyCvOlyJ0qAyMVVGMnaYtVCOM1KY7jmKOag/j
	Uh8l70WC6no+JtYs8+aceTC5jQm/BsYAYEZUKPG3dgQ+iLewqtMYZSrTiNl5fvAqhdvZUUeJYCHo/
	S68bMi8mDoOy823/YXAXFcQmYmd6DhVzxq+JWJw790vfquB6WlpP3afOwPsXesU/gWDLe2raC/jZG
	ZyzWrI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUl2-00DjGW-Ho; Mon, 13 Feb 2023 09:04:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUkZ-00Dj2f-26
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 09:03:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id he5so366682wmb.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 01:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8LLsoA+/jnvLY03SW/3CjxjxLr0O2vRnD+Q4dMXdO08=;
        b=d9L+fxYR7KB8U8abH0LHizef71A51RSbQtEJmV3+KUUPEEK3LFApM8JEQ6vr36/zz+
         i0F7jZHmtWnG0hTG53tudXdzCvyPct0YUIPCeBrVM/4KIxsM4bDN/UzlIMUUzOrHtXnc
         t96FoSEhOdtKoeKRRlAnPFxbhknCTeAjmn4wdxn/OVhroR3REoL+mKO5xSdEUhsQApdo
         Uw2MmSK2mNr9FrOhtiamQKAyNMG6wvWQPPSHXBAWRucpgw3UJk78rTzNFBnJjoD0V6Vd
         6OnQ6/8U+etKIZTubFV+z3DTMv8GES8Mwx07LXsgg+Yd/RE/Vi98G8MO2JZmZHaobA9I
         ok8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8LLsoA+/jnvLY03SW/3CjxjxLr0O2vRnD+Q4dMXdO08=;
        b=NxrcJnsTwp78Q02e10UWdL8uYUbmfNdlHqaSMf6AVQ7Kw1G/tRHBxM0y8AVHqhHjMd
         sPKryicQZq8ol0jQz0Rct8HEDGx7toXg1Mcc8jKuwpa3X17E+VdrpY241aUECRKWoF1k
         MW1ys+ryCRNdXyv8ubpc+2Zl8ukrnr7reMpzrnEMwGE+h/pOYrptV+pTsDiiMF/SjldF
         TFE9j5sBkkc5dy2i3vHPG2iLriXkW/h3ZLNt5rWEzzYk5lLs59gx/EnRz0PS9LXKRkBi
         amGQtSsgVb7JKFe/lwvaFqdMjmC3RlE+HheBR4L3YIZEqAxl15yzLmPnE4Os/jLf18KG
         pZHA==
X-Gm-Message-State: AO0yUKUjc+LmgJcd4n3GpYkyVrMInee2Ki8Cm+ON3b/ZV4mgwZOSlcrW
	HW4F+ovSgh4GssiRF549DWdsBw==
X-Google-Smtp-Source: AK7set+WaRt1w4kdWfiJ5KNpyq0QpLKtRxhAntGuIXlyAGmg0Y62u8QFkuWKubj9B+NUHiK5Pv1CJA==
X-Received: by 2002:a05:600c:2e95:b0:3da:50b0:e96a with SMTP id p21-20020a05600c2e9500b003da50b0e96amr18319399wmn.29.1676279029525;
        Mon, 13 Feb 2023 01:03:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8? ([2a01:e0a:982:cbb0:6e1e:131f:8bc1:aad8])
        by smtp.gmail.com with ESMTPSA id m23-20020a7bca57000000b003de8a1b06c0sm16306361wml.7.2023.02.13.01.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:03:49 -0800 (PST)
Message-ID: <e0d71204-87f3-1d07-3927-909d09d39000@linaro.org>
Date: Mon, 13 Feb 2023 10:03:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/8] arm64: dts: amlogic: meson-g12b-odroid-go-ultra:
 rename keypad-gpio pinctrl node
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
 <20230207-b4-amlogic-bindings-fixups-v2-v1-5-93b7e50286e7@linaro.org>
 <CAFBinCC1O52eraLJ=GoZVM0fM0zVyqdDrkP3RCjNQ=KaqhByLQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCC1O52eraLJ=GoZVM0fM0zVyqdDrkP3RCjNQ=KaqhByLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_010351_410609_047694C8 
X-CRM114-Status: GOOD (  16.08  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, Yuntian Zhang <yt@radxa.com>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11/02/2023 21:04, Martin Blumenstingl wrote:
> On Tue, Feb 7, 2023 at 4:08 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Fixes the following bindings check error:
>> pinctrl@40: keypad-gpio: {...} is not of type 'array'
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]
>>   &periphs_pinctrl {
>> -       keypad_gpio_pins: keypad-gpio {
>> +       keypad_gpio_pins: keypad-gpio-state {
>>                  mux {
>>                          groups = "GPIOX_0", "GPIOX_1", "GPIOX_2", "GPIOX_3",
>>                                   "GPIOX_4", "GPIOX_5", "GPIOX_6", "GPIOX_7",
> I'm wondering whether we make the keys work without having to specify
> a pinmux configuration for them separately.
> Our pinctrl driver already sets:
>     pc->chip.set_config = gpiochip_generic_config;
> So you should be able to use the GPIO_PULL_UP flag for these GPIOs in
> device-tree instead of specifying bias-pull-up here, for example:
>     gpios = <&gpio GPIOX_0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> 
> output-disable is managed by the direction of the GPIO anyways.
> pinmux_ops.gpio_request_enable is also implemented by our pinctrl driver.
> 
> This is not urgent - I am just curious as always :-)

I didn't know we supported this, this is only a bindings check fix, but yeah at
some point this should be moved to (GPIO_ACTIVE_LOW | GPIO_PULL_UP).

Neil

> 
> 
> Best regards,
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
