Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57526C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 03:59:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2112820714
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 03:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PIqL6RR4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2112820714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HB3inG6OLapW+euk9Pfv4WBCi4SNbx7NcQKtxsZxvpU=; b=PIqL6RR40PPrbU0WNdpYdKPP0
	YiG1u6grWaltRdlDQizDKqGkR0B0Hvu5xY1HiNbJ6eGxTsfGpshYvLNtLAiNS9H0fzhE+WVncnpKI
	Ku51+KfaDauGSteaqMMgaRsr4IMlqjrMFMUHfPkopk4B2iWyzkQDreD4++rZRYAWNSLIqlYamc0lm
	OafdvFXZerCHWFuRuxRSGG/8ns2RS5/dtQvF73614KzmFMG5MrhOOtOhWQByiCHtteV3+/7tvGhBU
	79Rd78svLG/MSIlM3gsRprp1ojuPsmzt5dMzsCisepLyg+GhVUewmH/g2IiWkgAW7tdGM6fxx8cm+
	tK07hicVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yCv-0006DL-1Z; Fri, 21 Aug 2020 03:59:13 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y99-0004b9-DI; Fri, 21 Aug 2020 03:55:40 +0000
Received: by mail-io1-f67.google.com with SMTP id g13so464654ioo.9;
 Thu, 20 Aug 2020 20:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7oe9LLB2O2qB8amIUwgNF8kLMAkuXQasFfOXSkrgGMU=;
 b=SpMpjfiWeXiyKavD9XlbMZ0zruwxUCaMocDMPUb88rgi/uRwPUBLtmK5TMBECSINQ1
 qeaEPXmYW4BtdhS6yTQIkmvr6jf2boXReHdELsRB/BHxrHYwgIj/dblKAjzByowUoD72
 FddjpeHQgKjxelT3EfVqAQaYVUNHprMQBnKEd/PpxhWrXBEj6rMhF50SPMvoiM6yEbuR
 gD5+dODKUmj8w3AWeptWs8SoFkAZnEp1gjW5kLukIoQpMKTWjXM06w1XnSdXwF9A8Z7r
 A5tddP41ic+l57dzZ9eWu0L3o0ROWlT+woFJrhanMALHDvFT8x6Nxbf36YZaUySM1GQm
 twRA==
X-Gm-Message-State: AOAM531fTz8jQqqKt4rBFPavj/lCGweKa6fPg1OTdi/EB7k5Fs7pFaEp
 ZX5YG7y+fVkAsNrIgeNiWg==
X-Google-Smtp-Source: ABdhPJygnWxXYKbB1eQHu7GGV718XGpKfRlbYVFwHsWaFGJAWtGyZHG0umEXXUD8qfphr3hVV6FIrA==
X-Received: by 2002:a02:454:: with SMTP id 81mr965925jab.142.1597982116863;
 Thu, 20 Aug 2020 20:55:16 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:16 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 12/40] PCI: dwc: Remove dwc specific config accessor ops
Date: Thu, 20 Aug 2020 21:53:52 -0600
Message-Id: <20200821035420.380495-13-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235519_809360_DDB7D4B5 
X-CRM114-Status: GOOD (  13.80  )
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

Now that all the drivers needing custom config accessors have been
converted to define their own pci_ops, we can remove the DWC specific
function callbacks {rd,wr}_{own,other}_conf.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 14 --------------
 drivers/pci/controller/dwc/pcie-designware.h      |  6 ------
 2 files changed, 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index e87edce9b8da..33e632a24466 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -26,9 +26,6 @@ static int dw_pcie_rd_own_conf(struct pcie_port *pp, int where, int size,
 {
 	struct dw_pcie *pci;
 
-	if (pp->ops->rd_own_conf)
-		return pp->ops->rd_own_conf(pp, where, size, val);
-
 	pci = to_dw_pcie_from_pp(pp);
 	return dw_pcie_read(pci->dbi_base + where, size, val);
 }
@@ -38,9 +35,6 @@ static int dw_pcie_wr_own_conf(struct pcie_port *pp, int where, int size,
 {
 	struct dw_pcie *pci;
 
-	if (pp->ops->wr_own_conf)
-		return pp->ops->wr_own_conf(pp, where, size, val);
-
 	pci = to_dw_pcie_from_pp(pp);
 	return dw_pcie_write(pci->dbi_base + where, size, val);
 }
@@ -537,10 +531,6 @@ static int dw_pcie_access_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 static int dw_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 				 u32 devfn, int where, int size, u32 *val)
 {
-	if (pp->ops->rd_other_conf)
-		return pp->ops->rd_other_conf(pp, bus, devfn, where,
-					      size, val);
-
 	return dw_pcie_access_other_conf(pp, bus, devfn, where, size, val,
 					 false);
 }
@@ -548,10 +538,6 @@ static int dw_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 static int dw_pcie_wr_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 				 u32 devfn, int where, int size, u32 val)
 {
-	if (pp->ops->wr_other_conf)
-		return pp->ops->wr_other_conf(pp, bus, devfn, where,
-					      size, val);
-
 	return dw_pcie_access_other_conf(pp, bus, devfn, where, size, &val,
 					 true);
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index a9d805b28c2a..4ed59b051b2b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -160,12 +160,6 @@ enum dw_pcie_device_mode {
 };
 
 struct dw_pcie_host_ops {
-	int (*rd_own_conf)(struct pcie_port *pp, int where, int size, u32 *val);
-	int (*wr_own_conf)(struct pcie_port *pp, int where, int size, u32 val);
-	int (*rd_other_conf)(struct pcie_port *pp, struct pci_bus *bus,
-			     unsigned int devfn, int where, int size, u32 *val);
-	int (*wr_other_conf)(struct pcie_port *pp, struct pci_bus *bus,
-			     unsigned int devfn, int where, int size, u32 val);
 	int (*host_init)(struct pcie_port *pp);
 	void (*scan_bus)(struct pcie_port *pp);
 	void (*set_num_vectors)(struct pcie_port *pp);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
