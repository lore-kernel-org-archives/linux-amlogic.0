Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5A8EB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Wj1F0IpDyGmI1X8WO0bzC//V89/SO5pD0nqtbUoOCw=; b=DeJg9IMqf0/41m
	egLmXiX6gbrLGBXiT3tR664jSJ47v6wcQ4nhhUPjOjcYGK50My+oOkEcY21nS83P9rwk/aIwYuLQx
	RnYjwbHS5kZ4bDxp/8pmAAa8k8SPOBSkP0cLkK3Linbx3orgFaNJR0GWAUp5/2BNPanAPa38IvP+U
	PBxZ1aevVOiFYq28PYiJAqObyErzlruQ6NHiYhtBTACPVASVF9bU+Lymp5YWescZJGE/rnOazUaVp
	cIs30F9OSBqzqsok70MzwetTGcoFNlm0ForB4LSQ5XyzHrigU/m5qHh7kBS/px1Gc54XsLPBeEkMd
	6YNcauGK6oiKTqpR4d+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qByGk-00EjnG-1d;
	Wed, 21 Jun 2023 13:53:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qByGi-00EjmI-1f
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Jun 2023 13:53:09 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f8fe9dc27aso45746555e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Jun 2023 06:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687355587; x=1689947587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btW/W684ILT1WDrtjGRP6au9Hja0Menok2T+1KUPWVs=;
        b=D7wt0OWSdkzK677jMrrdq6NydxVLYfuDAP5Sa90ke8buB0GEYxW5w8wIMAMEssozYU
         4vi/WDwpDyUEnnr+MDrC1LEGnTCB08d+qoWcUy5b97cNg2ZqYK2WIunZU1bUP0/DuQam
         B/shkwO9K4UeGZHsZ7uN8JY0r3Q3mNpwZgSPrYnil+tXiVOlrn0BOwDy9dsFXrrnVX2q
         BRerOGyNrsci2pZxqr7YF+iYVT1o9DzXY3pYdCtLbdpCKhOzDjJ8RTdQdkQIO57+FrXq
         SwLFlhK67JTRmCRf/YLJlxNWePU00Q7zDp9aiSwAb5V6L51aP435DLLteYLp4cxf2vHG
         DbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687355587; x=1689947587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btW/W684ILT1WDrtjGRP6au9Hja0Menok2T+1KUPWVs=;
        b=clQ1Vdc+WayEM4BPiebHsz+pZv2OvaE5anJPGeu7ZNtX46fC0qEHAtPhKkzwjH/8A8
         2fxoDLFqeGnBw2JaATNpbENJ7VeyA5gOewqYAO7KDgc62k0bcqy6HjUu3a18aTdyZpVy
         6FdsquhtPxH8NlC8MpqiZRq5V1M+hEVYCsPD/Wb3/ec2Cz248C8+R3kPm1SYql1+34ai
         80h/1nNqhv13WrzEQhuioz3U3WSXHuXJeD2PUNihtFczHFOQITXunXHchA6m/cJz7qPw
         TZx2WKDPUKGAlDymg2rB8Sfm2D5NXI0PmC9G1kj5KgRN5zjBEJpEsXWLsg7BMbja/LI1
         uDLg==
X-Gm-Message-State: AC+VfDyYTIC4Tj2Lx3RCtohk07WRkTapWRaxbLyCzUGpp1OzCr1pjWCx
	nHJqBzk3vUUGhBRsz7aI2AuDfQ==
X-Google-Smtp-Source: ACHHUZ6CjZCsBGzmv/SX+exJxEkW3wxvQ20zaQkPvlLAyy5XDVid0KGHqt/HCje2hkpyIdODPFR8Fg==
X-Received: by 2002:a7b:c407:0:b0:3f9:bd21:eb5e with SMTP id k7-20020a7bc407000000b003f9bd21eb5emr1857115wmi.29.1687355586931;
        Wed, 21 Jun 2023 06:53:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id q19-20020a1cf313000000b003f7361ca753sm15884772wmq.24.2023.06.21.06.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 06:53:06 -0700 (PDT)
Message-ID: <20f25e98-d02e-f914-c4e7-72bb9ddb1ae5@linaro.org>
Date: Wed, 21 Jun 2023 15:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Nick <nick@khadas.com>, Artem <art@khadas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230621133215.109254-1-tanure@linux.com>
 <20230621133215.109254-3-tanure@linux.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230621133215.109254-3-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_065308_561955_6F8B7285 
X-CRM114-Status: GOOD (  14.00  )
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

On 21/06/2023 15:32, Lucas Tanure wrote:
> Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
> There is no need for an extra compatible line in the driver, but
> add T7 compatible line for documentation.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> index 01ec45b3b406..860ab58d87b0 100644
> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> @@ -33,6 +33,7 @@ properties:
>                - amlogic,meson8b-uart
>                - amlogic,meson-gx-uart
>                - amlogic,meson-s4-uart
> +              - amlogic,meson-t7-uart
>            - const: amlogic,meson-ao-uart
>        - description: Always-on power domain UART controller on G12A SoCs
>          items:
> @@ -46,6 +47,7 @@ properties:
>            - amlogic,meson8b-uart
>            - amlogic,meson-gx-uart
>            - amlogic,meson-s4-uart
> +          - amlogic,meson-t7-uart

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
