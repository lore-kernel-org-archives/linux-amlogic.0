Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0280DC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:05:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A27A820775
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:05:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xmRFn2eQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A27A820775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UPgb8tHgGWJZaPkSiX7zbn/FoZU9tL6NFBuRSnfa4Is=; b=xmRFn2eQB0R34PnPRTYfh3NoK
	1/Iqhp8Nb3GXiai4BtCP843f17n1fJnZg+WqffiuxcaJMMEHnKVC0FbagrbqqEckCrUN6U9tk8SV5
	jt8eNkT4sNbAA6uV5quT2c4Q055sDhHvdxt5qx4PjtX+KbiJqMm0JY53je02I6T/I823Sa46qQlYT
	mh1fFacGKRmVK43kJ7bAXaHY5z0cc3mMbMS0anmX2iK05i60c9YCyaFPYrh2gcKSvDFMLBht8PaB2
	NFp1vk1R1bW65onUpHsiPy2xxOZ3e3z4lP3N2SxAmErO4jt1W1R3raI6uMOeWOrHqd7GEeEAjBXQU
	V3kezTJMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2heE-0002QA-Ev; Mon, 03 Aug 2020 21:05:30 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haw-0000IB-3T; Mon, 03 Aug 2020 21:02:07 +0000
Received: by mail-il1-f193.google.com with SMTP id i138so26417108ild.9;
 Mon, 03 Aug 2020 14:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xUz+R+tsBr+VP4t6lLVIS/60DtpOg9mXVRA50yAPEow=;
 b=mNtkSA8PVZg/LnLTgLiyQvkP7CUU7iYmakh+xt8/C70nsN1RjELnlNEmuHOLYzEDz/
 QzJDGjSt7xdSwW1qEpgojZ43udaoNF+Zh1Z2MnpCm/YuPT/eNBhKhbTkHZj09Dk38KF6
 Jsax6wm5tcGBlQBn2oDVv/j6lkccwL54ba6zJKm6i7Pa8VruadWA+mNBZXNpogB4kCHI
 e+J6UDS6PG8kwAQMmtuUaLmHjkbbIyA4xv+65B2oZR0Cqe+/9AOdx7rpefJUA9BB4f02
 wtmbudiZSAQaF6G+PDmry1OhQDwzZQzFb9Jw7ISLanZE5TwPb82iwnI45y7VhBGv+DYk
 NhYA==
X-Gm-Message-State: AOAM5309Z1SUEuK1+0N1O5f77ZvVuaDPSpPaoGLC98RXk/jWH5efCjwy
 6vgqTGItQYcg6bQubWiMEA==
X-Google-Smtp-Source: ABdhPJxQRC2hDazWRnHx6HVUyG/OxIUURk6yYbgjpKPr1lZXzY4+auLTp11NjAtvPj4c/6iBYyYg8Q==
X-Received: by 2002:a05:6e02:14cf:: with SMTP id
 o15mr1329621ilk.239.1596488525559; 
 Mon, 03 Aug 2020 14:02:05 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:02:04 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 18/27] PCI: dwc: Remove storing of PCI resources
Date: Mon,  3 Aug 2020 15:01:07 -0600
Message-Id: <20200803210116.3132633-19-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170206_212389_61519BEC 
X-CRM114-Status: GOOD (  16.74  )
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

The PCI bridge resources are stored in pci_host_bridge.windows, so
there's no need to store them in a DWC specific struct. There's also no
need to parse the resources and store them a 2nd time as they are mainly
used for one time setup of iATU windows.

Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jonathan Chocron <jonnyc@amazon.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-keystone.c     |  8 +++--
 drivers/pci/controller/dwc/pcie-al.c          |  7 +++--
 .../pci/controller/dwc/pcie-designware-host.c | 29 ++++++-------------
 drivers/pci/controller/dwc/pcie-designware.h  |  6 ----
 4 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 17271b21fb7d..bdf4fe1fc822 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -400,10 +400,14 @@ static void ks_pcie_setup_rc_app_regs(struct keystone_pcie *ks_pcie)
 	u32 num_viewport = ks_pcie->num_viewport;
 	struct dw_pcie *pci = ks_pcie->pci;
 	struct pcie_port *pp = &pci->pp;
-	u64 start = pp->mem->start;
-	u64 end = pp->mem->end;
+	u64 start, end;
+	struct resource *mem;
 	int i;
 
+	mem = resource_list_first_type(&pp->bridge->windows, IORESOURCE_MEM)->res;
+	start = mem->start;
+	end = mem->end;
+
 	/* Disable BARs for inbound access */
 	ks_pcie_set_dbi_mode(ks_pcie);
 	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_0, 0);
diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index 5c5763f14485..72bf1777f264 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -265,6 +265,7 @@ static void al_pcie_config_prepare(struct al_pcie *pcie)
 	u8 secondary_bus;
 	u32 cfg_control;
 	u32 reg;
+	struct resource *bus = resource_list_first_type(&pp->bridge->windows, IORESOURCE_BUS)->res;
 
 	target_bus_cfg = &pcie->target_bus_cfg;
 
@@ -278,13 +279,13 @@ static void al_pcie_config_prepare(struct al_pcie *pcie)
 	target_bus_cfg->ecam_mask = ecam_bus_mask;
 	/* This portion is taken from the cfg_target_bus reg */
 	target_bus_cfg->reg_mask = ~target_bus_cfg->ecam_mask;
-	target_bus_cfg->reg_val = pp->busn->start & target_bus_cfg->reg_mask;
+	target_bus_cfg->reg_val = bus->start & target_bus_cfg->reg_mask;
 
 	al_pcie_target_bus_set(pcie, target_bus_cfg->reg_val,
 			       target_bus_cfg->reg_mask);
 
-	secondary_bus = pp->busn->start + 1;
-	subordinate_bus = pp->busn->end;
+	secondary_bus = bus->start + 1;
+	subordinate_bus = bus->end;
 
 	/* Set the valid values of secondary and subordinate buses */
 	cfg_control_offset = AXI_BASE_OFFSET + pcie->reg_offsets.ob_ctrl +
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 9528c8b1c9ab..a981e9de81d7 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -331,17 +331,9 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	resource_list_for_each_entry(win, &bridge->windows) {
 		switch (resource_type(win->res)) {
 		case IORESOURCE_IO:
-			pp->io = win->res;
-			pp->io->name = "I/O";
-			pp->io_size = resource_size(pp->io);
-			pp->io_bus_addr = pp->io->start - win->offset;
-			pp->io_base = pci_pio_to_address(pp->io->start);
-			break;
-		case IORESOURCE_MEM:
-			pp->mem = win->res;
-			pp->mem->name = "MEM";
-			pp->mem_size = resource_size(pp->mem);
-			pp->mem_bus_addr = pp->mem->start - win->offset;
+			pp->io_size = resource_size(win->res);
+			pp->io_bus_addr = win->res->start - win->offset;
+			pp->io_base = pci_pio_to_address(win->res->start);
 			break;
 		case 0:
 			pp->cfg = win->res;
@@ -350,9 +342,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			pp->cfg0_base = pp->cfg->start;
 			pp->cfg1_base = pp->cfg->start + pp->cfg0_size;
 			break;
-		case IORESOURCE_BUS:
-			pp->busn = win->res;
-			break;
 		}
 	}
 
@@ -366,8 +355,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		}
 	}
 
-	pp->mem_base = pp->mem->start;
-
 	if (!pp->va_cfg0_base) {
 		pp->va_cfg0_base = devm_pci_remap_cfgspace(dev,
 					pp->cfg0_base, pp->cfg0_size);
@@ -438,8 +425,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			goto err_free_msi;
 	}
 
-	pp->root_bus_nr = pp->busn->start;
-
 	bridge->dev.parent = dev;
 	bridge->sysdata = pp;
 	bridge->busnr = pp->root_bus_nr;
@@ -623,9 +608,13 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 	 * ATU, so we should not program the ATU here.
 	 */
 	if (pp->bridge->child_ops == &dw_child_pcie_ops) {
+		struct resource_entry *entry =
+			resource_list_first_type(&pp->bridge->windows, IORESOURCE_MEM);
+
 		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX0,
-					  PCIE_ATU_TYPE_MEM, pp->mem_base,
-					  pp->mem_bus_addr, pp->mem_size);
+					  PCIE_ATU_TYPE_MEM, entry->res->start,
+					  entry->res->start - entry->offset,
+					  resource_size(entry->res));
 		if (pci->num_viewport > 2)
 			dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX2,
 						  PCIE_ATU_TYPE_IO, pp->io_base,
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 67aac6fdca24..3d552ec8a850 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -176,13 +176,7 @@ struct pcie_port {
 	resource_size_t		io_base;
 	phys_addr_t		io_bus_addr;
 	u32			io_size;
-	u64			mem_base;
-	phys_addr_t		mem_bus_addr;
-	u32			mem_size;
 	struct resource		*cfg;
-	struct resource		*io;
-	struct resource		*mem;
-	struct resource		*busn;
 	int			irq;
 	const struct dw_pcie_host_ops *ops;
 	int			msi_irq;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
