Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8219CC433E3
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A83321775
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQ9MRy/L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A83321775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lmlikoDUxI8frKRDCUSjcBN6W6LOt1+zo5E5YD5j6BE=; b=oQ9MRy/LSmLqILsLDPjm/N7C2
	8zauLP02LrDlm0cyPvDNEc8vBxrj0l+q9g+spYHJ42hNAKfA0eJ2HbU15pWE5U3+uS9Stuk4uH1ur
	EPRL4dgcaVgGfmCaWtnypFAMcKG5ny8QSVr+F78Q7CWpkDDH5jEJUpsQpbQ5X6a0JJJZh4Renh1U1
	dq6LUm7cwfDCo+Ub+twQCoZp35pTZTifXsnvcXmCJem0lmt+FDdDsnrfXp+oSu+uQPOPblo3M8WAY
	nir282JVRBouwJQWFkfiChdGFIYB28lgT4Lowemsb+3ZQkS80vB2PngJ81iArN3yQNXPnhkTLtifl
	CP562cQuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8zEW-0005l2-VF; Fri, 21 Aug 2020 05:04:56 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9A-0004cE-AE; Fri, 21 Aug 2020 03:55:42 +0000
Received: by mail-il1-f196.google.com with SMTP id q14so348485ilm.2;
 Thu, 20 Aug 2020 20:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nzA5Li0O8wMWcSVtXd/0wN/DTjqwQIp+nFPJ5Byn0Ao=;
 b=ASibPsyHffak5n8bzxiroN02r9/LvDt9FeHJmheUep8IfCIN99OowD64mnuUFycb5E
 gof6wOHKM3yCC+SxTFdGJfP3lPoSOOf+SDDRvYaWdgxf3+8P2WPdPe+Cn/ldrTHJb/aX
 RkeYG1VkODS96/JB+lUrXS2bQR2dQxsfvoKhGjO4lG84uc4N6n98FA6pVFne9dWb043m
 39F2TliSDSmJQdkCEXl8+YYat4TlbaqQH/CRvEjzrQkA/QSc66fNS5p3VVpfc9RMPHMJ
 4Ev05tm5Q83jR54B3+LW7aRdMoEEP/vaBrpW+Ou2nkmJT3erYDOX6y7QlDpeqnmEvRuJ
 xXYg==
X-Gm-Message-State: AOAM532j8MgkASvwYiseE3jUk4KU6A5rBLD7vy/on9+1FaQjyg6UtLFC
 rMoVhuNjFW4fuF34BTui5g==
X-Google-Smtp-Source: ABdhPJzc1LE/Tdy0xRmiGMzYiTEmO8pmLRpngToU2Ig8re+Zg0QljB3LIZO9lG4SEHYgPPOeBnT1rg==
X-Received: by 2002:a92:a302:: with SMTP id a2mr1022465ili.116.1597982119184; 
 Thu, 20 Aug 2020 20:55:19 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:18 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 13/40] PCI: dwc: Use generic config accessors
Date: Thu, 20 Aug 2020 21:53:53 -0600
Message-Id: <20200821035420.380495-14-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235523_728559_5601EE0E 
X-CRM114-Status: GOOD (  22.21  )
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

Now that all the platforms with custom config access handling define
their own pci_ops, let's split the default config accessors to use
different pci_ops for root and child buses. With this, we can use the
generic config accessors. The child bus accesses mainly require a
.map_bus() hook to reconfigure the iATU on each config space access.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../pci/controller/dwc/pcie-designware-host.c | 119 ++++++------------
 1 file changed, 37 insertions(+), 82 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 33e632a24466..07791b4ebaa7 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -20,24 +20,7 @@
 #include "pcie-designware.h"
 
 static struct pci_ops dw_pcie_ops;
-
-static int dw_pcie_rd_own_conf(struct pcie_port *pp, int where, int size,
-			       u32 *val)
-{
-	struct dw_pcie *pci;
-
-	pci = to_dw_pcie_from_pp(pp);
-	return dw_pcie_read(pci->dbi_base + where, size, val);
-}
-
-static int dw_pcie_wr_own_conf(struct pcie_port *pp, int where, int size,
-			       u32 val)
-{
-	struct dw_pcie *pci;
-
-	pci = to_dw_pcie_from_pp(pp);
-	return dw_pcie_write(pci->dbi_base + where, size, val);
-}
+static struct pci_ops dw_child_pcie_ops;
 
 static void dw_msi_ack_irq(struct irq_data *d)
 {
@@ -443,7 +426,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 
 	/* Set default bus ops */
 	bridge->ops = &dw_pcie_ops;
-	bridge->child_ops = &dw_pcie_ops;
+	bridge->child_ops = &dw_child_pcie_ops;
 
 	if (pp->ops->host_init) {
 		ret = pp->ops->host_init(pp);
@@ -487,14 +470,14 @@ void dw_pcie_host_deinit(struct pcie_port *pp)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_host_deinit);
 
-static int dw_pcie_access_other_conf(struct pcie_port *pp, struct pci_bus *bus,
-				     u32 devfn, int where, int size, u32 *val,
-				     bool write)
+static void __iomem *dw_pcie_other_conf_map_bus(struct pci_bus *bus,
+						unsigned int devfn, int where)
 {
-	int ret, type;
+	int type;
 	u32 busdev, cfg_size;
 	u64 cpu_addr;
 	void __iomem *va_cfg_base;
+	struct pcie_port *pp = bus->sysdata;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
 	busdev = PCIE_ATU_BUS(bus->number) | PCIE_ATU_DEV(PCI_SLOT(devfn)) |
@@ -515,79 +498,50 @@ static int dw_pcie_access_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 	dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX1,
 				  type, cpu_addr,
 				  busdev, cfg_size);
-	if (write)
-		ret = dw_pcie_write(va_cfg_base + where, size, *val);
-	else
-		ret = dw_pcie_read(va_cfg_base + where, size, val);
 
-	if (pci->num_viewport <= 2)
-		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX1,
-					  PCIE_ATU_TYPE_IO, pp->io_base,
-					  pp->io_bus_addr, pp->io_size);
-
-	return ret;
-}
-
-static int dw_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus,
-				 u32 devfn, int where, int size, u32 *val)
-{
-	return dw_pcie_access_other_conf(pp, bus, devfn, where, size, val,
-					 false);
+	return va_cfg_base + where;
 }
 
