Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF0EC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Mar 2023 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36w2KK1fkQKgfUxrsCcn4UFesfyvQBGujv0Sw0+k9uo=; b=oUa9/55A1tZ5PJ
	4srKS3a/5sdZZSsig+5JZETKEVcfP1nc32bchwlM/WmRtBUrriWO931rWyeUS9zjABwsBiW2iFQwP
	mSmggVL7N9Lx03c761HteGJO3M9YpPi33trxzvSTGdQRvA0fEa6lxsHsHtgNOJ4mlB88a9iRvI47E
	EK4YBuVBZnt9bUHl1Y0jfbgFlFn/PqQlIrBvDio2ULie1H1+a7SqRf9iE4tnnLtSXyQciKR6xdF7L
	r9VZ3k4A3Qie7vC4a22091grRfJRw5H94VGb9DiOwc/9/G3yrywHc5aItmEiy1xLM24VWq70avnmW
	jwFppekKxtC0UzaYG1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg2QK-006dPf-0v;
	Sat, 25 Mar 2023 11:51:04 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg2QH-006dOt-0J
	for linux-amlogic@lists.infradead.org;
	Sat, 25 Mar 2023 11:51:02 +0000
Received: by mail-ed1-x530.google.com with SMTP id ew6so17569899edb.7
        for <linux-amlogic@lists.infradead.org>; Sat, 25 Mar 2023 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679745059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQfEsJ/kRE4svm/QpY3bwtkC6UQ1KDFqIxzZimyy0K4=;
        b=zHR6Zo3t7o/2x6z18o6qSsk7yt9XwsI38ibIpH1UKOIN8XToCvDfqe7vBnFXwVEZ8u
         vTVtD130VtoJ3BxeHbBH/4Dq60M/2IXsyH/C5iKswd0DelleoYS+AcIdexkzhjETlEsL
         GcRyG0oVy5k2gZuZZ0OH0/RIwouFKdAfBPc/R5RY35EOHrwJFZk0WB8WVD2FvcEpX/kq
         8c9W9kPlQ3FfD7rCmUZ3Ul//iQGH0joinU8KZCoWcf/fEd3aefxXR9FLvMDMqpU2j6gV
         1R9HY+SJHf78r0XAEy+Rc6hGe/X/a13SO/xtit8u62QueW9+wvsOf5dDbQIZrBI32hAS
         ASgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679745059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQfEsJ/kRE4svm/QpY3bwtkC6UQ1KDFqIxzZimyy0K4=;
        b=6WViLABrpq1MX0Yt6jDitoLPLYXJBi+3+tSS9E2D6W9asR0kibojf5YP4a98Tmf5JP
         cv5Q9dOJTA6ppjRFmSviqIGPl91lr85ts7VZU36ZmyXau5VFlZiWymxfTff/JYVm8+DE
         EOusoF9/siaBLpqe1gyNXiHSQvrOtzXYiqmvgOUXwlthF8oKJfVAkDSyRUsITsftS0I0
         wOq8YRj9RsFVoAuX29ZWI1ZSIMdFaXsyOWgOpMMfn5qgUq3EQIzBJEKBtE3BCtYaxejb
         PykG2uVK3IT3qfEBFNt6xzrNBjSe3i9xWL0jeCzRPM6SeRCQIpGC0NoKQ5I4/B7XNois
         8IqA==
X-Gm-Message-State: AAQBX9coQINdZMcGqqjbXy/UmKBjhmaJTcW8mSvysOAW1583U8PdJm9R
	CNKKeApFeQwlEOcnKz4msQYTeg==
X-Google-Smtp-Source: AKy350ZVONNBf6X0XDXBdDm3eOWd/T0wslYWfPem1OuD3M4j6fthRc4ITWf8ho4pEtCkdeiAqnDZQg==
X-Received: by 2002:a17:907:a42a:b0:93f:b391:9a07 with SMTP id sg42-20020a170907a42a00b0093fb3919a07mr1082633ejc.15.1679745059546;
        Sat, 25 Mar 2023 04:50:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id r3-20020a50d683000000b004c0239e41d8sm12114820edi.81.2023.03.25.04.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:50:59 -0700 (PDT)
Message-ID: <29530f96-2633-a9ae-0ab6-811b68a74e9d@linaro.org>
Date: Sat, 25 Mar 2023 12:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <3e839363-e12a-93f1-a1f6-f783caa5665e@gmail.com>
 <b0a91d24-4458-169e-6547-2a2a68cd9922@linaro.org>
 <354ffe85-2033-eaf0-4dc5-b5a425900c20@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <354ffe85-2033-eaf0-4dc5-b5a425900c20@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_045101_137797_A1568545 
X-CRM114-Status: GOOD (  11.65  )
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

On 25/03/2023 12:41, Heiner Kallweit wrote:
> On 25.03.2023 12:18, Krzysztof Kozlowski wrote:
>> On 24/03/2023 23:51, Heiner Kallweit wrote:
>>> Convert Amlogic Meson pin controller binding to yaml.
>>>


>>> +patternProperties:
>>> +  "^bank@[0-9a-z]+$":
>>> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
>>> +
>>> +    properties:
>>> +      reg:
>>> +        maxItems: 4
>>> +
>>> +      reg-names:
>>> +        items:
>>> +          - const: mux
>>> +          - const: pull
>>> +          - const: pull-enable
>>> +          - const: gpio
>>> +
>>> +    unevaluatedProperties: false
>>
>> Wrong placement. Rob asked you to put it after $ref and the review was
>> conditional based on this. Don't add review-tag if you do not follow the
>> comment.
>>
> I wasn't aware that this makes a difference, and in e.g. samsung,pinctrl.yaml
> I found it at the end of the patternProperties block.
> Thanks for the hint, then I will correct this and resubmit.

But Rob asks for it, so regardless whether it makes difference or not,
you ignore the comment?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
