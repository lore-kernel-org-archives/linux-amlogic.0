Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFE2C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:05:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E0F20775
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:05:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ATz2wgBb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E0F20775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2eMTOmn925VLspZBdfvSBSTJzJcAQbaCHNuIiAbaDhg=; b=ATz2wgBbtgzAjlby/WnE3fz84
	EcLrkEYrJnQ59EJQgRdo3oNGNFIyKUNm1HrihsS5qfmoxgfp3pRreCS55V/8W9ZxnzGRXsUFUYySB
	5h4JN/S6jFNV+SHFUj1avo1I5H5CRVtWTps3hE/IQKYFUWKUpxsZuQBKwYsG94M+yJkpjsrSkcXcu
	DvCpsTqkCAcm4fWc4p9j2vW3oyUBqRuLAob/Kf8Y/5nOA73mRNmTBKFWdKJ4o4tukJ0/F7uPUa2b4
	2PwzB33aZgPCXLd7VpBoIwAXYH2vesqf7KIRZ+ZfS48Jg/dEv8dancKnr1sg035PIbvYL0v6PqGDI
	kO7zQe0RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2heG-0002Rk-G4; Mon, 03 Aug 2020 21:05:32 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2hay-0000JV-KD; Mon, 03 Aug 2020 21:02:10 +0000
Received: by mail-il1-f193.google.com with SMTP id i138so26417203ild.9;
 Mon, 03 Aug 2020 14:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A5ZRdGbgMokbNA9oTRazmcvFgPKDBEIf6TFNg0ak5Ts=;
 b=MUmZI9y63yROIkw1KAnCvluVZCKhCI3HHrXa2uY4r+AEKVgw+jYWAPvZsK/ca+OUSk
 K+9ZbjrlZNOiXEXuUnGdTwBphtrC1vMzwCI13ojzZ1RMzbUDN+EzgHDZNhn8uopMDeKr
 0ZmwWx1g01atWJ4Pg4FbW449CxqHf4ggUm5TtLzHCZW1vopRIG+UWtyGk2ZqdBgbxUlH
 i8dm0Ad52a8RtqbKz6ltHwzX6Bsxw6kkn3BubruebK+BZ5Mouni1H1NDI+XjzJ4aWeYl
 +cDp3ujRYn6UOOP+RdKyQDuyqwVZol10wTzS/TuvKunY8zUXFXIa9R8/1C/pNGd5LLDp
 kfHQ==
X-Gm-Message-State: AOAM533T2u0EtuiEdC+3DUEWQsIVoVMMlfDZuUOo//IZrF7Oarh2U6xf
 Aol8kriM1ydpv/M0LAhI2w==
X-Google-Smtp-Source: ABdhPJw9hQJvyqAcDIO3UaEmiIOveBESyqnRHcwOtmBQyXK9HRW5j6bU0VVQqY+1zy8sjr3lVihj5w==
X-Received: by 2002:a92:660e:: with SMTP id a14mr1369453ilc.290.1596488527825; 
 Mon, 03 Aug 2020 14:02:07 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:02:07 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 19/27] PCI: dwc: Simplify config space handling
Date: Mon,  3 Aug 2020 15:01:08 -0600
Message-Id: <20200803210116.3132633-20-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170208_739106_F02BA9E3 
X-CRM114-Status: GOOD (  20.23  )
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

The config space is divided in half for type 0 and type 1 accesses, but
this is pointless as there's only one iATU window which is
reconfigured on each access.

