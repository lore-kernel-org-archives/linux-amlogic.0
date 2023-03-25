Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69771C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Mar 2023 12:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoKQ+GODT+DuFzHOcLw/oJIelyKO/dhbO1jfoBQpaGs=; b=Nb2qSUvD9gkVcV
	o23JKxnT82yvt1gqT8ffUrE+SovUZ+oHNQP7OF+cdMDhNY9dYQ0sf8noi8NaZ6sXChPKoDoE8vrjs
	6XcDG84EDY02q3be6UHCBSbwG+C2SzuT6r+Rm5VZ+HT81AyBxEEzGlNgBWNLRzX6lq3jnA4d4EfWL
	xl+E2224VQehHoeyH4FiEZhFpVQv+IwqhTfdi345nVCuYKgL+Aer5WzQ1qdutBB9pxBLUtMvODEyS
	MtmeVDkfiQyEzSPfcA5Fa9Dxzu93oT/EtqKiD1NllMMzawwjdQznBF+Kbzr7lOZGtdfdV/MF46jl3
	w3fkdOHx1XY2Hx8VKuaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg2qN-006fbe-0E;
	Sat, 25 Mar 2023 12:17:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg2qJ-006fak-2K;
	Sat, 25 Mar 2023 12:17:57 +0000
Received: by mail-ed1-x531.google.com with SMTP id w9so17878316edc.3;
        Sat, 25 Mar 2023 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679746670;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pu8wL5qXVxNgSV+ESDKQBRdfmOHZWJtmzs8uhRMKNw0=;
        b=QlbtkAIghM6F1+7hxP11wPojqP837QcQnBAS3ZkcwugfPuVObD9rvyb6iFvuiZrQxp
         LgKaNEmSCwxyd1n4jIIoDH74sNCM4OWuoc/1O+Rpx7BToeX9BpvjrzovdclFYwVO9lU+
         C0c9qkSnvxeEGk7U39zzY29WnCxTtv2g3MXGbui4eVcGLTGfcu2gD8Bv2foIW4D65p0T
         ZucXNUpMNk1DnuFcxVCgTqYwmsri6snu0QA1x3CVnmWTLBmf/hqRljHZ7zgtGpdbZXXX
         HkBw/sjfjD5C5J8fdcaE5F3jmzwZgg037xDAZNcx3+FSls0nMYIA9xAUX6L7RCssurLZ
         ZKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679746670;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pu8wL5qXVxNgSV+ESDKQBRdfmOHZWJtmzs8uhRMKNw0=;
        b=2XTb+37sG6ZzSBkR4mhzueogQBgOrabbF3FNCmPTK8c4mew4KF8prMzUXGO5BRC3I/
         QPcity9zqgqBAOAmmhmp6Ijin96kxATz1WZ+rszUp1oqqzlQkVHEAbfbnD9cN0e5QHxz
         NABSQPaci4kMkkHgQmZgrNYOLq0pu5mJxNevaZoBpBK9zqEJTmzCt8OOO5t7GekQ7EFP
         u5H3AWfsuK77Yw1WTDjW1/JCVyJON5xJ72x/QyQ83p3tOZpHt4yzqrB+zWXOrqzV30Kb
         L/fGmTIHTguA3tZpd9QZgjTtkzF31rGG09aNrruZjq8fWdTqFkEUbC7ZmvGJOulLCH/h
         N1CA==
X-Gm-Message-State: AAQBX9c0mOlzgDCCvnDYt27mW/A7HdBjh9Acr248nhD38RfWRKj/jDNc
	Fp2VRqB7O8X4lH71wRzX36Q=
X-Google-Smtp-Source: AKy350Yf9IylYypMjLI9oj7WYoAte5cYfPahaeTQxosFGWXl6ka2/1vfBRamrxmGMerfgbTc1nfV8g==
X-Received: by 2002:a17:906:8296:b0:933:868:413a with SMTP id h22-20020a170906829600b009330868413amr5925389ejx.15.1679746670305;
        Sat, 25 Mar 2023 05:17:50 -0700 (PDT)
Received: from ?IPV6:2a01:c22:73a5:2800:e59a:ffcb:c722:70cf? (dynamic-2a01-0c22-73a5-2800-e59a-ffcb-c722-70cf.c22.pool.telefonica.de. [2a01:c22:73a5:2800:e59a:ffcb:c722:70cf])
        by smtp.googlemail.com with ESMTPSA id i21-20020a17090639d500b009332bb8b1f7sm10374452eje.66.2023.03.25.05.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 05:17:49 -0700 (PDT)
Message-ID: <73faa10f-c94a-759f-8407-49d64bd0f824@gmail.com>
Date: Sat, 25 Mar 2023 13:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v7] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
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
 <29530f96-2633-a9ae-0ab6-811b68a74e9d@linaro.org>
Content-Language: en-US
In-Reply-To: <29530f96-2633-a9ae-0ab6-811b68a74e9d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_051755_761827_005008E0 
X-CRM114-Status: GOOD (  11.39  )
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

On 25.03.2023 12:50, Krzysztof Kozlowski wrote:
> On 25/03/2023 12:41, Heiner Kallweit wrote:
>> On 25.03.2023 12:18, Krzysztof Kozlowski wrote:
>>> On 24/03/2023 23:51, Heiner Kallweit wrote:
>>>> Convert Amlogic Meson pin controller binding to yaml.
>>>>
> 
> 
>>>> +patternProperties:
>>>> +  "^bank@[0-9a-z]+$":
>>>> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        maxItems: 4
>>>> +
>>>> +      reg-names:
>>>> +        items:
>>>> +          - const: mux
>>>> +          - const: pull
>>>> +          - const: pull-enable
>>>> +          - const: gpio
>>>> +
>>>> +    unevaluatedProperties: false
>>>
>>> Wrong placement. Rob asked you to put it after $ref and the review was
>>> conditional based on this. Don't add review-tag if you do not follow the
>>> comment.
>>>
>> I wasn't aware that this makes a difference, and in e.g. samsung,pinctrl.yaml
>> I found it at the end of the patternProperties block.
>> Thanks for the hint, then I will correct this and resubmit.
> 
> But Rob asks for it, so regardless whether it makes difference or not,
> you ignore the comment?
> 
I understood the comment as: It needs to be in the block, somewhere after the $ref.
My bad.

> Best regards,
> Krzysztof
> 
Heiner






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