-static int dw_pcie_wr_other_conf(struct pcie_port *pp, struct pci_bus *bus,
-				 u32 devfn, int where, int size, u32 val)
-{
-	return dw_pcie_access_other_conf(pp, bus, devfn, where, size, &val,
-					 true);
-}
-
-static int dw_pcie_valid_device(struct pcie_port *pp, struct pci_bus *bus,
-				int dev)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-
-	/* If there is no link, then there is no device */
-	if (!pci_is_root_bus(bus)) {
-		if (!dw_pcie_link_up(pci))
-			return 0;
-	} else if (dev > 0)
-		/* Access only one slot on each root port */
-		return 0;
-
-	return 1;
-}
-
-static int dw_pcie_rd_conf(struct pci_bus *bus, u32 devfn, int where,
-			   int size, u32 *val)
+static int dw_pcie_rd_other_conf(struct pci_bus *bus, unsigned int devfn,
+				 int where, int size, u32 *val)
 {
+	int ret;
 	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
-	if (!dw_pcie_valid_device(pp, bus, PCI_SLOT(devfn))) {
-		*val = 0xffffffff;
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
+	ret = pci_generic_config_read(bus, devfn, where, size, val);
 
-	if (pci_is_root_bus(bus))
-		return dw_pcie_rd_own_conf(pp, where, size, val);
+	if (!ret && pci->num_viewport <= 2)
+		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX1,
+					  PCIE_ATU_TYPE_IO, pp->io_base,
+					  pp->io_bus_addr, pp->io_size);
 
-	return dw_pcie_rd_other_conf(pp, bus, devfn, where, size, val);
+	return ret;
 }
 
-static int dw_pcie_wr_conf(struct pci_bus *bus, u32 devfn,
-			   int where, int size, u32 val)
+static int dw_pcie_wr_other_conf(struct pci_bus *bus, unsigned int devfn,
+				 int where, int size, u32 val)
 {
+	int ret;
 	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
-	if (!dw_pcie_valid_device(pp, bus, PCI_SLOT(devfn)))
-		return PCIBIOS_DEVICE_NOT_FOUND;
+	ret = pci_generic_config_write(bus, devfn, where, size, val);
 
-	if (pci_is_root_bus(bus))
-		return dw_pcie_wr_own_conf(pp, where, size, val);
+	if (!ret && pci->num_viewport <= 2)
+		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX1,
+					  PCIE_ATU_TYPE_IO, pp->io_base,
+					  pp->io_bus_addr, pp->io_size);
 
-	return dw_pcie_wr_other_conf(pp, bus, devfn, where, size, val);
+	return ret;
 }
 
+static struct pci_ops dw_child_pcie_ops = {
+	.map_bus = dw_pcie_other_conf_map_bus,
+	.read = dw_pcie_rd_other_conf,
+	.write = dw_pcie_wr_other_conf,
+};
+
 void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn, int where)
 {
 	struct pcie_port *pp = bus->sysdata;
@@ -600,8 +554,9 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 }
 
 static struct pci_ops dw_pcie_ops = {
-	.read = dw_pcie_rd_conf,
-	.write = dw_pcie_wr_conf,
+	.map_bus = dw_pcie_own_conf_map_bus,
+	.read = pci_generic_config_read,
+	.write = pci_generic_config_write,
 };
 
 void dw_pcie_setup_rc(struct pcie_port *pp)
@@ -660,7 +615,7 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 	 * the platform uses its own address translation component rather than
 	 * ATU, so we should not program the ATU here.
 	 */
-	if (pp->bridge->child_ops == &dw_pcie_ops && !pp->ops->rd_other_conf) {
+	if (pp->bridge->child_ops == &dw_child_pcie_ops) {
 		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX0,
 					  PCIE_ATU_TYPE_MEM, pp->mem_base,
 					  pp->mem_bus_addr, pp->mem_size);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
