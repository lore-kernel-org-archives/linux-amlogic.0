Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEC3C04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 07:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhJvKd3n9y10SmRW+NW5qjmIgLHArFMVzInutboYX1U=; b=aRB7O3MvR/IyjJ
	FnjqE48a+DPoVkXHboj3uZQsMbEMflOHGiZ6n5sQoHsHpBJtvgkhJi6dSjz9deGx+e3In8+YbqJLR
	n9YIJMqfGgH8/05qbjKyyD0OIVVpkGxXN6hGVOZR1wIGLqZ0HyoLFRumz3XnP7p7SO5RIWrpQb5qx
	Wguy7t99lvah4aa5MMkNBcVBpxJhUwCX2T+a7FMG/s4j9q5nBj1IG17Aa3fqazXs3OixCBzJAB9un
	lNwFM1EKW7l8p6JnAouYPb7ivaWs1YsQqh3czXMAaOLdONnq9kraH74pnQuH431ypuFI/JSJYxi+L
	OucKyjKFwsp4gMBkXfhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxk3-005LyY-1l; Thu, 28 Jul 2022 07:15:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxjz-005Lvy-6t
	for linux-amlogic@lists.infradead.org; Thu, 28 Jul 2022 07:15:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id id17so467226wmb.1
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Jul 2022 00:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:subject:date:in-reply-to:message-id
         :mime-version;
        bh=AaIaSUDCvbW74aHuiO4CJrSTxDz4crTVOTtdXBqcE0U=;
        b=AWbcHHbX5voPsqXsYc0lPhQLZ7zq2Rbg+WDm4j47FHMHXMKBPLuAwqpaMLT4oN34qS
         R6hvle5W3TN4f3TJRhkhZx0QPFmqjX98W46tEqeGl2ss33pWsTUsz6ICWmUhi/rNGcp6
         3eQgOfcF15Ov6JaO/BaW85eAfyYfbTZQOU7lHqyUe9RumDh0CPDhSAXX5tspMaURVBIN
         hAIUu2L93pP5MlYjVltII27G+d2lmMvuyd0SOq/7MlSZeJoZH16sIqKEMA/AAaXCwDjZ
         ZO3DlrFDankTYdhuu2q7oCaJtjXdqKBN2swatEdyWuhc0kJ1eFLYTZlGg6qxjCqabDjz
         qUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:subject:date
         :in-reply-to:message-id:mime-version;
        bh=AaIaSUDCvbW74aHuiO4CJrSTxDz4crTVOTtdXBqcE0U=;
        b=37CLoC7nywFODNcYmNGl5/G/f0O3ZfA7x25ddHK/AIHJJ/2gKHc4Q2ri+e+bp4YTbn
         SMkN8tWxUvpFovdUN26fx9/9Ru/3E0HCIwV+pFfXLv74a22WTa2+EAgtzKvikjBK6ekZ
         VQufHz2ekAhgcdTxagg4mZ11t7JrR+9vf4+xJAr4EzZzmbAL8P6soBd1NUKUuYvw1BLY
         UGr1AVVzo0THAZHt9E3+h6SdGVZOn6Q0jEzAmSqYA5DyLzC+D4059sMMC2I7yt1QMGGk
         UGSwevVdfP5GN+tQOVY4zBViC6kNSXYGMLgInZLgs4QmUrFPukaMfkw1hUcDdg2f55Pu
         vsZg==
X-Gm-Message-State: AJIora9xZLYjAsaaZWLLHIuL5WtrhnnllX1K41TIeb0gYEDe1726R5Ts
	fr379cMYVNXmOeDLYBsxb/R9I6LkL1AZdA==
X-Google-Smtp-Source: AGRyM1uBQSHcp5qkcijv00Bu7Y7/z1KirWW8lPysYxj5MYnLBGbrvNTmEd6qDPwVfOty8mtSm4vSMw==
X-Received: by 2002:a05:600c:1289:b0:3a4:8401:5ced with SMTP id t9-20020a05600c128900b003a484015cedmr384142wmd.148.1658992524267;
        Thu, 28 Jul 2022 00:15:24 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n186-20020a1ca4c3000000b003a2d87aea57sm4519126wme.10.2022.07.28.00.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 00:15:23 -0700 (PDT)
References: <20220728054202.6981-1-yu.tu@amlogic.com>
User-agent: mu4e 1.8.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil  Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
  Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V2 0/3] Add S4 SoC clock controller driver
Date: Thu, 28 Jul 2022 09:08:44 +0200
In-reply-to: <20220728054202.6981-1-yu.tu@amlogic.com>
Message-ID: <1j8rodhfn9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_001527_489538_7BEC9419 
X-CRM114-Status: GOOD (  11.02  )
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


On Thu 28 Jul 2022 at 13:41, Yu Tu <yu.tu@amlogic.com> wrote:

> 1. Add clock controller driver for S4 SOC.
>
> Yu Tu (3):
>   dt-bindings: clk: meson: add S4 SoC clock controller bindings
>   arm64: dts: meson: add S4 Soc clock controller in DT
>   clk: meson: s4: add s4 SoC clock controller driver
>
> V1 -> V2: Change format as discussed in the email.
>
> Link:https://lore.kernel.org/linux-amlogic/20220708062757.3662-1-yu.tu@amlogic.com/
>
>  .../bindings/clock/amlogic,gxbb-clkc.txt      |    1 +
>  MAINTAINERS                                   |    1 +
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   11 +
>  drivers/clk/meson/Kconfig                     |   15 +
>  drivers/clk/meson/Makefile                    |    1 +
>  drivers/clk/meson/s4.c                        | 4732 +++++++++++++++++
>  drivers/clk/meson/s4.h                        |  296 ++
>  include/dt-bindings/clock/s4-clkc.h           |  146 +
>  8 files changed, 5203 insertions(+)
>  create mode 100644 drivers/clk/meson/s4.c
>  create mode 100644 drivers/clk/meson/s4.h
>  create mode 100644 include/dt-bindings/clock/s4-clkc.h
>
>
> base-commit: b293bc9286ee21824e93f0fcfed3b78fdfee01e6

Please don't post until you have addressed *ALL* the comments from the
previous version.

At first glance, I can see that this is still a single driver for
what is obviously 2 controllers with 2 register spaces. Simple comments
like the "<< 2" in the register declaration have not been addressed either.

Seeing that, I have not reviewed this version further.
I won't until all the comments from v1 are either addressed or answered.

Regards
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
