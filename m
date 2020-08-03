Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78863C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:10:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 510D522BF3
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sJVngJy4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 510D522BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NYQ79hvj0hKMaQnweLRNoibEtj4xtszGs/OW1Rou4VM=; b=sJVngJy4vEIEeCC9ybgtKbGXR
	c9fnYlrQshM/SJMT5/mQNvvgINZLHYnx8QVTxmc0IYIIZbcmVrbjTkcoVvHz7A9iFTnQSMDyTYIhT
	YGs4tn7NT7F3VYq+btr3c9+RwphUwBNVejyNIg74ZiL9zn/f7xvaHpyODdKWEHlW7q7i0Z3Rg32+G
	YvpMCIA+u0gPc2u6WOhewXL+4+H5p6wq4EBi14d8A9ZZkKMwJnBZN8NjRbPfnFZAyrXaM6wOV8OhE
	iGr0vqFpUf0MtoZK2ZJC/e7OeG45T3a4QZghbXSub4MN2G3CoH4AS2JA92/B/Kj1afH0AbXo9EzQC
	BQ6pQkL9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hie-0004tH-LZ; Mon, 03 Aug 2020 21:10:04 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2hbN-0000X6-4Q; Mon, 03 Aug 2020 21:02:35 +0000
Received: by mail-il1-f195.google.com with SMTP id j9so28946729ilc.11;
 Mon, 03 Aug 2020 14:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L06mAH8VA/IGeAefhzubwBSDxwj6YYC6qe74xf8W5J0=;
 b=CZo5SrmgQ99QpMxBn6Y63+uuvo/mU/qRWiZGzEVYlwGIU6QF3qdgYtaCxkfn832T6i
 TX+2TwLPFtOOvoRfQ4TyQAA84sL70RX/Aa4/nm2y1GTp7kWkS1JO/OksCu2g7Ti2BR7C
 mYlW3GG4NIikTnFNFPlQxok5zczu3p/KzxCL8snoyFBK233GGbHWxohxPixssaHrVmRI
 SrMFsaGRnrZl81oM6GmBGJ9tQeaZmGCcZlR+8D9Bbin4WJJL2KESK12ddUD+tmK8G5QN
 2p8ylscfo1/BRWvo234Vh9ipjkGQa5J/VX+3unHQehOJopvD97TIbDcsY4q2O3YPQehI
 a9wA==
X-Gm-Message-State: AOAM532adFg5Hy3C6lgkC2U5yTCilhCn5h9JBLwEXKiemGP7CecFywfO
 mhCCG5nLOedaKe7s20dTpg==
X-Google-Smtp-Source: ABdhPJyaj3PFM+CFdCy6mV1i58kFekEGMqO1UowSfypEY5AIM4vaGx5gSsEY/QdqAhmg5ntfqWZ6EQ==
X-Received: by 2002:a05:6e02:ea2:: with SMTP id
 u2mr1371612ilj.140.1596488552257; 
 Mon, 03 Aug 2020 14:02:32 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:02:31 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 26/27] PCI: dwc: Remove hardcoded PCI_CAP_ID_EXP offset
Date: Mon,  3 Aug 2020 15:01:15 -0600
Message-Id: <20200803210116.3132633-27-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170233_993689_F9E33B61 
X-CRM114-Status: GOOD (  16.58  )
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

While the Designware controller appears to hard code the PCI_CAP_ID_EXP
capability register at 0x70, there's no need to hard code this in the
driver as it is discoverable.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Pratyush Anand <pratyush.anand@gmail.com>
Cc: linux-omap@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c     |  4 +---
 drivers/pci/controller/dwc/pci-keystone.c   | 11 +++++------
 drivers/pci/controller/dwc/pcie-spear13xx.c |  4 +---
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 6184ebc9392d..b4508c3ffe96 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -73,8 +73,6 @@
 #define	LINK_UP						BIT(16)
 #define	DRA7XX_CPU_TO_BUS_ADDR				0x0FFFFFFF
 
-#define EXP_CAP_ID_OFFSET				0x70
-
 #define	PCIECTRL_TI_CONF_INTX_ASSERT			0x0124
 #define	PCIECTRL_TI_CONF_INTX_DEASSERT			0x0128
 
@@ -142,7 +140,7 @@ static int dra7xx_pcie_establish_link(struct dw_pcie *pci)
 	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
 	struct device *dev = pci->dev;
 	u32 reg;
-	u32 exp_cap_off = EXP_CAP_ID_OFFSET;
+	u32 exp_cap_off = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 
 	if (dw_pcie_link_up(pci)) {
 		dev_err(dev, "link is already up\n");
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 205754a6bc3c..d2eca3afebdb 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -96,8 +96,6 @@
 #define LEG_EP				0x1
 #define RC				0x2
 
-#define EXP_CAP_ID_OFFSET		0x70
-
 #define KS_PCIE_SYSCLOCKOUTEN		BIT(0)
 
 #define AM654_PCIE_DEV_TYPE_MASK	0x3
@@ -1125,22 +1123,23 @@ static int ks_pcie_am654_set_mode(struct device *dev,
 static void ks_pcie_set_link_speed(struct dw_pcie *pci, int link_speed)
 {
 	u32 val;
+	u32 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 
 	dw_pcie_dbi_ro_wr_en(pci);
 
-	val = dw_pcie_readl_dbi(pci, EXP_CAP_ID_OFFSET + PCI_EXP_LNKCAP);
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 	if ((val & PCI_EXP_LNKCAP_SLS) != link_speed) {
 		val &= ~((u32)PCI_EXP_LNKCAP_SLS);
 		val |= link_speed;
-		dw_pcie_writel_dbi(pci, EXP_CAP_ID_OFFSET + PCI_EXP_LNKCAP,
+		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP,
 				   val);
 	}
 
-	val = dw_pcie_readl_dbi(pci, EXP_CAP_ID_OFFSET + PCI_EXP_LNKCTL2);
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCTL2);
 	if ((val & PCI_EXP_LNKCAP_SLS) != link_speed) {
 		val &= ~((u32)PCI_EXP_LNKCAP_SLS);
 		val |= link_speed;
-		dw_pcie_writel_dbi(pci, EXP_CAP_ID_OFFSET + PCI_EXP_LNKCTL2,
+		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCTL2,
 				   val);
 	}
 
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index 7d0cdfd8138b..a4303148e8b1 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -65,8 +65,6 @@ struct pcie_app_reg {
 /* CR6 */
 #define MSI_CTRL_INT				(1 << 26)
 
-#define EXP_CAP_ID_OFFSET			0x70
-
 #define to_spear13xx_pcie(x)	dev_get_drvdata((x)->dev)
 
 static int spear13xx_pcie_establish_link(struct spear13xx_pcie *spear13xx_pcie)
@@ -75,7 +73,7 @@ static int spear13xx_pcie_establish_link(struct spear13xx_pcie *spear13xx_pcie)
 	struct pcie_port *pp = &pci->pp;
 	struct pcie_app_reg *app_reg = spear13xx_pcie->app_base;
 	u32 val;
-	u32 exp_cap_off = EXP_CAP_ID_OFFSET;
+	u32 exp_cap_off = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 
 	if (dw_pcie_link_up(pci)) {
 		dev_err(pci->dev, "link already up\n");
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
