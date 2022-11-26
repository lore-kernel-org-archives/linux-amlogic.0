Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B58C4321E
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Nov 2022 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aaf+7lZeH8DnzewSOyVqNU4qpx00HZzHhwCl6X4LADw=; b=UQkbCrWfR9gjJm
	Wmbqk6yCp1+x6mM/3HteJhvHM8rzuX2jeS6tWPFCkc4cLEW0GJFtXwZ9OUucAciWpAyTjZuDSjrlk
	kbtEAfTHgzQHqZ+QX1AjXQ/PoIc7BPz2qDxPVBmZzkHZqXtaoXPrT0X/7oKm+5g9CJVTSvMrlytWF
	VM/glBeCQE9INRRDD4ofcDfWcLS568jM8vAk0y4fo3fvjiTGyP6M6Mn6/kqJnUxsuVMvLmYH1Y+Gi
	Q/vex2bUcgdsW6Rzjd542CNCsi10XdVQqBtn7CEtyKKVGFzjjhTKME4qtY4eHbdrhWB8WHm8g1PCl
	24XfoCpdoK+L+agP3HBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyw72-006Yov-MM; Sat, 26 Nov 2022 14:25:00 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyw6z-006YnX-6R
	for linux-amlogic@lists.infradead.org; Sat, 26 Nov 2022 14:24:58 +0000
Received: by mail-lj1-x232.google.com with SMTP id bn5so8176889ljb.2
        for <linux-amlogic@lists.infradead.org>; Sat, 26 Nov 2022 06:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6vLna4taitqPmXLIIkapuDDCcusBIaRbdtMepRsT1Lk=;
        b=bI/p49EaYjuVNxAB0YHtI/ULp6a34ypk7UGk8rPTjXj/5EGsGX9EIKYdE7ktAR7y/5
         HyDXWltCIJFyUhUilDAEmCLBbazUzVMG+7a0FbLVh21BRg0xE64M+3WJUlngnejDx0Td
         dTw6sqoCTcC4Bu4EV7ix1Sq2ffm9B5Mht+EWCubU1CD/NQ1G7UMMErff8PCKZ0jTAsGN
         jp4FTrDEblJ0SE0GlRxk37Jj+puqMl+N/yxMlxj6O/oryZsq5no3XMJ4RltHJwCHV+iX
         5tx/HfJYdaB/O8X9WPPPtI9e/bhe746amcH0JupCys9/jrWctaPYQNGCs/vu0UCVfuJ6
         d1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vLna4taitqPmXLIIkapuDDCcusBIaRbdtMepRsT1Lk=;
        b=mnzqA/NwobYUqgZqrBVRV0F44l9cJZ9pL9Uuolza/YMmi7C7EZuWP2vXJWM3/5ZOfb
         AWlYTb6Ko4tdF4+RsSEjoFPrR9oXHkY17eTj84yYVSFd9cASlGXK23kzlXJfK9nv2RRb
         8tZfnc16X3gkLnNZjoLslKmZGM2uzKeFrRECTjTryYXCw796zfE43fzuwKt/cSmFZlDP
         JDmrAt2+emhhhQZLk4PDloj7EHfT/exm8iwMUBcE5QtZE4FMRiVZipbYY/ORn3ja0INT
         pl2zF00yoZHCM79aKPByGZJTt2ppA06WuynlGPeU8dHZr3mCD2BUGNpErccoxexbEAWO
         8tZw==
X-Gm-Message-State: ANoB5pnbpR+pyqe2vSOayI14AJrlg/0PCMsosMYdh60C51haMwYPi/z3
	rJeNUHsNnmUYGH6h8tmRJeO36A==
X-Google-Smtp-Source: AA0mqf6bMS826cl9TH4JOInpUf9DZmNCB4YgAJ67hHhc1az7C1ec/rGdofviQdcKs36HpKCtZBLcgA==
X-Received: by 2002:a2e:9194:0:b0:279:7ffa:15aa with SMTP id f20-20020a2e9194000000b002797ffa15aamr4788408ljg.307.1669472693437;
        Sat, 26 Nov 2022 06:24:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f13-20020a0565123b0d00b004b0b131453csm956821lfv.49.2022.11.26.06.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 06:24:53 -0800 (PST)
Message-ID: <54f500cb-d7d0-8af1-eb58-99fbe71791a5@linaro.org>
Date: Sat, 26 Nov 2022 15:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: dts: amlogic: align LED node names with dtschema
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
 <3719828c-0ac5-34c9-a04b-251cbeb5f6ef@linaro.org>
 <a135f93a-235a-27b8-f649-69d62f6ebd30@linaro.org>
In-Reply-To: <a135f93a-235a-27b8-f649-69d62f6ebd30@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_062457_271250_CFE3CDCD 
X-CRM114-Status: GOOD (  11.04  )
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

On 26/11/2022 15:16, Krzysztof Kozlowski wrote:
> On 25/11/2022 18:16, Neil Armstrong wrote:
>> On 25/11/2022 15:41, Krzysztof Kozlowski wrote:
>>> The node names should be generic and DT schema expects certain pattern:
>>>
>>>    amlogic/meson-sm1-bananapi-m5.dtb: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>
>>
>> <snip>
>>
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Aren't you maintainer of the platform? This means I should take care of
> this patch?

Ah, this will be picked up by Kevin or Jerome? So this tag means only
Reviewer's statement of oversight, right?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
