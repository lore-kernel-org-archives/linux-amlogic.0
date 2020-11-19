Return-Path: <SRS0=1amn=EZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D004C388F9
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 11:02:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8FD246B2
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 11:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jDG66eVb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F8FD246B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yi2ySEYAaijXfUbukL6/YBH+WDtfeoZoQzSih99wJgg=; b=jDG66eVbl5BgqDHjmtsccFGhL
	pemvP0H3TOe1y1hEXPucwVRnAsCiYwb+LIfkBUHPNVt9TPvuPxcYUa058GBWQWhXLPOgsd/DxfiGY
	n40E6zgRKpxrhbd2EQVAVLSw4PbX8+AuDfUElTxxar/lkVgUDRXWBWBMViwI+w+h+EHASrhhzbaVA
	jEUpC7ZbCa9sW/tXQbj/PqRfFWEY3uZEmmi6lV/ABM+BKma702SICJs0Go5ly/JI/81/I/ruHae1K
	ZcNvVGvty90DbCc4y6Drv5C4tZjbz35g96wEgktmyN5YWb6p7HcPWBNGJDswGOI00NHPSuCGUgvm/
	x7EVSVa9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfhhf-0002Lv-TK; Thu, 19 Nov 2020 11:02:15 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfhhd-0002LR-2i; Thu, 19 Nov 2020 11:02:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 627981396;
 Thu, 19 Nov 2020 03:02:11 -0800 (PST)
Received: from red-moon.arm.com (unknown [10.57.61.203])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02D183F718;
 Thu, 19 Nov 2020 03:02:03 -0800 (PST)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 00/16] PCI: dwc: Another round of clean-ups
Date: Thu, 19 Nov 2020 11:01:58 +0000
Message-Id: <160578351748.1677.14217204071434748520.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20201105211159.1814485-1-robh@kernel.org>
References: <20201105211159.1814485-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_060213_275492_BCA5EB80 
X-CRM114-Status: GOOD (  12.86  )
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
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, linux-samsung-soc@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Jingoo Han <jingoohan1@gmail.com>,
 Andy Gross <agross@kernel.org>, Vidya Sagar <vidyas@nvidia.com>,
 Stanimir Varbanov <svarbanov@mm-sol.com>, Kukjin Kim <kgene@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 5 Nov 2020 15:11:43 -0600, Rob Herring wrote:
> Here's another batch of DWC PCI host refactoring. This series primarily
> moves more of the MSI, link up, and resource handling to the core
> code. Beyond a couple of minor fixes, new in this version is runtime
> detection of iATU regions instead of using DT properties.
> 
> No doubt I've probably broken something. Please test. I've run this thru
> kernelci and checked boards with DWC PCI which currently is just
> Layerscape boards (hint: add boards and/or enable PCI). A git branch is
> here[1].
> 
> [...]

Applied to pci/dwc, thanks!

[01/16] PCI: dwc: Support multiple ATU memory regions
        https://git.kernel.org/lpieralisi/pci/c/9f9e59a480
[02/16] PCI: dwc/intel-gw: Move ATU offset out of driver match data
        https://git.kernel.org/lpieralisi/pci/c/1d567aac46
[03/16] PCI: dwc: Move "dbi", "dbi2", and "addr_space" resource setup into common code
        https://git.kernel.org/lpieralisi/pci/c/a0fd361db8
[04/16] PCI: dwc/intel-gw: Remove some unneeded function wrappers
        https://git.kernel.org/lpieralisi/pci/c/1cc9a55999
[05/16] PCI: dwc: Ensure all outbound ATU windows are reset
        https://git.kernel.org/lpieralisi/pci/c/458ad06c4c
[06/16] PCI: dwc/dra7xx: Use the common MSI irq_chip
        https://git.kernel.org/lpieralisi/pci/c/7f170d35f5
[07/16] PCI: dwc: Drop the .set_num_vectors() host op
        https://git.kernel.org/lpieralisi/pci/c/331e9bcead
[08/16] PCI: dwc: Move MSI interrupt setup into DWC common code
        https://git.kernel.org/lpieralisi/pci/c/5bcb1757e6
[09/16] PCI: dwc: Rework MSI initialization
        https://git.kernel.org/lpieralisi/pci/c/f78f02638a
[10/16] PCI: dwc: Move link handling into common code
        https://git.kernel.org/lpieralisi/pci/c/886a9c1347
[11/16] PCI: dwc: Move dw_pcie_msi_init() into core
        https://git.kernel.org/lpieralisi/pci/c/59fbab1ae4
[12/16] PCI: dwc: Move dw_pcie_setup_rc() to DWC common code
        https://git.kernel.org/lpieralisi/pci/c/b9ac0f9dc8
[13/16] PCI: dwc: Remove unnecessary wrappers around dw_pcie_host_init()
        https://git.kernel.org/lpieralisi/pci/c/60f5b73fa0
[14/16] Revert "PCI: dwc/keystone: Drop duplicated 'num-viewport'"
        https://git.kernel.org/lpieralisi/pci/c/fcde397422
[15/16] PCI: dwc: Move inbound and outbound windows to common struct
        https://git.kernel.org/lpieralisi/pci/c/9ca17af552
[16/16] PCI: dwc: Detect number of iATU windows
        https://git.kernel.org/lpieralisi/pci/c/281f1f99cf

Thanks,
Lorenzo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
