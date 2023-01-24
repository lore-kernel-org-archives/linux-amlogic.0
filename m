Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9ADC05027
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 01:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkvIGjSzxcwZtXCfif/X89gFKTg5R0CpkEF7r94N+mI=; b=Pl1JRW4leo1wpg
	MZQXn8D1vSINQH7YbVC5h92HykMpxnnJiG9BUoViXL88GZ5wyQT5r7b0lVu2S3WcVHIUIMU8hgr9d
	Y24SD9kPgizBEYE4i+GnSRw128FbUWtz7KTVnEIMgZxZUZaJGRwm265DmeWlWWE77I6EcmvpAYsri
	PueUnllNOiw6ofrFHZTipuwubHHbMChJ+e/MNI3/XY8nYRU4EVVUvClJyvEz5EU/0cVOQhn418QQ0
	/utAmlaahxqwar4ZoE1KwNJHW4LXwvAX2A6sS+LB04VsDbg+V6Ta4LOrHU6y5nIyCJ1w4euQR9MM4
	MJLq5U4UCR5BE1kYYwmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK81U-0020bm-6w; Tue, 24 Jan 2023 01:22:52 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK81Q-0020ar-F1; Tue, 24 Jan 2023 01:22:50 +0000
Received: by mail-oo1-f48.google.com with SMTP id c145-20020a4a4f97000000b004f505540a20so2423349oob.1;
        Mon, 23 Jan 2023 17:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2cQMAwwRREiwr/oZxVGOyaxb8i+wrIpEeXOLH8JzHGE=;
        b=t6o+ehGNC4D9ERU+MNnonzkUY01LsU//Oqetuy82n8yYIrcclQO8qMscXrTtvwq5oR
         zGfniAUREdWKCC2oCqoSnUMJBwRLOD4H6zNZgL9LTkNQzeYg8baR8i+JN4BTAwA0S3qT
         9CdU+vW7zXuPP43CuvYylQ0D+2tGjARI9ZQdqHoO+Wf7dfeclb2xqtN07BJtJwSHen+U
         gYF4z/viaT6qopGuBN0SXB8hVug19PnUZfrbUmtg6kcP1f0x/E/PHSgbC+C6qf5Cqr8A
         GbrPSh9/ws1elMUCmeVwj7GGIl0B0hZBUx4ywcs/PoyI9p88ygyvAwATU3OSNV6yifWb
         kkJQ==
X-Gm-Message-State: AFqh2kqDmyLUbA/FeLEda4fFVbDHuJDYxzsYldf3LbrL2VVrXJpPZn8u
	3tG5r9BnXbjGqfncpS7xvg==
X-Google-Smtp-Source: AMrXdXujZwMm6fXYSgOameyhHf0Aq2138aPsqvYqCTkEXLOXKLmaxvKaplYwPXK4MO3oQ+4UfNXC9g==
X-Received: by 2002:a4a:8c68:0:b0:4a3:aa96:23c7 with SMTP id v37-20020a4a8c68000000b004a3aa9623c7mr11797638ooj.6.1674523365895;
        Mon, 23 Jan 2023 17:22:45 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z14-20020a4a984e000000b004fca8a11c61sm277950ooi.3.2023.01.23.17.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 17:22:45 -0800 (PST)
Received: (nullmailer pid 3121723 invoked by uid 1000);
	Tue, 24 Jan 2023 01:22:42 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-pwm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?utf-8?q?=2C?= "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Marc Zyngier <maz@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <06289641-18b1-320d-6162-7ae176452f31@gmail.com>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <06289641-18b1-320d-6162-7ae176452f31@gmail.com>
Message-Id: <167452325371.3118653.16373677195744392136.robh@kernel.org>
Subject: Re: [PATCH 7/8] dt-bindings: interrupt-controller: Add Amlogic Meson
 GPIO interrupt controller binding
Date: Mon, 23 Jan 2023 19:22:42 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_172248_521978_8703FBC2 
X-CRM114-Status: GOOD (  12.29  )
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


On Mon, 23 Jan 2023 22:30:08 +0100, Heiner Kallweit wrote:
> Add Amlogic Meson GPIO interrupt controller binding.
> Tested with make targets dt_binding_check and dtbs_check.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  .../amlogic,meson-gpio-intc.txt               | 38 ----------
>  .../amlogic,meson-gpio-intc.yaml              | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/06289641-18b1-320d-6162-7ae176452f31@gmail.com


interrupt-controller@4080: compatible: ['amlogic,meson-s4-gpio-intc', 'amlogic,meson-gpio-intc'] is too long
	arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb

interrupt-controller@9880: compatible:0: 'amlogic,meson-gpio-intc' is not one of ['amlogic,meson8-gpio-intc', 'amlogic,meson8b-gpio-intc', 'amlogic,meson-gxbb-gpio-intc', 'amlogic,meson-gxl-gpio-intc', 'amlogic,meson-axg-gpio-intc', 'amlogic,meson-g12a-gpio-intc', 'amlogic,meson-sm1-gpio-intc', 'amlogic,meson-a1-gpio-intc', 'amlogic,meson-s4-gpio-intc', 'amlogic,meson-sc2-gpio-intc']
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
	arch/arm/boot/dts/meson8b-ec100.dtb
	arch/arm/boot/dts/meson8b-mxq.dtb
	arch/arm/boot/dts/meson8b-odroidc1.dtb

interrupt-controller@9880: compatible: ['amlogic,meson8-gpio-intc', 'amlogic,meson-gpio-intc'] is too long
	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
	arch/arm/boot/dts/meson8-minix-neo-x8.dtb

interrupt-controller@9880: compatible: ['amlogic,meson-gpio-intc', 'amlogic,meson8b-gpio-intc'] is too long
	arch/arm/boot/dts/meson8b-ec100.dtb
	arch/arm/boot/dts/meson8b-mxq.dtb
	arch/arm/boot/dts/meson8b-odroidc1.dtb

interrupt-controller@9880: compatible: ['amlogic,meson-gpio-intc', 'amlogic,meson-gxbb-gpio-intc'] is too long
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

interrupt-controller@9880: compatible: ['amlogic,meson-gpio-intc', 'amlogic,meson-gxl-gpio-intc'] is too long
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

interrupt-controller@f080: compatible: ['amlogic,meson-axg-gpio-intc', 'amlogic,meson-gpio-intc'] is too long
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dtb
	arch/arm64/boot/dts/amlogic/meson-axg-s400.dtb

interrupt-controller@f080: compatible: ['amlogic,meson-g12a-gpio-intc', 'amlogic,meson-gpio-intc'] is too long
	arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-u200.dtb
	arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-s922x-khadas-vim3.dtb
	arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dtb

interrupt-controller@f080: compatible: ['amlogic,meson-sm1-gpio-intc', 'amlogic,meson-gpio-intc'] is too long
	arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dtb
	arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dtb


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
