Return-Path: <SRS0=nKCN=CT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA63C433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 22:55:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3BB20684
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2020 22:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0+OgGyc9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQdTeSVM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3BB20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0jM5U3t4X8FUzMXQUJkvtIC2yDI5abPqu7/uBD7C1N8=; b=0+OgGyc9bKXDuuAsNenBj2Z8w
	exCpiGD3/NF5A2zXs4Omy8Oq+mDvQzJ47cFUb8th5IksaRZnD2pP3R4Tq3e8aXDiKd83bKLz0dVi9
	iZSTpnLelsZUz0Giahky8mmcOfy69YWE16F1jnKOSzMZOQDRgeoYinzGvWDO1lUlNqtVmLOvsVCHI
	FmC2cPgVc0ZWPKpqPpKNC0mSO0Ynzm1XrIZAbL6Ff6NWRbSq0Z2jnYZI+V63tDVO66ANh/F7JHE5i
	0ecsuQmvwZ7PHMq9pX8p9Heuf5uZUi+pXTqGgl8kI3P6qwjvBoplgYH+zU6GuT067FscLBOAqqJsw
	se7pQYREg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGVTh-0008Oj-Qc; Thu, 10 Sep 2020 22:55:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGVTg-0008Nk-46; Thu, 10 Sep 2020 22:55:40 +0000
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0969F221EC;
 Thu, 10 Sep 2020 22:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599778537;
 bh=qcDtdo4KtSRqLIHBTyQuxQS343VMAgWt9vLx/LQN3EM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EQdTeSVMOyglZrJ0y9T548kiI7MRiDSrEo47DwdhHEHN4RxB+VTRtSw56opOsDIOc
 WYdet4IJLbdKzGORoMPu51NLQpp7MxMQev1pboeHfMxnPAK8rvhimKnpmWTJi3AikZ
 pDmfs0Emi8Ad6yLOoRQK63OCOGC/IjNpTGDx2nnA=
Received: by mail-ot1-f51.google.com with SMTP id g10so6782845otq.9;
 Thu, 10 Sep 2020 15:55:36 -0700 (PDT)
X-Gm-Message-State: AOAM5339M0CxQ2fjxRpoTgZ61o1sy9CXEa6GF3iFgw/p0CGJAMNbUcV6
 wuuSqV7ryYBIqu/zR+RC2pMJ5boxL5TuEdrFRA==
X-Google-Smtp-Source: ABdhPJwxLrtw8P1iDFnINFBcq5+LFkPAZuZ45Y+BpDa4K34pf79dsdO3g4++HkIgCm6/pIKr4h47efJjCIAix2IDiXQ=
X-Received: by 2002:a9d:411:: with SMTP id 17mr5602788otc.192.1599778536187;
 Thu, 10 Sep 2020 15:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200902193658.20539-1-krzk@kernel.org>
 <CAPDyKFqBS-ws6fkirDQL8EEqh9At88K2vrG5fc8K5_JiXsmfyg@mail.gmail.com>
In-Reply-To: <CAPDyKFqBS-ws6fkirDQL8EEqh9At88K2vrG5fc8K5_JiXsmfyg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Sep 2020 16:55:24 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+ajm5aiAJfQdS2+2DO1ynBDHWha_7TsA4u-2qwd87y6g@mail.gmail.com>
Message-ID: <CAL_Jsq+ajm5aiAJfQdS2+2DO1ynBDHWha_7TsA4u-2qwd87y6g@mail.gmail.com>
Subject: Re: [PATCH 00/11] mmc: Minor cleanups and compile test
To: Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_185540_281516_7D7DDED2 
X-CRM114-Status: GOOD (  22.11  )
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

On Thu, Sep 3, 2020 at 2:40 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 2 Sep 2020 at 21:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Hi,
> >
> > Set of minor cleanups.  Patches requiring more attention:
> >  - 6/11: Testing and review would be appreciated,
> >  - 11/11: I build tested multiple architectures but not all and
> >    definitely no all possible configs. This one could sit on the lists
> >    for few days so 0-day would try it.
> >
> > Best regards,
> > Krzysztof
> >
> > Krzysztof Kozlowski (11):
> >   mmc: bcm2835: Simplify with dev_err_probe()
> >   mmc: davinci: Simplify with dev_err_probe()
> >   mmc: dw_mmc-zx: Simplify with dev_err_probe()
> >   mmc: jz4740: Simplify with dev_err_probe()
> >   mmc: meson: Simplify with dev_err_probe()
> >   mmc: sdhci-brcmstb: Simplify with optional clock and dev_err_probe()
> >   mmc: sdhci-of-arasan: Simplify with dev_err_probe()
> >   mmc: sdhci-tegra: Simplify with dev_err_probe()
> >   mmc: dw_mmc: Simplify with dev_err_probe()
> >   mmc: sdhci-of-sparx5: Use proper printk format for dma_addr_t
> >   mmc: host: Enable compile testing of multiple drivers
> >
> >  drivers/mmc/host/Kconfig           | 42 ++++++++++++++++--------------
> >  drivers/mmc/host/bcm2835.c         |  4 +--
> >  drivers/mmc/host/davinci_mmc.c     |  5 ++--
> >  drivers/mmc/host/dw_mmc-zx.c       | 11 +++-----
> >  drivers/mmc/host/dw_mmc.c          |  9 +++----
> >  drivers/mmc/host/jz4740_mmc.c      |  5 ++--
> >  drivers/mmc/host/meson-gx-mmc.c    | 16 ++++--------
> >  drivers/mmc/host/sdhci-brcmstb.c   | 12 ++++-----
> >  drivers/mmc/host/sdhci-of-arasan.c |  7 +++--
> >  drivers/mmc/host/sdhci-of-sparx5.c |  4 +--
> >  drivers/mmc/host/sdhci-tegra.c     |  7 ++---
> >  11 files changed, 51 insertions(+), 71 deletions(-)
> >
> > --
> > 2.17.1
> >
>
> Series applied for next, except 11, thanks!

I see there's a bunch of these already, but I think we can do better
here than dev_err_probe. We have _optional variants for the case not
getting a resource is not an error. So the called functions like
devm_clk_get can print an error. We already have this for
platform_get_irq along with a coccinelle script to fix cases. I have a
WIP branch[1] doing this.

Rob

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dev_err-removal

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
