Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAE0C4363A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DBC724822
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wKnHJ9nD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DBC724822
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qv7vqvrpg/6RvQL4wvqTZygYXtmNnLY/pIR2us69P8Q=; b=wKnHJ9nD6NcRttWnUC1XQM7joE
	5yqVnd7VegY6JfPft1JywFl/sFO24RFi/Z4x8+nQxuM4e68bWwMuDJMdGS7drBBBHOoqPegbLwAV3
	A+QOsPpaq7MDOiu7Xr1Bbua6tSJ733w5r7ZLDs/0rcbEd6qMnly1juDRqo+gWKBaGMY2i298iODqB
	aCKeX2bNPYOgKGge0vxJpyFG7/kUVHl47gipuR0HE5laFlBMd3S0+AoxzZZNoGlUb/OU3O4+gwsCy
	MSnPZHgGjQdkglsq6AYd+30WkMTL0uAuHigpIobBB0DhVA22SJADnbdIlj1WfBzVlDGl0MDbXJ9yh
	mu7TkcHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXsLN-0000Yv-OQ; Wed, 28 Oct 2020 20:46:53 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXsLL-0000Y9-Qr
 for linux-amlogic@lists.infradead.org; Wed, 28 Oct 2020 20:46:52 +0000
Received: by mail-ot1-f67.google.com with SMTP id b2so406015ots.5
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Oct 2020 13:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fkYpsqioT7Tb7YApRr6kOuIOqhvTBzDRVXioLFVYRRs=;
 b=Bs0jw3iwO2rZEKhemqZV6MpiX/P3Md5R1MEyxFGqO74ewwJbaZ3tKEFLYyGNsBQ8v9
 Rsa7X7Hg937SMG4bdyldGoSyIZ59JfPI/07m2Na0X/HoTpcWGZfx82PsmtiNzJQCkm+u
 Ivz5Lt52/imgJS/DIW0fN2v6nnAGd7UaFe1Tvqfw742Wso6LOq8yB3y3XMdftCIm1W4a
 gpWDWwgRJ3rpCdjeubZomROqyxJPHBEAYYvF8WWTzaIoVy3Y9v36jY/XoIDLt2n0RNhO
 N+1NsmfwND6z4NdjJ3pQUosiDgoqUXHDXp9LD/YxbrKmW4664Z9wcBFOG0Con3Lg45/I
 5a7A==
X-Gm-Message-State: AOAM530edphKDfO+lOEywvs+aQXxam65tCs+KUpsRwqnz+spq5M9e6fP
 tLdQMgzT/3AJ++FpjrrgNA==
X-Google-Smtp-Source: ABdhPJzUHZm4YYIM4XMiwc5sacukMJ5Sdrdk/i+veAcVoB9ovA+Vih+j4WmB8WVNzg3/epAFFNC3mg==
X-Received: by 2002:a05:6830:1694:: with SMTP id
 k20mr912314otr.100.1603918009773; 
 Wed, 28 Oct 2020 13:46:49 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:46:49 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 00/13] PCI: dwc: Another round of clean-ups
Date: Wed, 28 Oct 2020 15:46:33 -0500
Message-Id: <20201028204646.356535-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_164651_909096_DB048808 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Here's another batch of DWC PCI host refactoring. This series primarily
moves more of the MSI, link up, and resource handling to the core
code.

No doubt I've probably broken something. Please test. A git branch is
here[1].

Rob

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git pci-more-dwc-cleanup

Rob Herring (13):
  PCI: dwc/imx6: Drop setting PCI_MSI_FLAGS_ENABLE
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

 drivers/pci/controller/dwc/pci-dra7xx.c       | 141 +-----------------
 drivers/pci/controller/dwc/pci-exynos.c       |  50 ++-----
 drivers/pci/controller/dwc/pci-imx6.c         |  51 +------
 drivers/pci/controller/dwc/pci-keystone.c     |  68 +--------
 .../pci/controller/dwc/pci-layerscape-ep.c    |  37 +----
 drivers/pci/controller/dwc/pci-layerscape.c   |  67 +--------
 drivers/pci/controller/dwc/pci-meson.c        |  53 ++-----
 drivers/pci/controller/dwc/pcie-al.c          |  29 +---
 drivers/pci/controller/dwc/pcie-armada8k.c    |  37 ++---
 drivers/pci/controller/dwc/pcie-artpec6.c     |  76 +---------
 .../pci/controller/dwc/pcie-designware-ep.c   |  29 +++-
 .../pci/controller/dwc/pcie-designware-host.c |  80 ++++++----
 .../pci/controller/dwc/pcie-designware-plat.c |  70 +--------
 drivers/pci/controller/dwc/pcie-designware.h  |  12 +-
 drivers/pci/controller/dwc/pcie-histb.c       |  37 ++---
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  59 ++------
 drivers/pci/controller/dwc/pcie-kirin.c       |  62 +-------
 drivers/pci/controller/dwc/pcie-qcom.c        |  38 +----
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  62 +++-----
 drivers/pci/controller/dwc/pcie-tegra194.c    |  40 +----
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |  38 +----
 drivers/pci/controller/dwc/pcie-uniphier.c    |  51 +------
 22 files changed, 217 insertions(+), 970 deletions(-)

--
2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
