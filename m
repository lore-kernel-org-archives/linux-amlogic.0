Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DBEC433F8
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 03:55:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62CD52076E
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 03:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GSstnfaL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62CD52076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pg34V3Wmuk9ntZBAfxE3PqNye3olz6ohK7UBSjcsQ+0=; b=GSstnfaLeWQabG9Uu4L/ATG4b
	3waCAl5dPK826C3mms6b4we9HLB5xL1oZeDf2HVOI6beKoP7SyBn8iwvXwWNNo8Xdw3A1Mf5nCemd
	dVjy8Qe50ojD+S0tD/XSfKNLw6Fm5RJ8j/BRNmUuQ7RMCkTObjlz6K/kCUsQ/ZI4SYiegJ1HStgq4
	Arkmi9iy4GiY2rdosQS1jEnJf6TDzmvZVHdmyXgLDGM3ax0C2JAjAYU60u0RFNr83YKhWf6fafoYt
	AS6wVSjmL29Y4S8bs/Re9rlyAUUdpyws3k8HJN4NPmaqA+t70M0mvFghXosr5w+C9wr3Pw0ev/Q8E
	Rfie/1xBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8y8t-0004UQ-Kv; Fri, 21 Aug 2020 03:55:03 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y8S-0004Go-Lg; Fri, 21 Aug 2020 03:54:45 +0000
Received: by mail-io1-f65.google.com with SMTP id u126so451107iod.12;
 Thu, 20 Aug 2020 20:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WlJzV8OhTh5Vvu8qiV/8YFigGDBtZq/RAwkrYqOmODA=;
 b=BeOu4BZLgu+ZEQux2qnSIIeueRrf4y7oObNR1zX47xM/KVn2SWWsvmaRH5p0PdFjzS
 x0mXkbxfzUQKY/l8bgo+fW86FZX6Q6lHP8Sf35f7Dz68Z4oHjWRbJzFPr3GpyAcRIVld
 L5RkciE9AgVy/sDppz7LVrpVU6oIteAwGZfSDlt7qRfKmRZYmb5qK2fFLNZYN+3tLO2B
 zrzNbT++3A7/ribFN6YBRJ4U3weMP51zDqqmv784friI0LfRX7nF36TRwwnVpd6SXHMW
 Hjctm2QKVp+2Qw7i3crGsaGmsVHgeMrNY3eN+mrYGuX5lAWvDDMu/K1pS0qeCjdeXGWr
 69hQ==
X-Gm-Message-State: AOAM531pczuQZ4Xzd5QbBcEGhnnEuJub9XTJ/ysssO+xp/qaJWf1l7+f
 ToY6HlF3qdFCj4MNm8q/Tg==
X-Google-Smtp-Source: ABdhPJwXcrLWaZzka2x4aHtByoCZP+D78lmfKZFdV5LjiT3MS3pCIEtfnkrqh/XALZEi1JruRCkPEw==
X-Received: by 2002:a6b:f014:: with SMTP id w20mr903984ioc.21.1597982075311;
 Thu, 20 Aug 2020 20:54:35 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:54:34 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 02/40] PCI: dwc: Use DBI accessors instead of own config
 accessors
Date: Thu, 20 Aug 2020 21:53:42 -0600
Message-Id: <20200821035420.380495-3-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235436_910842_9A21ED87 
X-CRM114-Status: GOOD (  18.49  )
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

The Designware DBI space contains the root bus bridge config space.
Platforms needing custom {rd,wr}_own_conf functions are also the ones
needing custom {read,write}_dbi ops functions and the access sequences
are the same.

Replace all dw_pcie_{rd,wr}_own_conf() calls with the DBI variants in
preparation to remove dw_pcie_{rd,wr}_own_conf().

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../pci/controller/dwc/pcie-designware-host.c | 55 +++++++------------
 1 file changed, 19 insertions(+), 36 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 9dafecba347f..1d98554db009 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -82,13 +82,13 @@ irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
 	unsigned long val;
 	u32 status, num_ctrls;
 	irqreturn_t ret = IRQ_NONE;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
 	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
 
 	for (i = 0; i < num_ctrls; i++) {
-		dw_pcie_rd_own_conf(pp, PCIE_MSI_INTR0_STATUS +
-					(i * MSI_REG_CTRL_BLOCK_SIZE),
-				    4, &status);
+		status = dw_pcie_readl_dbi(pci, PCIE_MSI_INTR0_STATUS +
+					   (i * MSI_REG_CTRL_BLOCK_SIZE));
 		if (!status)
 			continue;
 
@@ -148,6 +148,7 @@ static int dw_pci_msi_set_affinity(struct irq_data *d,
 static void dw_pci_bottom_mask(struct irq_data *d)
 {
 	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	unsigned int res, bit, ctrl;
 	unsigned long flags;
 
@@ -158,8 +159,7 @@ static void dw_pci_bottom_mask(struct irq_data *d)
 	bit = d->hwirq % MAX_MSI_IRQS_PER_CTRL;
 
 	pp->irq_mask[ctrl] |= BIT(bit);
-	dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_MASK + res, 4,
-			    pp->irq_mask[ctrl]);
+	dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MASK + res, pp->irq_mask[ctrl]);
 
 	raw_spin_unlock_irqrestore(&pp->lock, flags);
 }
