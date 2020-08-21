Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA11C433E3
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:01:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D51AB206B5
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pDN+Bsuu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D51AB206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NIeYCPONbo9Wom5LC/Hh1X7e/R+11PO6HSlWpnDuIH4=; b=pDN+BsuuQa+ufzF78/r+/iaK7
	Tmy8Rv6TvYhdzQELyOmFd0pExGRCPAOpDkyM47v7qZVH1MH1fPWpEIi7G1huIUNHfkzc7YzlSWk19
	V4UbY8kqrmXtGAlwbRl/SNmYIqaO0P477txr341Q7Ak6fFFEol1NYd/h1DEAQE09s4YvPH7RE+I6S
	4utf1P2aD6j1bxbOQdRu2TMBwa0+pfwCEMyqq0CsbR06LA/5MFpub8dRABuyy+8E2IwQLQPwwNPp0
	lPEs71mTWpiMZ+IWmIbgVhVYSFpNeCyHAAIJUpFjKssK7j9baUj2f8/+8BXu1j9NSeQKyCOTnVTAB
	ynGoGtRtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yEg-00075b-Nn; Fri, 21 Aug 2020 04:01:02 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9q-0004rb-GW; Fri, 21 Aug 2020 03:56:22 +0000
Received: by mail-il1-f196.google.com with SMTP id v2so341728ilq.4;
 Thu, 20 Aug 2020 20:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uu4tpLpSWlZgPNlTgALarmZOQ965fdEPoxw3GPbhQMY=;
 b=NTXWPKMr2ZuqKHAsbmm4rrmOxWdxL1h7VzxhEZkkpwLlZdJ46VWFPLryEJqqYdPdi9
 /+ccVviCYSsNtrfCR4dxNjrYFg4KgQBZvt6LYW24nxKUATU9G64kdLspNrEBD6Y392Ao
 r5YWwH+Ml/EsEr0udDrJEewQ5ILFV/7RScS1TWIuT6wIEGQJErQrSvvZyjkwhoz0NhFP
 5cdvlsqE8KhvXADoWKwPrVJ5O3FLPvO9WEFdYOigE/4rvPVps+JX+xL8Cypzne6Jftje
 tvvbq6uC1G2yHnRdSTbuuXYGAfUIFZOOAHuoMJrBRnp83d7niJGNdJ8G4YsDV73Ar9iW
 fd3w==
X-Gm-Message-State: AOAM5315BSo6J/fbRgUaAA22hBRK4NlyBQC0hZPTw2u9g6fwvuieBGcv
 7D1BJ0vRIye4zTI3z3Y1WA==
X-Google-Smtp-Source: ABdhPJzZNZOWZm6KD7ItWV2xaPG0DqxpYvEl6L0qi9rFaLP6Bl6ngDqvWZqxYrl0EKniHIjOc3szPw==
X-Received: by 2002:a92:b05:: with SMTP id b5mr1008672ilf.14.1597982160472;
 Thu, 20 Aug 2020 20:56:00 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:59 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 23/40] PCI: dwc: Add a 'num_lanes' field to struct dw_pcie
Date: Thu, 20 Aug 2020 21:54:03 -0600
Message-Id: <20200821035420.380495-24-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235602_695035_71A30513 
X-CRM114-Status: GOOD (  17.00  )
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

Add a 'num_lanes' field to allow drivers to provide a the number of lanes
if not in DT or using a custom DT property. A driver can provide a
non-zero value which is used if the DT doesn't have a 'num-lanes'
property.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 13 ++++++-------
 drivers/pci/controller/dwc/pcie-designware.h |  1 +
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index b723e0cc41fb..14ac87fa21a2 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -548,7 +548,6 @@ void dw_pcie_setup(struct dw_pcie *pci)
 {
 	int ret;
 	u32 val;
-	u32 lanes;
 	struct device *dev = pci->dev;
 	struct device_node *np = dev->of_node;
 
@@ -562,16 +561,16 @@ void dw_pcie_setup(struct dw_pcie *pci)
 		"enabled" : "disabled");
 
 
-	ret = of_property_read_u32(np, "num-lanes", &lanes);
-	if (ret) {
-		dev_dbg(pci->dev, "property num-lanes isn't found\n");
+	ret = of_property_read_u32(np, "num-lanes", &pci->num_lanes);
+	if (!pci->num_lanes) {
+		dev_dbg(pci->dev, "Using h/w default number of lanes\n");
 		return;
 	}
 
 	/* Set the number of lanes */
 	val = dw_pcie_readl_dbi(pci, PCIE_PORT_LINK_CONTROL);
 	val &= ~PORT_LINK_MODE_MASK;
-	switch (lanes) {
+	switch (pci->num_lanes) {
 	case 1:
 		val |= PORT_LINK_MODE_1_LANES;
 		break;
@@ -585,7 +584,7 @@ void dw_pcie_setup(struct dw_pcie *pci)
 		val |= PORT_LINK_MODE_8_LANES;
 		break;
 	default:
-		dev_err(pci->dev, "num-lanes %u: invalid value\n", lanes);
+		dev_err(pci->dev, "num-lanes %u: invalid value\n", pci->num_lanes);
 		return;
 	}
 	dw_pcie_writel_dbi(pci, PCIE_PORT_LINK_CONTROL, val);
@@ -593,7 +592,7 @@ void dw_pcie_setup(struct dw_pcie *pci)
 	/* Set link width speed control register */
 	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
 	val &= ~PORT_LOGIC_LINK_WIDTH_MASK;
-	switch (lanes) {
+	switch (pci->num_lanes) {
 	case 1:
 		val |= PORT_LOGIC_LINK_WIDTH_1_LANES;
 		break;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 7cc322f8596c..43d3729101c3 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -246,6 +246,7 @@ struct dw_pcie {
 	struct dw_pcie_ep	ep;
 	const struct dw_pcie_ops *ops;
 	unsigned int		version;
+	int			num_lanes;
 };
 
 #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
