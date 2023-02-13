Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB19DC636D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ft9DDNH3xvd8tkIXo0eVlwrqUdsm02Pn5ObrHeLD8c=; b=v66yE985aHBbpI
	yQsUoIamm7u7Ouak1858f3QbBQk+V70b3ijNC3qlCu4zKm8N/qaaCS754+t25KwK6ishMVmS2C9kt
	nFfZUVxZIfgJH73QFLm67un4PURSK8c7seETDQcOj/i5FKxdYp/6JTWUXrUcV16sqczzM4IXC1rvj
	h+xW8hYRfw66R2zFq+58Ep37R085I7QZQJ5fSzotzxyfYu/SMQrDXpu66mhaEoN3gaYevMtwrTeUV
	BaGHvtXDZ/4dZEYJthiKSPCraORKCUt5aMwAJc3kFDOwNKiORDBLQzJkC2EipiSzI+56XvLHfdW49
	x+mcgLIXM9j9Q0Y1+Szg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWYY-00EH7j-Sg; Mon, 13 Feb 2023 10:59:35 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWYQ-00EH0w-41
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 10:59:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id m10so2811213wrn.4
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 02:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HNRrH6pVFd2ShQx69BQENhHFCRJ2DJdc/TbT0vWDWBA=;
        b=jcwCUaS5PsaDXY9H+0qskpy7DXmR3b1cP4nVEKDi4Hp/+xm7GVrQJgygVp5xrSOixW
         gDtHSPdrQnfqSPGCUs9crDzyA5P77qCi0pYULDwO+4l/UNW6zU6r3yM2amjpPvK2GOiG
         Gzyq27yRZhOvTd9yRYuyI8lEnkN8Tr0I+ayf2gnp+YBLrLJlFnTApP91LDbhFqjUUet7
         tiHerycM7g19mzYregs+tnn16eHbVNDrB/9FqoueFKnSoKWBYQRnqHmTaGZuY+L7+0VK
         Lt9t/ndiAQSeKWfDbNES/FIvG11bgnUPrHKivfZntyOo94HqL8A9Re4ctfsATcKSwDNK
         MNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HNRrH6pVFd2ShQx69BQENhHFCRJ2DJdc/TbT0vWDWBA=;
        b=qq0upByB/Mx5oex0xjvNWNd9H34x6y1hkloOjBgmP8eThN7hU8hP6wFhIi2vrgOTVG
         FDWXOD+zwGee33+egFK1P8cCQLWnFhkWNPhX2aY3O3TtJaXfp/aDox2maLrotqGi5exz
         sAZQBLVfwaOBKu2Iq48B04Xnjfl0FRj67R1oZxTMZ39CRpFwUBaWzv8RYzjJvNtd3mFf
         Qhhm0F/sJljtl/MrXyBQPj5ePFxrKpYkajLlIYDmw1IDF+L3TwLBOZeAQnpPs4aVnIYd
         U7lyhV0KNXtmxsA8aPXGykopqlbGk//TaiLyzZMTw2tadxgGZ2+/sMtyJOB6tXrmsK5u
         Cdxw==
X-Gm-Message-State: AO0yUKXndlDX7NENoyCOppf9eKmOK0LfSKgJ+fsMFrUsE8CtX7BvIpv3
	3nDbPYp+Mo3iJuiD6s0bFQru8g==
X-Google-Smtp-Source: AK7set9EKm+ljNDXO8rry/RYjZUYrLXSN+ZaRUUJFfk9J3sel0OVnXraCoS/B6pbcDZ/GaRn+sG7Tg==
X-Received: by 2002:adf:fcc1:0:b0:2c3:f78f:518f with SMTP id f1-20020adffcc1000000b002c3f78f518fmr18003290wrs.39.1676285958566;
        Mon, 13 Feb 2023 02:59:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h12-20020adff4cc000000b002be505ab59asm10354062wrp.97.2023.02.13.02.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:59:18 -0800 (PST)
Message-ID: <10ddd574-3ad1-f2e7-e7b4-a6803ee240d6@linaro.org>
Date: Mon, 13 Feb 2023 11:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/6] dt-bindings: soc: amlogic: document System Control
 registers
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-3-c4fe9049def9@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-3-c4fe9049def9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_025926_213990_6E9192F3 
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

On 09/02/2023 14:41, Neil Armstrong wrote:
> Document the System Control registers regions found on all Amlogic
> SoC families and it's clock, power, pinctrl and phy subnodes.
> 
> The regions has various independent registers tied to other
> hardware devices, thus the syscon compatible.
> 
> Clock controllers and Pinctrl devices are not yet documented, the
> definition of those will be updated in a second time.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> new file mode 100644
> index 000000000000..672eabd90c09
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson System Control registers
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - amlogic,meson-gx-hhi-sysctrl
> +          - amlogic,meson-gx-ao-sysctrl
> +          - amlogic,meson-axg-hhi-sysctrl
> +          - amlogic,meson-axg-ao-sysctrl
> +      - const: simple-mfd
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    type: object
> +
> +  power-controller:
> +    $ref: /schemas/power/amlogic,meson-ee-pwrc.yaml
> +
> +  pinctrl:
> +    type: object
> +
> +  phy:
> +    type: object
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - amlogic,meson-gx-hhi-sysctrl
> +            - amlogic,meson-axg-hhi-sysctrl
> +    then:
> +      required:
> +        - power-controller
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - amlogic,meson-gx-ao-sysctrl
> +            - amlogic,meson-axg-ao-sysctrl
> +    then:
> +      required:
> +        - pinctrl
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - amlogic,meson-axg-hhi-sysctrl
> +    then:
> +      properties:
> +        phy:
> +          oneOf:
> +            - $ref: /schemas/phy/amlogic,g12a-mipi-dphy-analog.yaml
> +            - $ref: /schemas/phy/amlogic,meson-axg-mipi-pcie-analog.yaml

And all other variants? This allows phy/power/pinctrl/clock in any
combination, thus maybe the binding should be just split? Hard to say
without full picture.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clock-controller
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    sysctrl: system-controller@0 {
> +        compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
> +        reg = <0 0x400>;
> +
> +        clock-controller { };

The example should be complete, so empty node does not look correct. If
you wait for other bindings, send them as patchset when all are ready.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
