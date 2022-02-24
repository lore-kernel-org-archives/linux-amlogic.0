Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E601DC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 20:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IeQhLmV365Nh5wf+xOlQ1asFDvcmb/4tOuL2yfB+d2c=; b=U7Zt8j71l/Etrx
	hdB4qFroNl0drweZvKwKDX6EywoM+92V1XjNS5Z2DT+/tRxEkurNXD5QG95+Jj17dc4beBOVx+Mcc
	Qh+t0Qin/xr7WoPIqYLGDzszhkHifnJlWkIS1uMWfZXblBt5UJBW3gYyVI9FOWpab6Xrzxtemv4N+
	3MJxX9XgTfncfWoLUWE4MS19IKEj4IBiTGnLbhsf9LS89k3IgHto+9y3FqjtT6Qk/uinHY/+KN3wQ
	SbJqDHfKnJ/b/WK/V/yNvNnYAQJlSQpto5xOWffnmuvKHMoO531UnI99Rti7KlahoehugSR9PWQcy
	7D3GBFhWlgSCEftHZlfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKda-002L1r-Gv; Thu, 24 Feb 2022 20:22:54 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKdN-002Kyc-P9; Thu, 24 Feb 2022 20:22:43 +0000
Received: by mail-oi1-f182.google.com with SMTP id p15so4767706oip.3;
 Thu, 24 Feb 2022 12:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AQE4AnwIVz+0iF8nufHOjdzMhDHazp/XagGhyvKub5Y=;
 b=fiTZnLyHoXuGf536pfLxp1y0fGMaYQv42cT/nowPUj1HRFavhNlzivxa9RmvAtjOio
 2GN0GPK7PaHfOqLqJWOnFnUynpMePebr3hXcJsEo2Ya3uiuzyVA4lrqfZ/VKusnGLBV3
 NWZB7xytzlDTHNSgTdij05m2t0nhsLNvWmK3yWF/kR+HcuSb7gWTntw0U1BmpXR+ZVON
 jdbAdyFaO32buSG2+J6XHRUev933nQMAian28nxcsSpYttHbHU4LjG1gBNwz9Iu+HFxK
 dzR1usspvV0XUIDZTfiVAtejKn1CzY+zJetUj4vBYf8gnK3tAWdtrBJAGX/nYPzWNLOo
 i/WA==
X-Gm-Message-State: AOAM5331fKR4D1wI+Snis/oIqL9CVN19/KxJiM8s7H5XENx/6xZXKp17
 UFMbeZg1VaKDnRtH2zUXgg==
X-Google-Smtp-Source: ABdhPJwfBrQb6gfJqoZaI2I5EjFPNP+FuBP0Acipmhp6nabxeKxtSNtfgRIJ+DxqWy//4jsyuZl6ZQ==
X-Received: by 2002:a05:6870:e2c6:b0:d6:cca1:2144 with SMTP id
 w6-20020a056870e2c600b000d6cca12144mr1994776oad.267.1645734160806; 
 Thu, 24 Feb 2022 12:22:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 i47-20020a9d172f000000b005aed7ea7b44sm144231ota.73.2022.02.24.12.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 12:22:40 -0800 (PST)
Received: (nullmailer pid 3522835 invoked by uid 1000);
 Thu, 24 Feb 2022 20:22:39 -0000
Date: Thu, 24 Feb 2022 14:22:39 -0600
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3 2/5] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
Message-ID: <YhfpD9qfcuAlC+wp@robh.at.kernel.org>
References: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
 <2b7f0011-8872-70fa-b9b7-50b7817e7084@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b7f0011-8872-70fa-b9b7-50b7817e7084@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_122241_848474_16E48D0A 
X-CRM114-Status: GOOD (  19.99  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Feb 23, 2022 at 06:59:31PM +0100, Heiner Kallweit wrote:
> Add a YAML schema binding for TM1628 auxdisplay
> (7/11-segment LED) controller.
> =

> This patch is partially based on previous work from
> Andreas F=E4rber <afaerber@suse.de>.
> =

> Co-Developed-by: Andreas F=E4rber <afaerber@suse.de>
> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> Co-Developed-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v3:
> - fix remaining YAML issues
> - use Co-Developed-by
> ---
>  .../bindings/auxdisplay/titanmec,tm1628.yaml  | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec=
,tm1628.yaml
> =

> diff --git a/Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628=
.yaml b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.yaml
> new file mode 100644
> index 000000000..2a1ef692c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/auxdisplay/titanmec,tm1628.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Titan Micro Electronics TM1628 LED controller
> +
> +maintainers:
> +  - Andreas F=E4rber <afaerber@suse.de>
> +  - Heiner Kallweit <hkallweit1@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: titanmec,tm1628
> +
> +  reg:
> +    maxItems: 1
> +

> +  grid:
> +    description:
> +      Mapping of display digit position to grid number.
> +      This implicitly defines the display size.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 1
> +    maxItems: 7
> +
> +  segment-mapping:
> +    description:
> +      Mapping of 7 segment display segments A-G to bit numbers 1-12.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 7
> +    maxItems: 7

Are these properties useful for any 7 segment display or specific to =

this controller?

The commit msg mentions 11 segment display. Does this need to be?:

oneOf:
  - minItems: 7
    maxItems: 7
  - minItems: 11
    maxItems: 11


> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "^.*@[1-7],([1-9]|1[0-6])$":
> +    type: object
> +    $ref: /schemas/leds/common.yaml#
> +    unevaluatedProperties: false
> +    description: |
> +      Properties for a single LED.
> +
> +    properties:
> +      reg:
> +        description: |
> +          1-based grid number, followed by 1-based segment bit number.
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        led-controller@0 {
> +            compatible =3D "titanmec,tm1628";
> +            reg =3D <0>;
> +            spi-3-wire;
> +            spi-lsb-first;
> +            spi-max-frequency =3D <500000>;
> +            grid =3D /bits/ 8 <4 3 2 1>;
> +            segment-mapping =3D /bits/ 8 <4 5 6 1 2 3 7>;
> +            #address-cells =3D <2>;
> +            #size-cells =3D <0>;
> +
> +            alarmn@5,4 {
> +                reg =3D <5 4>;
> +                function =3D LED_FUNCTION_ALARM;
> +            };
> +        };
> +    };
> +...
> -- =

> 2.35.1
> =

> =

> =


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
