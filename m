Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEB5C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:01:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A703720855
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AOtCXVeo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A703720855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZaYZGXy3n0BUnqFPdYyg00aa6MoBJemnoY9scZ5LMM4=; b=AOtCXVeoM7+bl9JuRC+Pljisp
	YOvQBv1TGSJYEEN6//PtoZ2EYjQZuNuyhApAXjBNldJ3tOkDonDeXfpFZ+gwmxWjsCDZ+8m12Tq1h
	zipdOpksQosWH4KKBgWVd3LhQSDH099CIdDFCmLhffeblnQLZO7rygzwu8uiBl3HaFytcuBeANnMT
	t61PJdX8+bncUgIu19vB7MXy5BA7uSY6ALvYdZW4R8RDinfcX34TeOm6wpmTNvVpO4+UdDdggnCu5
	9Q5yuiLQFRRxQqcGO6zLe7+eieDKtYMHPd0Ln3B5ovsDWWor88NeqFo04b6lD38z95JTTB1qhsb3k
	O2ogOHIww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yEp-0007BY-3p; Fri, 21 Aug 2020 04:01:11 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yA9-0004zT-3O; Fri, 21 Aug 2020 03:56:36 +0000
Received: by mail-io1-f66.google.com with SMTP id b16so484104ioj.4;
 Thu, 20 Aug 2020 20:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QjZFXqjWXEUTZiaAn5hYHKiqo62LdmVrJplZ+1XIJyE=;
 b=baRGIHMd7v0hpgnzHl6FvmOuwFRGbigLVuT4kZiqSYJ22wEf9uMfFCsnce5o+xoLFc
 lb7WTX4PejYPLh94FJRBIROifpx2+RdcSiDZ/WrAF6BrCaXP/X8lbqzQVKhvX3WPZjB4
 vYp1ZHMczG+AtXakbNypXA6+CgMgBy4wdCB1X4nzAs6Yq2+X/JvzfyVjGTEkgx2IJN14
 XXqKMK4y5RTvbSlrxZncslfdiVVDsdmog5Ars6g24RdC84/4bchf8nwD55SMsEDg8tXp
 4zrFDmNONfUERq4Q8rnzhCzeHYsAQIoMCqH2QCHyXNTSzukjM0709eahn9Cp8fjA1Mee
 bJww==
X-Gm-Message-State: AOAM532/VSEmXg23IZJpMND97ekfupLyNB2bQAIOrnWxypu68GWQpT5U
 /2J+R5XfeX7mgdrFH5OIhA==
X-Google-Smtp-Source: ABdhPJyQ7RVU1iN+BVye7DF0YMFH38k7wZRJyOkmHLo92bOUBV/bqZiSaIYoT6VXndxQVqniWCKMdw==
X-Received: by 2002:a05:6638:e90:: with SMTP id
 p16mr976888jas.26.1597982178007; 
 Thu, 20 Aug 2020 20:56:18 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:17 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 27/40] PCI: dwc/meson: Rework PCI config and DW port logic
 register accesses
Date: Thu, 20 Aug 2020 21:54:07 -0600
Message-Id: <20200821035420.380495-28-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235621_440445_985BA9CE 
X-CRM114-Status: GOOD (  18.86  )
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

The meson 'elbi' registers are just the Designware 'dbi' space and all
the registers accessed are either standard PCI config space or DWC port
logic registers. Convert the accesses to use the common defines and
register accessors.

Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-meson.c | 76 +++++++++-----------------
 1 file changed, 25 insertions(+), 51 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index cca423e834e8..33deb290c4e7 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -22,11 +22,7 @@
 
 #define to_meson_pcie(x) dev_get_drvdata((x)->dev)
 
-#define PCIE_CAP_OFFSET			0x70
-#define PCIE_DEV_CTRL_DEV_STUS		(PCIE_CAP_OFFSET + 0x08)
-#define PCIE_CAP_MAX_PAYLOAD_MASK	GENMASK(7, 5)
 #define PCIE_CAP_MAX_PAYLOAD_SIZE(x)	((x) << 5)
-#define PCIE_CAP_MAX_READ_REQ_MASK	GENMASK(14, 12)
 #define PCIE_CAP_MAX_READ_REQ_SIZE(x)	((x) << 12)
 
 /* PCIe specific config registers */
@@ -56,11 +52,6 @@ enum pcie_data_rate {
 	PCIE_GEN4
 };
 
