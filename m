Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92F3C00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 14:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azi3h9WsblYWoDJBGMeWGgKhjKIqhSflej3z501eAeA=; b=bxRwRIbUQLUzew
	7MCKprcNHrjM/ZDFfqSStrC91RB/GjeGG5L7kCNHKP0lcaXkoIyqiS2jhLJV+GqTcp3Trg1/UC2UJ
	+7g7VFSU3gGUOJwdl9jwA+IwajT1gbkmV9F03mz6gG8s2e2zDmHchtRToOk+Kk3wkMVwLMAjglgdu
	LVH12fP/czL9xodQozLbubXCdnEMt01M/gSHsEf3lwNz3GsSmokWeWyOIUVsvwDyb7XoayH8FJ5J3
	Hm8augeGpZhHzMDhK6rWxbJPLgZPhsjSxN/QZplTo2MXj0srTLCUg9SYVv8QLfaG3hjp4nLV6XB21
	uFYbg7dY4mspCToZUDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgrG-006Gu0-24; Thu, 18 Aug 2022 14:50:54 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgns-006El9-Tl; Thu, 18 Aug 2022 14:47:26 +0000
Received: by mail-qk1-f170.google.com with SMTP id g16so1240079qkl.11;
        Thu, 18 Aug 2022 07:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=gdljhD4izytPCTwhmdt8DBVVfc0NydPAltPgDipKvog=;
        b=FBSD+b0pHUiyCSB0uwood4/TCMfycYy/FivUtqarCJmfo2mMJDx0DCUDMb5L5Mv9qg
         11YoYfIVHydgayrXadVQPgvZcJ8GihDKLYUDqp1l6cXGOAdAUjW91goS6s8ioQ4xoXcx
         pG+KlgidNkMMCNL2n1fnUSVUWCR9c9CpEHJGDT0fck5elYi1pjF7QT3hz6HD1j8z9/0q
         JZu8j6ZOhbX9p76yBbDYemwzDIGwprZlUsso1aGORgluUUfG/9fwyqSw5rFBMkLVVSgV
         SK/vp7UEj0pX+EYnbkwOw+/dplY61mmc5ZEl9uNAHUmnQKy7OEnoTBQa/GKdwIh51+19
         6AUw==
X-Gm-Message-State: ACgBeo01kNud4fYdeaclCP+P8aKiyPMO83ne1RoBHnj+NtzSbAjlLY2n
	I9AVRnDCBESUZS3vX+17nBH3yr4qrQ==
X-Google-Smtp-Source: AA6agR6os7Il7llhYeMa4bR2kBtfZkcv6PCsh86UdfBNsIhRKKgO+IREW4lBHpdZzuhJU3WR6VLMIQ==
X-Received: by 2002:a05:620a:2286:b0:6bb:5fa4:58 with SMTP id o6-20020a05620a228600b006bb5fa40058mr2241995qkh.202.1660834040446;
        Thu, 18 Aug 2022 07:47:20 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:25d2:ea0d:b91c:d10a:6423:3870])
        by smtp.gmail.com with ESMTPSA id n1-20020ac86741000000b0031eebfcb369sm1049301qtp.97.2022.08.18.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 07:47:20 -0700 (PDT)
Received: (nullmailer pid 1843176 invoked by uid 1000);
	Thu, 18 Aug 2022 14:47:13 -0000
Date: Thu, 18 Aug 2022 08:47:13 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, netdev@vger.kernel.org, linux-phy@lists.infradead.org, linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update email of Neil Armstrong
Message-ID: <20220818144713.GC1829017-robh@kernel.org>
References: <20220816095617.948678-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220816095617.948678-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_074725_100837_D7768B8A 
X-CRM114-Status: GOOD (  11.65  )
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

On Tue, Aug 16, 2022 at 11:56:17AM +0200, Neil Armstrong wrote:
> From: Neil Armstrong <neil.armstrong@linaro.org>
> 
> My professional e-mail will change and the BayLibre one will
> bounce after mid-september of 2022.
> 
> This updates the MAINTAINERS file, the YAML bindings and adds an
> entry in the .mailmap file.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .mailmap                                      |  1 +
>  .../amlogic/amlogic,meson-gx-ao-secure.yaml   |  2 +-
>  .../display/amlogic,meson-dw-hdmi.yaml        |  2 +-
>  .../bindings/display/amlogic,meson-vpu.yaml   |  2 +-
>  .../display/bridge/analogix,anx7814.yaml      |  2 +-
>  .../bindings/display/bridge/ite,it66121.yaml  |  2 +-
>  .../display/panel/sgd,gktw70sdae4se.yaml      |  2 +-
>  .../bindings/i2c/amlogic,meson6-i2c.yaml      |  2 +-
>  .../mailbox/amlogic,meson-gxbb-mhu.yaml       |  2 +-
>  .../bindings/media/amlogic,axg-ge2d.yaml      |  2 +-
>  .../bindings/media/amlogic,gx-vdec.yaml       |  2 +-
>  .../media/amlogic,meson-gx-ao-cec.yaml        |  2 +-
>  .../devicetree/bindings/mfd/khadas,mcu.yaml   |  2 +-
>  .../bindings/net/amlogic,meson-dwmac.yaml     |  2 +-
>  .../bindings/phy/amlogic,axg-mipi-dphy.yaml   |  2 +-
>  .../phy/amlogic,meson-g12a-usb2-phy.yaml      |  2 +-
>  .../phy/amlogic,meson-g12a-usb3-pcie-phy.yaml |  2 +-
>  .../bindings/power/amlogic,meson-ee-pwrc.yaml |  2 +-
>  .../bindings/reset/amlogic,meson-reset.yaml   |  2 +-
>  .../bindings/rng/amlogic,meson-rng.yaml       |  2 +-
>  .../bindings/serial/amlogic,meson-uart.yaml   |  2 +-
>  .../bindings/soc/amlogic/amlogic,canvas.yaml  |  2 +-
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  2 +-
>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  2 +-
>  .../usb/amlogic,meson-g12a-usb-ctrl.yaml      |  2 +-
>  .../watchdog/amlogic,meson-gxbb-wdt.yaml      |  2 +-
>  MAINTAINERS                                   | 20 +++++++++----------
>  27 files changed, 36 insertions(+), 35 deletions(-)

Applied, thanks!

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
