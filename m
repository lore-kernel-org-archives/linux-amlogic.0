Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94872C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 09:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4+LVOnhZXTxBqaUb0uh8IsIsIhPZQ8A1ITlxhU9AZg=; b=rQNEr6XKe0zUcW
	GjnFNGCkkL1szvOgJSnl7pmaTNDKdkxQJPnqPv5ghXi9+8x6v2N2hZvYzmDTrw4pVrw3x5iXiW3vY
	9N+3uoDc5eUataAXAAyGzBKnhJ0L2XfoTNKwmjxwdRC5UQiOWNutyxVsvmt8N1Zc2vdDXyMVdzbbw
	Qa0jK1GX7r5wv5ikb6eErHlHXV3A42UNImxThA61/uV3AI6u/zLjAhaYrBOgdA2H5Ak2v5jRmbEl4
	fxSqU1/YYywJ/nQdfQ9awi0451FFsIbBXoLjsdAzZEd64KocSmgOX+ktcR+rmKgt1o/79dYOlS/zi
	xYjLjvPVfJBD9hXO+e4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSafJ-009GqY-Pq; Thu, 16 Feb 2023 09:34:57 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSafG-009Gov-El
	for linux-amlogic@lists.infradead.org; Thu, 16 Feb 2023 09:34:55 +0000
Received: by mail-ed1-x533.google.com with SMTP id t16so1869805edd.10
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Feb 2023 01:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svWlMyI6wlXGD9pTyPzUoADIQ1sfpe0Mys0Y7wrsKnM=;
        b=rwf8EHFvW0kW3XMm2w0YFkmx4JAKlvc3viohkBszIsyDH4rHJxkgGQTMTYzPHB8CdA
         SB0OZaT0FjMRCP+17vXbb48oXVrHgcz8y61IbSU8kEvafFm6e/Tb5C3WQeFoUxKucYLY
         /FAqAabTRqkWk3mrC4u0qVUJ87mNykTjEaj7d/F1OlHYSxTnjKOQ5BfLKDAS6Bk+K+uh
         Jb31CjnwLO/PwkTnhZ1gyoBEU39tZJh2w3tBlZmOzEfBcw9WkUCJ39gmQB0tjEBSwxEL
         smyUnLonCeuB/bQULncq6F9uy7cCB1T1YDT52+jZGwRL8na7S/svLNFfjLxf/cttW6Wd
         tivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svWlMyI6wlXGD9pTyPzUoADIQ1sfpe0Mys0Y7wrsKnM=;
        b=P+FGOJLpnpnroxVJfueLBJXf6oTuUJZlS4vI3lmYwL37CaxyPqlecFo3d9Y9yjyjro
         9I1MSHXMFIkx9jgQUIA9bdj/Hn38ZnvONZteGi7eiJPVESZuq7LVlpLeVujaIhDqqAcT
         cjCSQC7594O+FfBal770RsQD6qw2FDmt0DapeJxm94ZmU9CfP1J7llPscs5OPq7TzASc
         m77JmQX1dFAWVnTVOmRyH2SJz7MYpM54JsfNhsqJL0H1uElK+3Uyw/OLcZmUsnO9kLOm
         yAyTYLTgRqQesyyQrjlxtVo1B14UN7wHlG9Gw8jprjPuhVAWhjGI0ToRpbK6orfpfOZn
         rEBQ==
X-Gm-Message-State: AO0yUKUmQ6ZSETKwBdjF8VjHyZcqcizSrzimkHsbqh2+j7b9ZLF925I3
	IuLD/NDQANUeaXwVt9E5bYn4mw==
X-Google-Smtp-Source: AK7set/DywjlEvfAgh0u8LhyD8kSk6ewjjo4pcqO5hdesVF5obdc6Q7Zjlx6CvKJGOFdN4SGcYriag==
X-Received: by 2002:a05:6402:885:b0:4aa:a248:a153 with SMTP id e5-20020a056402088500b004aaa248a153mr5000114edy.3.1676540089178;
        Thu, 16 Feb 2023 01:34:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r11-20020a170906c28b00b008b1347773ccsm577463ejz.144.2023.02.16.01.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:34:46 -0800 (PST)
Message-ID: <8e9d4c8a-40e0-65ef-ba72-ee8d1114ce97@linaro.org>
Date: Thu, 16 Feb 2023 10:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] dt-bindings: mmc: meson-gx: support specifying cd
 interrupt
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <723119a3-7c7f-6447-254e-bc340a1fe2de@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_013454_526860_404EF879 
X-CRM114-Status: GOOD (  12.34  )
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

On 16/02/2023 10:29, Heiner Kallweit wrote:
> On 16.02.2023 10:18, Krzysztof Kozlowski wrote:
>> On 14/02/2023 22:42, Heiner Kallweit wrote:
>>> Support passing a second interrupt as card detect interrupt.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>>> index 46e235bf2..c8c30300d 100644
>>> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>>> @@ -28,7 +28,7 @@ properties:
>>>      maxItems: 1
>>>  
>>>    interrupts:
>>> -    maxItems: 1
>>> +    maxItems: 2
>>
>> Wait, you now *require* (not support) cd interrupt, so this looks like
>> ABI break.
>>
> The second interrupt is optional. If not provided MMC core falls back to
> cd polling.

It is not. Your binding requires it. Did you test it on DTS without the
second interrupt?

> 
>> Second, you must describe the items.
>>
> OK, this will be added.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
