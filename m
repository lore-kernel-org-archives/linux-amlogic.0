Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F92C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Apr 2022 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgX+4iHfsSCzT71a+31QBy8hORVOsT6VWiGNQFHxfwc=; b=jA/HyiXq3nn7nD
	DxwoDe10bboTbBNq092BspmTVr92XDfIU7LIQ0SbGkrpGwc4fMh9eBGq+HBUQJDfeGQkV7otWrRXt
	cQT9Q/8DlyqbR3KzrexBxEuKFFjmpxZSFTlSx7wCn3AYEYHorbZmyOlfPQNDJrgK3jn6PFUnYriB7
	RKBIKJy9KIVQpCixRx+NWaCQRFeox1aALiJ74Aj5TOq8/hXpi4PB/2GMn29/YvcS+qUNw+dk1p8X9
	dKm3RVQOU0BjFnlZpLb4WfrcITzbFUkH+QYxie1r71D6sPELRHhLEOCzOCvm/1kYoKmkfnT0aF3vS
	n3AcJ3XdHxWBpw1gxYVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf1So-006FYU-Jo; Thu, 14 Apr 2022 15:32:54 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf1SP-006FK8-J2; Thu, 14 Apr 2022 15:32:31 +0000
Received: by mail-ej1-x630.google.com with SMTP id i27so10754625ejd.9;
 Thu, 14 Apr 2022 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zNo0g28tlK9vSNHNGKqqjmBjPaYSOEtIiawAODAYH3c=;
 b=cW++jIHdTWB0e/u7vyX0744QVnVIpLHeGh5WEu4BOxVM9uRZh7gq6XNbmyhxdiX0XR
 DnNObAKYV/atK29rtd9VDxytlGyydSI3GK7gv8UXn2s61BkOk7SirtAUukWezAkshDlq
 S/vxhU3aqvdD4Zqx1321bK8UkTZ5MlXIcTcawWigG3NoYBFnJf5STvdVx3TUpJBfsLar
 EQAclsSro41RYhUaHhwMeeWqdSJWbXVcjR24H6KwhSZsIWtZvTUOcbxQYsJQYQDPhirF
 VFdLgQ3N+EYyMsyuH2QM2c0kXC8IiDC08CHcYMnXhx4rxUrl3t3+RKGADf5TY3AHrxf3
 qKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zNo0g28tlK9vSNHNGKqqjmBjPaYSOEtIiawAODAYH3c=;
 b=WBmOMjM3rUUnNr9jWCmwgP0AdltT1IWIx/YkAinP06viDk6LlK+nnJPjE8owaaVFzQ
 H94cmys+qRCTZvC0/RSnWSw/txKyJ0f97Oenm4hRBgTJTWWRPvTFJGNdKaU4bmvXpusl
 0Pp/VUZvSqZV14ideqQ6fml2enY/ayRZMBgDTpCC2UmqsDGoztHQKVZn5Qg1pc35e72m
 /D/kFTOhjOW09WF7KstTiKh36llrlTu0FMSEhu4jjagMbh+AMgAFnn+q0r3TsVA16ukG
 2OB6XCnIGGxUUl1LkXnZkvOUr2TZtPfPNrh1efajWoWDwviYaWA5kHGIOn0j/NPvGOG4
 lBmQ==
X-Gm-Message-State: AOAM531COtpKoMDRi0WkMd7YPRzx4LTRoAs+39LXKP4WsDGbMZ2iY3A5
 o3j6D7Rf0qZ+/dNaFHUHnpR+xethGGUe1NRn34E=
X-Google-Smtp-Source: ABdhPJzbycImSsBidIp4JSSW5b5SF1qL/I1dfcfErig8MjQOErRGdzGC2WsE7sy1HibLlRHnfGkpr6ZwwcMbQbIMAXs=
X-Received: by 2002:a17:907:3f03:b0:6df:b04b:8712 with SMTP id
 hq3-20020a1709073f0300b006dfb04b8712mr2856347ejc.290.1649950345064; Thu, 14
 Apr 2022 08:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <CGME20220414063849eucas1p126e41b53ff0d342f5c48408994b704e9@eucas1p1.samsung.com>
 <20220401103604.8705-12-andriy.shevchenko@linux.intel.com>
 <3a24ef01-3231-1bee-7429-dce5680c5682@samsung.com>
 <CAHp75VfMPpfeMpawRyLo_GtLR8+gVGgm8zW-fatp6=9a9wK18A@mail.gmail.com>
In-Reply-To: <CAHp75VfMPpfeMpawRyLo_GtLR8+gVGgm8zW-fatp6=9a9wK18A@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 14 Apr 2022 17:32:14 +0200
Message-ID: <CAFBinCCCtZvdp+01DdEE=-f7rZ8V46O125wKDqE1muA645sdUg@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] pinctrl: meson: Replace custom code by
 gpiochip_node_count() call
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_083229_668393_33304CD0 
X-CRM114-Status: GOOD (  14.06  )
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

Hi Andy,

On Thu, Apr 14, 2022 at 3:51 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
[...]
> > This patch landed in linux next-20220413 as commit 88834c75cae5
> > ("pinctrl: meson: Replace custom code by gpiochip_node_count() call").
> > Unfortunately it breaks booting of all my Amlogic-based test boards
> > (Odroid C4, N2, Khadas VIM3, VIM3l). MMC driver is no longer probed and
> > boards are unable to mount rootfs. Reverting this patch on top of
> > linux-next fixes the issue.
>
> Thank you for letting me know, I'll withdraw it and investigate.
If needed I can investigate further later today/tomorrow. I think the
problem is that our node name doesn't follow the .dts recommendation.

For GXL (arch/arm64/boot/dts/amlogic/meson-gxl.dtsi) the GPIO
controller nodes are for example:
  gpio: bank@4b0 {
      ...
  }
and
  gpio_ao: bank@14 {
      ...
  }

See also:
$ git grep -C6 gpio-controller arch/arm64/boot/dts/amlogic/*.dtsi

Marek did not state which error he's getting but I suspect it fails
with "no gpio node found".


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
