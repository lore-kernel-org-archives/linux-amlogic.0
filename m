Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82CEC25B50
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 01:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwsY/o6ZERu70w5G9EH3+lkMIgEZNweIuuRYF/+8u9k=; b=HThdtMTBfbG79S
	y0AHXOsBOp2IEkiQwPmn6iEksIEegMPEiwAqZn6wjghJBz/P3++YS6i7i6GD3znEhkz4NimZlDUud
	ymbR9t2JJb/Viz2rJlATRwvURZZHdqL5sVhxVkEqfh48RPtGUoqZmoGWiodlPJgdZDHchntQiRIh7
	28xT2KOaey0PzAv5ksCkPqCr2TMV3P3ewysyNiNiD1pS3S6p8vevPyYTXOg95NQIg18q02uuoCkRH
	ypXM20bqMTthRvZNDl6LIY/ifKK2Zb844VWdECg79f1HMq9MQzMqkwwLUQh68aGaUcuj80HLxg0XI
	NANrEF8OgWzMoTMCSjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK81l-0020fi-Gl; Tue, 24 Jan 2023 01:23:09 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK81U-0020bQ-F0; Tue, 24 Jan 2023 01:22:55 +0000
Received: by mail-oi1-f177.google.com with SMTP id s124so12068637oif.1;
        Mon, 23 Jan 2023 17:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ex9rtTnvTnd9QbSXyCMMOTB4h/ID+YN5WA2a1NWXifg=;
        b=2kZxFpq6bDUa/2gAoarVV5RhkRAXyTtTKu331uo4MdjQLIWj6MdhxKFph1Dt3bHiTa
         JD3aIyA+PwcK56zflPcnCUCVNenoeUQ8aQbP+J9/VytOE0JoGwzqMjzkFqPpvcIg6Mg5
         kyP4jGPLb0LsltN86ZSdfxKjDm0pRca4RaADHxGp1IvbVLH2MYm4P8kO3WKPgm8O6o8N
         0dMo/nLCgMbFBJbgy9fG9LeIucETgTN1/GRBdlJpcCqcfgzEseoV6TDLbHeZwyiUIb4q
         ch+yxK0qWSQ2iznI+TtWD17EL6lKg05SWIIy9foQAnCAXIssctZxejHEHW9xXiVGuDZI
         kpyA==
X-Gm-Message-State: AFqh2kr73qZ0ZXSMrWJStSSTeoCHlMGWiIOS1+dpYtXzzhQd96sEvMoo
	QcpxoLUFpHGu3e1fXvEIrg==
X-Google-Smtp-Source: AMrXdXs6LQcPgF2diyR2U+oxSitgZ0tz0VaoZCvl/s4plnLszo+9iYH4wIG5df8vF6fqzGOTOXWWJQ==
X-Received: by 2002:a54:4403:0:b0:35e:60a4:a92b with SMTP id k3-20020a544403000000b0035e60a4a92bmr21722284oiw.4.1674523370090;
        Mon, 23 Jan 2023 17:22:50 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e10-20020a9d560a000000b00684152e9ff2sm378880oti.0.2023.01.23.17.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 17:22:49 -0800 (PST)
Received: (nullmailer pid 3121721 invoked by uid 1000);
	Tue, 24 Jan 2023 01:22:42 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-pwm@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Jerome Brunet <jbrunet@baylibre.com>, =?utf-8?q?=2C?= Thierry Reding <thierry.reding@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
In-Reply-To: <0d492f0e-abb3-33f6-3ee9-09e1440a9015@gmail.com>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <0d492f0e-abb3-33f6-3ee9-09e1440a9015@gmail.com>
Message-Id: <167452325220.3117278.179752950407641934.robh@kernel.org>
Subject: Re: [PATCH 6/8] dt-bindings: pwm: Add Amlogic Meson PWM binding
Date: Mon, 23 Jan 2023 19:22:42 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_172252_553081_5267474D 
X-CRM114-Status: GOOD (  11.49  )
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


On Mon, 23 Jan 2023 22:29:27 +0100, Heiner Kallweit wrote:
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

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/0d492f0e-abb3-33f6-3ee9-09e1440a9015@gmail.com


