Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73A7C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AD1421734
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wvTNmQeO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AD1421734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+e653u2eCMpDJ7JdkRLlJpCexMkyEHk9ET53Wgc8U+M=; b=wvTNmQeOSFQPpveWm/X+kTzQ1e
	Km6Xj5HiEnsccn8FHWt2U2bBpqbLb4icK2X/k7epox424rKI/hUXrEPIHYNvYhMHmEt7v0kTLoFx/
	uGsP3o1MM0JKk1w9udrkkoTiCu0g8BX+p5pAVGK3e5HgxQ34MM+AGy27dGy6AWCJQ9YES2wWnvJvh
	958fE7A9UwLBHxWdJpAmt6xLlKhBnzgeUWzR/Lhnyo0X1r1mMLR/kA6VBVFRZVL0SXFU9tkQHX6VZ
	AvlmsqN+qR2Ql/uM57rwiOfq/mxDPZGOiQIDBjTrEX1zfzwERJTIZxE7yqh+6H6ezo/CKd1lq07vp
	X4o5TmTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8zES-0005jV-EV; Fri, 21 Aug 2020 05:04:52 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y8M-0004CM-8k; Fri, 21 Aug 2020 03:54:41 +0000
Received: by mail-io1-f67.google.com with SMTP id q75so485652iod.1;
 Thu, 20 Aug 2020 20:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3xQSyuidDHE000cQW3ruY29YdVzjzemLhdUCUqMHH4g=;
 b=KuSstWPB1gvhs4pl/otItJ8KLSl+lY5ntY1RPgOUyBzYJ1D8w9dg+lBPRAqZdRg2S6
 kYIMl4ltSKokPlCjdngSm/VhP+H5DYM7PmaBZ6I+Lco0AqDobq5xYx0i9XpfWk/p510p
 BmAxh3ek2Ud4ggXiMBb375kA3+wjuZ40GFB3VZ/+J3H6k1FOM1pWXxk88bm9mcbDeQD0
 RLWlL46V2nkN7+AzDosr6oqjf1L4e1RxndaOjpkXP3442w7MbRJDBDW5XN8TSTeN2XAJ
 BbjpezLhXdHCGG3xU1/BT8ed+hs+OsEl8t/QfpJOwPdGNmYMlrJBzNbpVa2uxd9TXzsw
 xM2A==
X-Gm-Message-State: AOAM533TrhITKkhO9Xg2DN7h/o3yQmRhmpNFxyrRAZgcEYbycWjM+fq4
 rSQyEGJ2141rpmKSyVhp2Q==
X-Google-Smtp-Source: ABdhPJwWDZ2uF1UR52gyVwJrVKI7xgxX5Bug8MFl6x6tEW09K4V+Q0/1o3ijFf216rQPvCw1DGjTMQ==
X-Received: by 2002:a6b:e70d:: with SMTP id b13mr795565ioh.141.1597982065025; 
 Thu, 20 Aug 2020 20:54:25 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:54:24 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 00/40] PCI: dwc: Driver clean-ups
Date: Thu, 20 Aug 2020 21:53:40 -0600
Message-Id: <20200821035420.380495-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235430_402285_A2A310AF 
X-CRM114-Status: GOOD (  13.56  )
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
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
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

This is a series of clean-ups for the Designware PCI driver. The series
initially reworks the config space accessors to use the existing pci_ops
struct. Then there's removal of various private data that's also present
in the pci_host_bridge struct. There's also some duplicated common (PCI
and DWC) register defines which I converted to use the common defines.
Finally, the initialization for speed/gen, number of lanes, and N_FTS
are all moved to the common DWC code.

This is compile tested only as I don't have any DWC based h/w, so any
testing would be helpful. A branch is here[1].

Rob

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git pci-dw-cleanups

