Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8799C4167B
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Nov 2023 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wu/2G7Adks/y7Gk2lUULUmCdlLn9LuSIn5H0A2ancw=; b=RQ1z9THG9YUSPs
	VonUeXUVuxjjZNTdnUZi922xDzfxG+ILCU7FfC7P+mq25ljU9E3bzCSfYrgA+clxzOXiilzG3sc1f
	alr5WHzFFDFXcVAeSxevsN9GtisCI2vrr4PLFZam7TEURvVfUpvNAMNaXzw1eJ1EGxyRYfwnd3wLG
	t4jmlkZBugPGD48SjKJ4sO11QaChHWlc7lC/oJcz8DaUG33DcS6kLCrPp3V0ugsojn+nIUeFrcyPu
	vDdDJoXWy4lcdHJFoUe7VLWyz0tF18V5B1G0wO8RSu7f2VGM1txLbpnICij8qdiKWamOw34b9/7I4
	NhDyhGwiJi0ez4Biz6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cWt-00AEGz-21;
	Thu, 30 Nov 2023 08:36:15 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cWq-00AEGX-1q
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Nov 2023 08:36:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54ba86ae133so577200a12.2
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Nov 2023 00:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701333371; x=1701938171; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ObsOROnpkbSezGJjA9kHVUriLkfnwLirBce/YF+bAkk=;
        b=jBweGiEQTPU5TQi5NCT1R2IwKh8NScnTwmudyhA+TcbVxdeeQu9PwURH+/AYKtrJ2Y
         Dq3scUX5Y8MVqfgp8qMfcYoUNKunE511ljTUFyPjzd0gxP8x+brTUUSL5rZPxnJ8+5mH
         AP1mQpsIAJ2WkgenMB0VPaphMGq/rq4iDTxDYjVNLTJoh3kI7hhYbcJspCdLS8EUtn9X
         gZJqXXpn9XO4lAmtm+NQNYlvGicr7O2sasuXayJPj4CWOirMVzWNie9HIKi3thzsx9k1
         jt9YAlrGYDPZ4ACb69PrwORMouazxago/TC2eK7AdZiXgDRfWTa1H19jNGlRq1L7ByTd
         B9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701333371; x=1701938171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObsOROnpkbSezGJjA9kHVUriLkfnwLirBce/YF+bAkk=;
        b=MozGMBH9T81eXUWt5prkJS1VsxDefGZp90M4cBWTGo0m0Y7OHbPsipNseBXIdHCnnp
         cWxM+M1r1yMPOkRYW3oGDj3owmr8xhXalDdQd4OlE98QIdackqo/yK5lU0balTidsqdJ
         IXYMDkZGFci9v7d8ZJn37H0ZnmjCf9y1gvX9ZxZlds0sd2vYK8514bgryGMoVGRsNuJk
         xSYjv2e+r7BnkF/mnQvUCp+6xXymPvj4TEsN7h96JsRjeGzxHMH2d61EYQx6Y5D685c+
         dS4i5hFRHMdJL6qy15WIlQMZGQM0ipBCPGHdN3gpXBNWO4i5xGZWWYhSHFQmBJS/Llzs
         JDgQ==
X-Gm-Message-State: AOJu0YzN5GvL/GoXXcuYGUIktNnq+7ujnkHatCL1oPls4ZjYJWPmNKIe
	MTPH2JsqJNT3Ht0ImISJ7y+ONQ==
X-Google-Smtp-Source: AGHT+IFijJ2dL0rrwFIC/oGgYn4XPWGR8i7aEz1lHlvxrn+1Mp6Ra089obwQTTw8dewalQdjd0NDCA==
X-Received: by 2002:a05:6402:520c:b0:54b:4067:6274 with SMTP id s12-20020a056402520c00b0054b40676274mr12578151edd.5.1701333370929;
        Thu, 30 Nov 2023 00:36:10 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id y24-20020a056402135800b00548d649f638sm313478edw.96.2023.11.30.00.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 00:36:10 -0800 (PST)
Message-ID: <e127dcef-3149-443a-9a8c-d24ef4054f09@linaro.org>
Date: Thu, 30 Nov 2023 09:36:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Content-Language: en-US
To: neil.armstrong@linaro.org, Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 JunYi Zhao <junyi.zhao@amlogic.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231129134004.3642121-1-jbrunet@baylibre.com>
 <20231129134004.3642121-3-jbrunet@baylibre.com>
 <8e78be99-3d4d-4f79-9791-404e60bcb67c@linaro.org>
 <1jfs0ojz1a.fsf@starbuckisacylon.baylibre.com>
 <11f8d986-3e97-4191-b46c-ad3166ee6dc7@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <11f8d986-3e97-4191-b46c-ad3166ee6dc7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_003612_621798_D299387F 
X-CRM114-Status: GOOD (  15.49  )
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

On 29/11/2023 17:41, neil.armstrong@linaro.org wrote:
>>>>    .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 52 ++++++++++++++++---
>>>>    1 file changed, 46 insertions(+), 6 deletions(-)
>>>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>>> b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>>> index 387976ed36d5..eece390114a3 100644
>>>> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>>> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>>>> @@ -21,23 +21,35 @@ properties:
>>>>              - amlogic,meson-g12a-ee-pwm
>>>>              - amlogic,meson-g12a-ao-pwm-ab
>>>>              - amlogic,meson-g12a-ao-pwm-cd
>>>> -          - amlogic,meson-s4-pwm
>>>> +        deprecated: true
>>>>          - items:
>>>>              - const: amlogic,meson-gx-pwm
>>>>              - const: amlogic,meson-gxbb-pwm
>>>> +        deprecated: true
>>>>          - items:
>>>>              - const: amlogic,meson-gx-ao-pwm
>>>>              - const: amlogic,meson-gxbb-ao-pwm
>>>> +        deprecated: true
>>>>          - items:
>>>>              - const: amlogic,meson8-pwm
>>>>              - const: amlogic,meson8b-pwm
>>>> +        deprecated: true
>>>
>>> I think deprecated should be moved in a third patch
>>
>> The complain on v2 was that it was not clear the new binding was making
>> the old one obsolete. It looked to me that the deprecation old bindings
>> needed to go together with the introduction of the new.
>>
>> I don't mind one way or the other
>>
>> Is there a rule somewhere about this ?
> 
> Not sure about that, I don't think it's a problem to have both valid
> at the same time, setting them deprecated afterwards looks cleaner
> to avoid mixing too much changes at the same time.

For me current order is correct and intuitive: you add new binding,
because old binding was wrong, so the old binding should be deprecated.
Otherwise you have a state with both new and old binding and one could
question - why did we need new binding? For dtschema it does not matter,
but it matters how we read the code.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
