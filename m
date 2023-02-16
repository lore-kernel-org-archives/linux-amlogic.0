Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8326AC636CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 09:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggrKKQJ+naG9wS0l5JrOQdyHLlJyTj31gJhrrEaqVzY=; b=zFjsS5xMXQqZts
	bMrP/kUM1DfqjnwPYevPFD5jmX8bGK4BUoEe8nzEoJRk6eZOS9sgs52iLOVlHjrRDFykwAQIgnl4T
	tdMeCysItsN+iY0iU4kc7bePUKH1PIwjEE2JkTt2TqprqD8PwvPQfgXlzRfwGxQPCWhsjEStRQtNb
	N4cRdrD7a7dOKrCq0ekPmQCaRHB+IFiM3GIXLfKAXuFxX4ipSv9B9hAqiJ546X5y/4GoyxOTIQJ1P
	BtAmNAdgCMpqpihz92Bn9wHg9R8e/D18+tCiHYn/Ttyw7WpWLlEWs8HAALJc3fnW+GzUKvtSX4UWQ
	r2pJm+Cs0G8NXCN1yutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSatz-009Mzh-4y; Thu, 16 Feb 2023 09:50:07 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSalY-009JEd-Gi; Thu, 16 Feb 2023 09:41:25 +0000
Received: by mail-ed1-x52b.google.com with SMTP id cq19so1953700edb.5;
        Thu, 16 Feb 2023 01:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=quXyRkYVg6+mx+DMzdhBfayREmrzmAme5kuDUedg1kc=;
        b=SK8ihzgHkYOlKVe+I3WOjjwygNzbWa/CmSxn/zp/g1EHFhf0gqN3iUxqB+FnTetiiG
         n8+YYMHNm6WGjU7pwGBuSW7vmfxo3waI3++8SIy8nmMv72fmMx77cfIuYiLeCAapjZto
         ux+hMrc4/AIiwf0EZKaQ3kfFbRs2JGGpnMbLKq0edtordKzg++bIYpL4Cm/8IXXqEpM/
         K5rzI7gpLRA3U+6AMFARiaBXPiawTe9ZE3D7IapFDgrK3RdoKrHqE9U5ZxnDZIuNkmWJ
         cMJ2FH9q2X/xgiS5RY7Ni744PTaDx0TG8MbctGssCI01Sc14ewpilXrLWc8aoY4xtUhJ
         oMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quXyRkYVg6+mx+DMzdhBfayREmrzmAme5kuDUedg1kc=;
        b=t39zMpVIPP1anNmtVP2pXB/npqfwfaZApR7qb2Jz0V//3V0dTRYy2fScNplZNKBVKt
         tGt9qZrjKGZEG9OkMNUlp1by1ksG5x9lxjsAylySb5MsxRe5g8ERccgt31sB0CndQmzi
         lkDdXMIjKepcilMPxYDMFXzJA9qQ2EqdhRe6a+nyv+0OZWVPjAqxRydMZ+G3ejHRXNvh
         gnck7yHfCsgDqfstcTRsCLS6DImlep/6vT3YxN5FBMYGCg1vPunB/Ky0Ty7H7jqHlEkU
         Oi1FnIqekQ36z/4OMuuiYXVbGgYqCqZWIxfUebSqYE6iU+GtCmgVBuY/lVr/d6RX6yW5
         BHZg==
X-Gm-Message-State: AO0yUKUfbqv3QRw/sSYsk07nEPHO8IU7Egh/UjPE1CR7iTGnMx3iNLRM
	8Rv1gGpRru7SV0K+H3edTpY=
X-Google-Smtp-Source: AK7set9FD5gRjpvzIYNiDnade74qEPNtL0IkKV2yThzFTaeU2C7AjKii9DXNA59jARj5ihclamD8Ig==
X-Received: by 2002:aa7:d686:0:b0:499:4130:fae with SMTP id d6-20020aa7d686000000b0049941300faemr5402410edr.10.1676540481373;
        Thu, 16 Feb 2023 01:41:21 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4f6:7c00:a103:b0a3:f168:e08f? (dynamic-2a01-0c23-c4f6-7c00-a103-b0a3-f168-e08f.c23.pool.telefonica.de. [2a01:c23:c4f6:7c00:a103:b0a3:f168:e08f])
        by smtp.googlemail.com with ESMTPSA id y42-20020a50bb2d000000b004ab1f97ca2csm575997ede.60.2023.02.16.01.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:41:21 -0800 (PST)
Message-ID: <eef6172c-6d74-16e2-bde2-324227ca174c@gmail.com>
Date: Thu, 16 Feb 2023 10:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/3] dt-bindings: mmc: meson-gx: support specifying cd
 interrupt
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
 <1c5996a5-491f-39d6-b120-bbef86473729@gmail.com>
 <b87003f6-02a8-64fc-80fb-b90ca6bec37c@linaro.org>
 <723119a3-7c7f-6447-254e-bc340a1fe2de@gmail.com>
 <8e9d4c8a-40e0-65ef-ba72-ee8d1114ce97@linaro.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <8e9d4c8a-40e0-65ef-ba72-ee8d1114ce97@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_014124_622103_1D081A7E 
X-CRM114-Status: GOOD (  13.37  )
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

On 16.02.2023 10:34, Krzysztof Kozlowski wrote:
> On 16/02/2023 10:29, Heiner Kallweit wrote:
>> On 16.02.2023 10:18, Krzysztof Kozlowski wrote:
>>> On 14/02/2023 22:42, Heiner Kallweit wrote:
>>>> Support passing a second interrupt as card detect interrupt.
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>>>> index 46e235bf2..c8c30300d 100644
>>>> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>>>> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>>>> @@ -28,7 +28,7 @@ properties:
>>>>      maxItems: 1
>>>>  
>>>>    interrupts:
>>>> -    maxItems: 1
>>>> +    maxItems: 2
>>>
>>> Wait, you now *require* (not support) cd interrupt, so this looks like
>>> ABI break.
>>>
>> The second interrupt is optional. If not provided MMC core falls back to
>> cd polling.
> 
> It is not. Your binding requires it. Did you test it on DTS without the
> second interrupt?
> 
You're right, the binding misses a minItems 1. I'll add that and the
interrupt description.

>>
>>> Second, you must describe the items.
>>>
>> OK, this will be added.
> 
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