@@ -167,6 +167,7 @@ static void dw_pci_bottom_mask(struct irq_data *d)
 static void dw_pci_bottom_unmask(struct irq_data *d)
 {
 	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	unsigned int res, bit, ctrl;
 	unsigned long flags;
 
@@ -177,8 +178,7 @@ static void dw_pci_bottom_unmask(struct irq_data *d)
 	bit = d->hwirq % MAX_MSI_IRQS_PER_CTRL;
 
 	pp->irq_mask[ctrl] &= ~BIT(bit);
-	dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_MASK + res, 4,
-			    pp->irq_mask[ctrl]);
+	dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MASK + res, pp->irq_mask[ctrl]);
 
 	raw_spin_unlock_irqrestore(&pp->lock, flags);
 }
@@ -186,13 +186,14 @@ static void dw_pci_bottom_unmask(struct irq_data *d)
 static void dw_pci_bottom_ack(struct irq_data *d)
 {
 	struct pcie_port *pp  = irq_data_get_irq_chip_data(d);
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	unsigned int res, bit, ctrl;
 
 	ctrl = d->hwirq / MAX_MSI_IRQS_PER_CTRL;
 	res = ctrl * MSI_REG_CTRL_BLOCK_SIZE;
 	bit = d->hwirq % MAX_MSI_IRQS_PER_CTRL;
 
-	dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_STATUS + res, 4, BIT(bit));
+	dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_STATUS + res, BIT(bit));
 }
 
 static struct irq_chip dw_pci_msi_bottom_irq_chip = {
@@ -310,10 +311,8 @@ void dw_pcie_msi_init(struct pcie_port *pp)
 	msi_target = (u64)pp->msi_data;
 
 	/* Program the msi_data */
-	dw_pcie_wr_own_conf(pp, PCIE_MSI_ADDR_LO, 4,
-			    lower_32_bits(msi_target));
-	dw_pcie_wr_own_conf(pp, PCIE_MSI_ADDR_HI, 4,
-			    upper_32_bits(msi_target));
+	dw_pcie_writel_dbi(pci, PCIE_MSI_ADDR_LO, lower_32_bits(msi_target));
+	dw_pcie_writel_dbi(pci, PCIE_MSI_ADDR_HI, upper_32_bits(msi_target));
 }
 EXPORT_SYMBOL_GPL(dw_pcie_msi_init);
 
@@ -327,7 +326,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	struct pci_bus *child;
 	struct pci_host_bridge *bridge;
 	struct resource *cfg_res;
-	u32 hdr_type;
 	int ret;
 
 	raw_spin_lock_init(&pci->pp.lock);
@@ -453,21 +451,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			goto err_free_msi;
 	}
 
-	ret = dw_pcie_rd_own_conf(pp, PCI_HEADER_TYPE, 1, &hdr_type);
-	if (ret != PCIBIOS_SUCCESSFUL) {
-		dev_err(pci->dev, "Failed reading PCI_HEADER_TYPE cfg space reg (ret: 0x%x)\n",
-			ret);
-		ret = pcibios_err_to_errno(ret);
-		goto err_free_msi;
-	}
-	if (hdr_type != PCI_HEADER_TYPE_BRIDGE) {
-		dev_err(pci->dev,
-			"PCIe controller is not set to bridge type (hdr_type: 0x%x)!\n",
-			hdr_type);
-		ret = -EIO;
-		goto err_free_msi;
-	}
-
 	bridge->sysdata = pp;
 	bridge->ops = &dw_pcie_ops;
 
@@ -638,12 +621,12 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 		/* Initialize IRQ Status array */
 		for (ctrl = 0; ctrl < num_ctrls; ctrl++) {
 			pp->irq_mask[ctrl] = ~0;
-			dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_MASK +
+			dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MASK +
 					    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
-					    4, pp->irq_mask[ctrl]);
-			dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_ENABLE +
+					    pp->irq_mask[ctrl]);
+			dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_ENABLE +
 					    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
-					    4, ~0);
+					    ~0);
 		}
 	}
 
@@ -685,14 +668,14 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 						  pp->io_bus_addr, pp->io_size);
 	}
 
-	dw_pcie_wr_own_conf(pp, PCI_BASE_ADDRESS_0, 4, 0);
+	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_0, 0);
 
 	/* Program correct class for RC */
-	dw_pcie_wr_own_conf(pp, PCI_CLASS_DEVICE, 2, PCI_CLASS_BRIDGE_PCI);
+	dw_pcie_writew_dbi(pci, PCI_CLASS_DEVICE, PCI_CLASS_BRIDGE_PCI);
 
-	dw_pcie_rd_own_conf(pp, PCIE_LINK_WIDTH_SPEED_CONTROL, 4, &val);
+	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
 	val |= PORT_LOGIC_SPEED_CHANGE;
-	dw_pcie_wr_own_conf(pp, PCIE_LINK_WIDTH_SPEED_CONTROL, 4, val);
+	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
 
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
