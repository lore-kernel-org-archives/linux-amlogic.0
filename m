Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14946C001DE
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCILSV0i0E7ejWwpujUF53nlXDYEFU0cI4Da2p3Ge+0=; b=R2tgB7GXFDtqkaD94gx/EYeMKf
	VdRd3zDcVZfxiZGezOJj+BgJ1PUq+2mfbNrDJVls+UexuVd/YTbQ6fc2hdT5/3tn7TrHsKZ5VcpBZ
	mtyCN3deRp1Uoedg8hfphiotRp/CmGF5i7uVXzpH3kkoAhkqfj/eXr3atjGoTyKNmdihFRT8oTBKn
	dZs3Fn//PaC7wGTfJn+ajOwkGfUr+ari67gvxUZzMmY4W7pPeK5e5JNKxozCz31IVyniREOID0CXn
	CRaErlEAngAUNJOjPlBnakeIfUnzpQfmIskVBOZJpToHOn78qy5q8PBMgkmeK281JHhS6UKPbMv/b
	npWYfcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOYD-00EaO6-3C;
	Mon, 31 Jul 2023 08:46:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOYA-00EaML-1v
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 08:46:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso39143935e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690793203; x=1691398003;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wr9S1xevkiceWDkqzJOGXDauW47kODXtzJg0v0eVCYQ=;
        b=Fk8MgaPoFog3wIA3AJUKoUQceKgnRMQRHry3wmSVur7INMe7B2zyLfuQIc5HDSTuPj
         AtRU+XI7m8jAzTyoL1ZFpeGk19OGWmEFBbbhW3j2evZ+Y/L7TdrXBM7aOaJ3i2b6blDv
         fbm88HFPhW/6QQqAj4VsH7mYdO2HNe4Bt9bN8PWCDeBU4O+3JZmdOKEkVgn3dWAlBEUy
         qfRto9lbq5TKDd1K4sX/7XyHztv3NQaxRlnb09svePujAmMXKmAthtVf1S7ZBUXce/HH
         O1+iRm3V/RyM7+TmIUPymkTtXmIkqvQkvet5NCtBsIC1fH0LRBech3gu2/t73GHzi3h5
         vVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793203; x=1691398003;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wr9S1xevkiceWDkqzJOGXDauW47kODXtzJg0v0eVCYQ=;
        b=jPvP5Hd5TB8jSV51aEnNnLwHZip2Nip5iI0K3baiLZcHk98KM9OT4xN10yMRNB+Vdu
         9TVM4qGQ9ql/Xx1sTOu2FscgO39sCca9x87Ub+VSgD/0M85ArCgzBBUS8GozjPueCfC/
         AOlbh8LD/6dOkLdIvy9LgSI6k4y6HvUV7+TnQvKmcoy2sdMtvG1W5tN9nPnypjnP8bqg
         VItr2HvTC0uQleNuaanuLLutXfhs1XxuvKwFgDq2h7HMxAnxAsl1MLOqF7ABf/zQdU9e
         pm6IvSyJd5tY6LUnx5HsqsFq3dztgkXfWAK0s0MKvjNT+8eU9WQAP82YIPmNGp5rfsin
         SvWg==
X-Gm-Message-State: ABy/qLZESAecihOyB3eBYQvpMn6Lek1JOXE0UoU/gV6YX6vw1ezcxcwn
	cDxNn6aALarIrYmb61I+QOnXzg==
X-Google-Smtp-Source: APBJJlGReOaWf7EDwA4liFEYkK+faS6psAGzATwisa4wFGMbpJ2OF/FRsZPrmGGGYkW1JAMOFAF8Pg==
X-Received: by 2002:a5d:63c8:0:b0:317:6be9:538a with SMTP id c8-20020a5d63c8000000b003176be9538amr5711448wrw.20.1690793203393;
        Mon, 31 Jul 2023 01:46:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d? ([2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d])
        by smtp.gmail.com with ESMTPSA id d12-20020a5d644c000000b003142e438e8csm12443440wrw.26.2023.07.31.01.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 01:46:42 -0700 (PDT)
Message-ID: <7ecdb9c9-6620-67b5-be46-a36490e7ba33@linaro.org>
Date: Mon, 31 Jul 2023 10:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12b-bananapi: switch to
 enable-gpios
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230725142703.157547-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230725142703.157547-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_014646_632330_56B3570F 
X-CRM114-Status: GOOD (  14.50  )
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

On 25/07/2023 16:27, Krzysztof Kozlowski wrote:
> The recommended name for enable GPIOs property in regulator-gpio is
> enable-gpios.  This is also required by bindings:
> 
>    meson-g12b-bananapi-cm4-cm4io.dtb: regulator-vddio-c: Unevaluated properties are not allowed ('enable-gpio' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> index 97e522921b06..86adc1423385 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> @@ -56,7 +56,7 @@ vddio_c: regulator-vddio-c {
>   		regulator-min-microvolt = <1800000>;
>   		regulator-max-microvolt = <3300000>;
>   
> -		enable-gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
> +		enable-gpios = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
>   		enable-active-high;
>   		regulator-always-on;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
