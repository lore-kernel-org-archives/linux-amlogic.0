Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD58C32793
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 08:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MbOLsGXNxcUgkieg2PYnIc+QgyJMEbXjw6UoD0dB3xo=; b=LceljoAmbCedye
	ACluMQpNbwZlyDe7BYOJ3rpMH/Fv5UddHmNrQf2ffR9OLik6L3IjB/uP8yKnlS2ErABt8v7Zv/G1h
	0KIysMlvrDDFrKTpm7poNebxCJ00cC+BDLhrV9VwqbZ22p03ESIO0XCoPYdM+82VjrQAakGVXRdy3
	RCaYD1EromLM5nxfUxcW/FnhRY0f9pEvShavyp1PD/R0SLNyMgNMvOnMwB7SeYrsOigAK2x6atQzI
	HBQwNPMNPP0pRfOKpDNsZQF8lvlUZk8fljuO5HlnzCXa/G4V+mRKs4cXEgDt8ExAZcwBppqne9TJb
	8LcWvW86DABZGe44wKWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3fP-00HRcm-BP; Wed, 18 Jan 2023 08:19:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3fM-00HRbp-NZ
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 08:19:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id d2so12952572wrp.8
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 00:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JEKWwonctGpIYQyBgQI4ckxGQ2LgFs9BvZSmjtP02g=;
        b=fpeFIu5SCiWtEqzPdjMpQQnizSO5gHn6+T9L7i5dI4vq1TwgPoyO+Mxc+G27U2jGEl
         uV3+vDLrYYQ0pKO+ekeTkzFqUzbdFZUB6yGM718pxmjsW2V8dk8dv/0zM6lu4/vPfBdf
         sWO/UtTk2hA0lONjcHhDSUK8R0CmJGti2Qw2LVjztthaM+/IVeiKjAu6J+zktnrqAwml
         Tf7PPxd7YlGEuIYs0oGVAm+Uq1aZz0ZtsXTCd8mwh84w86bS3PzcDTn+A10dEbifl/+A
         CLMwomuVhrhQ1jX+CMv6TcIBO/JF6dlANR9gkSunl8P2A+FALJ2D2//M6NwoCC9ninaS
         +F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JEKWwonctGpIYQyBgQI4ckxGQ2LgFs9BvZSmjtP02g=;
        b=CX3boHKOCKV2PfqEV+Wsy2oBx7mRiy+bJBBgtr/rfWuP1cwV4axJqCl15nYhXZNkma
         oB0KqczVsu07ODkoGcmgJpvVzsAb97m2sB2YDD5CnXxt92B+3Y0g6nElk97eajUcelJ1
         b/0gOZBNGNvd6i0djfatoydOdKzwjAc2AUpvv7dcSSpgfdbaD2Prts0FoEuNRZZ+9LnD
         lfSv/ntV9o0hI6rwPUiq8UM4YCP6IUBa5wiqd8zgZ9nbfHalY07h7RWyXrmFsyrXru+E
         xoB1XsMUkshyh9G8UAZPOEpBMEHkzjAMWOIjMI9io3ETDZKCDD/LonmnENJtwzPSHadg
         nl6g==
X-Gm-Message-State: AFqh2kqISUThrpFkWeoCClJmdq6DbfeMXARmPSet8kyh9dGy/8t5ZDgn
	bXbA1s5dOrvV6+gtMZ8ApYr8yA==
X-Google-Smtp-Source: AMrXdXtxvx6Qk2yzHCCoZTw0Gh6jNnIwwmM6YD/JTJFYkSjAFXi/y1n5cO2P1+elzl5fykTlk+PbJQ==
X-Received: by 2002:a5d:50c9:0:b0:2b4:790e:32f3 with SMTP id f9-20020a5d50c9000000b002b4790e32f3mr4986316wrt.68.1674029967087;
        Wed, 18 Jan 2023 00:19:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e7-20020a056000120700b00241dd5de644sm30685430wrx.97.2023.01.18.00.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 00:19:26 -0800 (PST)
Message-ID: <2c17eaa5-ee93-58c5-a35a-8366eb4cfc36@linaro.org>
Date: Wed, 18 Jan 2023 09:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/9] dt-bindings: usb: Add binding for Via lab VL817
 hub controller
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230118044418.875-1-linux.amoon@gmail.com>
 <20230118044418.875-7-linux.amoon@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118044418.875-7-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_001928_809736_0169D5B7 
X-CRM114-Status: GOOD (  21.55  )
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

On 18/01/2023 05:44, Anand Moon wrote:
> The VIA Lab VL817 is a USB 3.1 Gen 1 hub and USB 2.0 hub
> controller that features 4 downstream ports and 1 otg, with
> an internal 5V regulator and has external reset pin.

Subject: drop second/last, redundant "binding for". The "dt-bindings"
prefix is already stating that these are bindings.

> 
> Add a device tree binding for its USB protocol part.
> The internal LDO is not covered by this and can just be modelled
> as a fixed regulator.
> 
> Add combo of USB 2.0 and USB 3.0 root hub using peer-hub.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2 - fix the compatible string and fix the $id
>    - update the commit message.
>    - update the example for use peer-hub node because it
>      combo of USB 2.0 and USB 3.0 hub.
>    - rename the yaml file from vialab,vl817q7.yaml to vialab,vl817.yaml
>      as q7 suffix is ued for USB 3.1 and q5 suffix is used for USB 2.0.
> ---
>  .../devicetree/bindings/usb/vialab,vl817.yaml | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> new file mode 100644
> index 000000000000..5f9771e22058
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/vialab,vl817.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Via labs VL817 USB 3.1 hub controller
> +
> +maintainers:
> +  - Anand Moon <linux.amoon@gmail.com>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  compatible:
> +    items:

Drop items

> +      - enum:
> +          - usb2109,2817
> +          - usb2109,817
> +
> +  reg: true
> +
> +  reset-gpios:
> +    description: GPIO controlling the RESET# pin.

maxItems

> +
> +  vdd-supply:
> +    description:
> +      phandle to the regulator that provides power to the hub.
> +
> +  peer-hub:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'

Drop quotes

> +    description:
> +      phandle to the peer hub on the controller.
> +
> +required:
> +  - peer-hub
> +  - compatible
> +  - reg

Keep same order as in properties: part.

> +

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
