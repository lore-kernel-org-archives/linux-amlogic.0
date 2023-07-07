Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41112C0015E
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 15:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owxzQ83KHv89LcU8Q95WFqDvkbYZpu5yyq1MqS8dAWk=; b=Reiq+MpaXk9ZHy
	hKx9LM3qg36lsnlAnmCEkQA7lWNBQaAxesPwYsyEGYjIIUxg7OklqOMl2IICRBCRUgFMhiC1WpJDK
	qmwQue1mPg8jGEI8czjI98+0if6lwR7lJ/2QHalJGdQH4xNSdiHTSmD4wE8qSoDt+Wj8tcDjRWXy3
	I7o9p0aH5mQuPkF87gPNbhqM89FThl72sH4qrZ9TYvh3qPUflwIFFvE7IDCerFraicjWow29tTkyU
	ouZhMeeU0p6DpvCyF6qZagFodpoKzofAuOelmXparXs7SQ/8oIt1RB/xS6T9cljBuUPkg0M9bOTHx
	8gydDsVjyczN6ujqQcsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnNe-0052jV-29;
	Fri, 07 Jul 2023 15:28:22 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnNa-0052fQ-2m
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jul 2023 15:28:20 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-577497ec6c6so25824957b3.2
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jul 2023 08:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688743696; x=1691335696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gnLS0Wao9ThqAGg0W4sBazXmd57YpvJvSzmwB021jgg=;
        b=FA2TEkZv8EY4Szah0xhT0+hqQRy4ca0eQnWQm1xQthfJliJvWxXWUHZQBGrEQs7+pR
         2gkpvvv21s4uMoUipIV1WP6sok9AqahJMiuy6RmoRmajUsllBMW/9WtEwvlzJjmhMwVY
         clk7U4uDUPBEDlGGznkLYiT3uq8UN2ZQGFetRntXE0nowP5XydPpo+IcmOEUdQKfydV7
         lKCG5Si0ZssgQt1sLIUmuearc4vXTS07EgdXmY2WBdgFNiY3SMdp9OdVTkZeJnfaW/DC
         Waw5ISyqKNLoldOJTzLvmEwpD+kXMbaKAeNakvgDCzPXrJjf05y6TPSTOwNtcKNpKp+S
         CXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688743696; x=1691335696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnLS0Wao9ThqAGg0W4sBazXmd57YpvJvSzmwB021jgg=;
        b=F5f9YJ5YOcd7RHKrclfskxBP+ejPksWODTDQnS+plnsXqjGvLjXr76TNLti+6PkZzu
         tTpm44pmPdzdw9tdA2ouUCXX6BVHwAIG8YsD2Yt/qv4vAlSHTIJEyvD/88EYdSo23GD6
         2WQxSpVeZELNybF3skoYy3Y9gn4daxnBsTKZNjOngz8dp7GJmp5tLM5WFhwen1XCA0Zf
         zvjsST5Vih/xVknM4ysE6ZKEgcXBgPtl/zgoJeEZL0/aZnA8Gw5YCxuTdy5RnyZBmNM1
         uDA4wdJQBvAOt7NGNs3+TNQ8bg1d4vSVjzCBgpkoF9bsN8AK1hIO/+wLJixUNWcMVwrE
         vtww==
X-Gm-Message-State: ABy/qLbw1bHnm5FODlpnFDnSKjNEqWRspFqr6/KY+uU5RTQjfGmzmMy5
	LWb2S37iz66A4sv8NhqeDZIndS91RpAECVug7EYHPw==
X-Google-Smtp-Source: APBJJlGAlPu9Kh9rAaxrE+bP5ZFA9mz4mpQSZWaejlRI9czWAoUJlchCrYjCGV0/ipbIt9Q1LoIdikP2OjfuZV8UjT4=
X-Received: by 2002:a25:3d85:0:b0:be6:7314:19d5 with SMTP id
 k127-20020a253d85000000b00be6731419d5mr5045966yba.23.1688743695755; Fri, 07
 Jul 2023 08:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
 <20230707140434.723349-4-ulf.hansson@linaro.org> <0c8938a9-7a26-bf97-51ee-0c271901ec21@linaro.org>
 <CAPDyKFrOye96GyHS0tiTQ02Ve5S6Crtk8=bMsRS9Ljj=h5-nWQ@mail.gmail.com> <1496b9c1-289a-c354-f0ae-e14fd4c9bcfa@linaro.org>
In-Reply-To: <1496b9c1-289a-c354-f0ae-e14fd4c9bcfa@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 7 Jul 2023 17:27:39 +0200
Message-ID: <CAPDyKFr7Mqy5bisLcxcA_iEGWqL8SFt2mDDng7zYEaTD1vNisA@mail.gmail.com>
Subject: Re: [PATCH 03/18] soc: amlogic: Move power-domain drivers to the
 genpd dir
To: neil.armstrong@linaro.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_082818_903947_832853A5 
X-CRM114-Status: GOOD (  22.42  )
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

