Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F157C77B7D
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thp5NAY4FGrL363HerYPqoMdS3+9tGDJ+291ZT4r1xU=; b=J/9pLFVpZQ0ZUx
	d+7CUbhSngWX8rm5AclMeYqC2MNgwjR5BwxYFgvSaf7P43kkfogdYiEJXLzrWRbkOAgvP2guF+Zwf
	kYzScBkmQc6HsjGuFU7PpvmwjidBl1w5BXm4lBWRExACSYqOYavgBSXTgcD9/MHGBc4JO0O2VYmee
	YubfnSREqfTuT4KqPpj/U6JpSwqUS4s+a45k2SOGx51Ka5BH4gZHVajaEmslVqtes7r7l1TMHvpBd
	GKffMr1e/MKI3PG90KlOyY189xqlZoHmJnzmrNWIXAimz21r0OMwEHPY8lyaAaAvHooF7QDr9atet
	VjucDXagEDP2MU56tCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyV4U-001gNi-1e;
	Mon, 15 May 2023 10:04:50 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyV4R-001gMU-2y
	for linux-amlogic@lists.infradead.org;
	Mon, 15 May 2023 10:04:49 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so11121653a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 15 May 2023 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684145084; x=1686737084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XyEboodinoETFVIKDJ6MaTczEBVanL7D2yaqefiBb6w=;
        b=agNiLDnOYfkL2mCqKdqZSIiw70w52wrUzYgCUEB9n9qAUNdE3IdkTCGecuhuqmqtw8
         VbBnHMCmBZqIlWOujTG6Va8H4lYgd6yZCw8Hpsh1WMRMi6sWR9CV5Zz+PI9y7w66//fg
         arIWFcrfvMNI6tXxJfu9CJuqzfVPCCJXSFfujf2SlRVkcOVZzEbpj9uL91ebQdwYdGGG
         CbwgZp8Xda1ViZ6vvEebMUxYDF/F4JOxw/58B/jGCB4h0Cjhl291HV4z/BwINGd3eH5u
         3xWWfX6QvTTqZC9ircJRO5wuJMvJNb1rKfZ4JR+EFQndEWL5x+zFeDnzajqWMyvorZ5x
         c4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684145084; x=1686737084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyEboodinoETFVIKDJ6MaTczEBVanL7D2yaqefiBb6w=;
        b=khHJyZ0kNYVoBboHC8LFIOj2cAu0yW8EgfxB2gKmVJVNiSUvlTZRw8zEdJ57SFAXum
         1llRr0L7Zn5GtiiFbDtxuw412zlwzCymxc7h3FuKtAIMXAMnFYIXcv/bFahMPiDvdUXX
         lnr+28EvT0fN6GBhnlr/78kgjT1H5uNUvViAprUA7JvQPpN4DR5ZFSW10Pdi6hP7MwJ+
         fPuzRS35WCgjCG1Jk6x8FxW60gr4xwd28/CR13jP//DtB+UlnBUzcaTWH/0W7JLPseU7
         nO0wUdo1z/xq40xpuAiSIAKME24inUZveB1sSc9RgI+EfznFFa/yFCKYCXHDdDebLPNN
         M8pA==
X-Gm-Message-State: AC+VfDy4sRKcEOrunAfXOXnefkQoHjZVlomjdQz9LQjpx5mfxUfnHhms
	E7SPB4sGEiQbmMeAej+jpw6WyQ==
X-Google-Smtp-Source: ACHHUZ5HNnM1GF9ntlgBSWxnLUIuD7ee0ze5RiVw+zE9WMPn5mg3W9l+AOnJxUyQYhNRbGifB0Mx6Q==
X-Received: by 2002:a50:ec8a:0:b0:50b:c275:6c56 with SMTP id e10-20020a50ec8a000000b0050bc2756c56mr26793165edr.16.1684145084277;
        Mon, 15 May 2023 03:04:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id s15-20020a056402164f00b0050d56dffc93sm7229454edx.12.2023.05.15.03.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 03:04:43 -0700 (PDT)
Message-ID: <0b0c8f9f-bbb0-16e9-1556-eb2ac8cf1981@linaro.org>
Date: Mon, 15 May 2023 12:04:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230515031557.31143-1-yu.tu@amlogic.com>
 <20230515031557.31143-2-yu.tu@amlogic.com>
 <590560c9-4da6-bbd4-6aac-de57ab5403ba@linaro.org>
 <8c6ad0a9-7820-c7a2-bd3b-1eee87d96728@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8c6ad0a9-7820-c7a2-bd3b-1eee87d96728@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_030447_985940_44FF9D0B 
X-CRM114-Status: GOOD (  15.70  )
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

On 15/05/2023 09:35, Yu Tu wrote:
> Hi Krzysztof,
> 	Thank you for your prompt reply.
> 
> On 2023/5/15 14:32, Krzysztof Kozlowski wrote:
>> On 15/05/2023 05:15, Yu Tu wrote:
>>> Add the S4 PLL clock controller dt-bindings in the s4 SoC family.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>
>> This is a friendly reminder during the review process.
>>
>> It looks like you received a tag and forgot to add it.
>>
>> If you do not know the process, here is a short explanation:
>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>> versions. However, there's no need to repost patches *only* to add the
>> tags. The upstream maintainer will do that for acks received on the
>> version they apply.
>>
>> https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540
>>
>> If a tag was not added on purpose, please state why and what changed.
> 
> Yes. I don't know the process. So I need to add Reviewed-by: Rob Herring 
> <robh@kernel.org>. And resend V8?

Yes. I cannot add it top your emails.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
