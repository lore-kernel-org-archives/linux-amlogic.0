Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984A1C05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 07:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8/yghZcx0FUdQE2Blj/+JqIHxM0O1SsAtQLM441GJU=; b=i2HI3MKVfqDnHt
	Id6hxSUzm3CbGOwgdH2CDDIE4OgRTooBiLG679D50bIllBk0tQ9qiQ2fzWJ0rtO3UMg0IptdWXjxj
	ZkXCB2cFd5h1UWOPy3ZZM4/h1vlV/xPeIpX3q9WxTOHu/rB8v4qtwkURkGMQtJsyItvDfEHoM6poU
	OsuJg8oKL21Q84Ajs6Bd4oFvZSbfZnuqP7sHSqum0F5qjYNy+cGHxekGdA424a5kBamScjcKQrRRZ
	MgsGBirFFzgyE4KKbuVdnGUFQ8eBjqUbNWeWnshyLQhUemIknor6oBOx5D2Oz9zEyafA+RgkJl5rK
	ElrUbZmDqowHHg9V7kDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7es-00AcwI-43; Wed, 01 Feb 2023 07:35:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7eo-00AcrA-Vd
	for linux-amlogic@lists.infradead.org; Wed, 01 Feb 2023 07:35:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso2078973wmb.0
        for <linux-amlogic@lists.infradead.org>; Tue, 31 Jan 2023 23:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zMO4O6XLeS+CmaJzPkiM5TKqYcGSkxjv6mv/iv+doFM=;
        b=BE7kDWz7n+PSYdH2iN/bRL9Yj3r9hEX7mC1i1JpjP3qijwDoncOQyuOQKXUjB3LWPf
         o0p6DsrqJbn51CiyvJBP51I60gtfqT8bVzLizs++wndzf3XqtvZ6i9buxRaZ7rrPg9wJ
         vkeLWVcBlAvWruSbadDs7ydy5N3L7l7QMg7rx5kV4SIO7kvJ2eZ84EQyftys1Xi9fPiO
         jhZQ9bXQHvifASMJnuhJrgTWkN/QBRd6FxrkBx+uPYlcc5tJlAP5e68o6j2bPO8O84V0
         kgXa7tim9VnqYP4gA5mM3CHuCSoXsf2JlY5W9gyBw8yXrv7XDTTXAqLMNY+TBWnWE670
         EDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMO4O6XLeS+CmaJzPkiM5TKqYcGSkxjv6mv/iv+doFM=;
        b=bFBqqMqqWO4FJRSTcuvfJa1XeFheb6bP44VwxiiiqpqeS2vHRWuZprBwMPMU9Pjcom
         gHl5N0xtt5u4nbCf7JjJ1Mi5bfRcX+muKTFKxWA/dNnUf0S2SYQ+Bny/PtYECDv2wNE8
         VBcnVK9URo29yY1aqOgj/naygzaKb/LQmHHS9zPFxcVW+w0E+HNDYTUKiEZTjiNwkUAS
         ZYfD59iIiUxKQg+mt/RSZGYZlgnECfiDhHzYD7/7cHBmfl3jXVw6lq/VgYqSxZqNO9B3
         z0x6gQpxz+eVUCm9LrILCgRJzQ2FWOhL8aLejERkxsJ1BOTTHH9Zq+8uAFhDK/VLhGlu
         2V6A==
X-Gm-Message-State: AO0yUKUb1uIHw6zZ/Ddh5SEWnUen/d8M9lS/QAGasoD26VqN+sW/oq52
	O3e0hLzMAjkozS48EGNXOeA+Jg==
X-Google-Smtp-Source: AK7set/lXNHxnDU1hTSORqG2FBydX0NnEOY9kA1Iw6Uh7VHpr2eLvUZ+/+3JSVisozXeJS/LSHrmJA==
X-Received: by 2002:a7b:c00d:0:b0:3da:f5d1:c677 with SMTP id c13-20020a7bc00d000000b003daf5d1c677mr688028wmb.35.1675236945369;
        Tue, 31 Jan 2023 23:35:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q6-20020a05600c46c600b003dc54344764sm845248wmo.48.2023.01.31.23.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 23:35:44 -0800 (PST)
Message-ID: <58b7924e-07aa-fc62-d7a6-c5d453964486@linaro.org>
Date: Wed, 1 Feb 2023 08:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] dt-bindings: pwm: Convert Amlogic Meson PWM binding
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <c92b9e51-bb69-0712-0b29-3db3c9a29f8b@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c92b9e51-bb69-0712-0b29-3db3c9a29f8b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_233551_072089_96361A8D 
X-CRM114-Status: GOOD (  15.04  )
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

On 30/01/2023 21:34, Heiner Kallweit wrote:
> Convert Amlogic Meson PWM binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - fix clocks and clock-names
> - consider that more than one compatible may be set
> v3:
> - remove minItem/maxItem properties for compatible
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 71 +++++++++++++++++++
>  .../devicetree/bindings/pwm/pwm-meson.txt     | 29 --------
>  2 files changed, 71 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-meson.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> new file mode 100644
> index 000000000..750642e76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/pwm-amlogic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic PWM
> +
> +maintainers:
> +  - Heiner Kallweit <hkallweit1@gmail.com>
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Drop items

> +          - enum:
> +              - amlogic,meson8b-pwm
> +              - amlogic,meson-gxbb-pwm
> +              - amlogic,meson-gxbb-ao-pwm
> +              - amlogic,meson-axg-ee-pwm
> +              - amlogic,meson-axg-ao-pwm
> +              - amlogic,meson-g12a-ee-pwm
> +              - amlogic,meson-g12a-ao-pwm-ab
> +              - amlogic,meson-g12a-ao-pwm-cd
> +              - amlogic,meson-s4-pwm

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
