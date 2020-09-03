Return-Path: <SRS0=B1XO=CM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836CCC433E2
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 08:39:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B41C206C0
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 08:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WHeWEFgU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LNj9s0VD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B41C206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/PVe/jFIWnowpm0G5SeHKZB5CIsFTQe4jHkP2IbQ5yU=; b=WHeWEFgUO7Nsuhi5dhZlIY+8L
	angbrEcnEYxMepnPxkUlik7RLqlsYaaAmeVk1nSGktc64LTRoclLO8v6bbn+U2V77J4oILRyHgqag
	CcC6EyZFMQQr7tt8sFhIqdFbeFyL/EZr9zPykMFYw3JpPUr0PSIN7LzwF8Iygan6KhITerfbE1htL
	NeQPfRHueJE6oWnVJz/v/qGfqsC7vP5raLxft63mhl/qggs3vxHALbjnZVvI/zLvF1Jejl3hufq0D
	m2KENRqwGaFGQGl74FLMXWktqK13x6l1f89NGeIbgGuTLyKgJjI3Pzm080hRp+PygkapPGD0nW/gm
	dLmtujGzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDklp-0004fC-VS; Thu, 03 Sep 2020 08:39:02 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDkKF-0007X5-4O
 for linux-amlogic@lists.infradead.org; Thu, 03 Sep 2020 08:10:48 +0000
Received: by mail-ua1-x943.google.com with SMTP id i22so50903uat.8
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2020 01:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LrOjlA1x52Sx3PNdexN+2X/ozkPpzSng8Vccaxs54Zw=;
 b=LNj9s0VDa9drWeLKU2VtX/B9wbQgZmQkc6JpKMfK3e9C+15ObehWeink4X7oCMDirp
 WPafqIvq9t4fj1FDRMiaapi9ohjzXf41O7a5YaafCVZPvVQ9M2pyoTOBkhB2a+84EXOK
 AiANcRalw5n97ufIUIOei9DTEGLrtbKe/WatzVK99QTXRF7K/qYw86pIst4ltUDzOJQd
 Gn04+W0cxdaZGW5nD0qXPij/7pKctDdjpM60SGN4pobi5xXjPsFhZ71Edv4qO8JPESdz
 B5NaqGd/yzgyFw8wRa5dCrYP9Mm74fIRm4/AmfvKAjITRKgEyNhX9nL3RBTyIQ0ByLE0
 bmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LrOjlA1x52Sx3PNdexN+2X/ozkPpzSng8Vccaxs54Zw=;
 b=AoytxIM/FbAcgcP5Nc4pAHYT0/pBFErQ41DK490NwBsH/MDI19ofkmqtr5H8IEireJ
 13wmxBl4pV/n7ORgcGEkxyfHopGnT9w5GvobzgsIjG14EEu48HZ25E38SbZ7HrljznPv
 ou4dlYZdopgwlSg+VHlx+j85ql4PnBkxIEKSRceVXsbRkOHK4iVahdstElsecmZrSJeh
 bSwK3olFIIhgiP8V35kxoXb/bA0uAihBnKGV5ReR/35LPVdI0D9Ha8W+alUg7JXnc9sv
 OSHix9aXoRM7X6vh4/nX8nsvQoIbpT/dk9d4U62Drr3WY0++YSgbDXGWpVnSIna4nomR
 oVQQ==
X-Gm-Message-State: AOAM533CrRkfLv9PluB6609FGfwVH5qDQjGegCvqny8a02RGOOjTviIL
 g+1Q3Wqmv6g6KDJ4ehQ3io2B/lmDHhKPrjGZjSBGvg==
X-Google-Smtp-Source: ABdhPJw7qVTiuZksAFcWPUutKJ0zYg2tpTJGwRa2BumR3h5BzwPXYQoKG7VAuSHc8ImsX3M25x7A+yZZGSSWhcaYqhE=
X-Received: by 2002:ab0:6f91:: with SMTP id f17mr357139uav.129.1599120626145; 
 Thu, 03 Sep 2020 01:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200902193658.20539-1-krzk@kernel.org>
In-Reply-To: <20200902193658.20539-1-krzk@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Sep 2020 10:09:49 +0200
Message-ID: <CAPDyKFqBS-ws6fkirDQL8EEqh9At88K2vrG5fc8K5_JiXsmfyg@mail.gmail.com>
Subject: Re: [PATCH 00/11] mmc: Minor cleanups and compile test
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_041031_515614_167F6BFC 
X-CRM114-Status: GOOD (  15.96  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, linux-rpi-kernel@lists.infradead.org,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Scott Branden <sbranden@broadcom.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 2 Sep 2020 at 21:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Hi,
>
> Set of minor cleanups.  Patches requiring more attention:
>  - 6/11: Testing and review would be appreciated,
>  - 11/11: I build tested multiple architectures but not all and
>    definitely no all possible configs. This one could sit on the lists
>    for few days so 0-day would try it.
>
> Best regards,
> Krzysztof
>
> Krzysztof Kozlowski (11):
>   mmc: bcm2835: Simplify with dev_err_probe()
>   mmc: davinci: Simplify with dev_err_probe()
>   mmc: dw_mmc-zx: Simplify with dev_err_probe()
>   mmc: jz4740: Simplify with dev_err_probe()
>   mmc: meson: Simplify with dev_err_probe()
>   mmc: sdhci-brcmstb: Simplify with optional clock and dev_err_probe()
>   mmc: sdhci-of-arasan: Simplify with dev_err_probe()
>   mmc: sdhci-tegra: Simplify with dev_err_probe()
>   mmc: dw_mmc: Simplify with dev_err_probe()
>   mmc: sdhci-of-sparx5: Use proper printk format for dma_addr_t
>   mmc: host: Enable compile testing of multiple drivers
>
>  drivers/mmc/host/Kconfig           | 42 ++++++++++++++++--------------
>  drivers/mmc/host/bcm2835.c         |  4 +--
>  drivers/mmc/host/davinci_mmc.c     |  5 ++--
>  drivers/mmc/host/dw_mmc-zx.c       | 11 +++-----
>  drivers/mmc/host/dw_mmc.c          |  9 +++----
>  drivers/mmc/host/jz4740_mmc.c      |  5 ++--
>  drivers/mmc/host/meson-gx-mmc.c    | 16 ++++--------
>  drivers/mmc/host/sdhci-brcmstb.c   | 12 ++++-----
>  drivers/mmc/host/sdhci-of-arasan.c |  7 +++--
>  drivers/mmc/host/sdhci-of-sparx5.c |  4 +--
>  drivers/mmc/host/sdhci-tegra.c     |  7 ++---
>  11 files changed, 51 insertions(+), 71 deletions(-)
>
> --
> 2.17.1
>

Series applied for next, except 11, thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
