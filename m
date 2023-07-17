Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C19EB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jul 2023 09:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwktmAvT1UyIah0Ivxh+FeUEV9RN4XWgxycy/uEsVnc=; b=LtPQ9qhEAF02HO
	u+blyb04pF2nlKSZTIOX0V5s2Ijp+re0w5SfyijdgpCy3nGXKXrn7yYzb9MSxSK//12TRnEBsFJI+
	2fulQobZSlxjqIcKVsfgpcDaWpfZ4XbdIbj4dVIRYpqrPaG2U79fwH+wJ6TB7ol48I2J8oALPPNst
	d57E9RdxrSHHYI25OdjyfuN4YuQ0flxB/6Sq9s5J3RW1tiucc9U4LpO003DC1yi0kiQHQJuaZMuEQ
	UhxKDQuCDMeSIFRAzVPMYmGXU0Q6d54CtY1gHP3N0QkGqQ2ptK7cVN3eimHDgrruAJHBll5J8Ohp0
	ER1bN+8mGgOhauPPXtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLK65-003WzH-1m;
	Mon, 17 Jul 2023 09:01:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLK5q-003WtL-28
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jul 2023 09:00:45 +0000
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C98443F916
	for <linux-amlogic@lists.infradead.org>; Mon, 17 Jul 2023 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689584428;
	bh=JHnHS0B61qcl/Td8/lm9RDjYsfSOyiiTTr5PsC3FWaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=j0Odb0vkxyx7gdL6HQGcfVEgcpfs0SPkKfppmWbmJ/HHD4ABykTqM9t0CDwW60DtZ
	 ZFTI6uDz+W9dto8cXoXcyswJ41OO9ZbHRTfn9/LqDNPaEaHkN3pNqBfhHthGKVt/b0
	 ofK24nm7lwWLRp6XBEvoSJVaR7Y3ol8jPc1MmUP5Th1FrCNXFtBiy38Cs/DX+KVTuS
	 AUUmoNr1rQORxFaFFzClYM205U9qEm65NADoxIIZzMU7sPVb7M+l3p8Wo9cxxcprbx
	 58ZAo0VGqNGWTPnh/ZgF1FXtquKpctZOiu1VM/GI2rGp4HNMSlsSaP9dzlrUL3PLCZ
	 sNwtENALY4ORg==
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3a3df1e1f38so6749160b6e.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jul 2023 02:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689584422; x=1692176422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHnHS0B61qcl/Td8/lm9RDjYsfSOyiiTTr5PsC3FWaA=;
        b=hW17bJPL/gxDEbW48he2sMO2hvmEIATE+8hf02yf013EkqvLHD9eDHtmrbgakl6NQd
         ORLtPoUEPBfZlxNRrDgzCmZZ1RKexE8SRkN+AmBNKNrmwgrS5zf9o1EL8FGW/d/Qnnjw
         fczIaG0/zGGt37c2JfrTbXTT59kJA51Z8TezjnmaHledlDJLWQyDI9quniesY+V0AYXo
         8S2nlm1IwTRV6HPzJPBSqQPtd8JeYXAqqQ9P8eWcvEnULvqUeP84gSMFIQBSfAuf+FR0
         jX0G8T4KSXMXCBJ9HIxmg9CNGgMHD4VsbJHGOvwrC6F++90Bd5iV1MlzXOFgDTVG/geD
         uQ1A==
X-Gm-Message-State: ABy/qLa0WI7Wcs2+n7hN5UIP9ibu0uZbB3V0kut5YvOu6yNtovQ6GSZH
	eNAUGA4JnpwgXuttzOoTF50ooyCfMDK0GCq0PNb5yecIbWhcWxW/MO+eG53JiIqVuYo2vgEUovO
	wqBb+aQ1mK1O5+q3c2Na4g8FZEO22V3N4q8yuaTcbqu1VLx9GjqOw6HZo0Vkv63j5
X-Received: by 2002:ac8:7c48:0:b0:403:2dfd:1fdf with SMTP id o8-20020ac87c48000000b004032dfd1fdfmr15892602qtv.23.1689584401531;
        Mon, 17 Jul 2023 02:00:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEMazgMYki8IR1CHHFS4st+/s+/y1hah0oj0+nBQlO+NhXDM06BTdCzgvWJM4HcjDSd4KVriXj5Pmlo8MNpIrE=
X-Received: by 2002:ac8:7c48:0:b0:403:2dfd:1fdf with SMTP id
 o8-20020ac87c48000000b004032dfd1fdfmr15892526qtv.23.1689584401259; Mon, 17
 Jul 2023 02:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 17 Jul 2023 10:59:45 +0200
Message-ID: <CAJM55Z_Eba-LKxKAH0i0_vDM6JO_HvWgDLCLFQDave2+UFLMzA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Chester Lin <clin@suse.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Chen-Yu Tsai <wens@csie.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-oxnas@groups.io, 
	linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_020034_853230_12547EC0 
X-CRM114-Status: GOOD (  13.15  )
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

On Fri, 14 Jul 2023 at 19:52, Rob Herring <robh@kernel.org> wrote:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c | 5 +----
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 2 --
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c     | 1 -

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks,
/Emil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
