Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AE1C25B50
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 01:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1rMK5VZI6fXr/r6ux+aYxLzkebnmouT+KTQ4t03qx8=; b=H7huYjFl5AaQjq
	4P43R9yFuJsilv7mV9MeTeV6oz2wc+mZHGnUgOQVW1hPnaKHzfJgoZkY2Y4S0VMuZQEt3/lvLjgOu
	zOCDt9A1dYrwTRfIlz7UlMXdNfa7mC6YpCPD9kEMuaxJLd8zW0JZzvEGI8ll0iZ9OBYPibKcZldUx
	P5jKZZ+R3tmk9IsbQWL/FckbSKt3xmXATSBGqt1veVBri1E8jxKrcssKTWQi7WfFFnHO7wW1gXAyR
	K0YR5L0NxlbL7RN0l+CgzGzqpp7oJjbDN7r2rfwSD1KwuKzi/ZGGSHe9z8wa+Fi1aK1fWStTimmKU
	6FBOA1HWEoUhYx3H2uFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK81l-0020fW-1w; Tue, 24 Jan 2023 01:23:09 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK81S-0020ax-MN; Tue, 24 Jan 2023 01:22:52 +0000
Received: by mail-ot1-f49.google.com with SMTP id u13-20020a056830118d00b00686def09868so1065328otq.7;
        Mon, 23 Jan 2023 17:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V1sgADgA70SKeXhD/RheeeugqRShv1VPpwgsy/A47Bo=;
        b=V1gpn8wlXYWqTrHjsdPek0G5RxHwsHQeteuH24HPnrdKKuz0J9oxdz85KRWt6B0hTq
         W1ekRLmmmGqeQt0zY87Hsij9o6Tqv44aJuN8pCmmiR0JWjIMCe/iEM15GUlQQuhl/pTe
         aaFIeLH4dleOTjwO9b+oL0hlZHDg/yxlLxNOAvzLjIByY3EKkGXf3PwDA7zjx2uFhjr6
         C01RNGdHkfy788WHpIvBjie/MdmliVQrZAQxPI/V12jIfhzacwuWXTvr2xsdzt9uz+HJ
         /Yrj8st3N00gWR6xAMfGMbZ7taSyGtgAXCHIVNNrT1DJs38rPaEF+yyrc0nWxnzOqE1u
         32fQ==
X-Gm-Message-State: AFqh2kovul8S/GT/6ZP4PtP+/FZXkkfZs+xuV/w+LH3000g3SPtTCePq
	izlxNLLBap/OnsQO2h+TVg==
X-Google-Smtp-Source: AMrXdXvmGDew3Bm1N7N4NrHTPEZ/EnDXGdyJAibQDZF1jWycasGn07D0bPUpJAQzs9TdUOf3LSF0CQ==
X-Received: by 2002:a05:6830:1048:b0:66e:a83e:9e6b with SMTP id b8-20020a056830104800b0066ea83e9e6bmr13809933otp.25.1674523367356;
        Mon, 23 Jan 2023 17:22:47 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e14-20020a056830200e00b0066eab2ec808sm369992otp.1.2023.01.23.17.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 17:22:46 -0800 (PST)
Received: (nullmailer pid 3121725 invoked by uid 1000);
	Tue, 24 Jan 2023 01:22:42 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Thierry Reding <thierry.reding@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Marc Zyngier <maz@kernel.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
In-Reply-To: <69188960-9d88-4163-8a87-1820fb673eb9@gmail.com>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <69188960-9d88-4163-8a87-1820fb673eb9@gmail.com>
Message-Id: <167452325471.3119159.12105704680288885350.robh@kernel.org>
Subject:  Re: [PATCH 8/8] dt-bindings: pinctrl: Add Amlogic Meson pinctrl binding
Date: Mon, 23 Jan 2023 19:22:42 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_172250_748205_C0D1B92F 
X-CRM114-Status: GOOD (  11.70  )
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


On Mon, 23 Jan 2023 22:30:44 +0100, Heiner Kallweit wrote:
> Add Amlogic Meson pinctrl binding.
> Tested with make targets dt_binding_check and dtbs_check.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  .../pinctrl/amlogic,meson-pinctrl.yaml        | 121 ++++++++++++++++++
>  .../bindings/pinctrl/meson,pinctrl.txt        |  94 --------------
>  2 files changed, 121 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/69188960-9d88-4163-8a87-1820fb673eb9@gmail.com


pinctrl@84: #address-cells:0:0: 2 was expected
	arch/arm/boot/dts/meson8b-ec100.dtb
	arch/arm/boot/dts/meson8b-mxq.dtb
	arch/arm/boot/dts/meson8b-odroidc1.dtb
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

pinctrl@84: compatible: ['amlogic,meson8m2-aobus-pinctrl', 'amlogic,meson8-aobus-pinctrl'] is too long
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb

pinctrl@84: reg: 'anyOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/meson8b-ec100.dtb
	arch/arm/boot/dts/meson8b-mxq.dtb
	arch/arm/boot/dts/meson8b-odroidc1.dtb
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

pinctrl@84: #size-cells:0:0: 2 was expected
	arch/arm/boot/dts/meson8b-ec100.dtb
	arch/arm/boot/dts/meson8b-mxq.dtb
	arch/arm/boot/dts/meson8b-odroidc1.dtb
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

pinctrl@9880: #address-cells:0:0: 2 was expected
	arch/arm/boot/dts/meson8b-ec100.dtb
	arch/arm/boot/dts/meson8b-mxq.dtb
	arch/arm/boot/dts/meson8b-odroidc1.dtb
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

pinctrl@9880: compatible: ['amlogic,meson8m2-cbus-pinctrl', 'amlogic,meson8-cbus-pinctrl'] is too long
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb

pinctrl@9880: reg: 'anyOf' conditional failed, one must be fixed:
	arch/arm/boot/dts/meson8b-ec100.dtb
	arch/arm/boot/dts/meson8b-mxq.dtb
	arch/arm/boot/dts/meson8b-odroidc1.dtb
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

pinctrl@9880: #size-cells:0:0: 2 was expected
	arch/arm/boot/dts/meson8b-ec100.dtb
	arch/arm/boot/dts/meson8b-mxq.dtb
	arch/arm/boot/dts/meson8b-odroidc1.dtb
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
