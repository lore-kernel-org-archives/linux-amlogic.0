Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710F3C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:04:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6868022BED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:04:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZrSsnIy6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6868022BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pt7ZmLpSChMA+upCJ0Jc2HN8q9o9Zxe+bNJPkscHtcg=; b=ZrSsnIy6ec6CiiqYQG8F+iEfL
	4Ek8zrxBkFumhm/vvZ/Jkbgiw001WlrnZpUmhlyYehdOFjvs8EIrz4q0BlF7fqGgfZ0XkE4zz3waP
	4VncAjJUKVrt60FdsfHecXetjr58z0TQjo1bp5gqcIw78xM5IpX6/0e2JPUApQeauKnd4pE7CVHPM
	t4NehNVG6nZkN760bLSNR2w7fZ+G3guhQqHvvV7Tc78OOAavyQs8XUhzgBKr2w6XMRjIdwm8zDilu
	GpVegbc9aLz65rWmZg8GlPv2vgTmFnr9tQtoOs523/cJGITS9pK+xgh17I7sSjHN1rR4zBaKwNzSe
	RGFtgf5Bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hcm-0001PR-Vh; Mon, 03 Aug 2020 21:04:01 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haj-0000Aq-GA; Mon, 03 Aug 2020 21:01:56 +0000
Received: by mail-il1-f193.google.com with SMTP id t18so32374929ilh.2;
 Mon, 03 Aug 2020 14:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=saXc7GUoDkesF20I7UFsdi9hPtbZ6gcBdE2OHbCMpCA=;
 b=ZyXdBBLceSQ1c2mmMrWIE0wEthvI6miM7vZ0i2ike7zmsQWv4LdD4hLvnEluvAqPED
 OH4293m9GBgot7vkz+Rjruehee3O/0pnJQ/NV4UDRk6MlMXrgPEudvMV1SIFdCB29UWW
 W8aerne4OVXscC4BLMC9rY6/PIfxei1Gsk8V1HQOPvr9ftj/e98BbuG8Y3iOSgNWq+ZN
 AMhPMEAK+1GuoKWnKHR49lzTKXXyJbM1389zeFtLeWThSQwWXq74AVSuPULAhcQ23Y8d
 9aALYUDLa168tGDlrLdv6+Z9HhVN5eVFtj+XI/KE84hktKo0egJvZ8MxyZKYsjaINBtl
 DdLg==
X-Gm-Message-State: AOAM530VPP+Td2+J9zgEPrgqmEvlyHeGBWmRbsUIf0ogQAQRKLpUw684
 M9rAYMBMz/zsjx4uCM8Zgw==
X-Google-Smtp-Source: ABdhPJyvv0uRK79mfofQnWPAX/lrUkNhl98uSGAQALtBwC5yCmLzPHG/gk1AEvK1d658EgveC+qAIg==
X-Received: by 2002:a92:d1ce:: with SMTP id u14mr1318029ilg.270.1596488511699; 
 Mon, 03 Aug 2020 14:01:51 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:51 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 13/27] PCI: dwc: Use generic config accessors
Date: Mon,  3 Aug 2020 15:01:02 -0600
Message-Id: <20200803210116.3132633-14-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170153_723940_5F17F45D 
X-CRM114-Status: GOOD (  22.14  )
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

Now that all the platforms with custom config access handling define
their own pci_ops, let's split the default config accessors to use
different pci_ops for root and child buses. With this, we can use the
generic config accessors. The child bus accesses mainly require a
.map_bus() hook to reconfigure the iATU on each config space access.

BTW, if there are only 2 viewports which means config space and I/O
accesses are mutually exclusive because the iATU window is shared,
how are accesses serialized? That seems broken...

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../pci/controller/dwc/pcie-designware-host.c | 120 ++++++------------
 1 file changed, 42 insertions(+), 78 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 6e9f106e8e05..e9778f8ee955 100644
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
@@ -448,7 +431,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 
 	/* Set default bus ops */
 	bridge->ops = &dw_pcie_ops;
-	bridge->child_ops = &dw_pcie_ops;
+	bridge->child_ops = &dw_child_pcie_ops;
 
 	if (pp->ops->host_init) {
 		ret = pp->ops->host_init(pp);
@@ -498,14 +481,14 @@ void dw_pcie_host_deinit(struct pcie_port *pp)
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
@@ -526,79 +509,59 @@ static int dw_pcie_access_other_conf(struct pcie_port *pp, struct pci_bus *bus,
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
+static int dw_pcie_rd_other_conf(struct pci_bus *bus, unsigned int devfn,
+				 int where, int size, u32 *val)
 {
+	int ret;
+	struct pcie_port *pp = bus->sysdata;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
-	/* If there is no link, then there is no device */
-	if (bus->number != pp->root_bus_nr) {
-		if (!dw_pcie_link_up(pci))
-			return 0;
-	}
+	ret = pci_generic_config_read(bus, devfn, where, size, val);
 
-	/* Access only one slot on each root port */
-	if (bus->number == pp->root_bus_nr && dev > 0)
-		return 0;
+	if (!ret && pci->num_viewport <= 2)
+		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX1,
+					  PCIE_ATU_TYPE_IO, pp->io_base,
+					  pp->io_bus_addr, pp->io_size);
 
-	return 1;
+	return ret;
 }
 
-static int dw_pcie_rd_conf(struct pci_bus *bus, u32 devfn, int where,
-			   int size, u32 *val)
+static int dw_pcie_wr_other_conf(struct pci_bus *bus, unsigned int devfn,
+				 int where, int size, u32 val)
 {
+	int ret;
 	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
-	if (!dw_pcie_valid_device(pp, bus, PCI_SLOT(devfn))) {
-		*val = 0xffffffff;
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	}
+	ret = pci_generic_config_write(bus, devfn, where, size, val);
 
-	if (bus->number == pp->root_bus_nr)
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
+static struct pci_ops dw_child_pcie_ops = {
+	.map_bus = dw_pcie_other_conf_map_bus,
+	.read = dw_pcie_rd_other_conf,
+	.write = dw_pcie_wr_other_conf,
+};
+
+void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn, int where)
 {
 	struct pcie_port *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
-	if (!dw_pcie_valid_device(pp, bus, PCI_SLOT(devfn)))
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	if (bus->number == pp->root_bus_nr)
-		return dw_pcie_wr_own_conf(pp, where, size, val);
+	if (PCI_SLOT(devfn) > 0)
+		return NULL;
 
-	return dw_pcie_wr_other_conf(pp, bus, devfn, where, size, val);
+	return pci->dbi_base + where;
 }
 
 void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn, int where)
@@ -613,8 +576,9 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 }
 
 static struct pci_ops dw_pcie_ops = {
-	.read = dw_pcie_rd_conf,
-	.write = dw_pcie_wr_conf,
+	.map_bus = dw_pcie_own_conf_map_bus,
+	.read = pci_generic_config_read,
+	.write = pci_generic_config_write,
 };
 
 void dw_pcie_setup_rc(struct pcie_port *pp)
@@ -673,7 +637,7 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
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
