Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F13C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:09:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B7022C9F
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:09:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="igtX/xZ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B7022C9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ppHNhTHPhGiPJxpVAqoTvDIRHaIGnvJeRsySdEasrO4=; b=igtX/xZ+Ds/V1LUUGOchf1JpI
	WwG+yadmKMAdVIPNeTIX2coBki4cfZcu7cy8zSKYzbl9UzETJYIOyTXRWEoiXd5IPDXsLxt/Roucv
	Xzzb2hvBvX747SOgcvl47FLC5QDL7h0fQ5AOeNxUMXkiDIbFiayIR7KNp1AbURL9lTJRrDfG7DHdK
	kzi/+b8N6+yGdMxTnYHxxyhPU9DkQTxO5JXLgR+f9ZfP+9glWI6LaEydQSVBqBo4u3f0WsyAflww6
	DT3REo9qSCQBPXouxWWZeTW2l4RNYkYLJu0UulkwKH3Rxzulq/6Dfr7MJsJrrcu4q56etAELPHguj
	aoxpHuBiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hhS-0004Gm-KQ; Mon, 03 Aug 2020 21:08:50 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2hbF-0000TL-LZ; Mon, 03 Aug 2020 21:02:26 +0000
Received: by mail-io1-f66.google.com with SMTP id k23so39951061iom.10;
 Mon, 03 Aug 2020 14:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PM8zrR6BXOfDRWMk7IOmZATjTEqDEPOnq1HMPd0fm+I=;
 b=Hs7YkLU9+VHhsxR9yzPhvc529KqQaX5ucT5PFIwOcoeant6KwZVF3v0Zu9G6VkUJx+
 hTWjOWxBECWtaH7Lej6g98GH9aiBfwEqGoFe/i75i/BkqsRyg0rSzOAw0El1dZzzs4Pe
 zVJVfX3MX4w63lhmXz+Pb+OmK0dlSKQkr2gapILbq6f4VZlMoRkOFel0bRgtIqwD8Q0q
 p+prK+d3B057VBfnpRbWU69u0kfHmsiyMBubkTn0L1oAImbJfGdxCND6VIDl9Z1zVueP
 ltL9XTKCQzER/O5Ubc5pHWQubd9NqAyfd3rwO90zQjJY/zz8m8kmKH6TiiLb5UUnfBrp
 iLnQ==
X-Gm-Message-State: AOAM533HAXfT8RI3yI0J5Ia6IcWndeQV5zdigVIkgPDc0nxv9EwipjLY
 ioN6vfXboqMiYH0RppZvhQ==
X-Google-Smtp-Source: ABdhPJw96k8lyNK11/NlxPpmp4xlor/b3WWjFcRtY1Ld3dnCdpoOVounuLgtCLR+q/EA7hpBdE6Lnw==
X-Received: by 2002:a05:6638:1690:: with SMTP id
 f16mr1826708jat.91.1596488544963; 
 Mon, 03 Aug 2020 14:02:24 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:02:24 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 24/27] PCI: dwc/meson: Rework PCI config and DW port logic
 register accesses
Date: Mon,  3 Aug 2020 15:01:13 -0600
Message-Id: <20200803210116.3132633-25-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170225_762776_E3FF91B2 
X-CRM114-Status: GOOD (  19.80  )
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
Cc: linux-pci@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-meson.c       | 113 +++++++------------
 drivers/pci/controller/dwc/pcie-designware.h |   1 +
 2 files changed, 39 insertions(+), 75 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index d1cfc65f0a69..734aace62173 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -22,23 +22,7 @@
 
 #define to_meson_pcie(x) dev_get_drvdata((x)->dev)
 
-/* External local bus interface registers */
-#define PLR_OFFSET			0x700
-#define PCIE_PORT_LINK_CTRL_OFF		(PLR_OFFSET + 0x10)
-#define FAST_LINK_MODE			BIT(7)
-#define LINK_CAPABLE_MASK		GENMASK(21, 16)
-#define LINK_CAPABLE_X1			BIT(16)
-
-#define PCIE_GEN2_CTRL_OFF		(PLR_OFFSET + 0x10c)
-#define NUM_OF_LANES_MASK		GENMASK(12, 8)
-#define NUM_OF_LANES_X1			BIT(8)
-#define DIRECT_SPEED_CHANGE		BIT(17)
-
-#define PCIE_CAP_OFFSET			0x70
-#define PCIE_DEV_CTRL_DEV_STUS		(PCIE_CAP_OFFSET + 0x08)
-#define PCIE_CAP_MAX_PAYLOAD_MASK	GENMASK(7, 5)
 #define PCIE_CAP_MAX_PAYLOAD_SIZE(x)	((x) << 5)
