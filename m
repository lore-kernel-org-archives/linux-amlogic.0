Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B64C46467
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 16:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/pqmJSxP0mHVG5GWYGYsDZgixe6pPOlwi86JldKD4A=; b=FKhQdeJIuMsW6N
	7HgmPcV1U6qaBkk48pVW3GN5vRiJ1cU2+X8MsopcKyIPKJxOAFJDwhVpxOihcRPax6PIkMf6HYY6D
	m7c0H5niU1Us4HPSjcGK/bWVPKj3kA6L1nkEJgP1oCUP5/rYW/ST4YakjJn3ydOfFcqxVZI/nKj1u
	MO+uUl9gFqHDJb//AjwlihwtwjhrzpLohG8eSz4Qax7xt2VTYbN5ctiXujbm8vcieBPgpzd8j1f6X
	sqCqkXXTBeI1whYJQQgdMUXRYyV40Yp8/8QcWjfba3BQ5UNc7iA3pSP52yw3xh07vYTxVVdwJ9XaR
	ofWmBp/KFJGRAyXcAlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFHga-007pUI-FK; Tue, 10 Jan 2023 16:41:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFHgP-007pPj-Jm
	for linux-amlogic@lists.infradead.org; Tue, 10 Jan 2023 16:41:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so10542869wms.4
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jan 2023 08:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Th4XS3ExnJps+ejGgAt+lEc+wt5pkhQaMhYYIYNJy0U=;
        b=a2RI/NAz23mB851gzvwuv+p7hExudFo71Jz2+0oDw0T1EhzC7jwPZqmqwBS3mZ7Pk5
         XN+mp23UWm76WcYPMr+2b0ss91RHKvx5Q3bTO6u/8pXjO8pCxW5ph1dwoq/P9vV/hU8P
         uotbWX0UA1lJXNzp/yuQyd+Lybnq+sTqqt4Wu8jG1aiinRxynfX9xOUkrXVM8KlULoUd
         8fO+I6pUurdwv+JnjMTH1bjinN+feq4bT35Uf3/Uy+IpzcgzqQ7JahwDt2J12PTMjSky
         UqYsIc6fT9oEA/mGd0GtJKQnrOVgfM4z/YU/ABm/7341rcFsAxWKw8PKuZUveZxmvBsH
         2hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Th4XS3ExnJps+ejGgAt+lEc+wt5pkhQaMhYYIYNJy0U=;
        b=VTKtz+P1kOmDl9cNEmC9YM+bQVSv3z1+i67DiMXFENS67+RgT+5D3vfiLboacRkFL5
         sznfPcNDaYdzrbrpLbXrxnRTa16++hraItKWpGleQabmd55kDxXt+euNQy4FUicPaJ2s
         DtwiQxFiG41skiEb7Rpqhk8pMZKqazQiWfAbCWSxmmg7uLICZsttEsWGTDq00toANdZn
         IXCQTXi9sZdXTKd+lGwrUheRY+0DbU6GtYMwwiOFjHIk+SugcSNGiNY/1P4kQtTJd1/M
         8w//mmCeWLjy6KI/HYwtsk9cx4EiFK8EAONOYU8wNgez1mYUQQLgw2B8eSI3tTOAoAws
         A/zg==
X-Gm-Message-State: AFqh2koRgPdIjzhh9LGZk1OtOdn8MXWA5qWp+xz3AygFageQbXlOtGpB
	xNVEIDv3RFPlbKw97PQ6XcVg+w==
X-Google-Smtp-Source: AMrXdXskmZw3ugW9Pk8CVGZsMZh1RbFbAqdASFjBu3L9/SbBgfi3fYgfSX8zXMjI3EW8xExE+p+a9Q==
X-Received: by 2002:a05:600c:46c7:b0:3d9:ee3d:2f54 with SMTP id q7-20020a05600c46c700b003d9ee3d2f54mr6883493wmo.13.1673368863486;
        Tue, 10 Jan 2023 08:41:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id he12-20020a05600c540c00b003d9ddc82450sm15086035wmb.45.2023.01.10.08.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 08:41:03 -0800 (PST)
Message-ID: <9640d2a0-7245-285e-0e7a-d75bfe3f88ac@linaro.org>
Date: Tue, 10 Jan 2023 17:40:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 09/11] dt-bindings: mmc: convert amlogic,meson-gx.txt
 to dt-schema
Content-Language: en-US
To: neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v2-9-36ad050bb625@linaro.org>
 <e3d32fe1-9f2b-09fb-d7e0-2c8f42e5365c@linaro.org>
 <2037156d-5113-4b96-8f86-c8ef1c1fdf96@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2037156d-5113-4b96-8f86-c8ef1c1fdf96@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_084105_661553_4931664C 
X-CRM114-Status: GOOD (  17.55  )
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

On 10/01/2023 15:17, Neil Armstrong wrote:
> On 10/01/2023 11:17, Krzysztof Kozlowski wrote:
>> On 09/01/2023 13:53, Neil Armstrong wrote:
>>> Convert the Amlogic SD / eMMC controller for S905/GXBB family SoCs
>>> to dt-schema.
>>>
>>> Take in account the used variant with amlogic,meson-gx-mmc.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../bindings/mmc/amlogic,meson-gx-mmc.yaml         | 75 ++++++++++++++++++++++
>>>   .../devicetree/bindings/mmc/amlogic,meson-gx.txt   | 39 -----------
>>>   2 files changed, 75 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>>> new file mode 100644
>>> index 000000000000..30228964fd9c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
>>> @@ -0,0 +1,75 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/mmc/amlogic,meson-gx-mmc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic SD / eMMC controller for S905/GXBB family SoCs
>>> +
>>> +description:
>>> +  The MMC 5.1 compliant host controller on Amlogic provides the
>>> +  interface for SD, eMMC and SDIO devices
>>> +
>>> +maintainers:
>>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>>> +
>>> +allOf:
>>> +  - $ref: mmc-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - enum:
>>> +          - amlogic,meson-gx-mmc
>>> +          - amlogic,meson-axg-mmc
>>> +      - items:
>>> +          - const: amlogic,meson-gx-mmc
>>
>> This does not look correct. Either gx is alone (not compatible with
>> gxbb) or it is compatible with gxbb. Cannot be both.
> 
> This ishow it's used in DT:
> 
> arch/arm64/boot/dts/amlogic/meson-gx.dtsi:                              compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
> arch/arm64/boot/dts/amlogic/meson-axg.dtsi:                             compatible = "amlogic,meson-axg-mmc";
> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:                      compatible = "amlogic,meson-axg-mmc";
> 
> So I'll drop the amlogic,meson-gx-mmc in the first enum to have :
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: amlogic,meson-axg-mmc
> +      - items:
> +          - const: amlogic,meson-gx-mmc
> +          - const: amlogic,meson-gxbb-mmc
> 
> It's right ?

Yes.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
