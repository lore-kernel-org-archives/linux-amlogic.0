Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3CDC001E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Oct 2023 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EJKORa7twVpGAMqxedb4PWUrOidwWoExcaxYMY/zZE=; b=tBd0xtlk9n6ebu
	qPg4z2upYd7j2Ydr77E+ax/U4N+UkDjE1s7hdkLvJ9Uatmc+fv5iO6xeBZYLnHGwYC1pFFjTnwD29
	UO/awEPzoKcraDcs23SvcSGEKlIlhOkD/aPmpOLJNXYIrRmKAWczZERy3W+K0XZ3sEe7DXXM6fyDN
	hiXaDNFgtIFI2LRQTm4UBiYRpTs2QK+9AXkDcoSsaOsUThmKCTcByzswFECr9ipAxyvWzq0hTC2nt
	8ia1W/PX5wCisOs46yAi2HjF1p11fJcXQh8g+b/PJrQlsSwi85XitX5lZEIicFSIGEgMLxcxdKokz
	xmc3RMsIpi0VgD2oh70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quvpF-007XJK-35;
	Mon, 23 Oct 2023 14:22:37 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quvp9-007XHE-2Y
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Oct 2023 14:22:36 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c515527310so47692631fa.2
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Oct 2023 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698070949; x=1698675749; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=E+6RuqzMvi6/cl8AxQsj75tOfUbUu+K7Xht0IansoAI=;
        b=AZdokcxnMtYG8syx2rdlml8P2f6Mx38wo+89zv3235mhD7w3fVQ9+xD5NsJu5Bw8C8
         ZQrqs5WDcRRUIu+0yHU4DRnisgQeAgbrHTJ3FFbvDDV6YKrxkSVz3J3uQNOPxM6FHcMD
         8H5xD4tRNfS5pvfFmjRASOqi6kznuKMqY0MKeYUh16LN+u21hElXY+kdZhNLd68+WSW/
         9K6MsIRLjGL4U9ky74P2ILBsXKWkfmNhxNt2dCk4WxoNAN8jvCHNdBcsog3wefHuiHnL
         dc95Wjxovsn+3ZAbQhBE0TIqstPaGnfsdgfDyId0cxOxaV38BCuoZpv3Lrl+GnZimfej
         fZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698070949; x=1698675749;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+6RuqzMvi6/cl8AxQsj75tOfUbUu+K7Xht0IansoAI=;
        b=dKWHwSUFjphQaH5dhukC1Kd2QFrHVvB0TcaMwEraRTZV7q50uEkzNXfzb7MIaq9HpC
         yLv1id4xVBqhu2mgZethovICAYSEy4aoZ5Imhyb5CJPdbBl+t4NsvGK7NTs5bctgm79O
         lr6LD34N9W9vCHfFCU0Levu2Ly2TJqCiUrHBU56TMC/JmKosVlMHqehgZCfq9Jb+Wb24
         lDdPzyAgYRzWUySEA+koE5sHpuR98bp8Y7VlFhdXkp6WprdIQgpk3Sgtyb15eFzapUbA
         r8a2q7fepdlisDvLVZQcZYTbYfM+BYLEDb3IBeX9Axu5xGmkpzStUYhuZojOzIUequYF
         beag==
X-Gm-Message-State: AOJu0YyjvsRMuENZjSYyUz9dm7zMyePhC5MruLotK5UlX1xQ7w+SV3Fv
	BIVhMeqtixz0uwJ2bNkL9W9xyw==
X-Google-Smtp-Source: AGHT+IHc6CmbwwWmCnTdzGhXOAKUQkxUhWrqELC5YNvIOIMaavPZPWSg5xlXBNXGrT5DBzHza0MHgQ==
X-Received: by 2002:a2e:9051:0:b0:2c5:19e9:422c with SMTP id n17-20020a2e9051000000b002c519e9422cmr6179488ljg.24.1698070948940;
        Mon, 23 Oct 2023 07:22:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f0e1:712a:7682:b4ff])
        by smtp.gmail.com with ESMTPSA id e16-20020adfef10000000b0032d8354fb43sm7934803wro.76.2023.10.23.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:22:28 -0700 (PDT)
References: <20231023102810.4001943-1-arnd@kernel.org>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Yu
 Tu <yu.tu@amlogic.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>, Jian Hu <jian.hu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] clk: meson: S4: select
 CONFIG_COMMON_CLK_MESON_CLKC_UTILS
Date: Mon, 23 Oct 2023 16:20:42 +0200
In-reply-to: <20231023102810.4001943-1-arnd@kernel.org>
Message-ID: <1j1qdlpgf0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_072232_020946_25514D95 
X-CRM114-Status: GOOD (  13.43  )
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


On Mon 23 Oct 2023 at 12:28, Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Without this, the newly added drivers fail to link:
>
> aarch64-linux-ld: drivers/clk/meson/s4-pll.o: in function `meson_s4_pll_probe':
> s4-pll.c:(.text+0x13c): undefined reference to `meson_clk_hw_get'
> aarch64-linux-ld: drivers/clk/meson/s4-peripherals.o: in function `meson_s4_periphs_probe':
> s4-peripherals.c:(.text+0xb0): undefined reference to `meson_clk_hw_get'
>
> Fixes: e787c9c55edad ("clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver")
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied fixing this minor checkpatch warning (1 extra char)

WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: e787c9c55eda ("clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver")'

and preparing the PR for Stephen now.
Thanks Arnd.

> ---
> v2: fix up both drivers, the first version only addressed the s4-pll one.
> ---
>  drivers/clk/meson/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index c5303e4c16043..29ffd14d267b6 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -149,6 +149,7 @@ config COMMON_CLK_S4_PLL
>  	tristate "S4 SoC PLL clock controllers support"
>  	depends on ARM64
>  	default y
> +	select COMMON_CLK_MESON_CLKC_UTILS
>  	select COMMON_CLK_MESON_MPLL
>  	select COMMON_CLK_MESON_PLL
>  	select COMMON_CLK_MESON_REGMAP
> @@ -161,6 +162,7 @@ config COMMON_CLK_S4_PERIPHERALS
>  	tristate "S4 SoC peripherals clock controllers support"
>  	depends on ARM64
>  	default y
> +	select COMMON_CLK_MESON_CLKC_UTILS
>  	select COMMON_CLK_MESON_REGMAP
>  	select COMMON_CLK_MESON_DUALDIV
>  	select COMMON_CLK_MESON_VID_PLL_DIV


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
