Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F95C43445
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:01:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA4822C9F
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CVPi2dQU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAA4822C9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hALB0b5YusCoXXaIa5zQqeko5e55PQtDuLjAReYFI04=; b=CVPi2dQU0i0hd5JgEp4hs8Pn+r
	DhWtZenNoALWn+zvOuJYuKmVk2Bh8y1YnwOIrQtSjEmNucKQpocJ5LGlZE8EjekQ3Vz8sPXtvNOQh
	uZqHpPdwJEVkHEqn9gxFSuoAUR9Noaty+ax+m8dOb3kqmpABtdl+aTVrU36xaKsU6QrA2TF+J0Ux3
	UN+fpMgBUSXFLZh4lojLM6V4rIS6dNQNO5nDlPhGOmPHoO7w0zzYw2eHEVK480LXutgSjK2IqQ4VD
	BxXTQGIfn7PN6hzARiyt2pTLTr07lbXmU/sNX/bTOz4QtEuPYEwqUYBSB3yxZ9IIknGgqvDmi6+qn
	drHRcPNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2haF-0008MW-6f; Mon, 03 Aug 2020 21:01:23 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haC-0008Lj-Ab; Mon, 03 Aug 2020 21:01:21 +0000
Received: by mail-io1-f53.google.com with SMTP id l17so39997629iok.7;
 Mon, 03 Aug 2020 14:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=caU68Vks0Qq0qRNr1RcbbJo83bu5SQyVcphbC7uR/pw=;
 b=pKNryIduFtcz7qXkBQY5jxQtC/s73yD9v5o5rGvfvW8QcPpMNGONgbqN/JX56cJ9Yk
 fKA6Xqv9XpfATc/Z7xvKK5yAJvhPwBVziHijsTfB/R9f4Zk0tNdcoIOsWVlv4OLVMw/e
 QZxe4AoKkOr8FbUrObWO57IKqApVe0IDJRCbuhD0p6/yRgqjfO+q6ou3zF40M+CIrZHa
 pWnTcYA16dSSUfHCbqs1+A5xoeY3tqXNM42wGmhWurLnZkUIKnfMtKch5C5zXKQpkwYb
 9axqib4uPm+kdBLbcTx20VZR6fUGnxeKIHQsrVCo3MbV3+W8MzAzjDDolT8JNFaNbQs2
 fr/A==
X-Gm-Message-State: AOAM530kimZK2KwN8OgnVmx3MiRPVS0ovPKEmLxe7PKIuJs7b/DvftvC
 jL1Gs6ALRwE2bRt0+ciEPg==
X-Google-Smtp-Source: ABdhPJwLvkQ8nLiW6KyvJ0FE/ZZBxba/47A0nMcMogCK9MlyD6FPHyseUZgrOPhESgV+UWpEU2XPBA==
X-Received: by 2002:a5d:9b96:: with SMTP id r22mr1872679iom.66.1596488479389; 
 Mon, 03 Aug 2020 14:01:19 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:18 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 00/27] PCI: dwc: Driver clean-ups
Date: Mon,  3 Aug 2020 15:00:49 -0600
Message-Id: <20200803210116.3132633-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170120_406368_8BE743A0 
X-CRM114-Status: GOOD (  12.44  )
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
 linux-pci@vger.kernel.org, Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Kukjin Kim <kgene@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a series of clean-ups for the Designware PCI driver. The series
primarily reworks the config space accessors to use the existing pci_ops
struct and removes various private data that's also present in the
pci_host_bridge struct. There's also some duplicated common (PCI and
DWC) register defines which I converted to use the common defines.

This is compile tested only as I don't have any DWC based h/w, so any
testing would be helpful. This is an RFC as it will need to be rebased
on 5.9-rc1 and my previous clean-up series.

Rob


Rob Herring (27):
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
  PCI: dwc/meson: Drop unnecessary RC config space initialization
  PCI: dwc/meson: Rework PCI config and DW port logic register accesses
  PCI: dwc/qcom: Use common PCI register definitions
  PCI: dwc: Remove hardcoded PCI_CAP_ID_EXP offset
  PCI: dwc/tegra: Use common Designware port logic register definitions

 drivers/pci/controller/dwc/pci-dra7xx.c       |   4 +-
 drivers/pci/controller/dwc/pci-exynos.c       |  45 +--
 drivers/pci/controller/dwc/pci-imx6.c         |   6 +-
 drivers/pci/controller/dwc/pci-keystone.c     |  90 +++--
 drivers/pci/controller/dwc/pci-meson.c        | 164 +++------
 drivers/pci/controller/dwc/pcie-al.c          |  70 +---
 drivers/pci/controller/dwc/pcie-artpec6.c     |  11 +-
 .../pci/controller/dwc/pcie-designware-host.c | 319 ++++++------------
 .../pci/controller/dwc/pcie-designware-plat.c |   4 +-
 drivers/pci/controller/dwc/pcie-designware.h  |  28 +-
 drivers/pci/controller/dwc/pcie-histb.c       |  45 +--
 drivers/pci/controller/dwc/pcie-kirin.c       |  43 +--
 drivers/pci/controller/dwc/pcie-qcom.c        |  31 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c   |   4 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |  90 +++--
 drivers/pci/controller/dwc/pcie-uniphier.c    |   3 +-
 drivers/pci/probe.c                           |  14 +-
 include/linux/pci.h                           |   1 +
 18 files changed, 368 insertions(+), 604 deletions(-)

--
2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
