Return-Path: <SRS0=cGvQ=CU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9FAC433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2020 06:01:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90D6F20735
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2020 06:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PRFXAVZY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LC7DGZ8r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90D6F20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Enr3xCRNnpcJMPEfJ6fTyPUrdESrTuMCQgYzV5r0lNE=; b=PRFXAVZYFZYrJtokanOU0v4VL
	nNab5I2Y5PbGCfH+C6ti7XNAcTihbyweQm20a3f97dgGvMiZmBLDJE8Sj92O6plQ282gTpf+aJ761
	AjxB+LhWqGqlMLpvWi+3/53T3gc06rwaNf04LZxUCNGpWXNAZGc2RitnxAdIOZSV/qaQ/k49FwHND
	ZNYmZTez4Tp897ISalgB2BvL+OJVmSkdrpLyXebswKA7WWH8xMq+kuZgw7FfZkCmnONNDvNlKX9ZC
	hAog1SrH/iQc3SCn5FlhrIaGasfZPVaG9Y4adGiPCV2cNw6ort9Hi8OeMHM7rIx+WqHQMzq2BzUDG
	EgtZ2C54g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGc77-0002Tm-Fh; Fri, 11 Sep 2020 06:00:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGc75-0002TJ-8d; Fri, 11 Sep 2020 06:00:47 +0000
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 063D722205;
 Fri, 11 Sep 2020 06:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599804046;
 bh=WESK6UKUjRSkP/TKSKzcEG4kxiuhjNV3m+bUJP3+ZXk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LC7DGZ8rQekxgJUgL7zxJ0LSh8Y/78j+NhruI5QfUcNvg1Qnnm5Qz3wO0/okaaFUA
 WVguyWmjY1UBQ9GxUMisqY9kXRKh70rJ39UFlNetdPSqcs6RJ0mLNogVJ4Op3PRi+h
 kmmKZWyIKgr1QkKcWDHBRWULkVuo4+FNDgWkBwkM=
Received: by mail-ed1-f41.google.com with SMTP id n13so8682324edo.10;
 Thu, 10 Sep 2020 23:00:45 -0700 (PDT)
X-Gm-Message-State: AOAM531SX7uGEzYq47VMRzq3mQCiAs9kxuQxOjmMig5SOKzhyYTQkuOW
 dkWRLyZntzwvHYtuzSvW887PgTkAiQf95wNBXOE=
X-Google-Smtp-Source: ABdhPJymE4+rHgjSFNYuvs+iwJGMjk8bYNxuRzgTr6WbXwAWTZAX5N+hRh1+ebmhCBeiPPYGzNLG50rUvrXYcNeA9YU=
X-Received: by 2002:a05:6402:515:: with SMTP id
 m21mr346459edv.348.1599804044455; 
 Thu, 10 Sep 2020 23:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200902193658.20539-1-krzk@kernel.org>
 <CAPDyKFqBS-ws6fkirDQL8EEqh9At88K2vrG5fc8K5_JiXsmfyg@mail.gmail.com>
 <CAL_Jsq+ajm5aiAJfQdS2+2DO1ynBDHWha_7TsA4u-2qwd87y6g@mail.gmail.com>
In-Reply-To: <CAL_Jsq+ajm5aiAJfQdS2+2DO1ynBDHWha_7TsA4u-2qwd87y6g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 11 Sep 2020 08:00:32 +0200
X-Gmail-Original-Message-ID: <CAJKOXPf8cNDGaXGkYpgc-LEEPSoF2JxwzQp7fwVQB3kLJWNKXw@mail.gmail.com>
Message-ID: <CAJKOXPf8cNDGaXGkYpgc-LEEPSoF2JxwzQp7fwVQB3kLJWNKXw@mail.gmail.com>
Subject: Re: [PATCH 00/11] mmc: Minor cleanups and compile test
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_020047_435513_8BDC0018 
X-CRM114-Status: GOOD (  25.77  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Paul Cercueil <paul@crapouillou.net>,
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
 Ray Jui <rjui@broadcom.com>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Scott Branden <sbranden@broadcom.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 11 Sep 2020 at 00:55, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 3, 2020 at 2:40 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Wed, 2 Sep 2020 at 21:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > Set of minor cleanups.  Patches requiring more attention:
> > >  - 6/11: Testing and review would be appreciated,
> > >  - 11/11: I build tested multiple architectures but not all and
> > >    definitely no all possible configs. This one could sit on the lists
> > >    for few days so 0-day would try it.
> > >
> > > Best regards,
> > > Krzysztof
> > >
> > > Krzysztof Kozlowski (11):
> > >   mmc: bcm2835: Simplify with dev_err_probe()
> > >   mmc: davinci: Simplify with dev_err_probe()
> > >   mmc: dw_mmc-zx: Simplify with dev_err_probe()
> > >   mmc: jz4740: Simplify with dev_err_probe()
> > >   mmc: meson: Simplify with dev_err_probe()
> > >   mmc: sdhci-brcmstb: Simplify with optional clock and dev_err_probe()
> > >   mmc: sdhci-of-arasan: Simplify with dev_err_probe()
> > >   mmc: sdhci-tegra: Simplify with dev_err_probe()
> > >   mmc: dw_mmc: Simplify with dev_err_probe()
> > >   mmc: sdhci-of-sparx5: Use proper printk format for dma_addr_t
> > >   mmc: host: Enable compile testing of multiple drivers
> > >
> > >  drivers/mmc/host/Kconfig           | 42 ++++++++++++++++--------------
> > >  drivers/mmc/host/bcm2835.c         |  4 +--
> > >  drivers/mmc/host/davinci_mmc.c     |  5 ++--
> > >  drivers/mmc/host/dw_mmc-zx.c       | 11 +++-----
> > >  drivers/mmc/host/dw_mmc.c          |  9 +++----
> > >  drivers/mmc/host/jz4740_mmc.c      |  5 ++--
> > >  drivers/mmc/host/meson-gx-mmc.c    | 16 ++++--------
> > >  drivers/mmc/host/sdhci-brcmstb.c   | 12 ++++-----
> > >  drivers/mmc/host/sdhci-of-arasan.c |  7 +++--
> > >  drivers/mmc/host/sdhci-of-sparx5.c |  4 +--
> > >  drivers/mmc/host/sdhci-tegra.c     |  7 ++---
> > >  11 files changed, 51 insertions(+), 71 deletions(-)
> > >
> > > --
> > > 2.17.1
> > >
> >
> > Series applied for next, except 11, thanks!
>
> I see there's a bunch of these already, but I think we can do better
> here than dev_err_probe. We have _optional variants for the case not
> getting a resource is not an error. So the called functions like
> devm_clk_get can print an error. We already have this for
> platform_get_irq along with a coccinelle script to fix cases. I have a
> WIP branch[1] doing this.

That's quite good idea.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