pwm@550: compatible:0: 'amlogic,meson-gx-ao-pwm' is not one of ['amlogic,meson8b-pwm', 'amlogic,meson-gxbb-pwm', 'amlogic,meson-gxbb-ao-pwm', 'amlogic,meson-axg-ee-pwm', 'amlogic,meson-axg-ao-pwm', 'amlogic,meson-g12a-ee-pwm', 'amlogic,meson-g12a-ao-pwm-ab', 'amlogic,meson-g12a-ao-pwm-cd', 'amlogic,meson-s4-pwm']
	arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb

pwm@550: compatible: ['amlogic,meson-gx-ao-pwm', 'amlogic,meson-gxbb-ao-pwm'] is too long
	arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb

pwm@8550: compatible:0: 'amlogic,meson8-pwm' is not one of ['amlogic,meson8b-pwm', 'amlogic,meson-gxbb-pwm', 'amlogic,meson-gxbb-ao-pwm', 'amlogic,meson-axg-ee-pwm', 'amlogic,meson-axg-ao-pwm', 'amlogic,meson-g12a-ee-pwm', 'amlogic,meson-g12a-ao-pwm-ab', 'amlogic,meson-g12a-ao-pwm-cd', 'amlogic,meson-s4-pwm']
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

pwm@8550: compatible:0: 'amlogic,meson-gx-pwm' is not one of ['amlogic,meson8b-pwm', 'amlogic,meson-gxbb-pwm', 'amlogic,meson-gxbb-ao-pwm', 'amlogic,meson-axg-ee-pwm', 'amlogic,meson-axg-ao-pwm', 'amlogic,meson-g12a-ee-pwm', 'amlogic,meson-g12a-ao-pwm-ab', 'amlogic,meson-g12a-ao-pwm-cd', 'amlogic,meson-s4-pwm']
	arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb

pwm@8550: compatible: ['amlogic,meson8-pwm', 'amlogic,meson8b-pwm'] is too long
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

pwm@8550: compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm'] is too long
	arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb

pwm@8650: compatible:0: 'amlogic,meson8-pwm' is not one of ['amlogic,meson8b-pwm', 'amlogic,meson-gxbb-pwm', 'amlogic,meson-gxbb-ao-pwm', 'amlogic,meson-axg-ee-pwm', 'amlogic,meson-axg-ao-pwm', 'amlogic,meson-g12a-ee-pwm', 'amlogic,meson-g12a-ao-pwm-ab', 'amlogic,meson-g12a-ao-pwm-cd', 'amlogic,meson-s4-pwm']
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

pwm@8650: compatible:0: 'amlogic,meson-gx-pwm' is not one of ['amlogic,meson8b-pwm', 'amlogic,meson-gxbb-pwm', 'amlogic,meson-gxbb-ao-pwm', 'amlogic,meson-axg-ee-pwm', 'amlogic,meson-axg-ao-pwm', 'amlogic,meson-g12a-ee-pwm', 'amlogic,meson-g12a-ao-pwm-ab', 'amlogic,meson-g12a-ao-pwm-cd', 'amlogic,meson-s4-pwm']
	arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb

pwm@8650: compatible: ['amlogic,meson8-pwm', 'amlogic,meson8b-pwm'] is too long
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

pwm@8650: compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm'] is too long
	arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb

pwm@86c0: compatible:0: 'amlogic,meson8-pwm' is not one of ['amlogic,meson8b-pwm', 'amlogic,meson-gxbb-pwm', 'amlogic,meson-gxbb-ao-pwm', 'amlogic,meson-axg-ee-pwm', 'amlogic,meson-axg-ao-pwm', 'amlogic,meson-g12a-ee-pwm', 'amlogic,meson-g12a-ao-pwm-ab', 'amlogic,meson-g12a-ao-pwm-cd', 'amlogic,meson-s4-pwm']
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

pwm@86c0: compatible:0: 'amlogic,meson-gx-pwm' is not one of ['amlogic,meson8b-pwm', 'amlogic,meson-gxbb-pwm', 'amlogic,meson-gxbb-ao-pwm', 'amlogic,meson-axg-ee-pwm', 'amlogic,meson-axg-ao-pwm', 'amlogic,meson-g12a-ee-pwm', 'amlogic,meson-g12a-ao-pwm-ab', 'amlogic,meson-g12a-ao-pwm-cd', 'amlogic,meson-s4-pwm']
	arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb

pwm@86c0: compatible: ['amlogic,meson8-pwm', 'amlogic,meson8b-pwm'] is too long
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

pwm@86c0: compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm'] is too long
	arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dtb
	arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905d-vero4k-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dtb
	arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q200.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-q201.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dtb
	arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dtb


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
