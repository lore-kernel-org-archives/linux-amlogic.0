Return-Path: <SRS0=B1XO=CM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47309C2BC11
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE72020797
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3V1fN3nt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="io3XEfuy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE72020797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2oO6X0dDQYfEvYKgq8IpBSXWK+u6yalH9zEZhdqsETk=; b=3V1fN3nt9/WFmi8bYFz0/sYAPN
	fnauKk/yP7hINXjOAk13meOtyo/j4TMW18DamqKVyd+eyJVPAOFBk1vZqjjpfIQukK22nmvJyVjMG
	jsY9cp0L9dV4NmF2EHIrmMcAiAFij5YjrXtSr6D91KYfhhr9QvjX2Uh4tIplzrU3yEEHjKeQPKJDx
	5REJdSJOBGAC/KtOI939ij0ydcxmKaq4eyOS47F2ZqdXiDriTUP2zi+cZTe8i+59YJs0gWGNSd3Kp
	JmyOsLBwMGMx1gpuqXIGnHPpDxh40ZX1LoXwusnmxoXEvKdkZrd8a9PYR9x6uaElUGmWSM+7d7jZT
	u0bQOpFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDybR-00074c-9c; Thu, 03 Sep 2020 23:25:13 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDybK-0006zg-6d
 for linux-amlogic@lists.infradead.org; Thu, 03 Sep 2020 23:25:10 +0000
Received: by mail-pg1-x541.google.com with SMTP id m5so3334730pgj.9
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2020 16:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7bCjZ17rrssUWD1s9Actl4XKGz8CJPPkZoB8VrWyPY=;
 b=io3XEfuyAYQoZQ9TXQIpFhLwVhOjImI42C9gKY74x7/3fKnO66e7EB6TFNSieZSnzg
 WFa7Ra160IV6IshsgJvBoQ67+jkOHhdg/zRmGyKWppIUiIZ6Nr4+v9ua0DrgHCrrV84Z
 AdnxpxAhlCAoGPrAdEXN+8W/S6appdKPmNsNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7bCjZ17rrssUWD1s9Actl4XKGz8CJPPkZoB8VrWyPY=;
 b=d5P05gODj6S6QiN2OFAZVLb6evgHv8MA6OOo6TQTguYITuz/pOVgEv+Ky0B60JKUyC
 zIHvxtTS161ptDTz1CygyWxBb1MFq/JGVwRnHtUcGMaioiOfRPSQ4pNOFBOy6cpNogQC
 ELRX5tHPMt/8C8qzyqNuwxmCXpwDySU/+bhDTN+2in7+6FvJgGZDijRuGVkk7l0XtdlO
 4HjNzRFa7GN9wjhHPHokFCaD6slfp9Hp6yDFgG7I/CC4VOa2u0a46Q7PaiBjABP62sPy
 WYHT/dz6+eS2NN9EydYfJXQcP7F6sopQZngzHaCwbtkLUoU5E5zD1ZpAHYcOwgdyGekb
 l/JQ==
X-Gm-Message-State: AOAM5300UI+WzMbXr+vu7w5y8CiFNHQq/4s7yvN500HESphcEUAfzt3N
 i8fwW8L/gGZh4TDc1zTZ+0/nvQ==
X-Google-Smtp-Source: ABdhPJykLK0R3y6ZX5+5h9yGOD1JsS8MF6/gXrE6nqqJCGkLR9OTZUQAdhtthXcKK+3zLwzrSw/hHw==
X-Received: by 2002:a63:d449:: with SMTP id i9mr4632930pgj.83.1599175501895;
 Thu, 03 Sep 2020 16:25:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q7sm3614459pgg.10.2020.09.03.16.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 16:25:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 0/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for all host drivers
