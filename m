Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D30C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2u+2nTOJMsrIyw+sCplkdTG7EZ2hPztCvAqnp6KoHMU=; b=eQVp2PTdn2izFW
	/fw5HpDyzKIT1QW2RXa9cUg39u9sLPqdDwB3LJiygCsRWF2TngaLZRixrvuTJEh1vSr8UfA80v2TY
	4C+p90wXD92eTtDV3H5P39VAD4oqBQchtARfPaqqfEYsb6VQnD9j7W3wWXfx7EE3LAZQZVgg4TIFW
	chN2x4MgW2c2WPzYW40ivJOh8wzyqcnXVttjL+b74ILC3OqaOPRM1tuAGr2pEOhGYakp4obL4CaWT
	p9ZMdvgulYIY1qXi9n10MGDtLRJIEu/s4tsv9d9w85wHVesQyPc977n8cmlfuYCQWBCEOro9/dRLD
	kixtAaG1pOmtppDjCVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2gH-004cH0-QJ; Fri, 18 Nov 2022 14:49:25 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow2fF-004bdl-Ce
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 14:48:24 +0000
Received: by mail-lj1-x232.google.com with SMTP id b9so7054333ljr.5
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 06:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzDAVj14Kg7cyIXYwLhr95fRyEdtiFybQ+a9MmGfD7k=;
        b=P4iKBxDecGp7qNoMMYwLnoMJ7yQ2X4wm+chKoQAVcYgIbVgW/4Ic8Xtb7DnzlMuYXa
         a+KagPKM9e/V54JuDN4+ZpL+QSS0cClqMG3jaI8OG6ey10xV8p5VOGhv4B335yHdxxZ6
         udWuBi6XP4QdHTPL0/u9jWPb4AmhpkScZ6bVOxyFMBMkN5Up2LKYq3H5zmJuIcdkX0Fx
         8fRUzWUlUGxjaJQgcLB1Zf1N9rH+cvB0CSSHsOL6EuqAPju3FneXzOwnJAxFBrQpQVyr
         +UCtax2+FAg215FZ7h57gHkOjOg6N1bkk3yl6x31o6eYoiHPgEiKNXvzlBRf3tcxr8+J
         ZKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JzDAVj14Kg7cyIXYwLhr95fRyEdtiFybQ+a9MmGfD7k=;
        b=0Xq84uyx6n3Pg+BucL3UGpCw6BuygZpSMTLG/pyPRp8ilSpKclBO/7JLfsIwTLaM51
         kE3KVy+aLbIERDOUas9+9By+lj+XZN4MdEvMK9h/aoxRbN4f9pyogrTSU7MhpCf/AAjt
         mGpqQq8aqDRxwtU8gQhk5KTsV/xUD9qDK/3Yfib0EDxV5VhtFh+AGDPswZSWTHbFfFvM
         LfdxSs1wLLcqfpTQd8HPWAghyDzTtK5KAWeQ52AHsugGh1eP4N59I0z00EwwiCKFyWyp
         73DTTsAQ09+vIRfJ/mz/am3yBlbtiovW4NtRnV1vfGGuhsELCoa6jmq7JDIkXmjnPVnO
         g3Tw==
X-Gm-Message-State: ANoB5pnAU1EmdXn9rl5njRY5LDpVXG4NREHCNyyupZSmiKueNbT+K3vB
	OatE7QXn/DM5F+UL/I5gRTd+2g==
X-Google-Smtp-Source: AA0mqf5cBtRAtVWCHt/JKQ9brxqzzQxd4TedCgkS2P/jQOnKdMCSZLGEZqSJlBl/s61brK5m99FHbQ==
X-Received: by 2002:a2e:a274:0:b0:278:eef5:8d07 with SMTP id k20-20020a2ea274000000b00278eef58d07mr2463980ljm.61.1668782898632;
        Fri, 18 Nov 2022 06:48:18 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id be40-20020a056512252800b00497a61453a9sm683196lfb.243.2022.11.18.06.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:48:18 -0800 (PST)
Message-ID: <40a4d3fd-bde8-c8ce-a93e-e0f8b633f10b@linaro.org>
Date: Fri, 18 Nov 2022 15:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/12] dt-bindings: nvmem: convert amlogic-efuse.txt to
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
 <20221117-b4-amlogic-bindings-convert-v1-2-3f025599b968@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-2-3f025599b968@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_064821_522281_36B8A695 
X-CRM114-Status: GOOD (  14.95  )
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
> Convert the  Amlogic Meson GX eFuse bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/nvmem/amlogic,meson-gxbb-efuse.yaml   | 52 ++++++++++++++++++++++
>  .../devicetree/bindings/nvmem/amlogic-efuse.txt    | 48 --------------------
>  2 files changed, 52 insertions(+), 48 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
> new file mode 100644
> index 000000000000..1d88f7eee840
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/amlogic,meson-gxbb-efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson GX eFuse
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    const: amlogic,meson-gxbb-efuse
> +
> +  clocks:
> +    maxItems: 1
> +
> +  secure-monitor:
> +    description: phandle to the secure-monitor node

This does not look like standard property, so you need the type ($ref).

> +
> +required:
> +  - compatible
> +  - clocks
> +  - secure-monitor
> +


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
