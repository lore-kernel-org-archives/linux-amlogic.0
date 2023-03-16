Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15557C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Mar 2023 20:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hYkWdgCU0uS8InAUfDhHCbZ21klQ+IX3pXUvg/4pQ8=; b=aNobwniJEaCpTX
	luRgfcmDJOZBTdOLdQW4FgFuAc9ejubV/JvV11uAw//nQ9emBh8as3FUQmCASTcrAXHAmA8fNiJkT
	YZG5qDckT9EgqJYWeJb8ITWjWuLdftSY0mJSIQrt3wud0k7QGKG9UsgpM5/9PxmxMclc0czeSIZte
	6jrv5LGf9xVxJbdVRGfKtUbspiIOMD6yyy7BEauztyiTVazfJzvun6caAAryvbjadxzzRAw1KXIe/
	CM2LN2lwd6bQnKuNvWWFH1BzWuaaXOreDPGRoOPZeUQmDky3hiMEQRbLtkwuuE8xcVsL93qMrU+cQ
	CWfTjhesmRousPwqK1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcufp-00HZbd-0N;
	Thu, 16 Mar 2023 20:58:09 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcufk-00HZaY-1u;
	Thu, 16 Mar 2023 20:58:06 +0000
Received: by mail-io1-f41.google.com with SMTP id f14so1398269iow.5;
        Thu, 16 Mar 2023 13:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679000282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HIW6nQ4XWfdQUx5k0mQvCv0iyxvkQg+uxRbSjtQvbU=;
        b=C/1043T3gyf/YgKrFIarxpa+h1QEDQUP2/8ZO6zNL0ODqoxI/0pb8hpxhbhNacl7Bt
         OPibb1N17IH2ohMTpLSuprwHcP3BY53TtODu8p05hDjlInGq4gnwVfLBXGf4Ug7P7hPu
         NWdoD3/8ewCe5lLtmQuEqtHeSbs+gKBsfNOPUHmd7sw5LBQMDHKb+Ne8u3gvf3rcsBSn
         pSmWJwCRA3C8umRS7rjyM34bYTCFCYNYSwWYKRiDNSTvLl72gIz96t3J/VcG+omqdquM
         hYIG34HanitEtO0yOsz3l1VIqnoskFPOE3wd1Jc8W3WmrO7Krsepj56Z086LSIsuaX+T
         XS+w==
X-Gm-Message-State: AO0yUKXLkSk+u5IFAu11So9MxpnG1lUj8qfCFAhhn1tFdkfiHzM9yACP
	VcJ7kERr/O3VX4SgVoZQzA==
X-Google-Smtp-Source: AK7set9UxV2kBMCVOZt9L1z0RGHb77a9pOW482C1HFL1oz1QCJnjQu80RimbxFWV+bLvXeoI90SWBQ==
X-Received: by 2002:a5d:9e51:0:b0:74e:3d27:f014 with SMTP id i17-20020a5d9e51000000b0074e3d27f014mr194738ioi.3.1679000281908;
        Thu, 16 Mar 2023 13:58:01 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id 20-20020a5ea514000000b0073462b45b76sm49703iog.52.2023.03.16.13.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 13:58:01 -0700 (PDT)
Received: (nullmailer pid 3866429 invoked by uid 1000);
	Thu, 16 Mar 2023 20:58:00 -0000
Date: Thu, 16 Mar 2023 15:58:00 -0500
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Message-ID: <20230316205800.GA3859968-robh@kernel.org>
References: <2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c2fa53f-ff8d-6b7d-3037-4d11a9fb82df@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_135804_627390_61C953CA 
X-CRM114-Status: GOOD (  17.70  )
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

On Wed, Mar 15, 2023 at 10:23:57PM +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson pin controller binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - consider that more than one compatible can be set
> - remove bus part from example
> v3:
> - remove minItem/maxItem properties for compatible
> v4:
> - split patch to be able to deal with the different reg/reg-names
> v5:
> - remove compatible definition from common yaml
> - move pincfg-node and pinmux-node definition to meson-gpio object definition
> ---
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     | 63 +++++++++++++
>  .../pinctrl/amlogic,meson-pinctrl-common.yaml | 52 ++++++++++
>  .../amlogic,meson-pinctrl-g12a-aobus.yaml     | 64 +++++++++++++
>  .../amlogic,meson-pinctrl-g12a-periphs.yaml   | 68 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml | 72 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml  | 74 +++++++++++++++
>  .../bindings/pinctrl/meson,pinctrl.txt        | 94 -------------------
>  7 files changed, 393 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> new file mode 100644
> index 000000000..05074df12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-a1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson A1 pinmux controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: amlogic,meson-pinctrl-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-periphs-pinctrl
> +      - amlogic,meson-s4-periphs-pinctrl
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +patternProperties:
> +  "^bank@[0-9a-z]+$":
> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio

       unevaluatedProperties: false

That will then make all the child nodes throw errors, so you'll need to 
add them.

Same elsewhere.

> +
> +    properties:
> +      reg:
> +        maxItems: 2
> +
> +      reg-names:
> +        items:
> +          - const: mux
> +          - const: gpio

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
