Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50BBC64E7C
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 21:12:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3537E20724
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 21:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N+y5VmKL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3537E20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wQZnJInj4TBBLkgYGw8qYsAoGDoJ8Ywsy1hpTqUfgOA=; b=N+y5VmKL/e3NGd9jk/KRkiDtFj
	lQM48AQkLq28mAN2Chr2PWdMpA+yExaJ0aZY9OGJW/HaPEF0wnmAffRHlqUKXsJOiUNlXLgRxaBAI
	nhUUynfHXuOJJaq5Sv4n1n7LqvU2gn7rvCHSieS/0eGnZKPw7cBx1H861I7uWZzGSK+y/F2U8lQNF
	MfIdMMJEJQqBczhoCXIiz2QEXEPYDbDqwqvZzT1q6L95Zs0QSfuVb2IWBskioe9RJhlKpO9+VYtXM
	ZmW2GKI+AWlaQ1Cl58BHVlMs0OqU8qp5YgdFeh/edN7deuvPgGGKf0aPP5qlgRlxFuBoQGq2Ny2I9
	EiNOhHLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kamYM-0007iH-Jd; Thu, 05 Nov 2020 21:12:18 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kamYD-0007dX-05; Thu, 05 Nov 2020 21:12:10 +0000
Received: by mail-ot1-f65.google.com with SMTP id 32so2792466otm.3;
 Thu, 05 Nov 2020 13:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6kX9EfPGIe+vgEipGeuVSOOPuy47rKZgDC38PEky6/I=;
 b=h9iM6JwFLbfRlyBWdpnkQ8wgy/4N/Z2EVXWy86l0ofG0oqwg6eCNrr5WIrEGmuQu7p
 w16fn391TAzMCP7B4g80ZPoL58e8gFBWLtu4Ua0SbBFUmowsIZ5dOJMVL55fu9NiLOn8
 YmTVh3QBiFwYIMnfXDeiUfFiV8Wawc/sRj3AH+ftNK1wIOFb4L2sTGT4j9pRTLbUOPdu
 /8ZAlrGziHYLy4dZm4eMHj91vPjgIEJEFgxq3dz98TAxtIikY2voy4sHOEeys3Bq5TqT
 EoAcm76VLdKGMgCw0xqEu+fBLwcsOtgbX4YiM12fpRNsZIbt8vupTvBNwpejrlJbpBQq
 2WEg==
X-Gm-Message-State: AOAM533qHLx1MpnNB8rhTuKJbQobn/mHjjf9cELYfNCWXZFx4/QAIFbh
 JjQA87jNcRLsWuOtYET35Q==
X-Google-Smtp-Source: ABdhPJxfRm6a7WlZFra36M/W0cF8B4tklW/+2/U/J4e/fwp/StQ3JtLqn3HUrYnVIqGDvSo8N+eI0w==
X-Received: by 2002:a05:6830:22c9:: with SMTP id
 q9mr3230515otc.48.1604610722735; 
 Thu, 05 Nov 2020 13:12:02 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id z19sm622549ooi.32.2020.11.05.13.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 13:12:01 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 00/16] PCI: dwc: Another round of clean-ups
Date: Thu,  5 Nov 2020 15:11:43 -0600
Message-Id: <20201105211159.1814485-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_161209_067970_BC271DA9 
X-CRM114-Status: GOOD (  12.36  )
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
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roy Zang <roy.zang@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Vidya Sagar <vidyas@nvidia.com>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Here's another batch of DWC PCI host refactoring. This series primarily
moves more of the MSI, link up, and resource handling to the core
code. Beyond a couple of minor fixes, new in this version is runtime
detection of iATU regions instead of using DT properties.

No doubt I've probably broken something. Please test. I've run this thru
kernelci and checked boards with DWC PCI which currently is just
Layerscape boards (hint: add boards and/or enable PCI). A git branch is
here[1].

This is dependent on "PCI: dwc: Restore ATU memory resource setup to use
last entry" which will be in v5.10-rc3.

Rob

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git pci-more-dwc-cleanup

Rob Herring (16):
  PCI: dwc: Support multiple ATU memory regions
  PCI: dwc/intel-gw: Move ATU offset out of driver match data
  PCI: dwc: Move "dbi", "dbi2", and "addr_space" resource setup into
    common code
  PCI: dwc/intel-gw: Remove some unneeded function wrappers
  PCI: dwc: Ensure all outbound ATU windows are reset
  PCI: dwc/dra7xx: Use the common MSI irq_chip
  PCI: dwc: Drop the .set_num_vectors() host op
  PCI: dwc: Move MSI interrupt setup into DWC common code
  PCI: dwc: Rework MSI initialization
  PCI: dwc: Move link handling into common code
  PCI: dwc: Move dw_pcie_msi_init() into core
  PCI: dwc: Move dw_pcie_setup_rc() to DWC common code
  PCI: dwc: Remove unnecessary wrappers around dw_pcie_host_init()
  Revert "PCI: dwc/keystone: Drop duplicated 'num-viewport'"
  PCI: dwc: Move inbound and outbound windows to common struct
  PCI: dwc: Detect number of iATU windows

 drivers/pci/controller/dwc/pci-dra7xx.c       | 141 +-----------------
 drivers/pci/controller/dwc/pci-exynos.c       |  50 ++-----
 drivers/pci/controller/dwc/pci-imx6.c         |  39 +----
 drivers/pci/controller/dwc/pci-keystone.c     |  79 ++--------
 .../pci/controller/dwc/pci-layerscape-ep.c    |  37 +----
 drivers/pci/controller/dwc/pci-layerscape.c   |  67 +--------
 drivers/pci/controller/dwc/pci-meson.c        |  53 ++-----
 drivers/pci/controller/dwc/pcie-al.c          |  29 +---
 drivers/pci/controller/dwc/pcie-armada8k.c    |  37 ++---
 drivers/pci/controller/dwc/pcie-artpec6.c     |  76 +---------
 .../pci/controller/dwc/pcie-designware-ep.c   |  58 +++----
 .../pci/controller/dwc/pcie-designware-host.c | 139 ++++++++++-------
 .../pci/controller/dwc/pcie-designware-plat.c |  70 +--------
 drivers/pci/controller/dwc/pcie-designware.c  |  93 +++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h  |  24 +--
 drivers/pci/controller/dwc/pcie-histb.c       |  37 ++---
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  67 ++-------
 drivers/pci/controller/dwc/pcie-kirin.c       |  62 +-------
 drivers/pci/controller/dwc/pcie-qcom.c        |  38 +----
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  62 +++-----
 drivers/pci/controller/dwc/pcie-tegra194.c    |  41 +----
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |  38 +----
 drivers/pci/controller/dwc/pcie-uniphier.c    |  51 +------
 23 files changed, 356 insertions(+), 1032 deletions(-)

--
2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
