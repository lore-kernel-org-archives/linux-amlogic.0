Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A670BEB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5SwPYmDigKaPp3gvb2tIs9EDxmOkOuJIL1OtGgnbMM=; b=r/xTmwzyXT4oJE
	JV+vJ4ok9lPkzxGLIfMNf3bUvX5fj1PRdEc1eCGiOgyI/WaIh4nRazJcxlMyUjC5qDtvo1TfaJTl9
	YF+5EUD9+9D1n6HtLgHMmeEAseHjLJ818q5h1GjGqIeDtM3NfFyU0yRSRScWe4PKZkpgF4i5c/KOl
	Rt8vPHf8yO3JG7JPvx0Y/4k1cNNtGxZctMRWFYF1UsR0bzUm6bVjBRa4Fx8IO+9CRvx3d+pO3L9sM
	USqi9sz5axVpfZoSxk2DHfI6mcJkY0s9ukrNHdIPwj/qx5E7uLEd72AYERYJoctkX107qvkgk0wSa
	aDvtP/MOmvvra6MCFBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmrw-004wK7-2w;
	Fri, 07 Jul 2023 14:55:36 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmrt-004wHd-1H
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jul 2023 14:55:34 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-bff89873d34so2006052276.2
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jul 2023 07:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688741724; x=1691333724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2fD8UqByjVQZaOYrRH9n00mG/JWxOflxhgkt3jKtV60=;
        b=e0hb2EAf6WHbY5geehHqIq7YESqpwGvat037XDdpfWRZfWXcWlo9Vu0WtyxhTB5gii
         hDE7eifmi/ROEpYHjnuENTOTuJNOHCl2dcFDc903Ulstmf8zRFj2gTEaI1tShs79U4ot
         704VJZksXadue5fq0wx/0Gfj9q1VfAIV7gm1H/tVl+ros4g+/Uf/TUOUWkJr9HI9Ee1x
         CIYkJr5/3pw6I8BLP1UvHU03jFmGvUjn3rF4/bRIfwwwxoNyKbLctNsMsH1E98BseWoQ
         Se4PJfgCeK/y3T8Z7hIAw+/aIy+St0AK723wjrC1UV48MQaEKpWGhllVc+8RH730WE1Q
         OWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688741724; x=1691333724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fD8UqByjVQZaOYrRH9n00mG/JWxOflxhgkt3jKtV60=;
        b=H0MvpgH74Unt+NhjBNJNNv0C+wxb1WlhIsMjI8k+B360bEPWZ+DW/S72fiLU6Lbh/1
         y+4p95CScsFeZZ9bIstD1jkshfd48rYUB1Zkce+k5vVebaoBW8VC3ZJow7oe78w9m+8f
         5SFD+BSPd5hVFDP9R95TpwHBfNFkDEkOie1xR1kYljEU+drdTy7b5aJW4gZOs/ZZ/mLx
         RfqRw9KEou/gP9jYbtGFVr8iPMm4oiNLUSpUlmOWidgn6z0TMXPMVo5HPQq7X1VyPlN7
         L7asKb/lKO/4QteFK92pImjWtIMOTC+dvJh5NR0XejQ5c67lk7xzZvmwrFl1gedAXWnz
         G8og==
X-Gm-Message-State: ABy/qLY6Qzt2OijXT3Z43FhvuJlaXRMxMRKd5kTsr15raBxmHHBwGfQ/
	kj3u8WpG6dp/ObW6k0sgCXRAtWFBuUbO3WOthphEsA==
X-Google-Smtp-Source: APBJJlFrxFaG6bMvHkWjJa+Y/Zsglssbt8lE2+df1lfmaJ2asc9CJWHX4MFlS3Ein1oiJ/ppMK5rWUQLy28WoX5vMuk=
X-Received: by 2002:a25:6dd6:0:b0:c5d:37ca:a413 with SMTP id
 i205-20020a256dd6000000b00c5d37caa413mr4225615ybc.28.1688741723707; Fri, 07
 Jul 2023 07:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230707140434.723349-1-ulf.hansson@linaro.org>
 <20230707140434.723349-4-ulf.hansson@linaro.org> <0c8938a9-7a26-bf97-51ee-0c271901ec21@linaro.org>
In-Reply-To: <0c8938a9-7a26-bf97-51ee-0c271901ec21@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 7 Jul 2023 16:54:48 +0200
Message-ID: <CAPDyKFrOye96GyHS0tiTQ02Ve5S6Crtk8=bMsRS9Ljj=h5-nWQ@mail.gmail.com>
Subject: Re: [PATCH 03/18] soc: amlogic: Move power-domain drivers to the
 genpd dir
