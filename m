Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F96C636CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJ2BOekqtE3eaUGnczT7EthLQfO7s1o0uIhWWfjOes8=; b=kUmrnCeK8f8Kz9
	9qc10FtdyUHgbhv5Z3FUwKRfoWnImlomBssxbqpPMJ1FUVjvyTMEzbxCWcV5RvC2xL1pay5QsVO+f
	z0Lu7h2cl+F/+6qdRw6sgjyEFPYFmMJeFmTGppC5eri01ldRDbhg56usGP4wtq7Utlt25H3u+Wks1
	uwlyQ9J2EPr08ZYFa1s7JFmUlZl8AxjzFgLBVzweqKyNqAMlTM2B8DV7Yt7GPzmag6axtL3aty3ni
	ppZzCfMB/umEGNTAfmXagcvM7Yl3QW2u5hPNfSRpKXSXjUUclDZyzXBsPn6gwLDRZy8Eny6N4AuBs
	6DxFdyM5+Oj8Eg8hvzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSavp-009NlX-KY; Thu, 16 Feb 2023 09:52:01 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSatT-009MoY-Jv; Thu, 16 Feb 2023 09:49:37 +0000
Received: by mail-ej1-x636.google.com with SMTP id ky6so3832453ejc.0;
        Thu, 16 Feb 2023 01:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oW7oxsmghjRgR/cEvtjdj9saOc+kRxMn/Fex28SetPc=;
        b=dcbybFIFYOy3iMs8HnGAgDdGjQ32Pb/ch7AJenbUPn7vWRTK5AUUwxSq17fynnD5FS
         cr2QPcPFKw5Untn7PdDOk2/fRS6W1Qcdyg/WjiOgSKYvE46XX8vPkDt731pVgGFl/mWy
         u9wtOR/GEkqV7Am0CXOLFpyzHcJijHW9rttFROm1zQBg6XM7vR76bTJLx5qh5yjT40pD
         GLMheivSESZ+rZfhXh1Fu48r9reL9FziDY+NMOm96JR1ZIZGJF6nMY/Vc/RDwkEoGI2q
         gO+Oo/XPyOZGf82agnXKKurfAUcbrvaem4jPU7sYts1z/u8eHk/D8NR/YNa9QakILJJ4
         3DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oW7oxsmghjRgR/cEvtjdj9saOc+kRxMn/Fex28SetPc=;
        b=4eo99wgBlSdoptOtZG3s8Qf8pQ8oeusAZbAONetsCpiP3wL2w/joTUF6JVIBoWy9oY
         T3VnrYpxnRUkJfrzuWNCn9rvf+p7KoEgUPi4wjRPsQIi36AJdO7jYRn0SYgJPHaMTmvN
         P5zDczP30qtbuoXXEuNF5xKp9sV3QuP6iNhDMVrtS/JeK6Sx0BXYwDeXKxUI+t8bgmUw
         mf0iQcTd7MWbLE1WhjWFoICksTy7DhmD8FSlmka/OACThoG7eKTUiyVD6mbt0Vpj2QHo
         JC4zk88QQOvBF6V68cFpBL4D7bBzjIjvmQfNArz1Ktqv5soT2OcDmOCcq1y2RsDRiQzt
         SHRw==
X-Gm-Message-State: AO0yUKUIehRg37RAG7VNkXZOkL3WXJCDUnscipkk30oX1OQnW+8cU0UM
	t2ioaOQ6A7lYtpOa2Z4m3lI=
X-Google-Smtp-Source: AK7set8LaL2eQT8EV7iN1nX0qmp+S7YV4SUpTc9cLS0GsA+mCh4hU2NC8s1uLRwM+LDKyrMrGsY5DA==
X-Received: by 2002:a17:906:1d07:b0:8aa:c143:ffe1 with SMTP id n7-20020a1709061d0700b008aac143ffe1mr6016272ejh.48.1676540973842;
        Thu, 16 Feb 2023 01:49:33 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4f6:7c00:a103:b0a3:f168:e08f? (dynamic-2a01-0c23-c4f6-7c00-a103-b0a3-f168-e08f.c23.pool.telefonica.de. [2a01:c23:c4f6:7c00:a103:b0a3:f168:e08f])
        by smtp.googlemail.com with ESMTPSA id kq16-20020a170906abd000b00889a77458dbsm589492ejb.21.2023.02.16.01.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:49:33 -0800 (PST)
Message-ID: <bcd24667-731d-8a6c-82aa-4763d033741a@gmail.com>
Date: Thu, 16 Feb 2023 10:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/3] dt-bindings: mmc: meson-gx: support specifying cd
 interrupt
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
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
 <eef6172c-6d74-16e2-bde2-324227ca174c@gmail.com>
In-Reply-To: <eef6172c-6d74-16e2-bde2-324227ca174c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_014935_772235_63C4E4EB 
X-CRM114-Status: GOOD (  12.44  )
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

On 16.02.2023 10:41, Heiner Kallweit wrote:
> On 16.02.2023 10:34, Krzysztof Kozlowski wrote:
>> On 16/02/2023 10:29, Heiner Kallweit wrote:
>>> On 16.02.2023 10:18, Krzysztof Kozlowski wrote:
>>>> On 14/02/2023 22:42, Heiner Kallweit wrote:
>>>>> Support passing a second interrupt as card detect interrupt.
>>>>>
>>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>>>>> index 46e235bf2..c8c30300d 100644
>>>>> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>>>>> @@ -28,7 +28,7 @@ properties:
>>>>>      maxItems: 1
>>>>>  
>>>>>    interrupts:
>>>>> -    maxItems: 1
>>>>> +    maxItems: 2
>>>>
>>>> Wait, you now *require* (not support) cd interrupt, so this looks like
>>>> ABI break.
>>>>
>>> The second interrupt is optional. If not provided MMC core falls back to
>>> cd polling.
>>
>> It is not. Your binding requires it. Did you test it on DTS without the
>> second interrupt?
>>
> You're right, the binding misses a minItems 1. I'll add that and the
> interrupt description.
> 
Ulf,
do you require an add-on patch that fixes the binding issue or a
replacement patch?

>>>
>>>> Second, you must describe the items.
>>>>
>>> OK, this will be added.
>>
>>
>> Best regards,
>> Krzysztof
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
