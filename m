Return-Path: <SRS0=Xszf=CZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547EAC43461
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 07:54:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F414D2078D
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 07:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v4dfjS+m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="hZYcEooi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F414D2078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gk5DCtSEOI53V3IvaXzES0wUWyeN10bP10qRSffWjrQ=; b=v4dfjS+m/8jaHuux0aNKztK/a
	S91yhDS31apz4ELbKhuFwU6O9E9JgkKVSBX+3hnvL5e8AJRgZ00VsdPo52yBg7WM+WqvHfwHZN7yw
	YHMVYbXCnrjqJgp38R6HcagdQNktLwN6FtRcuBwtw2736d7y81b9+KjeVK1XYZEwsW8bop/cqtXGr
	mOkVi4GFpQiKZx0sonCziM0petuVrRfmW3Iq47IrVit9/6uROWcbXvqZjZf/3GiQuITXFLyV5zn7E
	pvFbNCtlyAH/oAHrDD9YhLzJmdoXFr5hy6Ix3wVpIZB++6UPwEihiU20m2zXMETs3SDTM5X/5LlWr
	30E+87cEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kISGr-0003QS-R3; Wed, 16 Sep 2020 07:54:29 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kISGn-0003Oz-8M; Wed, 16 Sep 2020 07:54:28 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DFEDB22F00;
 Wed, 16 Sep 2020 09:54:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1600242857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/mrV4ooFGnJh2/RwC1ApcYKUUoJS8TkPIKcSBJOevMI=;
 b=hZYcEooibPlvGYZsIy6M1JnuIGdhF2nyPQr1geOw5eoiHM1PLx4w1uqnELsVgZaNK9oHSm
 J6p7MyQNttvX9ylL+BtvV4J5f43XLjVJl9to5980o1I2bsOOnMfHmjEWfJQwKTEZ7audCW
 GI7REFPaQWuDo39bLZ59wHfcBEUMegs=
MIME-Version: 1.0
Date: Wed, 16 Sep 2020 09:54:10 +0200
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 00/40] PCI: dwc: Driver clean-ups
In-Reply-To: <CAL_JsqLHBPduSjs1L3R2vbsLygJNDzajt4XThAkRG0DEu-GnAA@mail.gmail.com>
References: <20200821035420.380495-1-robh@kernel.org>
 <20200915091218.28737-1-michael@walle.cc>
 <CAL_JsqLHBPduSjs1L3R2vbsLygJNDzajt4XThAkRG0DEu-GnAA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <346b694e43b1b6b86e4f3164e6589d25@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_035426_453674_E6668700 
X-CRM114-Status: GOOD (  16.48  )
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
 Jonathan Chocron <jonnyc@amazon.com>, Jon Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Marc Zyngier <maz@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
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
 Stanimir Varbanov <svarbanov@mm-sol.com>, Kukjin Kim <kgene@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>,
 Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am 2020-09-16 00:02, schrieb Rob Herring:
> Can you try this? The link up check seemed unnecessary as it is racy.
> What happens if the link goes down right after checking? That's the
> only thing in the change that sticks out.
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c
> b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 317ff512f8df..afee1a0e8883 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -441,6 +441,9 @@ static void __iomem
> *dw_pcie_other_conf_map_bus(struct pci_bus *bus,
>         struct pcie_port *pp = bus->sysdata;
>         struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> 
> +       if (!dw_pcie_link_up(pci))
> +               return NULL;
> +
>         busdev = PCIE_ATU_BUS(bus->number) | 
> PCIE_ATU_DEV(PCI_SLOT(devfn)) |
>                  PCIE_ATU_FUNC(PCI_FUNC(devfn));

This will fix the issue.

-michael

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