Date: Thu,  3 Sep 2020 16:24:35 -0700
Message-Id: <20200903232441.2694866-1-dianders@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_192506_348708_38DC3F00 
X-CRM114-Status: GOOD (  20.16  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-tegra@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, swboyd@chromium.org,
 Lars Persson <lars.persson@axis.com>, linux-omap@vger.kernel.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Yangtao Li <tiny.windzz@gmail.com>,
 Hu Ziji <huziji@marvell.com>, Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
 Pierre Ossman <pierre@ossman.eu>, Saiyam Doshi <saiyamdoshi.in@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Barry Song <baohua@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Douglas Anderson <dianders@chromium.org>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Stefan Wahren <wahrenst@gmx.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ricky Wu <ricky_wu@realtek.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Ben Dooks <ben-linux@fluff.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mmc@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Paul Cercueil <paul@crapouillou.net>,
 Lee Jones <lee.jones@linaro.org>, Marek Vasut <marex@denx.de>,
 Anson Huang <Anson.Huang@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, linux-mediatek@lists.infradead.org,
 Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>, Vinod Koul <vkoul@kernel.org>,
 Robert Richter <rrichter@marvell.com>, Viresh Kumar <vireshk@kernel.org>,
 Jun Nie <jun.nie@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As per discussion [1], it seems like it should be quite safe to turn
on PROBE_PREFER_ASYNCHRONOUS for all sd/mmc host controllers.  Let's
give it a shot.  For some discussion about this flag, see the commit
message for commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
probe").

I've broken this series into chunks based on LTS kernel releases to
attempt to make it easier if someone wanted to cherry-pick it to an
older kernel.  While these cherry-picks won't be conflict free, there
should only be trivial context conflicts and no problems with drivers
that are totally missing.  This is a bit of a compromise between a
1-big patch and a many-part patch series.

I have only tested this on a rk3399-kevin (sdhci-of-arasan) and a
rk3288-veyron (dw_mmc-rockchip) device and only lightly.  If this
patch causes anyone problems those drivers should be marked with
PROBE_FORCE_SYNCHRONOUS, debugged, and then go back to prefer
asynchronous.  Any problems are likely just a hidden bug that has been
exposed by this change.

NOTE: in theory, it'd be nice if there was a KConfig option that we
could flip that would turn on async probe everywhere (except for those
that opt out by adding PROBE_FORCE_SYNCHRONOUS).  My hope is that by
adding this flag in more places it will become clear that this flag is
working reliably and easier to move over when we're ready.

While coccinelle is too difficult for my feeble brain, I managed to
whip up a pretty terrible python script to help with this.  For your
edification:

import os
import sys
import re

for filename in os.listdir("."):
    found_plat = False
    found_driver = False
    output = []
    for line in open(filename, "r").readlines():
        output.append(line)

        if "struct platform_driver" in line:
            found_plat = True
        if found_plat and re.search(r"\t\.driver\s*=\s*{", line):
            found_driver = True
            found_plat = False
        mo = re.search(r"(\s*)\.name(\s*)=", line)
        if found_driver and mo:
            if mo.group(2) == " ":
                space = " "
            elif mo.group(2) == "\t":
                # Best we can do
                space = " "
            elif mo.group(2).startswith("\t"):
                # Guess that removing one tab is right
                space = mo.group(2)[1:]
            else:
                # Guess it's all spaces
                space = mo.group(2)[7:] + " "

            output.append("%s.probe_type%s= PROBE_PREFER_ASYNCHRONOUS,\n" % (mo.group(1), space))
            found_driver = False

    open(filename, "w").write("".join(output))

[1] https://lore.kernel.org/r/CAPDyKFq31bucJhP9hp1HSqh-qM2uNGHgDoyQpmbJf00nEf_T4Q@mail.gmail.com/


Douglas Anderson (6):
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.9
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.14
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.19
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v5.4
  mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that are newer than 5.4

 drivers/mmc/host/alcor.c                      | 1 +
 drivers/mmc/host/android-goldfish.c           | 1 +
 drivers/mmc/host/atmel-mci.c                  | 1 +
 drivers/mmc/host/au1xmmc.c                    | 1 +
 drivers/mmc/host/bcm2835.c                    | 1 +
 drivers/mmc/host/cavium-octeon.c              | 1 +
 drivers/mmc/host/davinci_mmc.c                | 1 +
 drivers/mmc/host/dw_mmc-bluefield.c           | 1 +
 drivers/mmc/host/dw_mmc-exynos.c              | 1 +
 drivers/mmc/host/dw_mmc-hi3798cv200.c         | 1 +
 drivers/mmc/host/dw_mmc-k3.c                  | 1 +
 drivers/mmc/host/dw_mmc-pltfm.c               | 1 +
 drivers/mmc/host/dw_mmc-rockchip.c            | 1 +
 drivers/mmc/host/dw_mmc-zx.c                  | 1 +
 drivers/mmc/host/jz4740_mmc.c                 | 1 +
 drivers/mmc/host/meson-gx-mmc.c               | 1 +
 drivers/mmc/host/meson-mx-sdhc-mmc.c          | 1 +
 drivers/mmc/host/meson-mx-sdio.c              | 1 +
 drivers/mmc/host/moxart-mmc.c                 | 1 +
 drivers/mmc/host/mtk-sd.c                     | 1 +
 drivers/mmc/host/mvsdio.c                     | 1 +
 drivers/mmc/host/mxcmmc.c                     | 1 +
 drivers/mmc/host/mxs-mmc.c                    | 1 +
 drivers/mmc/host/omap.c                       | 1 +
 drivers/mmc/host/omap_hsmmc.c                 | 1 +
 drivers/mmc/host/owl-mmc.c                    | 1 +
 drivers/mmc/host/pxamci.c                     | 1 +
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 1 +
 drivers/mmc/host/rtsx_pci_sdmmc.c             | 1 +
 drivers/mmc/host/rtsx_usb_sdmmc.c             | 1 +
 drivers/mmc/host/s3cmci.c                     | 1 +
 drivers/mmc/host/sdhci-acpi.c                 | 1 +
 drivers/mmc/host/sdhci-bcm-kona.c             | 1 +
 drivers/mmc/host/sdhci-brcmstb.c              | 1 +
 drivers/mmc/host/sdhci-cadence.c              | 1 +
 drivers/mmc/host/sdhci-cns3xxx.c              | 1 +
 drivers/mmc/host/sdhci-dove.c                 | 1 +
 drivers/mmc/host/sdhci-esdhc-imx.c            | 1 +
 drivers/mmc/host/sdhci-esdhc-mcf.c            | 1 +
 drivers/mmc/host/sdhci-iproc.c                | 1 +
 drivers/mmc/host/sdhci-milbeaut.c             | 1 +
 drivers/mmc/host/sdhci-of-arasan.c            | 1 +
 drivers/mmc/host/sdhci-of-aspeed.c            | 2 ++
 drivers/mmc/host/sdhci-of-at91.c              | 1 +
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 1 +
 drivers/mmc/host/sdhci-of-esdhc.c             | 1 +
 drivers/mmc/host/sdhci-of-hlwd.c              | 1 +
 drivers/mmc/host/sdhci-of-sparx5.c            | 1 +
 drivers/mmc/host/sdhci-omap.c                 | 1 +
 drivers/mmc/host/sdhci-pic32.c                | 1 +
 drivers/mmc/host/sdhci-pxav2.c                | 1 +
 drivers/mmc/host/sdhci-pxav3.c                | 1 +
 drivers/mmc/host/sdhci-s3c.c                  | 1 +
 drivers/mmc/host/sdhci-sirf.c                 | 1 +
 drivers/mmc/host/sdhci-spear.c                | 1 +
 drivers/mmc/host/sdhci-sprd.c                 | 1 +
 drivers/mmc/host/sdhci-st.c                   | 1 +
 drivers/mmc/host/sdhci-tegra.c                | 1 +
 drivers/mmc/host/sdhci-xenon.c                | 1 +
 drivers/mmc/host/sdhci_am654.c                | 1 +
 drivers/mmc/host/sdhci_f_sdh30.c              | 1 +
 drivers/mmc/host/sh_mmcif.c                   | 1 +
 drivers/mmc/host/sunxi-mmc.c                  | 1 +
 drivers/mmc/host/tmio_mmc.c                   | 1 +
 drivers/mmc/host/uniphier-sd.c                | 1 +
 drivers/mmc/host/usdhi6rol0.c                 | 1 +
 drivers/mmc/host/wbsd.c                       | 1 +
 drivers/mmc/host/wmt-sdmmc.c                  | 1 +
 69 files changed, 70 insertions(+)

-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
