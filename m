Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B72CD37B4
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Sep 2023 22:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UlNZMHZZ9wldrLAUMcOVN75SbdDeAI22eu8CSRts6hw=; b=TSxB/zzqmDE6NnKvE1kRo9itfS
	4MnCjaUEjRn3P/8gQj2UguGJ1h1+h//79TIfFjzlthIGzUWF5vXAtVZ6QAkN4BLwVkfNnEXNDIiZ4
	FKqch6a/2SkM7btz+YsDNbVHne0QKAbuB+pFqjvAbSwLgIjSy4mUzrA4zkYQE1YU41aijTUhVyjmn
	MGK/TmEIr8tKrzxvEHC7LaBDIBf53Qa6uoL9W8Rib2Y9oUKlXJJaYtK/daaWy7iyIrIQtc1wjTiEI
	n6FXbTIxPzlMayF1Oh2qM9WTQoAz/tnLs8LjfSXW/J++it4uwI4wvhDhp2UmCGdrQH3kVUyDU2Us4
	4tEtI6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi0DR-00E499-0D;
	Sun, 17 Sep 2023 22:26:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi0DH-00E45V-0L
	for linux-amlogic@lists.infradead.org;
	Sun, 17 Sep 2023 22:26:07 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5B2673F149
	for <linux-amlogic@lists.infradead.org>; Sun, 17 Sep 2023 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694989556;
	bh=I9MD/frOYatXvnTs5iG7mBs2PH8/IlXgMFq6W02dlmo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NmQRKRhi0LohoPlWsC0Tzix0+bVD7BtHqObbtgxvQ/+GycprG3wYcIoMLZqE8AiqF
	 k5oIzFDC0M+zXmVKJWGViVC+ZbXccz+sQRfqlMvdMRGxfWXdaP0Fnntn7DSfyDO1o6
	 kqziQ/bOoIBUcT8160q880Hhkv07Dzz4A/pEicwM7CzSajWc2c5jZ9XL3znRlpk+LS
	 U4Fwf/Ua60DpxiL0kyS1OmwQyA2r0/LoSPa1QKIP2TMa2dNm371Pia9Bohv/JrKTKu
	 o38QfEE+s1bYz57xAULK0IN0heugS3zHgR2H8Nsi/LwLzSbkHkIIz9SizYX5aIebp2
	 de38Fzd7zSxTw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-414c96b2ecaso47840011cf.0
        for <linux-amlogic@lists.infradead.org>; Sun, 17 Sep 2023 15:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694989555; x=1695594355;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9MD/frOYatXvnTs5iG7mBs2PH8/IlXgMFq6W02dlmo=;
        b=OMTFrCcsOgwTG/bEF/rUkLZxo3s3SXyv6c1Gf7U2gwjCZ8aYjmX3x1W6QHw1uu0Ldp
         MNtRG6rtT7BDJP3JHhB6I8kVxiB5Hk4halqZE8nqjFhbqtVyOTIEyxbkvsfEzyg88vTV
         VA4tZv199U82DsQq6E3KgLoU/WaoYVJoNbeS+/N1A7oIeC8GI46xlYu8kU8MLQN+RMW7
         SfejQeFhaTYn/nPMZETElSwPniU96yPgNuzwFw5nQqapcK1815cVwGhWphN39mht9ZsF
         y1xK+WAQJHyQLd3YBEdnZh0rpmesh2fttKs9dXQA5vDLl7Q6nLHtTIgKWMJI/DRt9FPq
         BNzw==
X-Gm-Message-State: AOJu0YwDqn2ae0m3MXJ6KRpnGiQ/n5UX3NeJscxr/o93Xb393Kj0nn3f
	1rRsoDaoIQ63x7bbOHAIu9lQuPyuo3fdh39YKiD21HWKxFaHNgi0UotzxhO+mw6QU2OKBCQ/gLM
	/8aBHKfjX1OoulLTD5ccvJ/Wupr4SxDw1HbuxdVS3FtZZCIgbggP5nLqrlMYEu8cB
X-Received: by 2002:ac8:7f91:0:b0:416:db70:2653 with SMTP id z17-20020ac87f91000000b00416db702653mr8876077qtj.38.1694989555279;
        Sun, 17 Sep 2023 15:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFezqxmfqtGhS2FxPCsYpubnTNK6tACbhkhYR/40Y08aycFwHOLWJhOoCYZSF3ud4i1i0EL+r/CXjLeOYzof7Y=
X-Received: by 2002:ac8:7f91:0:b0:416:db70:2653 with SMTP id
 z17-20020ac87f91000000b00416db702653mr8876059qtj.38.1694989554976; Sun, 17
 Sep 2023 15:25:54 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 Sep 2023 15:25:54 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
Mime-Version: 1.0
Date: Sun, 17 Sep 2023 15:25:54 -0700
Message-ID: <CAJM55Z-_yq3DrOC2KxQf8j5y_iDD7ejEReP4XajUz74iVp02LQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 00/22] convert to devm_stmmac_probe_config_dt
To: Jisheng Zhang <jszhang@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Russell King <linux@armlinux.org.uk>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_152559_477661_0086BCD9 
X-CRM114-Status: GOOD (  11.50  )
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

Jisheng Zhang wrote:
> Russell pointed out there's a new devm_stmmac_probe_config_dt()
> helper now when reviewing my starfive gmac error handling patch[1].
> After greping the code, this nice helper was introduced by Bartosz in
> [2], I think it's time to convert all dwmac users to this helper and
> finally complete the TODO in [2] "but once all users of the old
> stmmac_pltfr_remove() are converted to the devres helper, it will be
> renamed back to stmmac_pltfr_remove() and the no_dt function removed."

Thanks for doing this.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>
> Link: https://lore.kernel.org/netdev/ZOtWmedBsa6wQQ6+@shell.armlinux.org.uk/ [1]
> Link: https://lore.kernel.org/all/20230623100417.93592-1-brgl@bgdev.pl/  [2]
>
> Since v1:
>  - rebase on new net-next
>  - add make stmmac_{probe|remove}_config_dt static as suggested by Russell.
>
> Jisheng Zhang (23):
>   net: stmmac: dwmac-anarion: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-dwc-qos-eth: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-generic: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-generic: use devm_stmmac_pltfr_probe()
>   net: stmmac: dwmac-imx: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-ingenic: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-intel-plat: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-ipq806x: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-lpc18xx: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-mediatek: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-meson: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-meson8b: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-rk: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-socfpga: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-starfive: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sti: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-stm32: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sun8i: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sunxi: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-tegra: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-visconti: use devm_stmmac_probe_config_dt()
>   net: stmmac: rename stmmac_pltfr_remove_no_dt to stmmac_pltfr_remove
>   net: stmmac: make stmmac_{probe|remove}_config_dt static
>
>  .../ethernet/stmicro/stmmac/dwmac-anarion.c   | 10 +--
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 15 +---
>  .../ethernet/stmicro/stmmac/dwmac-generic.c   | 15 +---
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 13 ++--
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++------
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 25 +++----
>  .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   | 27 +++----
>  .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   | 19 ++---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  6 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-meson.c | 25 ++-----
>  .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 53 +++++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 14 ++--
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 16 ++---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 10 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 14 ++--
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 17 ++---
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  6 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 23 +++---
>  .../net/ethernet/stmicro/stmmac/dwmac-tegra.c | 10 ++-
>  .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 18 ++---
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 70 ++++++-------------
>  .../ethernet/stmicro/stmmac/stmmac_platform.h |  5 --
>  22 files changed, 127 insertions(+), 317 deletions(-)
>
> --
> 2.40.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
