Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45C8C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/T1m0FnEofSYIxBMe6mD1enybdHX4tN6a6zoEjj8Xw=; b=0neZ4uBuoYY7k6
	Zk4f69utnueeQAG9ovP2SXhfmKbwqDyYIVmEFsTKSpCLqM1DrH75HDv2YhPWEHwwZoyXkYlK2SdiI
	ZrLmKCg0+FqAs0pvjdFVAum+GNP88h2LcnDwyePlzyiVM8n0e2qqkvwNfnUjDy+GPqyq5QVYTbuOK
	tSStDCcTSngyzHcbaBzxcZULy0KNWbkVEE+I3B4HGLmZi6OUxpxPSarGXiG73mrSKZf2r/dBqEnZL
	oVDRJG7OAiPWP/52SH+N7iiLkML/eNrxRswG8y0sjLSazRhcc4zp6Bwi2y0L/bszINs/6lpKgqURq
	CMuQfHq2YGnSwSPdorKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2nR-004gRJ-2x; Fri, 18 Nov 2022 14:56:49 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2m9-004faJ-ER
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 14:55:31 +0000
Received: by mail-lf1-x135.google.com with SMTP id l12so8575790lfp.6
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=goUFPMKX4auhNOytpCS76F6+oFJbm5nDF3rRTkPSoxs=;
        b=ev8zzitMeZQuPjRj0P/TC0v7bJQVBjsNTIlj/vYfhMxFuR+OvntUDzBIMZEH11nujL
         HnCteaXp5n3QMFnDnDel1pkcwRnmcKF/HHapoacLlJxE+OJVvIFOmygYxO+zHqfZA/5Y
         Wtq0j+q+fqeudod2CPBAmCSaV2IWitzEjn2oAnGw4iK/nVg1L1ZkFB3vCZne8IJqHO1B
         xYgV+wALymQwd8zrJiMeLmbYxbaFgOZboRUK6CdTv2a0n2WI1fI2v8wz+a0V7uDToqEH
         EjY4B3YVUTJklIUQFYAZFlDp39fr/BGv/HZRpH481+iTcad97kjoL+sSZHZ2e2YUb8gK
         c+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=goUFPMKX4auhNOytpCS76F6+oFJbm5nDF3rRTkPSoxs=;
        b=VwGKoe+6/5iarQ0H2NFLjkzvu7ndcXCT83gmKgukR+pS0LeUlE/i3RkKIkaY4105PR
         PGRbhD/PGt7MAKZWugM5Pu5vGEUJohbP/PEB4o1/nXostuaRhUssWonIHNclmKRiwpNS
         YzW8fgbroeTgLph+I8WX1Z0jeFOFEdsnkYtAK+UlxmHDOM2EHVfvB3u9fRQYMSWs+FJP
         /063jsos4nk/CQDFpE0SYgrWhE8deJItuuYmE4+q46/OdEas+Y49u4K1Qxne7JqefrTG
         GQnkCk5i8FulZ8gVKnyvngnodq0FEZr/5PTdbvF5exHGHSq/rgOtQbefAZhSvBLBKJUv
         gGEw==
X-Gm-Message-State: ANoB5plL2tJUrsRgH8iLHRx8LBCSkbpnmx3RXxRZVz64DMw7uIiickE4
	5qJr3r03xXw5d5Xwm3xY69wzBA==
X-Google-Smtp-Source: AA0mqf4rUU5GFN13rGIm8oVXpzqHjxQvPRkD/HFkVTV6c9Dwb96c2a3B93ODDu0Sm7WxWsDPEwgNmQ==
X-Received: by 2002:a05:6512:3282:b0:4a2:4b1b:6ad9 with SMTP id p2-20020a056512328200b004a24b1b6ad9mr2863014lfe.296.1668783327899;
        Fri, 18 Nov 2022 06:55:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e19-20020a05651236d300b004afc1607130sm693758lfs.8.2022.11.18.06.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:55:27 -0800 (PST)
Message-ID: <86d3cb18-4e31-7389-f982-7985cf976791@linaro.org>
Date: Fri, 18 Nov 2022 15:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 09/12] dt-bindings: phy: convert meson-gxl-usb2-phy.txt to
 dt-schema
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Alessandro Zummo <a.zummo@towertech.it>, Eric Dumazet <edumazet@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Kevin Hilman <khilman@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Paolo Abeni <pabeni@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Cc: linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-9-3f025599b968@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-9-3f025599b968@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_065529_546143_6C612E7B 
X-CRM114-Status: GOOD (  15.27  )
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

On 18/11/2022 15:33, Neil Armstrong wrote:
> Convert the Amlogic Meson GXL USB2 PHY bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/phy/amlogic,meson-gxl-usb2-phy.yaml   | 56 ++++++++++++++++++++++
>  .../devicetree/bindings/phy/meson-gxl-usb2-phy.txt | 21 --------
>  2 files changed, 56 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-gxl-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-gxl-usb2-phy.yaml
> new file mode 100644
> index 000000000000..4dd287f1f400
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-gxl-usb2-phy.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/amlogic,meson-gxl-usb2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson GXL USB2 PHY
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: amlogic,meson-gxl-usb2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: phy
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: phy
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  phy-supply: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@78000 {
> +          compatible = "amlogic,meson-gxl-usb2-phy";
> +          reg = <0x78000 0x20>;
> +          clocks = <&xtal>;
> +          clock-names = "phy";
> +          resets = <&phy_reset>;
> +          reset-names = "phy";
> +          #phy-cells = <0>;
> +          phy-supply = <&usb2_supply>;

Use 4 spaces for example indentation.

With indentation fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
