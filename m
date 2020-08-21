Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3EBC433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:11:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE32206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:11:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXE/gu4T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PjSTpwWo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAE32206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+EdMGZox7xleFAhHPsx8y1+Jn6DL4OHmVtrVNv8Cudg=; b=FXE/gu4TayiXp902oJ+diW33x
	BZjM3FEqVbB7cIi8BcyAiuN42GuwimAoeOgCAg+VmVpZUVHDpBX4ay2rIRIwxkQ4Q1VANhNeAg7h9
	1CCSwpcV6c1NgJrqSfgKXNL+UhsSpnEEaD86i6Bl3518HKvBbZqPPOTBcluptGHn66mVKSPi81xrQ
	1eKerpZFRcmgwIwAqXs5Evmy/JntZuRcvcXW4cy8jssku2275OXjOqqnd5VxZwhGclzBhm47usk7A
	nxvhRe/+OP6vAbqOS/BypnFY2WN9qeh167y20Y0M1+iVyXwveJAHY5VtzgQOjOWASD4QIcBZZmhaC
	fGxeupfow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yOy-0003lR-Ry; Fri, 21 Aug 2020 04:11:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yO4-00034Q-82; Fri, 21 Aug 2020 04:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rxlIWP5s8Q0eZi3EvYbo0258HR6L8rBsGw9E+WBQLQE=; b=PjSTpwWoeYw0c7FypY5nV+xJdb
 nQCyRyMvrXFX0Cd641zweNGlLuLtdQjhwXE5gWx6RaqHcBa+fqw2STIN+kNs1fM5VzSMrNDVF0Y1i
 Nu2CsthPm42OyPaVDKWTFNyOmGCEv5zV2i9KDMCuyuJmTDNhQ25J/oVMjPiXD8avJ3S4jbjfLcgcD
 x+JtqoDaRb9ny2blRD38K0HbFjEjbV+mgCbUNM/sKn0I+0JIcQyyDkMA/BiRB4GAta2+svSJneW/D
 fpmuEJenbXgpgK7JkP0gBgmEnGqhYGx8iIHjhHMJgDufCgBGXp5CM8BLUSJxgGOwATZS2iViSR2EM
 XsYmGDJg==;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAK-0001NX-ST; Fri, 21 Aug 2020 03:56:35 +0000
Received: by mail-il1-f194.google.com with SMTP id 77so339260ilc.5;
 Thu, 20 Aug 2020 20:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rxlIWP5s8Q0eZi3EvYbo0258HR6L8rBsGw9E+WBQLQE=;
 b=Ul/5AWAwN3UFewCqq14UoYp5oafvy/ZCXM5j2S7BNkSutw6RO6ZDa4sqw5dR+BHZeA
 NO8uejGEtNlfr80bQ3o0oDw1WTluxke2z0LJr4nCBqYdvEFMPLMf0C5mVeHJRaEaHfgJ
 L8VOwZuLjPQO2SeNCACw6hAzicg9LZgHyORXi6kPDi96dDhQuV6WenEfkIG94PXPimuK
 tXs/42qdLOxED3eVLi057UfVkCo0x6tcktm3b/Pay5VYWlHciD5umN6Bfr2qhlyUZgQD
 tunGgEX/c620jUsq9z05LSeM7mwAbZf3uhEW9GnBrTTxyHQ/6ArXgGYzcrzkvGlYpg6M
 BHqg==
X-Gm-Message-State: AOAM533fWV38ZnL8tz14h/4QEQDT5yRdtUhJcOExSPKiRvRWOeJchN2k
 Xhj8L/mgJmIA7iNvvCPNAQ==
X-Google-Smtp-Source: ABdhPJwbGI9aHlju4p44HOztNYkvAORMbfv59GH0OOd/zH7h5ig35dQDgCJgHsilkLRRWaU7TgypFw==
X-Received: by 2002:a92:79ca:: with SMTP id u193mr950065ilc.185.1597982191043; 
 Thu, 20 Aug 2020 20:56:31 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:30 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 31/40] PCI: dwc/tegra: Use common Designware port logic
 register definitions
