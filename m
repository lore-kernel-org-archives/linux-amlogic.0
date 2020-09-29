Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACF1C4727C
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 14:32:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E6AD20739
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 14:32:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xpPSWIe8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="H42ozem7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E6AD20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Hb1UhrAaPVK24gR3k+8vPzOnQqh0Rvfy/7jDpUt27g=; b=xpPSWIe8fqMPjOGrpW+6nWeuQ
	br2Eox5R87Rt2worrWhxQt0/D/bwjS5zxGVfuQi6eOvZP7z+vOvr8MbsBEgs63btSc7YPtcuvc+kN
	FLpE/aUGKzGg9f11QTA1i6NRf7/diuU5L67b+HR8f4RqUMNqwLBd2ZkqdR1DmiFxPn6fuCmA5LHy9
	e6Ph/L67FLTfqTlsnVFn+PK+TVv/SM470IPCUSo5GkyXwwHOBS0DlIBYnrOhNBFh5EV9xkXWG4NXe
	ApLh3oQ0KXMhlyf8rrNScCfn2wduCElWlQsYVn8KPFY62A9dLFiSKSkm22/aV1MOYE7maU1u/q5xe
	AwmOVm6DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNGgC-0004Hf-Bo; Tue, 29 Sep 2020 14:32:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNGg9-0004Gf-M1; Tue, 29 Sep 2020 14:32:30 +0000
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFA6C21734;
 Tue, 29 Sep 2020 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601389948;
 bh=VjYWaMro1xYrDNe26Vn7kbXKrgcLLp4Ul6eqYCvWIoQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H42ozem74rjURrts0hRxe5T7CR4s7jiAxWHjUUrTYgxfrnGr0VLpdA4Aw1dCyY2XN
 F3H1cPJHIvXCrMnWjDV3iLSMTT23c4tqpcm164P6bprzHmV6oXC2ERW52N1oVptGMB
 32FTqmUy5XKdV9HwtzY+TaD8vzqFnaRvS+GdHy30=
Received: by mail-ot1-f46.google.com with SMTP id n61so4601683ota.10;
 Tue, 29 Sep 2020 07:32:27 -0700 (PDT)
X-Gm-Message-State: AOAM532ofYqjFAcqZze6ppwoDG+/oX29VmOv6xa8PUwE9b/ysTQadAAL
 1gSXMlGuxwodhIykaS2DX8fSpRic0nNPkyT6XQ==
X-Google-Smtp-Source: ABdhPJzrYJQxmXmK64+WMD0rkZVvGC2aVs8Bric+nrdYTcuT20sY6koxQbDnQMlcrE1ulqGTm+OoF2mzSgf9Ky4PhtA=
X-Received: by 2002:a9d:6ada:: with SMTP id m26mr3041497otq.192.1601389946977; 
 Tue, 29 Sep 2020 07:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200821035420.380495-1-robh@kernel.org>
 <20200915091218.28737-1-michael@walle.cc>
 <CAL_JsqLHBPduSjs1L3R2vbsLygJNDzajt4XThAkRG0DEu-GnAA@mail.gmail.com>
 <346b694e43b1b6b86e4f3164e6589d25@walle.cc>
 <6b776dda-e575-74f0-5575-0e5d30641522@ti.com>
In-Reply-To: <6b776dda-e575-74f0-5575-0e5d30641522@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Sep 2020 09:32:16 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+kQdmRfMQo-1AE+A3TxH7J99fuuuV5H0H=cOT1DK436Q@mail.gmail.com>
Message-ID: <CAL_Jsq+kQdmRfMQo-1AE+A3TxH7J99fuuuV5H0H=cOT1DK436Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/40] PCI: dwc: Driver clean-ups
To: Kishon Vijay Abraham I <kishon@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_103229_877441_5AD967D6 
X-CRM114-Status: GOOD (  21.01  )
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, PCI <linux-pci@vger.kernel.org>,
 Wangbinghui <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Jonathan Chocron <jonnyc@amazon.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 "Gross, Andy" <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Song Xiaowei <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Yue Wang <yue.wang@amlogic.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Murali Karicheri <m-karicheri2@ti.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Stanimir Varbanov <svarbanov@mm-sol.com>, Michael Walle <michael@walle.cc>,
 Kukjin Kim <kgene@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawn.guo@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2020 at 12:24 AM Kishon Vijay Abraham I <kishon@ti.com> wrote:
>
> Hi,
>
> On 16/09/20 1:24 pm, Michael Walle wrote:
> > Am 2020-09-16 00:02, schrieb Rob Herring:
> >> Can you try this? The link up check seemed unnecessary as it is racy.
> >> What happens if the link goes down right after checking? That's the
> >> only thing in the change that sticks out.
> >>
> >> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c
> >> b/drivers/pci/controller/dwc/pcie-designware-host.c
> >> index 317ff512f8df..afee1a0e8883 100644
> >> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> >> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> >> @@ -441,6 +441,9 @@ static void __iomem
> >> *dw_pcie_other_conf_map_bus(struct pci_bus *bus,
> >>         struct pcie_port *pp = bus->sysdata;
> >>         struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> >>
> >> +       if (!dw_pcie_link_up(pci))
> >> +               return NULL;
> >> +
> >>         busdev = PCIE_ATU_BUS(bus->number) |
> >> PCIE_ATU_DEV(PCI_SLOT(devfn)) |
> >>                  PCIE_ATU_FUNC(PCI_FUNC(devfn));
> >
> > This will fix the issue.
>
> This fix is required to get DRA7 EVM booting again in linux-next.

Did you see the discussion here[1]? Is firmware setting up the same
register in question?

Rob

[1] http://lore.kernel.org/r/HE1PR0402MB33713A623A37D08AE3253DEB84320@HE1PR0402MB3371.eurprd04.prod.outlook.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
