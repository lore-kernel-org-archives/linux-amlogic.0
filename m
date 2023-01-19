Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4049C004D4
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rl3i42H5wX8vXxBeVFXQIcg4zrAELa8WQ1wZQa6LLy4=; b=GTEx3J19S+vrGE
	bCd3hsdLkHz7OtvwUgM/FAgjdkkHUmIK5CVignH+dtF6TbCNipzV4SKjrZcD4NqoSg+lofuL+xj7i
	UC0vfJuEr5JcUmQMOnlbRiX8Tq3U8TxQq5WHEsTcpmEDcP8SPrWxhGXaqOrghHnPlV5mNCUpLpZ3t
	P3bz3wgvIB8+iokT3lNbmWrbvMA7Q8RkTFezlcqwBfzzUlOt6J4DdTRoacFaHVlGUscWxwlRSiMhM
	uL8T3Z4Ujvi/WPucoQkiiKoNog2LukLcSYc9uLkiYPJlZ/5ALZRjT5mxfQaXdLvTrT27og3DVwUex
	zD9fAop+pRUGpZmguhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pISxa-004ZSR-Hh; Thu, 19 Jan 2023 11:19:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pISxX-004ZQr-3D
	for linux-amlogic@lists.infradead.org; Thu, 19 Jan 2023 11:19:57 +0000
Received: by mail-wm1-x32c.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso3317360wmc.4
        for <linux-amlogic@lists.infradead.org>; Thu, 19 Jan 2023 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=2foPOEb90UyA/MJALqYP5FbUTQrze1RPaG+nVIqRt0I=;
        b=Ieu72sdcmYgGG3PlfHBUHxJl3gj5WnemeYAPms2q289TVEz15wrbeBvyW6Ieiz9sgU
         h6NIXPwaRQ16ix6KvIS02bHmZgstuFhggpao9Aa6KBtuJFC0kAaXc5pQN36Cax/QnUoK
         2PUvMD74UXn0x24Q/bOIWHIM2IHyTpLNp8qrYv+8USV+E9vZ1cvDNw8M2vPhnFxYlB/E
         nQGXh9EzF5wVMNFlQWPdVWg4sKPcEWZy0+O9n64a2FNqFC+EFvSJGFnH2kPerxUQyw3C
         5tUbad55722X1YpjyDPLvn6IUptP64Cdnc4moxTUJJ8qfmS+SZFyu02BgslurtJhOrs5
         0VWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2foPOEb90UyA/MJALqYP5FbUTQrze1RPaG+nVIqRt0I=;
        b=RxfCCZDzoXWus8r4LllBqhMVQ9CWz8BO1lwnd2ocR4k860LetsgoKBoMDBrr1dp6WW
         d9L6NoQHaVa0kHM4Qe5/m9qpDYv1YrqIKy/t+J7AzPhTBdRwxCwsGGAulKBIWvy9ARcX
         tm3KILP912inhqjXh3y7+SjduYVDpFgRft72ckDgpBQsa5SO0bm8ibuE6EYtxbBex3Ji
         IVRG9AXzBAEM0q7SCKEfrhvirmOBuqTZfH9aKz1iYdlDYUGoXEHORyeJSYGLp4oe/bbe
         ngR6oDGzFlk3b5grsTthi2VpB/m/QjNHwGq5WecW9D2T4djQHv9GUqr7G0Uja793nKaZ
         4/9w==
X-Gm-Message-State: AFqh2krJldmDrMdSyXartoooWDc4INhG3qnfXBnKjXc/6rwQ/rQsdbcP
	6JscjxauNNmmznTK8QqKes3X0A==
X-Google-Smtp-Source: AMrXdXvNO3Z4PWh6/DvCNgXXqNwnt7jnRnqMnqd9gIR5iYvzRWp6qf4higUbmzz63oEaUcdAIP4haQ==
X-Received: by 2002:a1c:750e:0:b0:3da:fcf6:7146 with SMTP id o14-20020a1c750e000000b003dafcf67146mr9912297wmc.14.1674127193017;
        Thu, 19 Jan 2023 03:19:53 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l27-20020a05600c2cdb00b003d99da8d30asm4909913wmc.46.2023.01.19.03.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 03:19:52 -0800 (PST)
References: <20230116074214.2326-1-yu.tu@amlogic.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil  Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
  Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
 <qi.duan@amlogic.com>
Subject: Re: [PATCH V6 0/3] Add S4 SoC PLL and Peripheral clock controller
Date: Thu, 19 Jan 2023 12:18:30 +0100
In-reply-to: <20230116074214.2326-1-yu.tu@amlogic.com>
Message-ID: <1jilh2ydns.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_031955_160301_C57ABE1A 
X-CRM114-Status: GOOD (  11.03  )
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


On Mon 16 Jan 2023 at 15:42, Yu Tu <yu.tu@amlogic.com> wrote:

> 1. Add S4 SoC PLL and Peripheral clock controller dt-bindings.
> 2. Add PLL and Peripheral clock controller driver for S4 SOC.
>
> Yu Tu (3):
>   dt-bindings: clock: document Amlogic S4 SoC PLL & peripheral clock
>     controller
>   clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
>   clk: meson: s4: add support for Amlogic S4 SoC peripheral clock
>     controller

You are adding 2 controller driver with this series.
Making 2 driver patches on clk/ is good. Please do the same for the bindings

>
> V5 -> V6: Change send patch series, as well change format and clock flags.
> V4 -> V5: change format and clock flags and adjust the patch series as suggested
> by Jerome.
> V3 -> V4: change format and clock flags.
> V2 -> V3: Use two clock controller.
> V1 -> V2: Change format as discussed in the email.
>
> Link:https://lore.kernel.org/all/20221123021346.18136-1-yu.tu@amlogic.com/
>
>  .../clock/amlogic,s4-peripherals-clkc.yaml    |  104 +
>  .../bindings/clock/amlogic,s4-pll-clkc.yaml   |   50 +
>  MAINTAINERS                                   |    1 +
>  drivers/clk/meson/Kconfig                     |   25 +
>  drivers/clk/meson/Makefile                    |    2 +
>  drivers/clk/meson/s4-peripherals.c            | 3874 +++++++++++++++++
>  drivers/clk/meson/s4-peripherals.h            |  218 +
>  drivers/clk/meson/s4-pll.c                    |  875 ++++
>  drivers/clk/meson/s4-pll.h                    |   88 +
>  .../clock/amlogic,s4-peripherals-clkc.h       |  131 +
>  .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |   30 +
>  11 files changed, 5398 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>  create mode 100644 drivers/clk/meson/s4-peripherals.c
>  create mode 100644 drivers/clk/meson/s4-peripherals.h
>  create mode 100644 drivers/clk/meson/s4-pll.c
>  create mode 100644 drivers/clk/meson/s4-pll.h
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
>
>
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
