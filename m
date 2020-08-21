Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125ADC433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:14:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E7520855
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:14:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SXRGmovB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R4j8nb4I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E7520855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=APGr5NJBfLIuiEjki/sUpNCWpZSubdgEe43LRJU8Ehc=; b=SXRGmovB1ic5NRu4eYwq1ky8W
	niK9hrt9WFcZPkloRBvxP5x3J2kiLvfubOFWwNpJcYqQFVGtXoVXQ3K5H2bkg4uqZgEcK8i4+8QXP
	+9Yrec5fM7Sm6G9MlsoG7cNm2RddmaBinP4p+7UO2TpCjb9hePwjF5VVHalGevrWTJCuFHsI3hS6V
	OoavFQgz3YPXyYFLYZCoVYPcAiBt1xaC2aQd/QPWgAdb5jvZh9BJYlPFFmdyoXEYx4q48aT8kUcc8
	ZVr0R1PpjV6xq8j9hL7ir2imn/hVNtni3hKUmd3h+q+IPzc0AuuCUDsn/LHaU4CU4GJAvRdvFZKWZ
	57xqLE5ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yR8-0004tP-QR; Fri, 21 Aug 2020 04:13:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yOF-00034Q-66; Fri, 21 Aug 2020 04:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=bXG25ws/U2dFzSa8lenT9wsjfRYOe4p4E3p8TazUipk=; b=R4j8nb4IATN/HK+ZaQ6b8hlQ8c
 18RiFvKHV4poeTqdSmDoVM1txLw5VnFlayew/SYpG9L6jiCA6wksJBK65lOxPcb4gsxQETfdioHj7
 eY4AhpiiQcYobvHIbZQk8eYrF/YcueHvvgU6I0fNHw7YKf9bXR0A/lHBFfqmNgRRn1YVUWLhbn5pA
 9zhfkv5QsrNp0XT7hISYl9qilbl6ar5HZFVPCFwPvYRJFwj8G4au8aB5dpBAOd4qVoN9BWNh8aKjd
 xiBauqqOi/fDOoL2wWiK8D9RHlKlO24fSAHfOlANCfPh8erjWw/vJEG6TSPUecCYAW2ZbrVaI6kVI
 MOjdE+jw==;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9V-0001Gw-P2; Fri, 21 Aug 2020 03:55:44 +0000
Received: by mail-il1-f194.google.com with SMTP id t13so325490ile.9;
 Thu, 20 Aug 2020 20:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bXG25ws/U2dFzSa8lenT9wsjfRYOe4p4E3p8TazUipk=;
 b=LAvqtHfB83XRF35uMMQDtVol2oxyj6aWTnyCC4mXDq9dyzBANCFmD4JEnAI5UWTwdD
 2RhIytFFjAl87pntmAdT0JaxJi4YEu7bTxzF7T9URbUlZ+eXhbSPIPdIrWn4Ma3WzM8e
 mD5i4nWd+y+GF837WumiIVvpUwhexZvfGtJqSd07+x088DFois3jrBCOt/Nk/qIn4NQK
 KGPZp2rupUARrhIX0z5lzwZ69hjhp15Y+TGN1g595bZmYHTXbtQbGIEorA6/jhidrzfN
 4sKnq0g7Bc0Ha0RxZ4Pgq0qkGHeXfsHzrQE9FywLvIKXY/Yaj19XEv2esZ4Sk0r3Seb3
 Lq0A==
X-Gm-Message-State: AOAM532o+7nRK/lPw8JTIQPApVxE6/JNZUK5Rp9SPD2lzQIAXvP/ClZ7
 5ahUxujE4jyCgtKlNcxU1g==
X-Google-Smtp-Source: ABdhPJyPe0dr4IHnAhl6FtaJqFQnHw5NBMTrbn3z8oh2Lsfgv2Dr4ChvLuAoznSpFjg6tMWAOIEZlw==
X-Received: by 2002:a92:6901:: with SMTP id e1mr1002002ilc.209.1597982140468; 
 Thu, 20 Aug 2020 20:55:40 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:39 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 19/40] PCI: dwc: Simplify config space handling
Date: Thu, 20 Aug 2020 21:53:59 -0600
Message-Id: <20200821035420.380495-20-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045542_026114_B1559189 
X-CRM114-Status: GOOD (  18.73  )
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
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Fix passing cfg0_base in dw_pcie_other_conf_map_bus
---
 drivers/pci/controller/dwc/pci-keystone.c     |  8 ---
 .../pci/controller/dwc/pcie-designware-host.c | 63 ++++++-------------
 drivers/pci/controller/dwc/pcie-designware.h  |  4 --
 3 files changed, 20 insertions(+), 55 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index d306914a1f93..983069a4a561 100644
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
index 1e42345922d5..06f6cbefeb95 100644
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
@@ -331,25 +329,22 @@ int dw_pcie_host_init(struct pcie_port *pp)
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
@@ -359,16 +354,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
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
@@ -446,32 +431,24 @@ static void __iomem *dw_pcie_other_conf_map_bus(struct pci_bus *bus,
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
 
-	if (pci_is_root_bus(bus->parent)) {
+	if (pci_is_root_bus(bus->parent))
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
+				  type, pp->cfg0_base,
+				  busdev, pp->cfg0_size);
 
-	return va_cfg_base + where;
+	return pp->va_cfg0_base + where;
 }
 
 static int dw_pcie_rd_other_conf(struct pci_bus *bus, unsigned int devfn,
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 50225bf6a2b5..7cc322f8596c 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -169,13 +169,9 @@ struct pcie_port {
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