On Fri, 7 Jul 2023 at 17:12, <neil.armstrong@linaro.org> wrote:
>
> On 07/07/2023 16:54, Ulf Hansson wrote:
> > On Fri, 7 Jul 2023 at 16:42, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> Hi,
> >>
> >> On 07/07/2023 16:04, Ulf Hansson wrote:
> >>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> >>> Cc: Kevin Hilman <khilman@baylibre.com>
> >>> Cc: Jerome Brunet <jbrunet@baylibre.com>
> >>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >>> Cc: <linux-amlogic@lists.infradead.org>
> >>> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> >>> ---
> >>>    MAINTAINERS                                        | 1 +
> >>>    drivers/genpd/Makefile                             | 1 +
> >>>    drivers/genpd/amlogic/Makefile                     | 4 ++++
> >>>    drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c     | 0
> >>>    drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c | 0
> >>>    drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c | 0
> >>>    drivers/soc/Makefile                               | 1 -
> >>>    drivers/soc/amlogic/Makefile                       | 3 ---
> >>>    8 files changed, 6 insertions(+), 4 deletions(-)
> >>>    create mode 100644 drivers/genpd/amlogic/Makefile
> >>>    rename drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c (100%)
> >>>    rename drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c (100%)
> >>>    rename drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c (100%)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 588769fab516..9b8c9ae2375d 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -1843,6 +1843,7 @@ F:      Documentation/devicetree/bindings/phy/amlogic*
> >>>    F:  arch/arm/boot/dts/amlogic/
> >>>    F:  arch/arm/mach-meson/
> >>>    F:  arch/arm64/boot/dts/amlogic/
> >>> +F:   drivers/genpd/amlogic/
> >>>    F:  drivers/mmc/host/meson*
> >>>    F:  drivers/phy/amlogic/
> >>>    F:  drivers/pinctrl/meson/
> >>> diff --git a/drivers/genpd/Makefile b/drivers/genpd/Makefile
> >>> index a2d5b2095915..cdba3b9f0c75 100644
> >>> --- a/drivers/genpd/Makefile
> >>> +++ b/drivers/genpd/Makefile
> >>> @@ -1,2 +1,3 @@
> >>>    # SPDX-License-Identifier: GPL-2.0-only
> >>>    obj-y                                       += actions/
> >>> +obj-y                                        += amlogic/
> >>> diff --git a/drivers/genpd/amlogic/Makefile b/drivers/genpd/amlogic/Makefile
> >>> new file mode 100644
> >>> index 000000000000..3d58abd574f9
> >>> --- /dev/null
> >>> +++ b/drivers/genpd/amlogic/Makefile
> >>> @@ -0,0 +1,4 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only
> >>> +obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
> >>> +obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
> >>> +obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
> >>> diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/genpd/amlogic/meson-ee-pwrc.c
> >>> similarity index 100%
> >>> rename from drivers/soc/amlogic/meson-ee-pwrc.c
> >>> rename to drivers/genpd/amlogic/meson-ee-pwrc.c
> >>> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/genpd/amlogic/meson-gx-pwrc-vpu.c
> >>> similarity index 100%
> >>> rename from drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> >>> rename to drivers/genpd/amlogic/meson-gx-pwrc-vpu.c
> >>> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
> >>> similarity index 100%
> >>> rename from drivers/soc/amlogic/meson-secure-pwrc.c
> >>> rename to drivers/genpd/amlogic/meson-secure-pwrc.c
> >>> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> >>> index 3b0f9fb3b5c8..dc93e1762ca7 100644
> >>> --- a/drivers/soc/Makefile
> >>> +++ b/drivers/soc/Makefile
> >>> @@ -23,7 +23,6 @@ obj-y                               += mediatek/
> >>>    obj-y                               += microchip/
> >>>    obj-y                               += nuvoton/
> >>>    obj-y                               += pxa/
> >>> -obj-y                                += amlogic/
> >>>    obj-y                               += qcom/
> >>>    obj-y                               += renesas/
> >>>    obj-y                               += rockchip/
> >>> diff --git a/drivers/soc/amlogic/Makefile b/drivers/soc/amlogic/Makefile
> >>> index 7b8c5d323f5c..c25f835e6a26 100644
> >>> --- a/drivers/soc/amlogic/Makefile
> >>> +++ b/drivers/soc/amlogic/Makefile
> >>> @@ -2,7 +2,4 @@
> >>>    obj-$(CONFIG_MESON_CANVAS) += meson-canvas.o
> >>>    obj-$(CONFIG_MESON_CLK_MEASURE) += meson-clk-measure.o
> >>>    obj-$(CONFIG_MESON_GX_SOCINFO) += meson-gx-socinfo.o
> >>> -obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
> >>>    obj-$(CONFIG_MESON_MX_SOCINFO) += meson-mx-socinfo.o
> >>> -obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
> >>> -obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
> >>
> >> I've a few changes for v6.6, how shall we handle that ?
> >
> > I think we should continue to use the soc tree until v6.6-rc1 (or if
> > Arnd have some other ideas), there are some more thoughts around this
> > in the cover letter.
> >
> > Beyond v6.6-rc1 I plan to help with maintenance in practice  and run
> > my own separate git tree.
>
> If it helps I can send you a PR with only the pwrc changes you can merge
> before applying this serie.

Right, that could be a good idea, but let's defer to Arnd before we
agree on the way forward.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