-struct meson_pcie_mem_res {
-	void __iomem *elbi_base;
-	void __iomem *cfg_base;
-};
-
 struct meson_pcie_clk_res {
 	struct clk *clk;
 	struct clk *port_clk;
@@ -74,7 +65,7 @@ struct meson_pcie_rc_reset {
 
 struct meson_pcie {
 	struct dw_pcie pci;
-	struct meson_pcie_mem_res mem_res;
+	void __iomem *cfg_base;
 	struct meson_pcie_clk_res clk_res;
 	struct meson_pcie_rc_reset mrst;
 	struct gpio_desc *reset_gpio;
@@ -113,28 +104,18 @@ static int meson_pcie_get_resets(struct meson_pcie *mp)
 	return 0;
 }
 
-static void __iomem *meson_pcie_get_mem(struct platform_device *pdev,
-					struct meson_pcie *mp,
-					const char *id)
-{
-	struct device *dev = mp->pci.dev;
-	struct resource *res;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, id);
-
-	return devm_ioremap_resource(dev, res);
-}
-
 static int meson_pcie_get_mems(struct platform_device *pdev,
 			       struct meson_pcie *mp)
 {
-	mp->mem_res.elbi_base = meson_pcie_get_mem(pdev, mp, "elbi");
-	if (IS_ERR(mp->mem_res.elbi_base))
-		return PTR_ERR(mp->mem_res.elbi_base);
+	struct dw_pcie *pci = &mp->pci;
+
+	pci->dbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
+	if (IS_ERR(pci->dbi_base))
+		return PTR_ERR(pci->dbi_base);
 
-	mp->mem_res.cfg_base = meson_pcie_get_mem(pdev, mp, "cfg");
-	if (IS_ERR(mp->mem_res.cfg_base))
-		return PTR_ERR(mp->mem_res.cfg_base);
+	mp->cfg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(mp->cfg_base))
+		return PTR_ERR(mp->cfg_base);
 
 	return 0;
 }
@@ -232,24 +213,14 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
 	return 0;
 }
 
-static inline void meson_elb_writel(struct meson_pcie *mp, u32 val, u32 reg)
-{
-	writel(val, mp->mem_res.elbi_base + reg);
-}
-
-static inline u32 meson_elb_readl(struct meson_pcie *mp, u32 reg)
-{
-	return readl(mp->mem_res.elbi_base + reg);
-}
-
 static inline u32 meson_cfg_readl(struct meson_pcie *mp, u32 reg)
 {
-	return readl(mp->mem_res.cfg_base + reg);
+	return readl(mp->cfg_base + reg);
 }
 
 static inline void meson_cfg_writel(struct meson_pcie *mp, u32 val, u32 reg)
 {
-	writel(val, mp->mem_res.cfg_base + reg);
+	writel(val, mp->cfg_base + reg);
 }
 
 static void meson_pcie_assert_reset(struct meson_pcie *mp)
@@ -287,30 +258,34 @@ static int meson_size_to_payload(struct meson_pcie *mp, int size)
 
 static void meson_set_max_payload(struct meson_pcie *mp, int size)
 {
+	struct dw_pcie *pci = &mp->pci;
 	u32 val;
+	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	int max_payload_size = meson_size_to_payload(mp, size);
 
-	val = meson_elb_readl(mp, PCIE_DEV_CTRL_DEV_STUS);
-	val &= ~PCIE_CAP_MAX_PAYLOAD_MASK;
-	meson_elb_writel(mp, val, PCIE_DEV_CTRL_DEV_STUS);
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
+	val &= ~PCI_EXP_DEVCTL_PAYLOAD;
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
 
-	val = meson_elb_readl(mp, PCIE_DEV_CTRL_DEV_STUS);
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
 	val |= PCIE_CAP_MAX_PAYLOAD_SIZE(max_payload_size);
-	meson_elb_writel(mp, val, PCIE_DEV_CTRL_DEV_STUS);
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
 }
 
 static void meson_set_max_rd_req_size(struct meson_pcie *mp, int size)
 {
+	struct dw_pcie *pci = &mp->pci;
 	u32 val;
+	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	int max_rd_req_size = meson_size_to_payload(mp, size);
 
-	val = meson_elb_readl(mp, PCIE_DEV_CTRL_DEV_STUS);
-	val &= ~PCIE_CAP_MAX_READ_REQ_MASK;
-	meson_elb_writel(mp, val, PCIE_DEV_CTRL_DEV_STUS);
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
+	val &= ~PCI_EXP_DEVCTL_READRQ;
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
 
-	val = meson_elb_readl(mp, PCIE_DEV_CTRL_DEV_STUS);
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
 	val |= PCIE_CAP_MAX_READ_REQ_SIZE(max_rd_req_size);
-	meson_elb_writel(mp, val, PCIE_DEV_CTRL_DEV_STUS);
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, val);
 }
 
 static int meson_pcie_establish_link(struct meson_pcie *mp)
@@ -436,7 +411,6 @@ static int meson_add_pcie_port(struct meson_pcie *mp,
 	}
 
 	pp->ops = &meson_pcie_host_ops;
-	pci->dbi_base = mp->mem_res.elbi_base;
 
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
