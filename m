Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165A7C63797
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 07:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3mxhr7FTd94YzfZ+faQwLs3CeHb7qp7ITf/Ka6Ky0c=; b=cQxnmQ3cejmA6N
	PrcEX030Ae0e2gU3xnIQcS9arKetD6EUmGdmK6Yp8J1sGWoivqssKY86N+EuA/kAc2taKOAjMCvu0
	dTv3BscOM1N5fQVW91ncWiyf3GETUbwBL5taCs5f2FTMOTh+istRvqqi2CJpZ/AC5f9cC+R27U2nC
	Z8Pz791Zrlfw+GQ4ji2IQ93t/2dW5uEsUCyoGFHiSAR5mmlI7Jo5NJREdUTcXKWM2p2cLobPEuJ2V
	pDEY48Es/ZboAfG+ZqA3cx1q4u68HuY6trRfMr5hSLMir+RF+KWR46hMM2VAtAiTbkdP8uSWNWxqe
	ejCwk7TCUQfTHlU4G7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqog-000rWE-4C; Fri, 03 Feb 2023 07:49:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqod-000rVX-AY
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 07:49:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so5402813wmb.2
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 23:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v5gfpczBzl62sAvBqjyZghlCn5Q/6Yh+maXELEJGN6Y=;
        b=HAO2CNODWncVDUlMlFhIV6G/1KE+6/Sw6jH7FCGny1is7RMq7DDZWism/cSfO1QPmY
         YWpE7obG92rNxg0WDwlz+/itQXkq4uMNl05IuIg+/pAkBmLGzxSGwi5gdT98lReGF6c2
         OCy8iXA3/12Ozd8KXYIQDIF/TTUXgLnq+3AJzeZhb/6wHRa7CKIo/ZS5MtOTt/uU055F
         NRHplid1x2R11lA+5CO3Jpjo9z04B70XPxxXHQSs/6Et8FsOkIK3SUEPRvFlBNjnwzst
         OWF32m2lvF3SPrp18G/+YqmIQFNAgipHr3RGG5TK6SizVkqhhVw0i8U2LJfShkhBH1Hc
         E70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5gfpczBzl62sAvBqjyZghlCn5Q/6Yh+maXELEJGN6Y=;
        b=QxJD7jegocjEDLzwNckNSWVv680VB4jfds/iiO1puw9kIZ8g70sikWDOI5rHkxwWCY
         xa+Ex9ShdVvkQfuhoIeevnea1J/Jf3UvF7asvwJOwrIszqgJJ6+MIfIa4/u7dQMpqcDh
         vP+HX7riHGHXuo8LoO+4ihtUZLg0Uo9+q9eRUxrrSNnNSysgxyrGpRwedAA26oPM8UIf
         0m9Ao230U+IiKdrfdPg4pgySRNxW4Hmzy6NikS+8kJK03JOc4sG4SYzubBDPIzoOQNL/
         QY5rsfx6DRPd76wDa4Rrtg6MkTJ7+Qbwc6X8Yi9tvoqTwxUvSk1568TB3+xbZxBkfMvV
         njIQ==
X-Gm-Message-State: AO0yUKW8MeTAF9zUVqxMHv3bONZXPb2HVQuNdZ2Gf69U46jyZzqXhfY1
	bK/MeVEhj1XuqcBlI1lS/JdGRQ==
X-Google-Smtp-Source: AK7set+oqhPulJShRtcIKzg8mOnQKZu7gCG1/8sG+jlfV7LfKIvKHyV6ok09Mw27P/viyjbWaw/7mQ==
X-Received: by 2002:a05:600c:1c22:b0:3dc:37d0:e9df with SMTP id j34-20020a05600c1c2200b003dc37d0e9dfmr8634479wms.14.1675410535780;
        Thu, 02 Feb 2023 23:48:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y6-20020a7bcd86000000b003dc4480df80sm7001220wmj.34.2023.02.02.23.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 23:48:55 -0800 (PST)
Message-ID: <e2d4c841-b3f9-a23e-6977-4015f8f9de5f@linaro.org>
Date: Fri, 3 Feb 2023 08:48:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/9] ASoC: dt-bindings: create component common schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-2-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_234859_393183_88558306 
X-CRM114-Status: GOOD (  13.63  )
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

On 02/02/2023 19:36, Jerome Brunet wrote:
> All DAIs are component but not all components are DAI.
> Move the component properties (sound-name-prefix ATM) to a separate schema
> file so it can be used by non-DAI components, such as auxiliary devices.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>


> -properties:
> -  sound-name-prefix:
> -    $ref: /schemas/types.yaml#/definitions/string
> -    description: |
> -      Card implementing the routing property define the connection between
> -      audio components as list of string pair. Component using the same
> -      sink/source names may use this property to prepend the name of their
> -      sinks/sources with the provided string.
> +allOf:
> +  - $ref: component-common.yaml#
>  
> +properties:
>    '#sound-dai-cells': true
>  

Probably we should require sound-dai-cells at some point, but anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
