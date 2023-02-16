Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26ADC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btinh+XzlbPyLYNJDmVgeMyQLSO+H80IPNDclKfTZgw=; b=u2fqv+YpSFg7mp
	y9LOdwDZy0vkgYQjqxx53UjLhlz/8fMg4Os5ITenIgRv02AET+MRG4AMAXkn8KGk40gomjRwztYNX
	DhI+t/39JH5B6KkwM+qK66ysKY18VfZaCNcr9m5pOqYqtha5IftchAIx5KssmGpmJTCe8eLIxdgJJ
	z85deRT/902mXAP+cBx0yv64QEjqRnp3TXfWwTdq8o/nzuPJXNYLFXUo/U4c49SUqAqQMgf09t/kt
	2ZRMxTsHpX9DSCptGnKNRMcEBUb0UM8+Chpk+ZJJRGupKEVZU0xnUnWUUiB4eRviVIlNgKMNnltg+
	utSNSTbtSyxjmpaP/umA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaam-009FtK-OJ; Thu, 16 Feb 2023 09:30:16 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaac-009FoP-8L; Thu, 16 Feb 2023 09:30:07 +0000
Received: by mail-ed1-x52c.google.com with SMTP id dz21so1829090edb.13;
        Thu, 16 Feb 2023 01:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rsPY97Yb49Y5FgSF3U74uFpbs2etiGuSLqzypFzafCw=;
        b=g8AHuQPOL0KbtLgNuQ3OlO2X1hOBflAHNSLWULqA0A4oZoC4vcFPCvaHiOm3nKowlG
         NPNN3ClJykznTJ14yuyCFW3Q0Hp88LVZYi/6q67H/GtxcanaKQPTqCF228Tu53MZ+vWX
         fcLDe3lwxdwD3V9aozeqfpC7sWgEh14YtWd8+NDWJW+5AhWcScDXnLJyx69p0gKrEa47
         pssYFIQ88X9XsdHYB/duGe7d0dYkxVaFyrk1ZnsXFYAwBl68/I95F8uIYhxjEYQVkRce
         lUPOsU+3MdE/aEQb7/hJzmfVskS859VLnr2V2SVdsqiNSfLdDQdLAtt5x+6AQfWQfAuQ
         ir+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rsPY97Yb49Y5FgSF3U74uFpbs2etiGuSLqzypFzafCw=;
        b=yaJnuROcTkRGl0Sk8eoMOLzfg4/Qm3aDNHGFR9mGp43EfdgyPhHpPpbUvFt7K7lsRO
         YX+v5kaItoXAO4zv71Hcg1uPiT88j90UDYSI0ynBlSP0ulN0CCLb5AZ2BbxJgYvpB1gC
         wC2/qEqfuZrgO1a4+9rcDjy+kctyGGQFMpmC5Eg6J3cih0DOkmnXRG/zboXXoxHzW+YQ
         StdD8BVjwnqWF/sHryChVQknrQBlYiol1dLzplXXenHcqrG+09jZP1g0VnkWHcrbuOhU
         4c2Bx8VSWdssTo7pcdFo9H64tm75Kd/Z/z5abbWI99JxLofSGb2fqdB3k2jBFf1WEMh1
         4oxg==
X-Gm-Message-State: AO0yUKUgJiE03JyDLSXfGXolzL5A6dH67qDBA0i1EXHVKyl8/1dVQQg3
	nwaJZn70K5VGMUurYvTgjR3+90m7CGE=
X-Google-Smtp-Source: AK7set/As+S00Pk3E9sDFYTcqiBB9PX1GCdND6YbLhUo+BAQk/u4DugqNJ0Qj0Y47EFSy8ZbyNd4rg==
X-Received: by 2002:a05:6402:180f:b0:4ac:be53:1789 with SMTP id g15-20020a056402180f00b004acbe531789mr5027357edy.40.1676539799932;
        Thu, 16 Feb 2023 01:29:59 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4f6:7c00:a103:b0a3:f168:e08f? (dynamic-2a01-0c23-c4f6-7c00-a103-b0a3-f168-e08f.c23.pool.telefonica.de. [2a01:c23:c4f6:7c00:a103:b0a3:f168:e08f])
        by smtp.googlemail.com with ESMTPSA id y23-20020a50ce17000000b004acc1374849sm548575edi.82.2023.02.16.01.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:29:59 -0800 (PST)
Message-ID: <723119a3-7c7f-6447-254e-bc340a1fe2de@gmail.com>
Date: Thu, 16 Feb 2023 10:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/3] dt-bindings: mmc: meson-gx: support specifying cd
 interrupt
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <b87003f6-02a8-64fc-80fb-b90ca6bec37c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_013006_330059_4753EFFD 
X-CRM114-Status: GOOD (  12.45  )
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

On 16.02.2023 10:18, Krzysztof Kozlowski wrote:
> On 14/02/2023 22:42, Heiner Kallweit wrote:
>> Support passing a second interrupt as card detect interrupt.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>> index 46e235bf2..c8c30300d 100644
>> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>> @@ -28,7 +28,7 @@ properties:
>>      maxItems: 1
>>  
>>    interrupts:
>> -    maxItems: 1
>> +    maxItems: 2
> 
> Wait, you now *require* (not support) cd interrupt, so this looks like
> ABI break.
> 
The second interrupt is optional. If not provided MMC core falls back to
cd polling.

> Second, you must describe the items.
> 
OK, this will be added.

> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