-#define PCIE_CAP_MAX_READ_REQ_MASK	GENMASK(14, 12)
 #define PCIE_CAP_MAX_READ_REQ_SIZE(x)	((x) << 12)
 
 /* PCIe specific config registers */
@@ -68,11 +52,6 @@ enum pcie_data_rate {
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
@@ -86,7 +65,7 @@ struct meson_pcie_rc_reset {
 
 struct meson_pcie {
 	struct dw_pcie pci;
-	struct meson_pcie_mem_res mem_res;
+	void __iomem *cfg_base;
 	struct meson_pcie_clk_res clk_res;
 	struct meson_pcie_rc_reset mrst;
 	struct gpio_desc *reset_gpio;
@@ -125,28 +104,18 @@ static int meson_pcie_get_resets(struct meson_pcie *mp)
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
 
-	mp->mem_res.cfg_base = meson_pcie_get_mem(pdev, mp, "cfg");
-	if (IS_ERR(mp->mem_res.cfg_base))
-		return PTR_ERR(mp->mem_res.cfg_base);
+	pci->dbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
+	if (IS_ERR(pci->dbi_base))
+		return PTR_ERR(pci->dbi_base);
+
+	mp->cfg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(mp->cfg_base))
+		return PTR_ERR(mp->cfg_base);
 
 	return 0;
 }
@@ -244,24 +213,14 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
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
@@ -273,27 +232,28 @@ static void meson_pcie_assert_reset(struct meson_pcie *mp)
 
 static void meson_pcie_init_dw(struct meson_pcie *mp)
 {
+	struct dw_pcie *pci = &mp->pci;
 	u32 val;
 
 	val = meson_cfg_readl(mp, PCIE_CFG0);
 	val |= APP_LTSSM_ENABLE;
 	meson_cfg_writel(mp, val, PCIE_CFG0);
 
-	val = meson_elb_readl(mp, PCIE_PORT_LINK_CTRL_OFF);
-	val &= ~(LINK_CAPABLE_MASK | FAST_LINK_MODE);
-	meson_elb_writel(mp, val, PCIE_PORT_LINK_CTRL_OFF);
+	val = dw_pcie_readl_dbi(pci, PCIE_PORT_LINK_CONTROL);
+	val &= ~(PORT_LINK_MODE_MASK | PORT_LINK_FAST_LINK_MODE);
+	dw_pcie_writel_dbi(pci, PCIE_PORT_LINK_CONTROL, val);
 
-	val = meson_elb_readl(mp, PCIE_PORT_LINK_CTRL_OFF);
-	val |= LINK_CAPABLE_X1;
-	meson_elb_writel(mp, val, PCIE_PORT_LINK_CTRL_OFF);
+	val = dw_pcie_readl_dbi(pci, PCIE_PORT_LINK_CONTROL);
+	val |= PORT_LINK_MODE_1_LANES;
+	dw_pcie_writel_dbi(pci, PCIE_PORT_LINK_CONTROL, val);
 
-	val = meson_elb_readl(mp, PCIE_GEN2_CTRL_OFF);
-	val &= ~NUM_OF_LANES_MASK;
-	meson_elb_writel(mp, val, PCIE_GEN2_CTRL_OFF);
+	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
+	val &= ~PORT_LOGIC_LINK_WIDTH_MASK;
+	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
 
-	val = meson_elb_readl(mp, PCIE_GEN2_CTRL_OFF);
-	val |= NUM_OF_LANES_X1 | DIRECT_SPEED_CHANGE;
-	meson_elb_writel(mp, val, PCIE_GEN2_CTRL_OFF);
+	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
+	val |= PORT_LOGIC_LINK_WIDTH_1_LANES | PORT_LOGIC_SPEED_CHANGE;
+	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
 }
 
 static int meson_size_to_payload(struct meson_pcie *mp, int size)
@@ -315,30 +275,34 @@ static int meson_size_to_payload(struct meson_pcie *mp, int size)
 
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
@@ -466,7 +430,6 @@ static int meson_add_pcie_port(struct meson_pcie *mp,
 	}
 
 	pp->ops = &meson_pcie_host_ops;
-	pci->dbi_base = mp->mem_res.elbi_base;
 
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 2db6f52dfe81..b18a9a5f48d2 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -36,6 +36,7 @@
 
 #define PCIE_PORT_LINK_CONTROL		0x710
 #define PORT_LINK_DLL_LINK_EN		BIT(5)
+#define PORT_LINK_FAST_LINK_MODE	BIT(7)
 #define PORT_LINK_MODE_MASK		GENMASK(21, 16)
 #define PORT_LINK_MODE(n)		FIELD_PREP(PORT_LINK_MODE_MASK, n)
 #define PORT_LINK_MODE_1_LANES		PORT_LINK_MODE(0x1)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