To: neil.armstrong@linaro.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_075533_433521_04C9198E 
X-CRM114-Status: GOOD (  19.32  )
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

On Fri, 7 Jul 2023 at 16:42, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 07/07/2023 16:04, Ulf Hansson wrote:
> > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: <linux-amlogic@lists.infradead.org>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >   MAINTAINERS                                        | 1 +
> >   drivers/genpd/Makefile                             | 1 +
> >   drivers/genpd/amlogic/Makefile                     | 4 ++++
> >   drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c     | 0
> >   drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c | 0
> >   drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c | 0
> >   drivers/soc/Makefile                               | 1 -
> >   drivers/soc/amlogic/Makefile                       | 3 ---
> >   8 files changed, 6 insertions(+), 4 deletions(-)
> >   create mode 100644 drivers/genpd/amlogic/Makefile
> >   rename drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c (100%)
> >   rename drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c (100%)
> >   rename drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c (100%)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 588769fab516..9b8c9ae2375d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1843,6 +1843,7 @@ F:      Documentation/devicetree/bindings/phy/amlogic*
> >   F:  arch/arm/boot/dts/amlogic/
> >   F:  arch/arm/mach-meson/
> >   F:  arch/arm64/boot/dts/amlogic/
> > +F:   drivers/genpd/amlogic/
> >   F:  drivers/mmc/host/meson*
> >   F:  drivers/phy/amlogic/
> >   F:  drivers/pinctrl/meson/
> > diff --git a/drivers/genpd/Makefile b/drivers/genpd/Makefile
> > index a2d5b2095915..cdba3b9f0c75 100644
> > --- a/drivers/genpd/Makefile
> > +++ b/drivers/genpd/Makefile
> > @@ -1,2 +1,3 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   obj-y                                       += actions/
> > +obj-y                                        += amlogic/
> > diff --git a/drivers/genpd/amlogic/Makefile b/drivers/genpd/amlogic/Makefile
> > new file mode 100644
> > index 000000000000..3d58abd574f9
> > --- /dev/null
> > +++ b/drivers/genpd/amlogic/Makefile
> > @@ -0,0 +1,4 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
> > +obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
> > +obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
> > diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/genpd/amlogic/meson-ee-pwrc.c
> > similarity index 100%
> > rename from drivers/soc/amlogic/meson-ee-pwrc.c
> > rename to drivers/genpd/amlogic/meson-ee-pwrc.c
> > diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/genpd/amlogic/meson-gx-pwrc-vpu.c
> > similarity index 100%
> > rename from drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> > rename to drivers/genpd/amlogic/meson-gx-pwrc-vpu.c
> > diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
> > similarity index 100%
> > rename from drivers/soc/amlogic/meson-secure-pwrc.c
> > rename to drivers/genpd/amlogic/meson-secure-pwrc.c
> > diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> > index 3b0f9fb3b5c8..dc93e1762ca7 100644
> > --- a/drivers/soc/Makefile
> > +++ b/drivers/soc/Makefile
> > @@ -23,7 +23,6 @@ obj-y                               += mediatek/
> >   obj-y                               += microchip/
> >   obj-y                               += nuvoton/
> >   obj-y                               += pxa/
> > -obj-y                                += amlogic/
> >   obj-y                               += qcom/
> >   obj-y                               += renesas/
> >   obj-y                               += rockchip/
> > diff --git a/drivers/soc/amlogic/Makefile b/drivers/soc/amlogic/Makefile
> > index 7b8c5d323f5c..c25f835e6a26 100644
> > --- a/drivers/soc/amlogic/Makefile
> > +++ b/drivers/soc/amlogic/Makefile
> > @@ -2,7 +2,4 @@
> >   obj-$(CONFIG_MESON_CANVAS) += meson-canvas.o
> >   obj-$(CONFIG_MESON_CLK_MEASURE) += meson-clk-measure.o
> >   obj-$(CONFIG_MESON_GX_SOCINFO) += meson-gx-socinfo.o
> > -obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
> >   obj-$(CONFIG_MESON_MX_SOCINFO) += meson-mx-socinfo.o
> > -obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
> > -obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
>
> I've a few changes for v6.6, how shall we handle that ?

I think we should continue to use the soc tree until v6.6-rc1 (or if
Arnd have some other ideas), there are some more thoughts around this
in the cover letter.

Beyond v6.6-rc1 I plan to help with maintenance in practice  and run
my own separate git tree.

>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> Thanks !
> Neil

Thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