Rob Herring (40):
  PCI: Allow root and child buses to have different pci_ops
  PCI: dwc: Use DBI accessors instead of own config accessors
  PCI: dwc: Allow overriding bridge pci_ops
  PCI: dwc: Add a default pci_ops.map_bus for root port
  PCI: dwc: al: Use pci_ops for child config space accessors
  PCI: dwc: keystone: Use pci_ops for config space accessors
  PCI: dwc: tegra: Use pci_ops for root config space accessors
  PCI: dwc: meson: Use pci_ops for root config space accessors
  PCI: dwc: kirin: Use pci_ops for root config space accessors
  PCI: dwc: exynos: Use pci_ops for root config space accessors
  PCI: dwc: histb: Use pci_ops for root config space accessors
  PCI: dwc: Remove dwc specific config accessor ops
  PCI: dwc: Use generic config accessors
  PCI: Also call .add_bus() callback for root bus
  PCI: dwc: keystone: Convert .scan_bus() callback to use add_bus
  PCI: dwc: Convert to use pci_host_probe()
  PCI: dwc: Remove root_bus pointer
  PCI: dwc: Remove storing of PCI resources
  PCI: dwc: Simplify config space handling
  PCI: dwc/keystone: Drop duplicated 'num-viewport'
  PCI: dwc: Check CONFIG_PCI_MSI inside dw_pcie_msi_init()
  PCI: dwc/imx6: Remove duplicate define PCIE_LINK_WIDTH_SPEED_CONTROL
  PCI: dwc: Add a 'num_lanes' field to struct dw_pcie
  PCI: dwc: Ensure FAST_LINK_MODE is cleared
  PCI: dwc/meson: Drop the duplicate number of lanes setup
  PCI: dwc/meson: Drop unnecessary RC config space initialization
  PCI: dwc/meson: Rework PCI config and DW port logic register accesses
  PCI: dwc/imx6: Use common PCI register definitions
  PCI: dwc/qcom: Use common PCI register definitions
  PCI: dwc: Remove hardcoded PCI_CAP_ID_EXP offset
  PCI: dwc/tegra: Use common Designware port logic register definitions
  PCI: dwc: Remove read_dbi2 code
  PCI: dwc: Make ATU accessors private
  PCI: dwc: Centralize link gen setting
  PCI: dwc: Set PORT_LINK_DLL_LINK_EN in common setup code
  PCI: dwc/intel-gw: Drop unnecessary checking of DT 'device_type'
    property
  PCI: dwc/intel-gw: Move getting PCI_CAP_ID_EXP offset to
    intel_pcie_link_setup()
  PCI: dwc/intel-gw: Drop unused max_width
  PCI: dwc: Move N_FTS setup to common setup
  PCI: dwc: Use DBI accessors

 drivers/pci/controller/dwc/pci-dra7xx.c       |  29 +-
 drivers/pci/controller/dwc/pci-exynos.c       |  45 +--
 drivers/pci/controller/dwc/pci-imx6.c         |  52 +--
 drivers/pci/controller/dwc/pci-keystone.c     | 126 ++-----
 drivers/pci/controller/dwc/pci-meson.c        | 156 ++-------
 drivers/pci/controller/dwc/pcie-al.c          |  70 +---
 drivers/pci/controller/dwc/pcie-artpec6.c     |  48 +--
 .../pci/controller/dwc/pcie-designware-ep.c   |  11 +-
 .../pci/controller/dwc/pcie-designware-host.c | 319 ++++++------------
 .../pci/controller/dwc/pcie-designware-plat.c |   4 +-
 drivers/pci/controller/dwc/pcie-designware.c  | 104 +++---
 drivers/pci/controller/dwc/pcie-designware.h  |  54 +--
 drivers/pci/controller/dwc/pcie-histb.c       |  45 +--
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  65 +---
 drivers/pci/controller/dwc/pcie-kirin.c       |  43 +--
 drivers/pci/controller/dwc/pcie-qcom.c        |  33 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  39 +--
 drivers/pci/controller/dwc/pcie-tegra194.c    | 120 ++-----
 drivers/pci/controller/dwc/pcie-uniphier.c    |   3 +-
 drivers/pci/probe.c                           |  14 +-
 include/linux/pci.h                           |   1 +
 21 files changed, 443 insertions(+), 938 deletions(-)

--
2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