Date: Thu, 20 Aug 2020 21:54:11 -0600
Message-Id: <20200821035420.380495-32-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045633_276196_51F44763 
X-CRM114-Status: GOOD (  13.22  )
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

The Tegra driver has its own defines for common Designware Port Logic
registers. Convert it to use the standard register definitions.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware.h |  6 +++
 drivers/pci/controller/dwc/pcie-tegra194.c   | 56 ++++++++------------
 2 files changed, 28 insertions(+), 34 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 40c3766df096..73c119437fee 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -32,7 +32,13 @@
 /* Synopsys-specific PCIe configuration registers */
 #define PCIE_PORT_AFR			0x70C
 #define PORT_AFR_N_FTS_MASK		GENMASK(15, 8)
+#define PORT_AFR_N_FTS(n)		FIELD_PREP(PORT_AFR_N_FTS_MASK, n)
 #define PORT_AFR_CC_N_FTS_MASK		GENMASK(23, 16)
+#define PORT_AFR_ENTER_ASPM		BIT(30)
+#define PORT_AFR_L0S_ENTRANCE_LAT_SHIFT	24
+#define PORT_AFR_L0S_ENTRANCE_LAT_MASK	GENMASK(26, 24)
+#define PORT_AFR_L1_ENTRANCE_LAT_SHIFT	27
+#define PORT_AFR_L1_ENTRANCE_LAT_MASK	GENMASK(29, 27)
 
 #define PCIE_PORT_LINK_CONTROL		0x710
 #define PORT_LINK_DLL_LINK_EN		BIT(5)
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index a5dce56b3b7a..f121ac25d418 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -183,19 +183,7 @@
 #define EVENT_COUNTER_GROUP_SEL_SHIFT	24
 #define EVENT_COUNTER_GROUP_5		0x5
 
-#define PORT_LOGIC_ACK_F_ASPM_CTRL			0x70C
-#define ENTER_ASPM					BIT(30)
-#define L0S_ENTRANCE_LAT_SHIFT				24
-#define L0S_ENTRANCE_LAT_MASK				GENMASK(26, 24)
-#define L1_ENTRANCE_LAT_SHIFT				27
-#define L1_ENTRANCE_LAT_MASK				GENMASK(29, 27)
-#define N_FTS_SHIFT					8
-#define N_FTS_MASK					GENMASK(7, 0)
 #define N_FTS_VAL					52
-
-#define PORT_LOGIC_GEN2_CTRL				0x80C
-#define PORT_LOGIC_GEN2_CTRL_DIRECT_SPEED_CHANGE	BIT(17)
-#define FTS_MASK					GENMASK(7, 0)
 #define FTS_VAL						52
 
 #define PORT_LOGIC_MSI_CTRL_INT_0_EN		0x828
@@ -401,9 +389,9 @@ static irqreturn_t tegra_pcie_rp_irq_handler(int irq, void *arg)
 			val |= APPL_CAR_RESET_OVRD_CYA_OVERRIDE_CORE_RST_N;
 			appl_writel(pcie, val, APPL_CAR_RESET_OVRD);
 
-			val = dw_pcie_readl_dbi(pci, PORT_LOGIC_GEN2_CTRL);
-			val |= PORT_LOGIC_GEN2_CTRL_DIRECT_SPEED_CHANGE;
-			dw_pcie_writel_dbi(pci, PORT_LOGIC_GEN2_CTRL, val);
+			val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
+			val |= PORT_LOGIC_SPEED_CHANGE;
+			dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
 		}
 	}
 
@@ -694,11 +682,11 @@ static void init_host_aspm(struct tegra_pcie_dw *pcie)
 	dw_pcie_writel_dbi(pci, pcie->cfg_link_cap_l1sub, val);
 
 	/* Program L0s and L1 entrance latencies */
