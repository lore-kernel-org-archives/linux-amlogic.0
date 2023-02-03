Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41278C61DA4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 17:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPA1pfsR2+NJa3WnOU682vWwFYg+sUqfoSMyYS+acX0=; b=Ft9AATQ4gqlJjn
	NzZsD530lmPvAsqJQq/XtIL1+ZIFQL9/M77mJYtXnVhGitmJFUPw8X17nquwYJ3+/9NAUddC8iKs4
	ZtVUnY0k+mpEOBTCe5I60bSlVV6YfqbmQDm2OhuDYBcjO2t4U+JY8vxwr+jtEVAy5NIN5CGH7Uzrt
	fDBaDHAS5cK/Ji0xYIb8zHzSJGOV6iq5BngWMJBw3myUTyGqTHK5pFg1NoEsEQWR3k+FZSOJuqq9T
	hPkYDC8+ZEWVCZ+WbgnGDFTFlWzky2RWEzLOG6GaC/PzJoRSPxDV+Y7BEe80MJaaYBxYnc99moocb
	3tHuxz/jd1oRC1/YuFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0KL-0039hy-Sn; Fri, 03 Feb 2023 17:58:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0KI-0039fw-NR
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 17:58:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so6573931wmb.2
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 09:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lN+M6aiUbCqF46CC1crDFxdVf7hLTQ+IRNqaZ978vd8=;
        b=S1EjWXdz//eVBIiu80y0i58Nwfp/vPB6JlRYf2vOiL5xiefMP2zINH+qTlJJbRKItY
         WPrNVD0VpVMglADIzRh8Ojmkhb+O/yZ6DvaCEfVRF7ZEnrTYtwIF13YFx5XNMFgIj8rE
         uWSA5IlhAOYI0mTPHGzK+xv/oXOiRT/JZGYpW3WMtyFcdn+ofmFkqIFIURJEvwE7FM7Q
         2TMKBxnxWIbBXDhy/h1s540I8b9ylHqaLRjlafMhockTDHZP+qIiT44NeP9mnh4zsA0s
         Xclq547eR3BpKU4H5GOz04EFZ1KWSUjYUabfKn1PAQqCB0mIirpl0MmXm/DFU5UC11ms
         1l5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lN+M6aiUbCqF46CC1crDFxdVf7hLTQ+IRNqaZ978vd8=;
        b=zE2PjCsEi81MpaythnRT9F2jlnVFxxgyyOHy4l5lGYKlESMRBrEAmSkcMhA6EGUKLL
         ASEahlCP+8S1qjRJ4mcvwgluwNUpTMgYHxV/igitA06OmXRREBGxnE5dYcyx7z+wjhqe
         ftwH5WLK/liwtTrbf/JkLZzlq5K8/p/DyvW3E/efhkyHcaNUmySZaNNGlv2wKa0PN2Y/
         2F33tptRShl/iE9VcqTlp6uoYroxJBmAM3y4idMDvuZz/4wxS/m5ij60H2+a//v8T9Is
         XEKcELH2X6GVI3a3YmxoYNrEj+iZ8nQU//K2CeC3+p3m4QA569s1289S0O3d1sG/Cmnb
         T7YQ==
X-Gm-Message-State: AO0yUKWXjqP26aFq5yhYiTWhn/nTpMbA/plvxqKaW9hsYGVQ3/MMp4T1
	VZcrm6Cdq0DU8jAhGtuKyoFwgg==
X-Google-Smtp-Source: AK7set/XQawmCDWrVyjPwzNZBBNVKsO+g4KUQAE8B9uS3eeB81KjPN+ttS8KXCXrBfkXJpYejKU66Q==
X-Received: by 2002:a05:600c:510e:b0:3dc:59e9:9285 with SMTP id o14-20020a05600c510e00b003dc59e99285mr11539024wms.18.1675447094889;
        Fri, 03 Feb 2023 09:58:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p2-20020a05600c358200b003dc4ecfc4d7sm3609686wmq.29.2023.02.03.09.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 09:58:14 -0800 (PST)
Message-ID: <d72f2c93-934c-67fe-0afd-96bc52b12a9f@linaro.org>
Date: Fri, 3 Feb 2023 18:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/9] ASoC: dt-bindings: meson: convert axg fifo to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-7-jbrunet@baylibre.com>
 <6e6ed493-4748-46ca-7a26-fe9cf6e2377a@linaro.org>
 <1jmt5un9u4.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jmt5un9u4.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_095818_809198_82CFBCD8 
X-CRM114-Status: GOOD (  19.97  )
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

On 03/02/2023 14:27, Jerome Brunet wrote:
> 

>>> +  resets:
>>> +    items:
>>> +      - description: Memory ARB line
>>> +      - description: Dedicated device reset line
>>
>> This won't work without minItems and you should see errors on your DTS
>> or in dt_binding_check
>>
> 
> The example provided here worked but there is indeed a warning with the
> axg-frddr variant.
> 
> I'm adding a 2nd example so it does not happen again.

If the difference is only in one property, no need. If the difference is
in more properties - then could be. We do not keep examples for every
trivial change, because the assumption is that submitter tests DTS as well.

> 
>>> +
>>> +  reset-names: true
>>
>> minItems
>> maxItems
> 
> Adding this causes troubles with the reset-names definitions in the 'if'
> clause. If I put min: 1, max: 2 and min: 2 in the 'then' clause I get:
> 
>> Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml: allOf:1:then:properties:reset-names: 'oneOf' conditional failed, one must be fixed:
>>        [{'const': 'arb'}, {'const': 'rst'}] is too long
>>        [{'const': 'arb'}, {'const': 'rst'}] is too short
>>        False schema does not allow 2
>>        1 was expected
>>        hint: "minItems" is only needed if less than the "items" list length
>>        from schema $id: http://devicetree.org/meta-schemas/items.yaml#

Probably because rest of binding does not match. One way is like this:

https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57

> 
> The older devices just have the 'arb' reset.
> Newer devices have a 2nd reset line (called rst here)
> 
> If I just restrict the min and max, it would be valid for the older
> devices to have 'rst' only - but it is not valid.

How? Why would you define for old devices "rst" as one name if this is
not correct?

> 
> With just 'true', it works as expected (throw errors if an incorrect
> name or number of names is passed). Min and Max comes from the items list.

Because the rest is not in recommended way. Once you implement it in
recommended way, there will be no such...

> 
> Any suggestions ?

Implement rest of comments.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
