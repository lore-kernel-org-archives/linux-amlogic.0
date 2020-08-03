Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E55C433F2
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:01:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5102E22BED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k20xsQwS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5102E22BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TL5cfS0Sb/hbrlmX5XXM8W/SfU59mDz0z9pAKKg0FsA=; b=k20xsQwS33pcaTydqFP3SlBmM
	3DFdgUAaInDQJGO0tN7DklJrzKU36v/nZB8kKysG6PJJ+TyTnRyVqpqf9yVlwDKHcyCgC8CiLVdOD
	xw2oWHpnExYwU6ms7j+lfY6eifRtBvdLYbflwLSOpslAPmfDTLKW8O1lA9YC4+Y4uhmCtavL3szv3
	De+40NnqhZdqLbaW3OVDg5+mOB+4itIuMPmjQc5AKR0F/aXM0yhLJfyTB3ycH0gj5JtVbjLa/JSWk
	4ubYMhCCi94FCJv8hJlTu1rlZZvTmP9pEngDsXl7efTI+mj4CimE1sizW75chV0Sm2MfkUaZG/6ic
	i1xdde87A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2haQ-0008R5-93; Mon, 03 Aug 2020 21:01:34 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haJ-0008O6-Po; Mon, 03 Aug 2020 21:01:28 +0000
Received: by mail-io1-f68.google.com with SMTP id q75so31849171iod.1;
 Mon, 03 Aug 2020 14:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ijQ8ATU40Ukxf+vdFPpN/cTBNWQIy8LHFEwNkXuS7vE=;
 b=ReSSUk/NqAzlBPtIkpJJ6NfXxgZw+idRODvnrakzRxoiBj8r5+nSzdziO2xfecBSUw
 aBxKfpbeRD7jepzPDbhAmWBGiVX7UZ++/pBsbOEdGh5j5mXFClKbxLAirsO2DjWn4ZFF
 o+4CtjyoFtw30yGDCMfU3Spe76y6PdP+S3lsa+N29iwCQeI5DTP5yHoAaI0r3KloAFmv
 Q+yMqi/Jx2HlLHIIsnsdXwi1xP/+h0PyPfFGscDVkpVMtxPQS+Hj0EZAklkTc4X7G3Co
 5aISWYgOH2I4Kvt+2G17bDh1DoowUIPiHeY0Tr7l1INuRQXItkv+4+fkLzQ2v41SONoP
 xQKw==
X-Gm-Message-State: AOAM532I8dysTBfxO0sK4RURHYG97ky7oUIO0SspbtyXNc0/NxeTLspP
 jdn7KEpigsUmuPB/TnHL7Q==
X-Google-Smtp-Source: ABdhPJwDDB+OwHWjJuTy7sDEknkVzY4VCrs5f0YZ1QmljRmggfDq+USGhZLjxDletIoYITtztOCGKA==
X-Received: by 2002:a05:6638:2482:: with SMTP id
 x2mr1801792jat.55.1596488486266; 
 Mon, 03 Aug 2020 14:01:26 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:25 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 03/27] PCI: dwc: Allow overriding bridge pci_ops
Date: Mon,  3 Aug 2020 15:00:52 -0600
Message-Id: <20200803210116.3132633-4-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170127_875688_C721D7F3 
X-CRM114-Status: GOOD (  18.54  )
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

In preparation to allow drivers to set their own root and child pci_ops
instead of using the DWC specific config space ops, we need to make
the pci_host_bridge pointer available and move setting the bridge->ops
and bridge->child_ops pointer to before the .host_init() hook.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 15 ++++++++++-----
 drivers/pci/controller/dwc/pcie-designware.h      |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 6232aefbbdb4..7cd8c9528d4c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -344,6 +344,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	if (!bridge)
 		return -ENOMEM;
 
+	pp->bridge = bridge;
+
 	ret = pci_parse_request_of_pci_ranges(dev, &bridge->windows,
 					      &bridge->dma_ranges, NULL);
 	if (ret)
@@ -450,6 +452,10 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		}
 	}
 
+	/* Set default bus ops */
+	bridge->ops = &dw_pcie_ops;
+	bridge->child_ops = &dw_pcie_ops;
+
 	if (pp->ops->host_init) {
 		ret = pp->ops->host_init(pp);
 		if (ret)
@@ -461,7 +467,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	bridge->dev.parent = dev;
 	bridge->sysdata = pp;
 	bridge->busnr = pp->root_bus_nr;
-	bridge->ops = &dw_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
 
@@ -667,11 +672,11 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
 
 	/*
-	 * If the platform provides ->rd_other_conf, it means the platform
-	 * uses its own address translation component rather than ATU, so
-	 * we should not program the ATU here.
+	 * If the platform provides its own child bus config accesses, it means
+	 * the platform uses its own address translation component rather than
+	 * ATU, so we should not program the ATU here.
 	 */
-	if (!pp->ops->rd_other_conf) {
+	if (pp->bridge->child_ops == &dw_pcie_ops && !pp->ops->rd_other_conf) {
 		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX0,
 					  PCIE_ATU_TYPE_MEM, pp->mem_base,
 					  pp->mem_bus_addr, pp->mem_size);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 656e00f8fbeb..bad3cddab28e 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -201,6 +201,7 @@ struct pcie_port {
 	u32			num_vectors;
 	u32			irq_mask[MAX_MSI_CTRLS];
 	struct pci_bus		*root_bus;
+	struct pci_host_bridge  *bridge;
 	raw_spinlock_t		lock;
 	DECLARE_BITMAP(msi_irq_in_use, MAX_MSI_IRQS);
 };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
