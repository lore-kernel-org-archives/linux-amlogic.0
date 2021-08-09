Return-Path: <SRS0=MsbO=NA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611BEC4338F
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Aug 2021 14:53:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CF1060C41
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Aug 2021 14:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CF1060C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pg4WW8jCH41xSv7n78K56ALtYByJWE28zWnk6zj/N0I=; b=A6auEHmKMamZnV
	Xq9PViU1Af6dHQcQNTojyL56uRodYl75FurEx17wgMFIN/lsZEf3CZ9R9l54MUb6O74UNdX54FbtQ
	s7jHH6NL3Osvl9Rx37ZmY4a6c/UYv58mEQhHYZBefhu8I8Q1CFf4G/SCk48IzY4Qpg7QpxzgVpXga
	E9pLzWaOIhans9AgECckLhLhSp5+qYzc8jCB7LCGqFD4oi2VhHztFO8RCShRJAwiquJqp121L2j7F
	8FhNw08GQ1sljnQzqpzV7dZc6rEg/OExsrlivUOlWCceyqLa3JCXdaoCPRAmGaTHcWG4Hrcv2oriJ
	QTlS86NPDez9Er7ke1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD6eH-000yn9-Ok; Mon, 09 Aug 2021 14:53:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD6eE-000yly-7b; Mon, 09 Aug 2021 14:53:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 244D460C41;
 Mon,  9 Aug 2021 14:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628520781;
 bh=Pxvauf7CFHRqwgrPJcBCTzOuC/lUcd4Kz0wvLQ2dWzw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Tsur/vJbn6dnB6LaXdr4MxV1l5AHtEulyK9Q/oAlwAnX44xwfTjy6OVLwCw9lrxil
 MMtIe1SbWqLgSDvIA54m6yIl+T9l+6RGnMUOrV2Ch0SatZPlhWiRCK8mWk7ZmjtNVg
 OuZBG/2PPPWEoBeqqH/wDwWx/Uolgt092LXFI1CphtK9PeKcEh0LacJ22r0T40crC+
 gZVYNF92MisiyUQ6EqiO3qzWuKepa6lJ6yt99Oxl6TFhrvqXzd6lBH+hPlD6+c8REZ
 +m/Y3VoU3rH01gted3/RM7gsHZaqtUFmXGJoYw85GJhUgTjcc69d3qJ2qU+SS77kAM
 wpLu3W7XQZjfA==
Received: by mail-lf1-f45.google.com with SMTP id c16so34556930lfc.2;
 Mon, 09 Aug 2021 07:53:01 -0700 (PDT)
X-Gm-Message-State: AOAM530bnb6+EPL18Y8yS5y/SuXO9hwVV5rR5afOap/Z/1/hb3bNGdY7
 IjZbYFIOCTBNItJpAOhshXsxgayHi5sAiMk05w==
X-Google-Smtp-Source: ABdhPJzc6XZ8s9ydxQHfxUS1CfauBiPrkQyjudkgpPtRe58+tK6GJ3YbxcrQpiqucK1Zl64RWkT3x4DLs+goMJdOtns=
X-Received: by 2002:a05:6402:291d:: with SMTP id
 ee29mr30809324edb.289.1628520768969; 
 Mon, 09 Aug 2021 07:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200821035420.380495-1-robh@kernel.org>
 <20200821035420.380495-4-robh@kernel.org>
 <68e3adfb-a79d-3b70-87ed-2e5e1bf7fc93@nvidia.com>
In-Reply-To: <68e3adfb-a79d-3b70-87ed-2e5e1bf7fc93@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Aug 2021 08:52:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJZ-BzxnEPeqirrd=yZFSWejP4PBYDgLNEn-kubFzvXCA@mail.gmail.com>
Message-ID: <CAL_JsqJZ-BzxnEPeqirrd=yZFSWejP4PBYDgLNEn-kubFzvXCA@mail.gmail.com>
Subject: Re: [PATCH v2 03/40] PCI: dwc: Allow overriding bridge pci_ops
To: Vidya Sagar <vidyas@nvidia.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 PCI <linux-pci@vger.kernel.org>, Andy Gross <agross@kernel.org>, 
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dilip Kota <eswara.kota@linux.intel.com>, Fabio Estevam <festevam@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lucas Stach <l.stach@pengutronix.de>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Murali Karicheri <m-karicheri2@ti.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Pratyush Anand <pratyush.anand@gmail.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, 
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Xiaowei Song <songxiaowei@hisilicon.com>, Yue Wang <yue.wang@amlogic.com>, 
 Marc Zyngier <maz@kernel.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel@axis.com, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_075302_358220_00795F3D 
X-CRM114-Status: GOOD (  29.17  )
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

On Sun, Aug 8, 2021 at 9:13 AM Vidya Sagar <vidyas@nvidia.com> wrote:
>
>
>
> On 8/21/2020 9:23 AM, Rob Herring wrote:
> > In preparation to allow drivers to set their own root and child pci_ops
> > instead of using the DWC specific config space ops, we need to make
> > the pci_host_bridge pointer available and move setting the bridge->ops
> > and bridge->child_ops pointer to before the .host_init() hook.
> >
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >   drivers/pci/controller/dwc/pcie-designware-host.c | 15 ++++++++++-----
> >   drivers/pci/controller/dwc/pcie-designware.h      |  1 +
> >   2 files changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index 1d98554db009..b626cc7cd43a 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -344,6 +344,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
> >       if (!bridge)
> >               return -ENOMEM;
> >
> > +     pp->bridge = bridge;
> > +
> >       /* Get the I/O and memory ranges from DT */
> >       resource_list_for_each_entry(win, &bridge->windows) {
> >               switch (resource_type(win->res)) {
> > @@ -445,6 +447,10 @@ int dw_pcie_host_init(struct pcie_port *pp)
> >               }
> >       }
> >
> > +     /* Set default bus ops */
> > +     bridge->ops = &dw_pcie_ops;
> > +     bridge->child_ops = &dw_pcie_ops;
> > +
> >       if (pp->ops->host_init) {
> >               ret = pp->ops->host_init(pp);
> >               if (ret)
> > @@ -452,7 +458,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
> >       }
> >
> >       bridge->sysdata = pp;
> > -     bridge->ops = &dw_pcie_ops;
> >
> >       ret = pci_scan_root_bus_bridge(bridge);
> >       if (ret)
> > @@ -654,11 +659,11 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
> >       dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
> >
> >       /*
> > -      * If the platform provides ->rd_other_conf, it means the platform
> > -      * uses its own address translation component rather than ATU, so
> > -      * we should not program the ATU here.
> > +      * If the platform provides its own child bus config accesses, it means
> > +      * the platform uses its own address translation component rather than
> > +      * ATU, so we should not program the ATU here.
> It is possible that a platform can have its own translation for
> configuration accesses and use DWC's ATU for memory/IO address
> translations. IMHO, ATU setup for memory/IO address translations
> shouldn't be skipped based on platform's '->rd_other_conf'
> implementation. Ex:- A platform can implement configuration space access
> through the ECAM mechanism yet choose to use ATU for memory/IO address
> translations.

A platform could, but none of them upstream do that. I'm all for doing
ECAM setup (in the kernel) if possible. That could be in the DWC core
with a feature flag the platform can set or something to enable it if
we do that. It could be based on the config space size as well. I'm
not sure what else determines whether ECAM can work besides having
enough address space and at least 3 outbound iATU windows.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
