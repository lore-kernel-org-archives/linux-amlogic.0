Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7660EC678DB
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Mar 2023 11:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4pTMusE1lVKYCvQwtsCLVIbba3gevMhbpBru6wx/jw=; b=GJpxdaW8yDpQdy
	Xq4c2ZVadLa67x5jioCvy+KKL91sPt75iRoNslcsKiLRrmLC5JFwjlSsIvbz69//IiFRH37Gw1mtK
	/eKNm4B4UGG1bAfwZwfbMWt+5zK9Yrv7WsUbuBSZ1XF1rdishIUuzNAIih232Om5sxq76FiH6bHXh
	ukVf06nGL0OkdJr0TDlXkJ3O5SNv+oQ9iFjgKMr6h5K544Fxzp8ExRZNsWDMBPUGBeFEl2b64waYM
	q1bARKg4ziOVd1QOnJX6vX3sq+BY4E1oqZacJSjHvAPsjIIsJyAffJbqzMY5jWfqRi3t+LTYJeY8X
	wwOcoSYvRLXVv4/XJRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYPro-008qPV-2q; Sat, 04 Mar 2023 11:15:56 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYPrd-008qLY-JV
	for linux-amlogic@lists.infradead.org; Sat, 04 Mar 2023 11:15:47 +0000
Received: by mail-ed1-x531.google.com with SMTP id cy23so19917974edb.12
        for <linux-amlogic@lists.infradead.org>; Sat, 04 Mar 2023 03:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677928540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ftk4PV2UVoiZ3+JPdTCAz4kPzDVIhLMOG9HeEl28Ozs=;
        b=vCHiWYscL9Kbfe0TAVo7UWRE8jVnjWvNU5XWSmAOdwXPwkTPh/2G2WO9Ax/EG753V/
         qfgLTp+FDuLjPUQhylZqyx1njWAtFwD94byKnj9eBsDX0J3Tx74pf+OpEZ/S5pAF+0YU
         KXOFha4Ilb/hwMEtKQbNQwJy2hPJIF8wZ+Cn0itd02eLGhIInbfuEFJ3DHx8kfHLmpiL
         VY/ndXwVLEa7EIW0ti0J+cst7EeghQc4gSzYLHkIgIgkLaoRkF5EGwsqXfQzc+DzYiH5
         CPWNg7ujEbay5ZqbNrW+3B4nwOS1III99ZEMhPpB4EAwxr4fCby5dhJU4XVj3iK2U+cy
         wD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677928540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ftk4PV2UVoiZ3+JPdTCAz4kPzDVIhLMOG9HeEl28Ozs=;
        b=BKoaavxhJ8bN3m4pXQDuJcJLfiWVtxjHQPZ4f8RMx6OptvjZWhQXexgPNm6foi1laJ
         f8fJNEJMTh2V3BKE57NEuRvWDO2RtvXdqhD4sPr1C7bPuwB8F7X7WWQs2Z7gLTzt5DgP
         SCSJ7x4d/uv1T5pw7jHz/e+0yXsuQnAfQSRjvCi5rZHbYZKAZQ8yUKygQ7KLao9Ur8ec
         p5OW+i7Dd+icsx/8muF0UT7kac9Q/t4Nbz5w37ol/WP5N/FDAloUf3KoGklCSCjXY7Cq
         AacZ1w/6XZZ0esY+W9CzaaqxV4bOOe1iOIBklkuI6D8jguYaY1AtbOto3vQQQl8zJ5lW
         CcDg==
X-Gm-Message-State: AO0yUKVfiUj49Ioi0MRFVrGELv8Lh2klLkXXigu3kS0XjLLJDSKsx837
	AYDm+/x0BWiGsGaspuCpVdjuCQ==
X-Google-Smtp-Source: AK7set/KGQOOy6z0wzqUoxZNRI9lxGHxaqc0AaV8j+0HjKSadP4nPVI5SC/GjiprJLDQAt/MuWv/dg==
X-Received: by 2002:a17:906:2756:b0:878:79e6:4672 with SMTP id a22-20020a170906275600b0087879e64672mr3595195ejd.42.1677928540692;
        Sat, 04 Mar 2023 03:15:40 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:b758:6326:1292:e2aa? ([2a02:810d:15c0:828:b758:6326:1292:e2aa])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709062ec400b008f89953b761sm1968521eji.3.2023.03.04.03.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 03:15:39 -0800 (PST)
Message-ID: <db22af89-6ec5-437d-520e-38aafdb195fc@linaro.org>
Date: Sat, 4 Mar 2023 12:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: Add initial support for BPI-CM4
 module with BPI-CM4IO baseboard
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230303-topic-amlogic-upstream-bpi-cm4-v1-0-5a23a1ade6bd@linaro.org>
 <20230303-topic-amlogic-upstream-bpi-cm4-v1-2-5a23a1ade6bd@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230303-topic-amlogic-upstream-bpi-cm4-v1-2-5a23a1ade6bd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_031545_651426_0E342B31 
X-CRM114-Status: GOOD (  10.46  )
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

On 03/03/2023 18:37, Neil Armstrong wrote:
> Add support for both the BananaPi BPI-CM4 module and the BananaPi
> baseboard which is comnpatible with the RaspberryPi CM4IO baseboard.
> 
> The BananaPi BPI-CM4 module follows the CM4 specifications at [1],
> but with a single HDMI port and a since DSI output.
> 

(...)

> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOAO_6 GPIO_ACTIVE_LOW>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	emmc_1v8: regulator-emmc_1v8 {

No underscores in node names.

> +		compatible = "regulator-fixed";
> +		regulator-name = "EMMC_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vddao_3v3>;
> +		regulator-always-on;
> +	};
> +
> +	dc_in: regulator-dc-in {
> +		compatible = "regulator-fixed";
> +		regulator-name = "DC_IN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +

> 

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
