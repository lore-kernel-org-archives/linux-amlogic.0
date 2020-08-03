Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09478C4345D
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:02:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BA7622C9F
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:02:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mndNFR2s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BA7622C9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RI9sm8bi21kOfJXzwftXSUe1xWkIzd3rK9QgqGeRKIY=; b=mndNFR2snew9VBZVk3XnxJSrf
	Ok9im+QFBOl6ZjF1Wv32Aq2habZ3uwyhk6SAUI0mUI44h9O5JheDPmv4CsL+LRVC3YLn4afpUiXXc
	Uw9TzbZFB8uTNWvy9WJjXdbP9UXkBRfcMap3RU6IEPEnVFa9m6iZM4cNJ5CRQi+eC/gk2G2GhS2DW
	SYdFhbXGNQS1y5Vhylr88VTfhVp7x5l5O4qkOCeM8oHlwhVKx7xAUqVNuMoMvqQZ1V3Ii0Icw89tC
	LU0eLCcUZxvLV7Dg9c3i24ca7rkrxkfU63SXJrAmHfDFsng5t/Qu4GhxWzbdYtn+48u645WIm9Dwt
	tEKkvw1UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hb0-0000KC-E7; Mon, 03 Aug 2020 21:02:10 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haO-0008Pz-2S; Mon, 03 Aug 2020 21:01:34 +0000
Received: by mail-il1-f194.google.com with SMTP id i138so26415732ild.9;
 Mon, 03 Aug 2020 14:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EQL3A7dHzz+gC5njEctrBiMEIqtA+XjXrb2o208g3Ks=;
 b=HhC4x0MNRbXJBDrTuFf7+3LxsluNxP1mJoIhQh6FNZmSjXfPtrgpS9MC/8CRtyqnul
 t+TXodJgg/j78cRh9bUBHOdBToiIdpoBKp6JTOFRV6bw7h9+hOTPvBUaarJY1VVSwzKv
 S5uHwp5nC0P478vEJtjaUMFneMReORPKAezoJlpu0T7yQT0KaDEviWkqS29f1OrkDAue
 HoXD4QdOWrpdb8kXi3aPg2NoFrFVrc11Va3v0euJkBhblpZUqd/Llh4W8sEEV9jDZnh1
 SovNXOXOM1Lv3V9lI4n6lB5MOAs2+M15oB3JOCNqGibef/L+PbYisighELcgXbmov/X7
 9GPw==
X-Gm-Message-State: AOAM530N7oB8zOd0mwrFIL80cYnXzH+ugxfDQ+/SWXpQOK7fcBd3kmPY
 TKUrfipxOrc1PdPqx73lyg==
X-Google-Smtp-Source: ABdhPJzftW92R17dfbV7F93wEn6AsKYKgSXK+D8yX+DoZOz9nVGWzXcp3oJtQO05/bk7IoPLrTUNQg==
X-Received: by 2002:a92:d7cb:: with SMTP id g11mr1303449ilq.89.1596488491153; 
 Mon, 03 Aug 2020 14:01:31 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:30 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 05/27] PCI: dwc: al: Use pci_ops for child config space accessors
Date: Mon,  3 Aug 2020 15:00:54 -0600
Message-Id: <20200803210116.3132633-6-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170133_024721_03C6CE8A 
X-CRM114-Status: GOOD (  17.93  )
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

Now that DWC drivers can setup their own pci_ops for the root and child
buses, convert the Amazon driver to use the standard pci_ops for child
bus config accesses.

Cc: Jonathan Chocron <jonnyc@amazon.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-al.c | 63 ++++++----------------------
 1 file changed, 13 insertions(+), 50 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index 270868f3859a..5c5763f14485 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -222,14 +222,15 @@ static inline void al_pcie_target_bus_set(struct al_pcie *pcie,
 				  reg);
 }
 
