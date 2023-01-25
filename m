Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEE8C27C76
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 19:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=za7/VORtlw3wllEwI8G0YIHG8wOM0t+Xv1M1c/v/QU4=; b=H/MadfvH5ZuWFI
	xfqGc9qWNPOkKLZ76nfQsdpiLNuodg84yEKp8kqo7OK92E5ANdJdOXwqyVKEJcLmoLnjGIipHdNo5
	k0ZQnqkhoQS53Pp5jjRSF3rHy3Dk1OgvfS7VG6C6wPih+aQAV9lZz43fjxi1OIjfnuO8W7rINxr3L
	pEUkG+zLrYQfZ7fyw34ba5s7Af6QRjfPQOqS273sx+WItvB0tBW4zAuLLnw0dBTiFrroMROOx+qUL
	k37Hyv9uFey3Cok+3yZdvnzrwLpzMty+GqeGQT09d+HUes0tz+IzYyCjGoQd9VtrZQETIPaiVJYO9
	2RkSgqcIgI+TPKNEYLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKlLl-008STr-DA; Wed, 25 Jan 2023 19:22:25 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKlLX-008SLL-Dv; Wed, 25 Jan 2023 19:22:14 +0000
Received: by mail-oi1-f173.google.com with SMTP id bm8so1903685oib.0;
        Wed, 25 Jan 2023 11:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PVEqBCzfLUzY4IompNf+WDKcAK9eA2hdVNa/dgEZEM=;
        b=tAxoeIbCO/mBpXUmdAuOd082ZP8mbmw9mG6XKfX5w/6f/F4yvVdKJo4hjwe/1ty9yR
         BGwj+iIUrrJkhmwoYuQZzF4V1viSpr10PoRe2VYsGwtwEXAOwDZi4yKTF8xzEoJibkk+
         CJQoY57WerLP8jRchRKAAqE2kWARmrl5BllmvJSVl1pZv4/yrLt9ongd6TuLX4HINsDE
         SelspfbOcnZHSacGFHEbeE5elq5JYDOa7UlU1JEb+FwsyhdGuYf6PRGfknF1Rcms/cHU
         PL+UqcqaxqTL58VJLGbthhO4BqXtWlrUn/9xMqNxZdcuRYAflBfitcxere9Dkg4wA/lq
         5UcA==
X-Gm-Message-State: AFqh2koxTRezRSny86x3LlBb3tvIOFDj3HcBLCKBSwaCGBqX1GAuCywU
	P5MvR78abb48fwCePOELdQ==
X-Google-Smtp-Source: AMrXdXtSGTGKDZXApqdn1BokhZuqhAW4CWOl6Q8yAt6sCWvdBefTWfX8VBhMIBueSOmJDZQTrHxWyA==
X-Received: by 2002:a05:6808:2015:b0:36c:e058:9cc with SMTP id q21-20020a056808201500b0036ce05809ccmr16173734oiw.7.1674674529265;
        Wed, 25 Jan 2023 11:22:09 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m24-20020a05680806d800b0035ec1384c9esm2396349oih.23.2023.01.25.11.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 11:22:08 -0800 (PST)
Received: (nullmailer pid 2716000 invoked by uid 1000);
	Wed, 25 Jan 2023 19:22:08 -0000
Date: Wed, 25 Jan 2023 13:22:08 -0600
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 6/8] dt-bindings: pwm: Add Amlogic Meson PWM binding
Message-ID: <20230125192208.GA2713777-robh@kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <0d492f0e-abb3-33f6-3ee9-09e1440a9015@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d492f0e-abb3-33f6-3ee9-09e1440a9015@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_112211_491673_81404CE1 
X-CRM114-Status: GOOD (  20.08  )
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

On Mon, Jan 23, 2023 at 10:29:27PM +0100, Heiner Kallweit wrote:
> Add Amlogic Meson PWM binding.
> Tested with make targets dt_binding_check and dtbs_check.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 61 +++++++++++++++++++
>  .../devicetree/bindings/pwm/pwm-meson.txt     | 29 ---------
>  2 files changed, 61 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-meson.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> new file mode 100644
> index 000000000..443ff4e5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -0,0 +1,61 @@
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
> +    enum:
> +      - amlogic,meson8b-pwm
> +      - amlogic,meson-gxbb-pwm
> +      - amlogic,meson-gxbb-ao-pwm
> +      - amlogic,meson-axg-ee-pwm
> +      - amlogic,meson-axg-ao-pwm
> +      - amlogic,meson-g12a-ee-pwm
> +      - amlogic,meson-g12a-ao-pwm-ab
> +      - amlogic,meson-g12a-ao-pwm-cd
> +      - amlogic,meson-s4-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

No need for a type, 'clocks' already has one. You need how many and what 
each one is when more than 1.

> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2

Need the exact names here.

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
> +    apb@fe000000 {
> +      reg = <0x0 0xfe000000 0x0 0x480000>;
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      pwm@8550 {
> +        compatible = "amlogic,meson-gxbb-pwm";
> +        reg = <0x0 0x08550 0x0 0x10>;
> +        clocks = <&xtal>, <&xtal>;
> +        clock-names = "clkin0", "clkin1";
> +        #pwm-cells = <3>;
> +      };
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
