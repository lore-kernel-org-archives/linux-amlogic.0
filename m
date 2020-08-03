Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18C7C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:10:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BEEF22BF3
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C0+dqt7T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BEEF22BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lBe7PkQeyTFxapmPI9NfYu4yqR0AfR1wDMn5qsy3rOc=; b=C0+dqt7T7qjwcwCyroer+/8C8
	U2qdm/K+4Fd36rsQTs4IaGlwHVP1GyKhLaaPBJJiwmzqX00b3CnbjPR2zzcKVLQlaDU2EjkAhpsSZ
	O7SpBPUz21rhqmSiPZc59DzfyNxotffjJVeKRDw+e/p3EdMctjq36px0aSISzsPX5mSsvsEGopHzr
	KzMKMhRtDQ1U4N1eKd7MXEygz4pn9ayegp7OP+G7dVoCte0d7UG7nM7m/2Nj+tePB31EnfQ5s1L9S
	9SZR6xxPg2LN/XZhu8lVp2zpyTQ7UO33URY0dFHo/wxAzCRIIURQWSGdIWqK0s9aoMoMcrcG99i7H
	+rpSc8xtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hiq-0004yn-DO; Mon, 03 Aug 2020 21:10:16 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2hbP-0000Yc-UK; Mon, 03 Aug 2020 21:02:37 +0000
Received: by mail-io1-f67.google.com with SMTP id w12so26396296iom.4;
 Mon, 03 Aug 2020 14:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5V63dl5D15U/c4aTTJinxu1IGbYXot5HyJAyQBAcQN8=;
 b=Mk0Kneg4cu9ROUb6F4YEThf6hUUuG/TknZzSAAUpsW+5IT/FpJikag3NLECeDf1V69
 vihqfeUTdTYEfWkBurWGlojVy/eIDFTCJBLOTawZuYqxbFNNKyQIvbMIEpRSGRoVWSQv
 SmJPtnXzyv21huFb+lXoChc9gUlx69Dp9pgASloK4g3Uo9F+7sz4FB8ZwnUsgIlYHLZu
 aCClvRXkAJvCji3FwGw55yYHb9Aca1Ea+pGYvM7HCgcB456OHoEBW9Aj8JeQiW8EbsDE
 ydqxfzUh9zNMBUeZJe44IPEMTAeBQgi2wNBk0L1UwbZkh0fFjkszwEATPKs+W+5lwq+F
 tbFQ==
X-Gm-Message-State: AOAM533Zo7GopeaAlktJJ4U9+Ps60pE3Cr18oigLHnI65FKCpWZXBVgW
 J0nOczul8gLqKxy7HlhIsg==
X-Google-Smtp-Source: ABdhPJye2Mo2SgL9U7MmsN235jpxm7lOgHdwxN7y4uIMz2vtYYQ/vzsM/p/WbFYNk1hakIOySw24tA==
X-Received: by 2002:a6b:c504:: with SMTP id v4mr1853953iof.20.1596488554927;
 Mon, 03 Aug 2020 14:02:34 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:02:34 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 27/27] PCI: dwc/tegra: Use common Designware port logic register
 definitions
Date: Mon,  3 Aug 2020 15:01:16 -0600
Message-Id: <20200803210116.3132633-28-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170236_166928_25E99BB5 
X-CRM114-Status: GOOD (  13.91  )
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

The Tegra driver has its own defines for common Designware Port Logic
registers. Convert it to use the standard register definitions.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware.h |  6 +++
 drivers/pci/controller/dwc/pcie-tegra194.c   | 56 ++++++++------------
 2 files changed, 28 insertions(+), 34 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index b18a9a5f48d2..3bd322db69a6 100644
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
index c567c9c09ff6..ad295c854853 100644
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
