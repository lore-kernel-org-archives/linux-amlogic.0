Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367E6C43461
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:36:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BCC92075A
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:36:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kk1CtTRD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BCC92075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9lIAV1kd9LMVKOpfRaIjmc5Dkb1EoVIj0pkVIsiG4oc=; b=Kk1CtTRDGecULQKUMZse49iXe
	F9dkEixMZtddjPFmLciAzecNed1w4trk8DDPAiaukfp5eK65mCxquRapC4RthMxiG8vwGhZTfMcUf
	K7hwbY2/yIJ2PcpkVVFAoUgrUWmuPeIv7ExzH8MYYqcZxQ+867N+bt4K7EkPx1OhvwFiwWcWBTgUD
	63Dfv+A1CqJQcCooBvPHIgmAy2snxN8H9BXa3RNFb5wr+71qGLYsUb1MoHx8mo01bLl1eTbJrQNvF
	OgkxtL2+tQeovK8gt7ehkSDTm7w4i8OHGoSUgAWox00MV71UNUQEJghP7BQKQqIDlt6lkPDnBeqxm
	w1pBHEtUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFDZI-0003o4-Uv; Mon, 07 Sep 2020 09:36:08 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFDZH-0003nc-5O; Mon, 07 Sep 2020 09:36:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D06430E;
 Mon,  7 Sep 2020 02:36:06 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BF733F66E;
 Mon,  7 Sep 2020 02:36:01 -0700 (PDT)
Date: Mon, 7 Sep 2020 10:35:58 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 00/40] PCI: dwc: Driver clean-ups
Message-ID: <20200907093558.GC6428@e121166-lin.cambridge.arm.com>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_053607_405684_CEE00A6B 
X-CRM114-Status: GOOD (  20.69  )
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
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Marc Zyngier <maz@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Dilip Kota <eswara.kota@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 20, 2020 at 09:53:40PM -0600, Rob Herring wrote:
> This is a series of clean-ups for the Designware PCI driver. The series
> initially reworks the config space accessors to use the existing pci_ops
> struct. Then there's removal of various private data that's also present
> in the pci_host_bridge struct. There's also some duplicated common (PCI
> and DWC) register defines which I converted to use the common defines.
> Finally, the initialization for speed/gen, number of lanes, and N_FTS
> are all moved to the common DWC code.
> 
> This is compile tested only as I don't have any DWC based h/w, so any
> testing would be helpful. A branch is here[1].

Applied the series to pci/dwc, thanks.

Lorenzo

> Rob
> 
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git pci-dw-cleanups
> 
> Rob Herring (40):
>   PCI: Allow root and child buses to have different pci_ops
>   PCI: dwc: Use DBI accessors instead of own config accessors
>   PCI: dwc: Allow overriding bridge pci_ops
>   PCI: dwc: Add a default pci_ops.map_bus for root port
>   PCI: dwc: al: Use pci_ops for child config space accessors
>   PCI: dwc: keystone: Use pci_ops for config space accessors
>   PCI: dwc: tegra: Use pci_ops for root config space accessors
>   PCI: dwc: meson: Use pci_ops for root config space accessors
>   PCI: dwc: kirin: Use pci_ops for root config space accessors
>   PCI: dwc: exynos: Use pci_ops for root config space accessors
>   PCI: dwc: histb: Use pci_ops for root config space accessors
>   PCI: dwc: Remove dwc specific config accessor ops
>   PCI: dwc: Use generic config accessors
>   PCI: Also call .add_bus() callback for root bus
>   PCI: dwc: keystone: Convert .scan_bus() callback to use add_bus
>   PCI: dwc: Convert to use pci_host_probe()
>   PCI: dwc: Remove root_bus pointer
>   PCI: dwc: Remove storing of PCI resources
>   PCI: dwc: Simplify config space handling
>   PCI: dwc/keystone: Drop duplicated 'num-viewport'
>   PCI: dwc: Check CONFIG_PCI_MSI inside dw_pcie_msi_init()
>   PCI: dwc/imx6: Remove duplicate define PCIE_LINK_WIDTH_SPEED_CONTROL
>   PCI: dwc: Add a 'num_lanes' field to struct dw_pcie
>   PCI: dwc: Ensure FAST_LINK_MODE is cleared
>   PCI: dwc/meson: Drop the duplicate number of lanes setup
>   PCI: dwc/meson: Drop unnecessary RC config space initialization
>   PCI: dwc/meson: Rework PCI config and DW port logic register accesses
>   PCI: dwc/imx6: Use common PCI register definitions
>   PCI: dwc/qcom: Use common PCI register definitions
>   PCI: dwc: Remove hardcoded PCI_CAP_ID_EXP offset
>   PCI: dwc/tegra: Use common Designware port logic register definitions
>   PCI: dwc: Remove read_dbi2 code
>   PCI: dwc: Make ATU accessors private
>   PCI: dwc: Centralize link gen setting
>   PCI: dwc: Set PORT_LINK_DLL_LINK_EN in common setup code
>   PCI: dwc/intel-gw: Drop unnecessary checking of DT 'device_type'
>     property
>   PCI: dwc/intel-gw: Move getting PCI_CAP_ID_EXP offset to
>     intel_pcie_link_setup()
>   PCI: dwc/intel-gw: Drop unused max_width
>   PCI: dwc: Move N_FTS setup to common setup
>   PCI: dwc: Use DBI accessors
> 
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  29 +-
>  drivers/pci/controller/dwc/pci-exynos.c       |  45 +--
>  drivers/pci/controller/dwc/pci-imx6.c         |  52 +--
>  drivers/pci/controller/dwc/pci-keystone.c     | 126 ++-----
>  drivers/pci/controller/dwc/pci-meson.c        | 156 ++-------
>  drivers/pci/controller/dwc/pcie-al.c          |  70 +---
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  48 +--
>  .../pci/controller/dwc/pcie-designware-ep.c   |  11 +-
>  .../pci/controller/dwc/pcie-designware-host.c | 319 ++++++------------
>  .../pci/controller/dwc/pcie-designware-plat.c |   4 +-
>  drivers/pci/controller/dwc/pcie-designware.c  | 104 +++---
>  drivers/pci/controller/dwc/pcie-designware.h  |  54 +--
>  drivers/pci/controller/dwc/pcie-histb.c       |  45 +--
>  drivers/pci/controller/dwc/pcie-intel-gw.c    |  65 +---
>  drivers/pci/controller/dwc/pcie-kirin.c       |  43 +--
>  drivers/pci/controller/dwc/pcie-qcom.c        |  33 +-
>  drivers/pci/controller/dwc/pcie-spear13xx.c   |  39 +--
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 120 ++-----
>  drivers/pci/controller/dwc/pcie-uniphier.c    |   3 +-
>  drivers/pci/probe.c                           |  14 +-
>  include/linux/pci.h                           |   1 +
>  21 files changed, 443 insertions(+), 938 deletions(-)
> 
> --
> 2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