-static void __iomem *al_pcie_conf_addr_map(struct al_pcie *pcie,
-					   unsigned int busnr,
-					   unsigned int devfn)
+static void __iomem *al_pcie_conf_addr_map_bus(struct pci_bus *bus,
+					       unsigned int devfn, int where)
 {
+	struct pcie_port *pp = bus->sysdata;
+	struct al_pcie *pcie = to_al_pcie(to_dw_pcie_from_pp(pp));
+	unsigned int busnr = bus->number;
 	struct al_pcie_target_bus_cfg *target_bus_cfg = &pcie->target_bus_cfg;
 	unsigned int busnr_ecam = busnr & target_bus_cfg->ecam_mask;
 	unsigned int busnr_reg = busnr & target_bus_cfg->reg_mask;
-	struct pcie_port *pp = &pcie->pci->pp;
 	void __iomem *pci_base_addr;
 
 	pci_base_addr = (void __iomem *)((uintptr_t)pp->va_cfg0_base +
@@ -245,52 +246,14 @@ static void __iomem *al_pcie_conf_addr_map(struct al_pcie *pcie,
 				       target_bus_cfg->reg_mask);
 	}
 
-	return pci_base_addr;
-}
-
-static int al_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus,
-				 unsigned int devfn, int where, int size,
-				 u32 *val)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct al_pcie *pcie = to_al_pcie(pci);
-	unsigned int busnr = bus->number;
-	void __iomem *pci_addr;
-	int rc;
-
-	pci_addr = al_pcie_conf_addr_map(pcie, busnr, devfn);
-
-	rc = dw_pcie_read(pci_addr + where, size, val);
-
-	dev_dbg(pci->dev, "%d-byte config read from %04x:%02x:%02x.%d offset 0x%x (pci_addr: 0x%px) - val:0x%x\n",
-		size, pci_domain_nr(bus), bus->number,
-		PCI_SLOT(devfn), PCI_FUNC(devfn), where,
-		(pci_addr + where), *val);
-
-	return rc;
+	return pci_base_addr + where;
 }
 
-static int al_pcie_wr_other_conf(struct pcie_port *pp, struct pci_bus *bus,
-				 unsigned int devfn, int where, int size,
-				 u32 val)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct al_pcie *pcie = to_al_pcie(pci);
-	unsigned int busnr = bus->number;
-	void __iomem *pci_addr;
-	int rc;
-
-	pci_addr = al_pcie_conf_addr_map(pcie, busnr, devfn);
-
-	rc = dw_pcie_write(pci_addr + where, size, val);
-
-	dev_dbg(pci->dev, "%d-byte config write to %04x:%02x:%02x.%d offset 0x%x (pci_addr: 0x%px) - val:0x%x\n",
-		size, pci_domain_nr(bus), bus->number,
-		PCI_SLOT(devfn), PCI_FUNC(devfn), where,
-		(pci_addr + where), val);
-
-	return rc;
-}
+static struct pci_ops al_child_pci_ops = {
+	.map_bus = al_pcie_conf_addr_map_bus,
+	.read = pci_generic_config_read,
+	.write = pci_generic_config_write,
+};
 
 static void al_pcie_config_prepare(struct al_pcie *pcie)
 {
@@ -344,6 +307,8 @@ static int al_pcie_host_init(struct pcie_port *pp)
 	struct al_pcie *pcie = to_al_pcie(pci);
 	int rc;
 
+	pp->bridge->child_ops = &al_child_pci_ops;
+
 	rc = al_pcie_rev_id_get(pcie, &pcie->controller_rev_id);
 	if (rc)
 		return rc;
@@ -358,8 +323,6 @@ static int al_pcie_host_init(struct pcie_port *pp)
 }
 
 static const struct dw_pcie_host_ops al_pcie_host_ops = {
-	.rd_other_conf = al_pcie_rd_other_conf,
-	.wr_other_conf = al_pcie_wr_other_conf,
 	.host_init = al_pcie_host_init,
 };
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