The only platform doing something custom is TI Keystone (surprise!).
It does its own mapping of the config space to avoid spliting the
config space and never actually uses va_cfg1_base as it has its own
config space accessors. With the splitting removed, Keystone can use the
default mapping of config space.

Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-keystone.c     |  8 ---
 .../pci/controller/dwc/pcie-designware-host.c | 63 ++++++-------------
 drivers/pci/controller/dwc/pcie-designware.h  |  4 --
 3 files changed, 20 insertions(+), 55 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index bdf4fe1fc822..e9028c98d6c0 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -873,16 +873,8 @@ static int __init ks_pcie_add_pcie_port(struct keystone_pcie *ks_pcie,
 	struct dw_pcie *pci = ks_pcie->pci;
 	struct pcie_port *pp = &pci->pp;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int ret;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config");
-	pp->va_cfg0_base = devm_pci_remap_cfg_resource(dev, res);
-	if (IS_ERR(pp->va_cfg0_base))
-		return PTR_ERR(pp->va_cfg0_base);
-
-	pp->va_cfg1_base = pp->va_cfg0_base;
-
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
 		dev_err(dev, "failed to initialize host\n");
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index a981e9de81d7..1ff4702595b6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -308,10 +308,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
 
 	cfg_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config");
 	if (cfg_res) {
-		pp->cfg0_size = resource_size(cfg_res) >> 1;
-		pp->cfg1_size = resource_size(cfg_res) >> 1;
+		pp->cfg0_size = resource_size(cfg_res);
 		pp->cfg0_base = cfg_res->start;
-		pp->cfg1_base = cfg_res->start + pp->cfg0_size;
 	} else if (!pp->va_cfg0_base) {
 		dev_err(dev, "Missing *config* reg space\n");
 	}
@@ -336,25 +334,22 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			pp->io_base = pci_pio_to_address(win->res->start);
 			break;
 		case 0:
-			pp->cfg = win->res;
-			pp->cfg0_size = resource_size(pp->cfg) >> 1;
-			pp->cfg1_size = resource_size(pp->cfg) >> 1;
-			pp->cfg0_base = pp->cfg->start;
-			pp->cfg1_base = pp->cfg->start + pp->cfg0_size;
+			dev_err(dev, "Missing *config* reg space\n");
+			pp->cfg0_size = resource_size(win->res);
+			pp->cfg0_base = win->res->start;
+			if (!pci->dbi_base) {
+				pci->dbi_base = devm_pci_remap_cfgspace(dev,
+								pp->cfg0_base,
+								pp->cfg0_size);
+				if (!pci->dbi_base) {
+					dev_err(dev, "Error with ioremap\n");
+					return -ENOMEM;
+				}
+			}
 			break;
 		}
 	}
 
-	if (!pci->dbi_base) {
-		pci->dbi_base = devm_pci_remap_cfgspace(dev,
-						pp->cfg->start,
-						resource_size(pp->cfg));
-		if (!pci->dbi_base) {
-			dev_err(dev, "Error with ioremap\n");
-			return -ENOMEM;
-		}
-	}
-
 	if (!pp->va_cfg0_base) {
 		pp->va_cfg0_base = devm_pci_remap_cfgspace(dev,
 					pp->cfg0_base, pp->cfg0_size);
@@ -364,16 +359,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		}
 	}
 
-	if (!pp->va_cfg1_base) {
-		pp->va_cfg1_base = devm_pci_remap_cfgspace(dev,
-						pp->cfg1_base,
-						pp->cfg1_size);
-		if (!pp->va_cfg1_base) {
-			dev_err(dev, "Error with ioremap\n");
-			return -ENOMEM;
-		}
-	}
-
 	ret = of_property_read_u32(np, "num-viewport", &pci->num_viewport);
 	if (ret)
 		pci->num_viewport = 2;
@@ -455,32 +440,24 @@ static void __iomem *dw_pcie_other_conf_map_bus(struct pci_bus *bus,
 						unsigned int devfn, int where)
 {
 	int type;
-	u32 busdev, cfg_size;
-	u64 cpu_addr;
-	void __iomem *va_cfg_base;
+	u32 busdev;
 	struct pcie_port *pp = bus->sysdata;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
 	busdev = PCIE_ATU_BUS(bus->number) | PCIE_ATU_DEV(PCI_SLOT(devfn)) |
 		 PCIE_ATU_FUNC(PCI_FUNC(devfn));
 
-	if (bus->parent->number == pp->root_bus_nr) {
+	if (bus->parent->number == pp->root_bus_nr)
 		type = PCIE_ATU_TYPE_CFG0;
-		cpu_addr = pp->cfg0_base;
-		cfg_size = pp->cfg0_size;
-		va_cfg_base = pp->va_cfg0_base;
-	} else {
+	else
 		type = PCIE_ATU_TYPE_CFG1;
-		cpu_addr = pp->cfg1_base;
-		cfg_size = pp->cfg1_size;
-		va_cfg_base = pp->va_cfg1_base;
-	}
+
 
 	dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX1,
-				  type, cpu_addr,
-				  busdev, cfg_size);
+				  type, pp->cfg0_size,
+				  busdev, pp->cfg0_size);
 
-	return va_cfg_base + where;
+	return pp->va_cfg0_base + where;
 }
 
 static int dw_pcie_rd_other_conf(struct pci_bus *bus, unsigned int devfn,
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 3d552ec8a850..2db6f52dfe81 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -170,13 +170,9 @@ struct pcie_port {
 	u64			cfg0_base;
 	void __iomem		*va_cfg0_base;
 	u32			cfg0_size;
-	u64			cfg1_base;
-	void __iomem		*va_cfg1_base;
-	u32			cfg1_size;
 	resource_size_t		io_base;
 	phys_addr_t		io_bus_addr;
 	u32			io_size;
-	struct resource		*cfg;
 	int			irq;
 	const struct dw_pcie_host_ops *ops;
 	int			msi_irq;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
