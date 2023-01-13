Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4782C54EBE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 08:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epsCOZpTD6OV/p3sXYdwBFvzT3HPeXhiRcVTqr67b+8=; b=RVy1aFFuIcB122DVfB0q8NfW/7
	MnNyS9a1XDm3yk71Ouy4pmQ/eUxasq/lxS8xSuqv9sKBfO6Ei9mo/YQcKstESs+Jd5da5XGEmz9CS
	IYMirktzltszF+9M0tLz1Nr8hyTHwjEdmzInUXm6An5lyqtbB4vRZw4p67LNCrM2LWiCruoR8DwDi
	zhYSat2cKuQS0P/f+LyU3bw3WHjF9ID5HslbpXfO3gn7yI2jFUpyNbWpgafi0dtzNQezcEKc/Zhyp
	/gezEWg+LastPmxPFx6AhtFDGf8eYWKcjOA9GMZONr6naoQHlrZoTKqrFC5/EAm2GVOW7cCLgyyPO
	PmVTAdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEys-0014EK-Ly; Fri, 13 Jan 2023 08:00:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEyJ-0013tb-3b
	for linux-amlogic@lists.infradead.org; Fri, 13 Jan 2023 07:59:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id g10so14701814wmo.1
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Jan 2023 23:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pXn/Sqn27pQ2/tPlS+9ov/6xbhT2AAHAgRbkg7kFwAQ=;
        b=tPKn2xm1/gh4Sij1f8jwVleMt42338WsI75gttRBU1JgFNfgYU0r/MAm8PW2q+BPN0
         NnN7QANVH84FpsyRzfINaFG6a1otwdl4AghMsMY54//2IrapjIYqXjF9xqXeMtNeYlEW
         04Qjo/fHRhBt/qXR892YiB10RCu3gSa9gnoXBJ/bMSIJFujFVt46HjN1NFtYmTQRV1il
         MP0pmSdzZfwvDneRERS2di6XylPDSJSJOJ0Ot9bSv6SANQLmRqGekffVJP5HWP1gTIJq
         S//ZPvM2koyrnUiLQCYEEEXrX5Q7M1x1xQMh/UHv74qkUeWiio+ad1wa46DsvmA4KdbQ
         qYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXn/Sqn27pQ2/tPlS+9ov/6xbhT2AAHAgRbkg7kFwAQ=;
        b=N8nMc5Kbtcq7QfAolYMB1WGHp5+ZZKTlfvpzsJn+cn7IGyXp0DdV8Zwj88U6SRjBQd
         i3FlGgi52tbdVeovB46N5o0Ij8REgrFlCqpWcYe+TDRnb09Lh4DUHje0uYoUliT2uCCZ
         5QBlZ/Zuxt3kI+AOdj7oCP66rSokw9hik3WZ3C6Vll2GLK+lj9Wka4ry9N+zcLjpQoJq
         SjtRCPHZBmvZCAEFLKD6nw4lJp51kcRsgmp+kHB1Bl2OoFw3s3o9lhhC/fUN/lGj8OIL
         owB4a13CbQmIjsCVQXWlIAYnYJgPsY5amhzw1J4CFsW1FVRGSw6/q618imKx2mEnId9U
         tqow==
X-Gm-Message-State: AFqh2kqmaEkvAL7uYw2LgXqg25EgdElgAr1XSNOFWiVag0nFzv3B3i2O
	M4o4xoyYXiFes0AyubXTKgngyg==
X-Google-Smtp-Source: AMrXdXs74AoIWMIyEUQ5IhW/LhJ6G7INvXg/qItiXrZhlEqQHD7ZDRpWY+gedk41wh7L5Z+K27n72g==
X-Received: by 2002:a05:600c:1819:b0:3cf:8d51:fae1 with SMTP id n25-20020a05600c181900b003cf8d51fae1mr57508264wmp.0.1673596769675;
        Thu, 12 Jan 2023 23:59:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb? ([2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb])
        by smtp.gmail.com with ESMTPSA id hg9-20020a05600c538900b003cfa622a18asm28029637wmb.3.2023.01.12.23.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 23:59:29 -0800 (PST)
Message-ID: <916dec5f-5798-047f-37b9-ea4ced426838@linaro.org>
Date: Fri, 13 Jan 2023 08:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 5/6] arm64: dts: meson-g12a: Fix internal Ethernet PHY
 unit name
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
 <20230111211350.1461860-6-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230111211350.1461860-6-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_235931_206337_BF025D1A 
X-CRM114-Status: GOOD (  14.87  )
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

On 11/01/2023 22:13, Martin Blumenstingl wrote:
> Documentation/devicetree/bindings/net/ethernet-phy.yaml defines that the
> node name for Ethernet PHYs should match the following pattern:
>    ^ethernet-phy(@[a-f0-9]+)?$
> 
> Replace the underscore with a hyphen to adhere to this binding.
> 
> Fixes: 280c17df8fbf ("arm64: dts: meson: g12a: add mdio multiplexer")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> changes from v1 -> v2:
> - new patch
> 
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 9dbd50820b1c..c95cf3afc666 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1694,7 +1694,7 @@ int_mdio: mdio@1 {
>   					#address-cells = <1>;
>   					#size-cells = <0>;
>   
> -					internal_ephy: ethernet_phy@8 {
> +					internal_ephy: ethernet-phy@8 {
>   						compatible = "ethernet-phy-id0180.3301",
>   							     "ethernet-phy-ieee802.3-c22";
>   						interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
