Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E088DC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:16:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A94AD20855
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:16:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DyZYz+Zm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZCBdFH32"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A94AD20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g/CCGzGC4yb1IFP7yaau4jsYMmrLiTovkGZdvEh9tVU=; b=DyZYz+Zmklid99tRjdiVPxpgL
	L1aoC11/NhlJZ64fMb7eKIqjne1ktYugDca7TIvq6IZlSVR/etPHjIIQLE+bU+kNXwxwjEjK393e2
	lM13ciRTipUrxwG7E68WZePB57+muDvT9DS/46NlvwA+tOTRrAZSCbfPaRwWfsZXfLHPKuRA78gvt
	j7HeIB/R+FDdQvXwNKc20Pdk+MEDEk7mOVB1fvsQM0v5FaEBcQYe1zKj5zl2dsR3oiUjLwBjsExl9
	gWYEYginmVdrPVvqwmz5NYYBeK733mXHrRxr/2URn7uCfCWLcgH7MkUty5GTxTIfMnN2DBFKASa8R
	hVYNwWNcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yTo-0006id-Nh; Fri, 21 Aug 2020 04:16:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yOP-00034Q-Uw; Fri, 21 Aug 2020 04:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=AMrM+qtiSMWCUDEPdNKF+1qvSLxCjHol2qvMYIhg0lM=; b=ZCBdFH323pqwRTZF+9FZf4yrcq
 QO2f907f3dvFgOSTiz5FAsf60lvzcBdrpkr9EO0TJ3HVS5j9U7+Vqb3biZ+ZGWGfeT46n9gz4o31G
 QAbLeMYf0gGs/zqDJQOBHGH7+aV4FRIXzSyQXgyeCdpsaiDUh79atJTDnqRSNz16YEYdzXLm3o5cs
 VFM2UhY8QUFPAujgZRoh0tmOQolifqTEwb5C6yPsXvs1p+WX9eLIqBjOy9a8Hd0D97SEM2Waiw8mI
 r2BH8pF7EW8oqKJCKL9hQc4dNh3MZldJUOcvPsSPPLDIuumO9aYAQxzuYXfbMSl5dNfpeZ4IqjGes
 pDbFXhYg==;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y8i-00015t-MG; Fri, 21 Aug 2020 03:54:59 +0000
Received: by mail-il1-f194.google.com with SMTP id k4so313358ilr.12;
 Thu, 20 Aug 2020 20:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AMrM+qtiSMWCUDEPdNKF+1qvSLxCjHol2qvMYIhg0lM=;
 b=LKl4TGrUftKsxWuJhXe1jzucTzpMqqTVLDbYOq6GScfnvqNudFq4kUV4clUpK46CB0
 3GPF/hswQD9BpBJcjMUBgpjCyQnj8OVVU1GhFn169TrMCbC0lMy+TnYDxcKockqLYfda
 KjJJoRLes7e48Nzg7cn+4NriY/E+H3DYcBBgiTDQPkzLn2q/Cs3x3qZkMegLr8Tx/zWv
 jD6UZVzzf+mWh7aXdqT7FTHhc0He51otp14YKIcFUj6UMK1HfdYewC/pBwrliOcyzy86
 PpUVTUgjzmMyT0/OljalCmeUK8odOY2VXKZO1qkyOay4zNYINj0VckEqOHBsuGjwiihO
 mNGw==
X-Gm-Message-State: AOAM531rNs0vnnXLy+Yzu0/MCq2O/sjiVxUFF52TiVXa4HU8XIYBboFn
 meP5agVp0C51Od6TWw78Ew==
X-Google-Smtp-Source: ABdhPJwv0XL0OXwwpZMdG6yLDwDy/CWX58TYS7rfLWejUwz7WvjOyk3gAOJ+/9+KkWqavfshCopL3A==
X-Received: by 2002:a92:b05:: with SMTP id b5mr1005648ilf.14.1597982089434;
 Thu, 20 Aug 2020 20:54:49 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:54:48 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 05/40] PCI: dwc: al: Use pci_ops for child config space
 accessors
Date: Thu, 20 Aug 2020 21:53:45 -0600
Message-Id: <20200821035420.380495-6-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045453_588813_A10AB29C 
X-CRM114-Status: GOOD (  14.85  )
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
index d57d4ee15848..59e33d3a8380 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -217,14 +217,15 @@ static inline void al_pcie_target_bus_set(struct al_pcie *pcie,
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
@@ -240,52 +241,14 @@ static void __iomem *al_pcie_conf_addr_map(struct al_pcie *pcie,
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
@@ -339,6 +302,8 @@ static int al_pcie_host_init(struct pcie_port *pp)
 	struct al_pcie *pcie = to_al_pcie(pci);
 	int rc;
 
+	pp->bridge->child_ops = &al_child_pci_ops;
+
 	rc = al_pcie_rev_id_get(pcie, &pcie->controller_rev_id);
 	if (rc)
 		return rc;
@@ -353,8 +318,6 @@ static int al_pcie_host_init(struct pcie_port *pp)
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
