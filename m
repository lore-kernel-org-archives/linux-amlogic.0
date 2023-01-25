Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CF7C27C76
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 19:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80tIkuE4VztHHYbAE31cDYsjgrWjLrasKfO6s2wKqfA=; b=G1MMyKHD4vy4jr
	aLCk32fZn3M6I6CVnGdbhne/joTDiv7edLC20h+rANu6gSfGw2osu1CFD0uQtyq2LjoYoTP1W24T6
	GcHsnU7KVzLaQY8TPttN/R41tpB9WOoEe3cV9hh6qTM/NW9qXxuWHJd2dp8IQgzsP8/iwmHQla+bH
	NhntTZpimmvdqD9ImN2uqippvWy743mMKDwuGc4dCaXtVOcn4JoCblu0tKpHkIFo9PGY8jwMrsPQp
	2k4goAydYZ/ptDXjRp3C04N9HUG+c/lS5ufhnB/xWpAvu0hYi8rUkxhicmTXdCgzMCKT+JL9mxXUA
	ZATaDidwIvGkxWrE6//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKlJV-008S6F-6z; Wed, 25 Jan 2023 19:20:05 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKlJK-008S52-Ia; Wed, 25 Jan 2023 19:19:56 +0000
Received: by mail-oi1-f171.google.com with SMTP id d188so17186137oia.3;
        Wed, 25 Jan 2023 11:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZPukRskp99fuNYff+LVNhQ3Vv98k10meP7w/WAUKYk=;
        b=tUAzuuYrKSeVLEg2viKF5JdFvSGkynsCgjhy81WcvQf25f58XkJCxn17BR3+Urcn6Y
         kljlb9GUR+SsWNLE3+m8fhE9UwcKNyfTfeo1D5g36ppAoy+XQyy9TyjPWVCcHZ+qVWxV
         COlaY8M7bwpUboRzpIBE8KucbbGzC6ZG9LH1agDmVN0GcZsxdZlR78FRWp+cE2142qFj
         FdatERBTxvJ+OtvVM362FbtvjgLmGP7VOqSVAGNQU5BBE6h5o8whjHsLHjXb8g2BMvKN
         9+T0HD7vLn8CH4xpBj3PsuBv0dvWonqYcc0GNX3AvXFXtFzFOQm3cNpg5Qk7jaJqslcN
         UYsg==
X-Gm-Message-State: AFqh2kooC1ec1dSNhPKwyJVqb8it5IHKOIzn5OketYTJ8aJWu8IvwFWJ
	YcsIN4c6zs+AObY+WE2j0A==
X-Google-Smtp-Source: AMrXdXtpJYBDSpjXNA/NvxappnChwgDMyiCEA6bnsdY2ZTgPxvxKeIkDuuPfOUoF+C3D8F3u31zVsw==
X-Received: by 2002:a05:6808:14c2:b0:36e:a91d:b7ed with SMTP id f2-20020a05680814c200b0036ea91db7edmr15804498oiw.9.1674674393254;
        Wed, 25 Jan 2023 11:19:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x133-20020acae08b000000b003458d346a60sm2619464oig.25.2023.01.25.11.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 11:19:52 -0800 (PST)
Received: (nullmailer pid 2713556 invoked by uid 1000);
	Wed, 25 Jan 2023 19:19:51 -0000
Date: Wed, 25 Jan 2023 13:19:51 -0600
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 5/8] dt-bindings: rtc: Add Amlogic Meson vrtc controller
 binding
Message-ID: <20230125191951.GA2709957-robh@kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <440a7cad-d48f-8975-4dfd-265b235bf629@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <440a7cad-d48f-8975-4dfd-265b235bf629@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_111954_638204_F7EBD6F4 
X-CRM114-Status: GOOD (  22.51  )
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

On Mon, Jan 23, 2023 at 10:28:49PM +0100, Heiner Kallweit wrote:
> Add Amlogic Meson vrtc controller binding.

You are not adding, you are converting.

> Tested with make targets dt_binding_check and dtbs_check.

That's assumed...

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  .../bindings/rtc/amlogic,meson-vrtc.yaml      | 50 +++++++++++++++++++
>  .../bindings/rtc/rtc-meson-vrtc.txt           | 22 --------
>  2 files changed, 50 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
> new file mode 100644
> index 000000000..26a70b3ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/amlogic,meson-vrtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Virtual RTC (VRTC)
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description: |
> +  This is a Linux interface to an RTC managed by firmware, hence it's
> +  virtual from a Linux perspective.  The interface is 1 register where
> +  an alarm time (in seconds) is to be written.
> +  The alarm register is a simple scratch register shared between the
> +  application processors (AP) and the secure co-processor (SCP.)  When
> +  the AP suspends, the SCP will use the value of this register to
> +  program an always-on timer before going sleep. When the timer expires,
> +  the SCP will wake up and will then wake the AP.
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-vrtc
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    bus@ff800000 {
> +      reg = <0x0 0xff800000 0x0 0x100000>;
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      rtc@a8 {
> +        compatible = "amlogic,meson-vrtc";
> +        reg = <0x0 0x000a8 0x0 0x4>;

Just use 1 address/size cell here and then you don't need the bus node 
(which has an error in it (no ranges)).

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
