Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA7CC76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tA1RCco3c6LN7yKvGsVLJBuwwF5YzNji6EsB+ZybIRQ=; b=fSzA3nERXAAZQNfpjqbNj7yxEb
	kx76hatFfK3UQmaqqiH6UqGeSxzxFrszl5Fe1WhjjnHy0FAynHUb2dSOwPxou7inpIFk9Pb4jyR7L
	pdCl2IuJChECgglQnSHNcwpKi4SIsbG6xL09baZ5/6JcpLMUPvMkd2+Uxus+I+FWenf8MU+enMAyA
	cqB0fDfUm5ykM3smQ4pplnoKVWxk+OlgDFxryXQ/8JzSCpz8lgMNN76v3ri3WFv6/Q2o1SoxcUBFX
	t6WeUQQuHxGtggJwO7poWpR5D4w/KEk6XNHgO++MFuLaMqSqjbUkAJNyRAkIqo2uS/0Ed3MKfimVF
	DH5PM6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnb3-00BFxw-2E;
	Mon, 27 Mar 2023 14:13:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnaK-00BFMi-1m
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 14:12:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso7508165wmb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 07:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679926350;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fKnoQ1IGP979Kt8TCBwbgTqrZMuWob8dGcOoVTk9Mns=;
        b=xIo433rYkzdQshhv0w4YajqWveo8kDFdO02NDrgL2+OyJotmdYUaYLjlY5rlx5s6XH
         Tb9Tz7PtAkGdQVNgbxbv/RGZXwPhydwRQ8Owfcm8K5+fXekpnxuZ4x5mBd7UsdOyKh0y
         xZkMAkpn4o5i7sdk33oQkznhLTUDO1qi2YKisjyi/Jgf7+bqqg3KojB97upu9HzA4W9Q
         yKa99CG/mDjTsyvxmND71zrB1vtls7NQ4b6cqQ4j/nlLGOvtSMyI9rqnYUgrBtLADD4e
         8X+Na+Q5T2pBqDn0QY3I6gTPR67uhyBYHmwmfplczL9pwGSUsf469KGucqG4SnAF8qSi
         unuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679926350;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKnoQ1IGP979Kt8TCBwbgTqrZMuWob8dGcOoVTk9Mns=;
        b=HsjynyVTa6N6uyDQCwebcZ6cUXTrb3xnN+zamEP09VM1wItywJf06B143cnRFUW/QR
         17zvLxMScOhrVUMvWNkQKPKF6QOE3MGnnOxOgR4Gghvwpwc8u6gYWgBWRl6y1ZHjZOSu
         E1026gMydRyXDMHHz7YTG/Qjtxriy79RNI+yNOKm8Lez3YXRUom46ivS5zN96ExSEqzU
         OH5ExivJgup6zHW6AE408a33GPYdpNnqaZU2iL9kPA0eEvQvIf04osrYXO9IMhPGI5tU
         rGVae1Njq9jFeDEarJ2tyHAi2JoFAez3cFL1JRGSXYDLHQKWb0qbOMnl2vs6Yc7YyA/9
         tCQw==
X-Gm-Message-State: AO0yUKXB+j0ORyGSNkAyOWsoLRpmOkYCk0KdvlXiNybXpbQd+LOFhwF1
	a2M7qXoErMxaN8IiT44dcqyKdQ==
X-Google-Smtp-Source: AK7set/BioTRThtgYoUpRpK1iQV3aUjlqyafv/MSXVLT+TCzV7sOZd5n/J0DhO10wtb6+Yoyi6Q5sA==
X-Received: by 2002:a7b:c5d4:0:b0:3ed:8079:27d7 with SMTP id n20-20020a7bc5d4000000b003ed807927d7mr9022949wmk.40.1679926350308;
        Mon, 27 Mar 2023 07:12:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2? ([2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003ed793d9de0sm22134610wms.1.2023.03.27.07.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 07:12:29 -0700 (PDT)
Message-ID: <09fbe342-7bf2-fd51-f401-d88e787078a4@linaro.org>
Date: Mon, 27 Mar 2023 16:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] perf/amlogic: resolve conflict between canvas &
 pmu
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>, Pierre-Hugues Husson
 <phh@phh.me>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
 <20230327120932.2158389-3-mgonzalez@freebox.fr>
Organization: Linaro Developer Services
In-Reply-To: <20230327120932.2158389-3-mgonzalez@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_071232_738494_AE50FF12 
X-CRM114-Status: GOOD (  13.58  )
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

On 27/03/2023 14:09, Marc Gonzalez wrote:

I'll fixup the commit message while applying.

> According to S905X2 Datasheet - Revision 07:
> 
> DMC_MON area spans 0xff638080-0xff6380c0
> DDR_PLL area spans 0xff638c00-0xff638c34
> 
> Round DDR_PLL area size up to 0x40
> 
> Fixes: 90cf8e21016fa3 ("arm64: dts: meson: Add DDR PMU node")
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index a5653ab1f0b43..1aab65bb5f578 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1585,6 +1585,12 @@ canvas: video-lut@48 {
>   					compatible = "amlogic,canvas";
>   					reg = <0x0 0x48 0x0 0x14>;
>   				};
> +
> +				pmu: pmu@80 {
> +					reg = <0x0 0x80 0x0 0x40>,
> +					      <0x0 0xc00 0x0 0x40>;
> +					interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
> +				};
>   			};
>   
>   			usb2_phy1: phy@3a000 {
> @@ -1710,12 +1716,6 @@ internal_ephy: ethernet-phy@8 {
>   			};
>   		};
>   
> -		pmu: pmu@ff638000 {
> -			reg = <0x0 0xff638000 0x0 0x100>,
> -			      <0x0 0xff638c00 0x0 0x100>;
> -			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
> -		};
> -
>   		aobus: bus@ff800000 {
>   			compatible = "simple-bus";
>   			reg = <0x0 0xff800000 0x0 0x100000>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
