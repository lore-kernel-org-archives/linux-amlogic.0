Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DD6C6FD20
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 21:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEX3fHFJul3wtAuKQzrsaPgFtYhXeMMJVyGbg1e+11E=; b=00nITtCiNCA4Qk
	wPUX4n/1txWKSgMYkz/2LtUShe2ZnhRtms6JlYdJJPs4qJOzNaveX9UmzNdrKOT/raF+lFUCQTBgw
	63KiNq96hFN8UJQa7Mwp11c43yYPW0nR6GmIwJx5zdkO9aKWT6GxYjglVnDwUaMniJipCHsag5Zhb
	NV9sfl2bjLi6Jq5NXG5Yt6hKUmIIocsTDN6gjMaO+mXqoK5RAQAlo0FLAARTyi7q8W64uGclMnaj/
	iznAYWwHeyBiPXKmIiH3y25tJnUGXv2XKcZ4sRAfEbAywerkk9xO2rsU3iIhkZkMXyP+tniWs7wN2
	a6Q8ra/m3/GI1CxmLqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfpNi-005gdo-1A;
	Fri, 24 Mar 2023 21:55:30 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfpNd-005gcm-1W;
	Fri, 24 Mar 2023 21:55:27 +0000
Received: by mail-ot1-f51.google.com with SMTP id k14-20020a9d700e000000b0069faa923e7eso1607753otj.10;
        Fri, 24 Mar 2023 14:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679694922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cg1iyMYEgtsbLeRCpRhPaB9K329aNM5LHp0JzHXTovw=;
        b=3GA4YnU49SvJVQaTj9NQMSEuSmfTEgJ94tR+W2hUSTZTiMDtx/UhADJBU1zBfB2IkC
         KGHwTxoL6VX/NMQtToYG/w26KH4ck8VpLEMlBPL4con5rkdStWpShN2hxoELlP4Tlj6H
         DkiBl+PXiB7wAXXPVk3zQJInnjoDOcQ2lF0LUsgkpLf/3ZWYf0+lYkMVIZ5Tw5NK6By7
         fw8CzoxizvT74CrxJeOebqQGEiyYNINDOnedT28mOuE6EojfL7iTHyq0EyXa/RpXU62I
         FP/87oNoqE/qlCJA3AAV+m14IXcT7zC1IIoTD4Eu+TuJ0rLjBKPvGFUn9u8YuCALAWNp
         siDw==
X-Gm-Message-State: AO0yUKVbSmRax8HHUmj+GTqVVOk0U+Cjc1l1UL9+1alvOOz+7e+HosGj
	hlv22jKIKZKPpqXJWH0xDg==
X-Google-Smtp-Source: AK7set9dYHYAM+jGb64LFJy7wftyFTrHGyla2bUb6XZxeJK54Y5Ubcj6Z23GeROLf7WDxg8xYzahkQ==
X-Received: by 2002:a05:6830:148d:b0:69f:93bc:26be with SMTP id s13-20020a056830148d00b0069f93bc26bemr2504070otq.21.1679694922173;
        Fri, 24 Mar 2023 14:55:22 -0700 (PDT)
Received: from robh_at_kernel.org ([2605:ef80:80f9:92f0:b372:78c0:69c1:66d6])
        by smtp.gmail.com with ESMTPSA id b12-20020a9d6b8c000000b0069fa7b738b3sm2800448otq.27.2023.03.24.14.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 14:55:21 -0700 (PDT)
Received: (nullmailer pid 49167 invoked by uid 1000);
	Fri, 24 Mar 2023 21:55:19 -0000
Date: Fri, 24 Mar 2023 16:55:19 -0500
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Message-ID: <20230324215519.GA41513-robh@kernel.org>
References: <4fdb1416-b806-c9d3-dc1d-80875b01ac3a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fdb1416-b806-c9d3-dc1d-80875b01ac3a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_145525_535717_072E91B8 
X-CRM114-Status: GOOD (  17.17  )
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

On Sat, Mar 18, 2023 at 12:10:59AM +0100, Heiner Kallweit wrote:
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
> v6:
> - add meson-pins definition
> - change usage of unevaluatedProperties
> ---
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     | 65 +++++++++++++
>  .../pinctrl/amlogic,meson-pinctrl-common.yaml | 57 +++++++++++
>  .../amlogic,meson-pinctrl-g12a-aobus.yaml     | 66 +++++++++++++
>  .../amlogic,meson-pinctrl-g12a-periphs.yaml   | 70 ++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml | 74 +++++++++++++++
>  .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml  | 76 +++++++++++++++
>  .../bindings/pinctrl/meson,pinctrl.txt        | 94 -------------------
>  7 files changed, 408 insertions(+), 94 deletions(-)
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
> index 000000000..7dccf18c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> @@ -0,0 +1,65 @@
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
> +required:
> +  - compatible
> +
> +patternProperties:
> +  "^bank@[0-9a-z]+$":
> +    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio

       unevaluatedProperties: false

And other meson-gpio references. With that,

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
