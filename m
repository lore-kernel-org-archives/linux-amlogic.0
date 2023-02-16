Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55B2C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02S1r5AaolA82xdeoTKOVrawGYMXCQlyCQO4azr6Jy8=; b=noiP3VPhFiPOOPwwBAIMun98ZD
	6YXXdN8hrE9wYG5HgJwJerJkyMyZmlZK4498DCPZ2A9D+S2DRGhGc327GoTWBf1vQeMowEo/zgxwc
	/6T30AmuUQQ58xLEx3fEnmIVg31GaNtsDmWTq9WoHdHX3OUqfUaQyUpT68TKWM8Y6YLKNpz6xS2RU
	shQsB19neTev7I8cu1ZwukSmcRRp8fLSQiFpm4Ui8XYfRwZkYUeU5bGZ+dexBaWyey7dI4+3TdUt7
	gjkw/TfuCtjlHnvYBZKC/JN2EfTyvqMPrhS8JWJxeSZrxqUF3zAFWf4NqR4n4a4uLQsl+Fvti1KmS
	Y5rGDhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdkP-00ACny-Ev; Thu, 16 Feb 2023 12:52:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdkF-00ACls-5l
	for linux-amlogic@lists.infradead.org; Thu, 16 Feb 2023 12:52:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id n33so1531530wms.0
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Feb 2023 04:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3fURNFwbiEdBhrpBfrsEhNqdNbbdKyGMjFWCZrl9ICw=;
        b=MJSZe0XdE7hWpZfFDi3EAkuzdy7c8YEweCJMwKpcADEai0u15DFqmcOkoDvjExQTNa
         PGvJhh9XBhw+UlOIjzHld3Z4O/lHXZ9C8pFO+ro0isFF2RQ5zY2K/WpESSPUOPNeCjoq
         qgabMPLc1NtSucZ27e1l/6zEIEtkMJxo7xgmEVyh87W4Gcljm/psyRzfY6g0ThJdTlI5
         7LuIoRsBmosiX4RMdTXEMoOTJ3whb/qzFnzNk+EwuL7NeeecTUc9SdpT9iiAEXlYrp5Y
         CZhO2/lEDx4zE4tyB8FjuUYCICQHMS+dWFhicTSx3izpzO2TnpSdIfK2Dj//V1eslWid
         ooxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fURNFwbiEdBhrpBfrsEhNqdNbbdKyGMjFWCZrl9ICw=;
        b=Kkv1iUYjhfGE7IKhMTUeW9QKo6vN0xLtG7iv4j7rmMBIGomJmvBNTvNexEoJ5ASrnn
         FNJfiq9m6DWJm6tfosVgPjFUS93y18+ixjkSz91AJFfZDdT6CdTtTcSPQlnjSvJma2fD
         UugvLVfE/2bwDelnZWkL/n6yKOOJ5RIYQ1m5JVV8jH6THVuBcgeLaILr36JwW3zsXeOe
         AktSP0NVeRXlOEcd3zwtOwyMHNlU56jmIdg4hGq9prMY0ApSnK1YTQtHVMb3/1lOIy0x
         cK1DQVCpFUMxAAkM/yiLH6kcKQS6h979yjC2AXysbFzFkBO1m24aSo+1ezUT5IGY8LOc
         h/bg==
X-Gm-Message-State: AO0yUKWv2C346Tc10uhra/wSvOmRTaL8yUXi7mWkmbHuz6sSYKSkilHb
	haYbkoTAYp6KHDf7iEYeXul9ZA==
X-Google-Smtp-Source: AK7set94rPRKvqc3t74D75F2PTN7qeKsoMoOgT33uDhuTptxL7rcZglfbf8sW5s9AoblSSdXHQpAGg==
X-Received: by 2002:a05:600c:4b29:b0:3e2:147f:ac1a with SMTP id i41-20020a05600c4b2900b003e2147fac1amr1256780wmp.21.1676551932009;
        Thu, 16 Feb 2023 04:52:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:13e4:d5bc:1ce7:c1b6? ([2a01:e0a:982:cbb0:13e4:d5bc:1ce7:c1b6])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c348400b003df5be8987esm5308945wmq.20.2023.02.16.04.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 04:52:11 -0800 (PST)
Message-ID: <21ae5f5f-2336-db5b-f98a-f83391e1becd@linaro.org>
Date: Thu, 16 Feb 2023 13:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: mmc: meson-gx: fix interrupt binding
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <d5542f6e-920e-93cf-a453-b0601d03f48d@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <d5542f6e-920e-93cf-a453-b0601d03f48d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_045215_241734_D0371360 
X-CRM114-Status: GOOD (  12.53  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16/02/2023 12:49, Heiner Kallweit wrote:
> Reflect in the binding that the cd interrupt is optional,
> and add a description of the interrupts.
> 
> Fixes: 09b31a610328 ("dt-bindings: mmc: meson-gx: support specifying cd interrupt")
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   .../devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml         | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> index c8c30300d..cd3f75821 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -28,7 +28,11 @@ properties:
>       maxItems: 1
>   
>     interrupts:
> +    minItems: 1
>       maxItems: 2
> +    description:
> +      mmc controller instance interrupt
> +      optional card detect interrupt

I would instead write:

interrupts:
   minItems: 1
   items:
     - description: mmc controller instance
     - description: card detect

and drop maxItems.

Neil
>   
>     clocks:
>       maxItems: 3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
