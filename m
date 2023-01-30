Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C46C54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2CTnJBMy9e9uiDcHlQb7UA4Qedgecw2EVk+x5xwgN0=; b=3zi0OLTv4r8zhz
	gBGPdmJCajO7on2O+5G3m+RW0TEIKnuqC5j8p9ExSLGr5kYJpZahdWh8kwsQsB8UwLyFzEv3u4iKL
	yXZszM7DO9zaw0cuzD1jng0Pe05M1NSwU5/0cdFlJ5r70sJi4g/9nICqfEDGtPfHGons2H8+sYk8u
	uYIXAua1vfrNpbqGZk5yiAmjFRJZhwgpfGJ4h0Y56+O1kZPqJge9wFxOI+vq/cjcanrypE3k2GT36
	GILP8cS1yQrFWjnVe8C39N7NDrcqMnigFJ1mS9pzdcoRiW4n9Pd3w3Pa5xkSnBIewHPxM6yA4OFqH
	xT+I2ckcmSBuVQVaxjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXna-004THo-TS; Mon, 30 Jan 2023 17:18:30 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXlV-004Sgd-UW; Mon, 30 Jan 2023 17:16:23 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1631b928691so15851239fac.11;
        Mon, 30 Jan 2023 09:16:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFbZYokXDaufN+nrw5U+tk54eaumBdk6Eaj/TYXiSlc=;
        b=wyGsCyImHvCz60z+jjOHeIMLl0XKEcG5S7tVP7hdv5/qwhgAZ6cLC5kKKcCTuOpAl8
         qCDgCVmlCuVAJHHb2ygHyPeQJwycUX/880zXYtzQBAUT4ELFMRGtN5HioTBbNNfkAcy9
         QwhJMmOnmhw9IIIFDtlrK8lPwK0okeP064ziUBvMOKAe+bkUouckTyF0Kol2iIhCxGYQ
         lrSsty+WDU/4KN6JE8Hx2e8n53JxssSjmJm1HzC5dd4Nk2287yyYMhggb07k9Jwsez8w
         GlGWC678v/xg8O1WwHiZ4oTvkZhExcTi4TYIJpR9bPA+YBqltc5mhQU191j9yukALGmt
         LVSA==
X-Gm-Message-State: AO0yUKXiWYhqpHCPQlnd6IZllp2txsLNI28ci9x0agNJlTXMdJGeQMf0
	PDX3fvjHZxWB6vai5HMYXQ==
X-Google-Smtp-Source: AK7set9D9gvZqo/95yXNlorY/OCGBOTG2wadwkpOFSNQvhHBMxofZPVeWjr0GxvAfHf2ukHGXSr36Q==
X-Received: by 2002:a05:6870:42d2:b0:163:290f:9ef4 with SMTP id z18-20020a05687042d200b00163290f9ef4mr12449174oah.6.1675098980670;
        Mon, 30 Jan 2023 09:16:20 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id et10-20020a0568705cca00b00163263f84dasm5335195oab.12.2023.01.30.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 09:16:20 -0800 (PST)
Received: (nullmailer pid 2929331 invoked by uid 1000);
	Mon, 30 Jan 2023 17:16:19 -0000
Date: Mon, 30 Jan 2023 11:16:19 -0600
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Thierry Reding <thierry.reding@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pwm: Convert Amlogic Meson PWM binding
Message-ID: <20230130171619.GA2851045-robh@kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <d37fb6a3-f94e-224a-8829-80cf47412fce@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d37fb6a3-f94e-224a-8829-80cf47412fce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_091622_008616_7D223AF8 
X-CRM114-Status: GOOD (  19.17  )
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

On Wed, Jan 25, 2023 at 11:28:17PM +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson PWM binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - fix clocks and clock-names
> - consider that more than one compatible may be set
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 73 +++++++++++++++++++
>  .../devicetree/bindings/pwm/pwm-meson.txt     | 29 --------
>  2 files changed, 73 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-meson.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> new file mode 100644
> index 000000000..871b24bc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -0,0 +1,73 @@
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
> +    minItems: 1
> +    maxItems: 2

A fallback compatible shouldn't be optional. This makes 
'amlogic,meson-gx-pwm' alone valid, for example.

Though probably the dtschema processing will add minItems/maxItems on 
each oneOf entry to prevent that anyways. So just drop the 
minItems/maxItems here.

> +    oneOf:
> +      - items:
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
> +      - items:
> +          - const: amlogic,meson-gx-pwm
> +          - const: amlogic,meson-gxbb-pwm
> +      - items:
> +          - const: amlogic,meson-gx-ao-pwm
> +          - const: amlogic,meson-gxbb-ao-pwm
> +      - items:
> +          - const: amlogic,meson8-pwm
> +          - const: amlogic,meson8b-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - enum: [clkin0, clkin1]
> +      - items:
> +          - const: clkin0
> +          - const: clkin1
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwm@8550 {
> +      compatible = "amlogic,meson-gxbb-pwm";
> +      reg = <0x08550 0x10>;
> +      clocks = <&xtal>, <&xtal>;
> +      clock-names = "clkin0", "clkin1";
> +      #pwm-cells = <3>;
> +    };
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-meson.txt b/Documentation/devicetree/bindings/pwm/pwm-meson.txt
> deleted file mode 100644
> index bd02b0a14..000000000
> --- a/Documentation/devicetree/bindings/pwm/pwm-meson.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Amlogic Meson PWM Controller
> -============================
> -
> -Required properties:
> -- compatible: Shall contain "amlogic,meson8b-pwm"
> -                         or "amlogic,meson-gxbb-pwm"
> -                         or "amlogic,meson-gxbb-ao-pwm"
> -                         or "amlogic,meson-axg-ee-pwm"
> -                         or "amlogic,meson-axg-ao-pwm"
> -                         or "amlogic,meson-g12a-ee-pwm"
> -                         or "amlogic,meson-g12a-ao-pwm-ab"
> -                         or "amlogic,meson-g12a-ao-pwm-cd"
> -- #pwm-cells: Should be 3. See pwm.yaml in this directory for a description of
> -  the cells format.
> -
> -Optional properties:
> -- clocks: Could contain one or two parents clocks phandle for each of the two
> -  PWM channels.
> -- clock-names: Could contain at least the "clkin0" and/or "clkin1" names.
> -
> -Example:
> -
> -	pwm_ab: pwm@8550 {
> -		compatible = "amlogic,meson-gxbb-pwm";
> -		reg = <0x0 0x08550 0x0 0x10>;
> -		#pwm-cells = <3>;
> -		clocks = <&xtal>, <&xtal>;
> -		clock-names = "clkin0", "clkin1";
> -	}
> -- 
> 2.39.1
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
