Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AB6C433FC
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:02:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB71C22CB1
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OBy6g+t0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB71C22CB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wXlrYS8dPxi61HKg9qudVQNT0Zc8z3BHVN58/ehppas=; b=OBy6g+t0mZPRYHY+3Oygb6/iy
	/DceHkZUvux2sm3leTfzam/QI0/JaZbRcliGrgZS/Xe0EMrXBzY56KkQQ89lj2ld5IvNAfEHEOtgq
	/6mjHM7tikhJ7gr96p74h+A7j3nip2mxFSB+OcL76XVuWLKGGVoaxMBXvCnXQYGi8ZY+VQ6i0uPH/
	SMIQRIO7SOme3U4YqpyUSJI9uSSGeqrV4pS9LbH6bG7ivYfDdDnieEqrAOplSvRuPaXemIvi9ncOb
	FQb6D9jHHe7VLb9pcwr5f47zXW2FxRtp/wVsAA7McI2IVlHujE6hR7GElhPJYNgl/fWRQ1v1IHe+P
	RPLCwggnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hbC-0000Qs-00; Mon, 03 Aug 2020 21:02:22 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haQ-0008Qw-Co; Mon, 03 Aug 2020 21:01:35 +0000
Received: by mail-il1-f196.google.com with SMTP id i138so26415826ild.9;
 Mon, 03 Aug 2020 14:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=enkj1hpfF2DRae6tMsmNr00vC0nnMrJ8ecK1LKopnys=;
 b=oX185OrfzSlcWDcRrwz089eGJD/tXLlxjfHO9OK4aVkyTPqmb6O0A4PXlSwKhMfXt3
 ToyzvPtVGQhZXDDuPOq9xpahvh9VTkvXnCrv3BzW07uPJsO2/4U9Mp2+h3hjvR3WjGni
 5HLCC036d9HFjkuqCl6RaqwcnXRub1mPLfkoyUZiG9WhfOIIUvR5wVlx8w1NRMWQMeCN
 4aj3Ak6IuO4Vd7nsQtT8uFHUV7GobGQ9wBUn5cTxiMmT4rwReVc3yHn/S5Uqn/4m83Nt
 90qcLIJnjhOtk7X607HLRVjSwaLedaPGaPLZgnFUmWvf03XoHnblVZ9We3mYJebNXaUp
 walA==
X-Gm-Message-State: AOAM530voWSqjQY8gGfg8g5BxS5zWZMBr3+Y3fjPEAQ1nzJpC3v8EOY5
 apTRaHY4j7ymRjcVAK6W2w==
X-Google-Smtp-Source: ABdhPJzWPzbp0GjA/fWrdCLZshRyk6S65JBCKe+YdG5gw5OjbQ3+gG0tLzeJjdOPlVejehxqb5N9Qg==
X-Received: by 2002:a92:d2c8:: with SMTP id w8mr1409855ilg.38.1596488493349;
 Mon, 03 Aug 2020 14:01:33 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:32 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 06/27] PCI: dwc: keystone: Use pci_ops for config space accessors
Date: Mon,  3 Aug 2020 15:00:55 -0600
Message-Id: <20200803210116.3132633-7-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170134_469765_B6C8E9D5 
X-CRM114-Status: GOOD (  16.44  )
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
buses, convert the TI Keystone driver to use the standard pci_ops for
config accesses.

Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-keystone.c | 40 ++++++++++-------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 790679fdfa48..df1194d186bc 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -430,10 +430,10 @@ static void ks_pcie_setup_rc_app_regs(struct keystone_pcie *ks_pcie)
 	ks_pcie_app_writel(ks_pcie, CMD_STATUS, val);
 }
 
-static int ks_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus,
-				 unsigned int devfn, int where, int size,
-				 u32 *val)
+static void __iomem *ks_pcie_other_map_bus(struct pci_bus *bus,
+					   unsigned int devfn, int where)
 {
+	struct pcie_port *pp = bus->sysdata;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
 	u32 reg;
@@ -444,25 +444,14 @@ static int ks_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 		reg |= CFG_TYPE1;
 	ks_pcie_app_writel(ks_pcie, CFG_SETUP, reg);
 
-	return dw_pcie_read(pp->va_cfg0_base + where, size, val);
+	return pp->va_cfg0_base + where;
 }
 
-static int ks_pcie_wr_other_conf(struct pcie_port *pp, struct pci_bus *bus,
-				 unsigned int devfn, int where, int size,
-				 u32 val)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
-	u32 reg;
-
-	reg = CFG_BUS(bus->number) | CFG_DEVICE(PCI_SLOT(devfn)) |
-		CFG_FUNC(PCI_FUNC(devfn));
-	if (bus->parent->number != pp->root_bus_nr)
-		reg |= CFG_TYPE1;
-	ks_pcie_app_writel(ks_pcie, CFG_SETUP, reg);
-
-	return dw_pcie_write(pp->va_cfg0_base + where, size, val);
-}
+static struct pci_ops ks_child_pcie_ops = {
+	.map_bus = ks_pcie_other_map_bus,
+	.read = pci_generic_config_read,
+	.write = pci_generic_config_write,
+};
 
 /**
  * ks_pcie_v3_65_scan_bus() - keystone scan_bus post initialization
@@ -490,6 +479,12 @@ static void ks_pcie_v3_65_scan_bus(struct pcie_port *pp)
 	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_0, ks_pcie->app.start);
 }
 
+static struct pci_ops ks_pcie_ops = {
+	.map_bus = dw_pcie_own_conf_map_bus,
+	.read = pci_generic_config_read,
+	.write = pci_generic_config_write,
+};
+
 /**
  * ks_pcie_link_up() - Check if link up
  */
@@ -807,6 +802,9 @@ static int __init ks_pcie_host_init(struct pcie_port *pp)
 	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
 	int ret;
 
+	pp->bridge->ops = &ks_pcie_ops;
+	pp->bridge->child_ops = &ks_child_pcie_ops;
+
 	ret = ks_pcie_config_legacy_irq(ks_pcie);
 	if (ret)
 		return ret;
@@ -842,8 +840,6 @@ static int __init ks_pcie_host_init(struct pcie_port *pp)
 }
 
 static const struct dw_pcie_host_ops ks_pcie_host_ops = {
-	.rd_other_conf = ks_pcie_rd_other_conf,
-	.wr_other_conf = ks_pcie_wr_other_conf,
 	.host_init = ks_pcie_host_init,
 	.msi_host_init = ks_pcie_msi_host_init,
 	.scan_bus = ks_pcie_v3_65_scan_bus,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