-	val = dw_pcie_readl_dbi(pci, PORT_LOGIC_ACK_F_ASPM_CTRL);
-	val &= ~L0S_ENTRANCE_LAT_MASK;
-	val |= (pcie->aspm_l0s_enter_lat << L0S_ENTRANCE_LAT_SHIFT);
-	val |= ENTER_ASPM;
-	dw_pcie_writel_dbi(pci, PORT_LOGIC_ACK_F_ASPM_CTRL, val);
+	val = dw_pcie_readl_dbi(pci, PCIE_PORT_AFR);
+	val &= ~PORT_AFR_L0S_ENTRANCE_LAT_MASK;
+	val |= (pcie->aspm_l0s_enter_lat << PORT_AFR_L0S_ENTRANCE_LAT_SHIFT);
+	val |= PORT_AFR_ENTER_ASPM;
+	dw_pcie_writel_dbi(pci, PCIE_PORT_AFR, val);
 }
 
 static int init_debugfs(struct tegra_pcie_dw *pcie)
@@ -895,15 +883,15 @@ static void tegra_pcie_prepare_host(struct pcie_port *pp)
 	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_0, 0);
 
 	/* Configure FTS */
-	val = dw_pcie_readl_dbi(pci, PORT_LOGIC_ACK_F_ASPM_CTRL);
-	val &= ~(N_FTS_MASK << N_FTS_SHIFT);
-	val |= N_FTS_VAL << N_FTS_SHIFT;
-	dw_pcie_writel_dbi(pci, PORT_LOGIC_ACK_F_ASPM_CTRL, val);
+	val = dw_pcie_readl_dbi(pci, PCIE_PORT_AFR);
+	val &= ~PORT_AFR_N_FTS_MASK;
+	val |= PORT_AFR_N_FTS(N_FTS_VAL);
+	dw_pcie_writel_dbi(pci, PCIE_PORT_AFR, val);
 
-	val = dw_pcie_readl_dbi(pci, PORT_LOGIC_GEN2_CTRL);
-	val &= ~FTS_MASK;
+	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
+	val &= ~PORT_LOGIC_N_FTS_MASK;
 	val |= FTS_VAL;
-	dw_pcie_writel_dbi(pci, PORT_LOGIC_GEN2_CTRL, val);
+	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
 
 	/* Enable as 0xFFFF0001 response for CRS */
 	val = dw_pcie_readl_dbi(pci, PORT_LOGIC_AMBA_ERROR_RESPONSE_DEFAULT);
@@ -1820,15 +1808,15 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 	dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
 
 	/* Configure N_FTS & FTS */
-	val = dw_pcie_readl_dbi(pci, PORT_LOGIC_ACK_F_ASPM_CTRL);
-	val &= ~(N_FTS_MASK << N_FTS_SHIFT);
-	val |= N_FTS_VAL << N_FTS_SHIFT;
-	dw_pcie_writel_dbi(pci, PORT_LOGIC_ACK_F_ASPM_CTRL, val);
+	val = dw_pcie_readl_dbi(pci, PCIE_PORT_AFR);
+	val &= ~PORT_AFR_N_FTS_MASK;
+	val |= PORT_AFR_N_FTS(FTS_VAL);
+	dw_pcie_writel_dbi(pci, PCIE_PORT_AFR, val);
 
-	val = dw_pcie_readl_dbi(pci, PORT_LOGIC_GEN2_CTRL);
-	val &= ~FTS_MASK;
+	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
+	val &= ~PORT_LOGIC_N_FTS_MASK;
 	val |= FTS_VAL;
-	dw_pcie_writel_dbi(pci, PORT_LOGIC_GEN2_CTRL, val);
+	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
 
 	/* Configure Max Speed from DT */
 	if (pcie->max_speed && pcie->max_speed != -EINVAL) {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
