Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471ABC678DB
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Mar 2023 13:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/86uWsaPEiS0F3TqLhQNeuC5od8pqdPU9Mn3Uvezkw=; b=pcXnBXADVDp25i
	gwMgtgkfirBfvQo1vDvXWUwRGuiVkWMtH73HDObxPPctq237wldE3r3Dsh0t7rpTWITaLocWm777E
	qHv9lSNJDWR9cK61Cg2BIM+zrZCIAmlLlUN7hc9Dgl7LUtCV+I/McRf0pGmC406G+dFnwjfZ7kz/L
	IwoqdbaQLOvdTBOAkX9PnOlBYwC4q9ZVIAyWGfdloOlNWiAQcVZGiIpemAjuyCdodq2GmRQDcSaiI
	qHFBek9wBdgmba3RuAmzwVT6W9K+9rTHIwTGt6k08RsywtT/3r0E83EsPeAl7TygioVQz7dYDkkx7
	ocFvSFcrtVYhDUZJpK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYoSH-00AFwB-N4; Sun, 05 Mar 2023 13:31:13 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYoS7-00AFu1-BO
	for linux-amlogic@lists.infradead.org; Sun, 05 Mar 2023 13:31:04 +0000
Received: by mail-ed1-x532.google.com with SMTP id o12so28102503edb.9
        for <linux-amlogic@lists.infradead.org>; Sun, 05 Mar 2023 05:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678023060;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxwKusTrT5Ph9UVPcadPhfPIciAtPEwoDMOjQJNze1A=;
        b=hl/9z6Ol1ta6vFalu2IngF7fzfDi+iLnw4Ik3ge/NOGMzBWs70s0duKW4rfkRKEtCN
         xxMimahktHyXd4aw7QJloyDPuT2HtctGeuQ+1AEvKoAdAyfrjEltRbs8CIH+fMkuQhH+
         arAX08FX/D+xZpm30aVQHhbXoxYIprTvCkrBAwAXDkVv2OektKn0y/x4aEwOrpQAP6sm
         cZzj+jJuShomHH4WvHcOHsuxURGr6GwasAXeqDPjbhxE2ulhp6YnVL3tFTAVeNauCWSf
         NUEe5FK61uo7YLk1Z7MniADb5r+HsTyXZXvcvLghEnRnDaBmPm/OYQTEX9dq5w5mRe3y
         tt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678023060;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxwKusTrT5Ph9UVPcadPhfPIciAtPEwoDMOjQJNze1A=;
        b=t033MoSlOEYxI5/Gm2KUoeLU0S8E3Jzuf5ruM24DbE8lSOglrv+sEObzixQQvdvKN9
         9AUhUsc3FQvb/0yJyOx5tKEL6B5xklN58EpUAm6WS8AQ5+TLPAB+x4wgsb/r9sXnAfzk
         at5pV26iPxi6/Rqy2CSYuy3jcwZEpjr82TZ2//FGHoxFlulJqHKJBfcFx6rayK2mLdja
         b1RWeuBt3iczNchSmukyn742EkSG2xNnQZf3B/EsSSPRf7tNI72bfbK63xWiqvW4mr53
         Yc+U52v+iCDh7x5j/xijim7tQy9y7GOydUb2Z5gAuhOubGxnW6oC4ReVvPZghwnaEitX
         Kb9w==
X-Gm-Message-State: AO0yUKU0/lt94hnokHf7uyyxCkiTGBIDQAxNuI0DxzOh3auV3OX3hJRx
	ELEXfU8lAeGr2puLbrL48WSUKw==
X-Google-Smtp-Source: AK7set/+wBTKZHcwMuDcJInU5Oi6zg2QZX/PcO/qgNORoWNGsi9EADRiv0/dhtTc/PE29DWnpM2xKA==
X-Received: by 2002:a17:906:60c3:b0:8a9:f870:d25b with SMTP id f3-20020a17090660c300b008a9f870d25bmr6605064ejk.15.1678023060093;
        Sun, 05 Mar 2023 05:31:00 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:71e7:13d:1c29:505f? ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id g10-20020a50d0ca000000b004bc9d44478fsm3697966edf.51.2023.03.05.05.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 05:30:59 -0800 (PST)
Message-ID: <0d2184ee-679e-371e-8433-c38b22c97799@linaro.org>
Date: Sun, 5 Mar 2023 14:30:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] arm64: dts: meson: add support for BananaPi M2S
 variants
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230305132044.1596320-1-christianshewitt@gmail.com>
 <20230305132044.1596320-3-christianshewitt@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230305132044.1596320-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_053103_514396_B85356F2 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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

On 05/03/2023 14:20, Christian Hewitt wrote:
> BananaPi M2S ships in Amlogic S922X and A311D variants with the
> following common specifications:
> 
(...)

> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		blue {

led-0

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio_ao GPIOAO_7 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		green {

led-1

> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
> +		};

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
