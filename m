Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBBBC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:10:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35984206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:10:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WmYvrkYN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="miCnIDO5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35984206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iiPptMYEENWthNMjtrhZX6HBUp4wy6uOkaZfPMpNJn0=; b=WmYvrkYNpRYuBPD2eUpwDWlis
	Ljpf/Wv7zVFJb+L64LqwyM5mfvtgomIt+YNQ9Mxnal9Kk7YfUGHC+8ca7wfyAcAB5x/yudI+OK8qA
	533kVtlmdbNPFcRTJNol4R9edWPa4wxYTN2oAMFdhKZ/x1VO0/yGuyCZdeVDgwpAGE97T3LKtXbed
	k6DP2LP/N048QgFHsGA0/o+r27BVfOiYYA4Q4urKykYTVrGxjFRUjFxpacT4T1+DVn1p6dV7e0SLv
	3XnppM23oV7g13bjqXpASXc+fdlF1wUdAbcULsfjO5IxRAu9vj0ZqWVT335Y5bH/Fnxgl1kkYtbfM
	jL4tU08Qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yNi-0003A6-Kv; Fri, 21 Aug 2020 04:10:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yNh-00034Q-6l; Fri, 21 Aug 2020 04:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=kP/T61es9DvAAR9dLPg8gUF5gI5xlrq862DmcnbYwx4=; b=miCnIDO5JWvUD8pjz5PFumRkAD
 eWFBzu5yOKnp+5rymjzOoKF6nDeqDVHCBi/2ZpPZ4uivnKgC7IOgINg3JdNO6rixpFske/UpUn2vO
 M23YCNe0OGdAAGNkqYbanx9t0Qa4WmGL6I56k3ixfhFp0rDv+baJCuat+M+JibKKVPzh7jNRrq8bS
 jKzBh8hZ8YtUQyMefN+hlN22m/aXWGZVGilL7Za9s9n2DKWu7QqW6ojfookYMOtPQ5jHPYTZ16+Of
 +/2LsLUV86PhAKJXemhzCs5inQRGxohV03IXfwU5hdVgfH0wG4CmPbeun6Yx1BX7a1b6OhH+3P3tp
 zw4gGzfg==;
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAh-0001T7-P9; Fri, 21 Aug 2020 03:56:58 +0000
Received: by mail-io1-f65.google.com with SMTP id u126so454564iod.12;
 Thu, 20 Aug 2020 20:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kP/T61es9DvAAR9dLPg8gUF5gI5xlrq862DmcnbYwx4=;
 b=BNGDey0pevtz/KK2SYb6I+ai7e5GVPiOgBofe7vJamY3hZ3ETFRhukIeR7nuKFGZWP
 kJr0KbqicvKmmkIRQztkmNZjS1Iz3eDrtpvt1AfBT/kO3Nxq4gpOwtqnLXWfVW/sywP+
 RS1bXzQ8EAJ4WXQAP4ZTyiW2YWAtTrjWLgafL95Rdx0dZ/JQJqGssAnqK1Ru4i/M3nTo
 +asmTjVHXrRCUkUizSdUqH8VQ/MSU7cJXYfvA0i9K2VR5iORHbYu6QbJ73sbxBI1xm+p
 TtOyzdjRjXPCYyoxRW+w3XXgs2gNmajT/zc2abcKNxG4Ntbatww02J40L+3ks9lr3S6p
 2LAA==
X-Gm-Message-State: AOAM530k7awjAu0YFc5HeSqnAqJYwnPKgRwKsfxPNzmpfr5xqP5JvTpI
 LgiqVOPDq7D0Hyw26lPzKA==
X-Google-Smtp-Source: ABdhPJzKcMsIuzXYEJD3GGVjx/id1u+aBxnnd2EyAyGfwElnMjqt0JTVFjjDQ4nmrXUWaFGgMPtkpA==
X-Received: by 2002:a05:6638:214d:: with SMTP id
 z13mr971479jaj.7.1597982214483; 
 Thu, 20 Aug 2020 20:56:54 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:53 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 39/40] PCI: dwc: Move N_FTS setup to common setup
Date: Thu, 20 Aug 2020 21:54:19 -0600
Message-Id: <20200821035420.380495-40-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045656_035040_F242E68F 
X-CRM114-Status: GOOD (  23.87  )
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

The Designware controller has common registers to set number of fast
training sequence ordered sets. The Artpec6, Intel, and Tegra driver
initialize these register fields. Let's move the initialization to the
common setup code and drivers just have to provide the value.

There's a slight change in that the common clock mode N_FTS field is
now initialized. Previously only the Intel driver set this. It's not
clear from the code if common clock mode is used in the Artpec6 or Tegra
driver. It depends on the DWC configuration. Given the field is not
initialized while the others are, it seems unlikely common clock mode
is used.

Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-artpec6.c    | 37 +++-----------------
 drivers/pci/controller/dwc/pcie-designware.c | 28 +++++++++------
 drivers/pci/controller/dwc/pcie-designware.h |  3 +-
 drivers/pci/controller/dwc/pcie-intel-gw.c   | 27 +++++---------
 drivers/pci/controller/dwc/pcie-tegra194.c   | 25 ++-----------
 5 files changed, 35 insertions(+), 85 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 86f4d66d8587..929448e9e0bc 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -44,13 +44,6 @@ struct artpec_pcie_of_data {
 
 static const struct of_device_id artpec6_pcie_of_match[];
 
-/* PCIe Port Logic registers (memory-mapped) */
-#define PL_OFFSET			0x700
-
-#define ACK_F_ASPM_CTRL_OFF		(PL_OFFSET + 0xc)
-#define ACK_N_FTS_MASK			GENMASK(15, 8)
-#define ACK_N_FTS(x)			(((x) << 8) & ACK_N_FTS_MASK)
-
 /* ARTPEC-6 specific registers */
 #define PCIECFG				0x18
 #define  PCIECFG_DBG_OEN		BIT(24)
@@ -289,30 +282,6 @@ static void artpec6_pcie_init_phy(struct artpec6_pcie *artpec6_pcie)
 	}
 }
 
-static void artpec6_pcie_set_nfts(struct artpec6_pcie *artpec6_pcie)
-{
-	struct dw_pcie *pci = artpec6_pcie->pci;
-	u32 val;
-
-	if (artpec6_pcie->variant != ARTPEC7)
-		return;
-
-	/*
-	 * Increase the N_FTS (Number of Fast Training Sequences)
-	 * to be transmitted when transitioning from L0s to L0.
-	 */
-	val = dw_pcie_readl_dbi(pci, ACK_F_ASPM_CTRL_OFF);
-	val &= ~ACK_N_FTS_MASK;
-	val |= ACK_N_FTS(180);
-	dw_pcie_writel_dbi(pci, ACK_F_ASPM_CTRL_OFF, val);
-
-	/*
-	 * Set the Number of Fast Training Sequences that the core
-	 * advertises as its N_FTS during Gen2 or Gen3 link training.
-	 */
-	dw_pcie_link_set_n_fts(pci, 180);
-}
-
 static void artpec6_pcie_assert_core_reset(struct artpec6_pcie *artpec6_pcie)
 {
 	u32 val;
@@ -351,11 +320,14 @@ static int artpec6_pcie_host_init(struct pcie_port *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct artpec6_pcie *artpec6_pcie = to_artpec6_pcie(pci);
 
+	if (artpec6_pcie->variant == ARTPEC7) {
+		pci->n_fts[0] = 180;
+		pci->n_fts[1] = 180;
+	}
 	artpec6_pcie_assert_core_reset(artpec6_pcie);
 	artpec6_pcie_init_phy(artpec6_pcie);
 	artpec6_pcie_deassert_core_reset(artpec6_pcie);
 	artpec6_pcie_wait_for_phy(artpec6_pcie);
-	artpec6_pcie_set_nfts(artpec6_pcie);
 	dw_pcie_setup_rc(pp);
 	artpec6_pcie_establish_link(pci);
 	dw_pcie_wait_for_link(pci);
@@ -403,7 +375,6 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
 	artpec6_pcie_init_phy(artpec6_pcie);
 	artpec6_pcie_deassert_core_reset(artpec6_pcie);
 	artpec6_pcie_wait_for_phy(artpec6_pcie);
-	artpec6_pcie_set_nfts(artpec6_pcie);
 
 	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
 		dw_pcie_ep_reset_bar(pci, bar);
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 61e1faba15bf..3cb21247619c 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -510,17 +510,6 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci, u32 link_gen)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_link_set_max_speed);
 
-void dw_pcie_link_set_n_fts(struct dw_pcie *pci, u32 n_fts)
-{
-	u32 val;
-
-	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
-	val &= ~PORT_LOGIC_N_FTS_MASK;
-	val |= n_fts & PORT_LOGIC_N_FTS_MASK;
-	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
-}
-EXPORT_SYMBOL_GPL(dw_pcie_link_set_n_fts);
-
 static u8 dw_pcie_iatu_unroll_enabled(struct dw_pcie *pci)
 {
 	u32 val;
@@ -551,6 +540,23 @@ void dw_pcie_setup(struct dw_pcie *pci)
 	if (pci->link_gen > 0)
 		dw_pcie_link_set_max_speed(pci, pci->link_gen);
 
+	/* Configure Gen1 N_FTS */
+	if (pci->n_fts[0]) {
+		val = dw_pcie_readl_dbi(pci, PCIE_PORT_AFR);
+		val &= ~(PORT_AFR_N_FTS_MASK | PORT_AFR_CC_N_FTS_MASK);
+		val |= PORT_AFR_N_FTS(pci->n_fts[0]);
+		val |= PORT_AFR_CC_N_FTS(pci->n_fts[0]);
+		dw_pcie_writel_dbi(pci, PCIE_PORT_AFR, val);
+	}
+
+	/* Configure Gen2+ N_FTS */
+	if (pci->n_fts[1]) {
+		val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
+		val &= ~PORT_LOGIC_N_FTS_MASK;
+		val |= pci->n_fts[pci->link_gen - 1];
+		dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
+	}
+
 	val = dw_pcie_readl_dbi(pci, PCIE_PORT_LINK_CONTROL);
 	val &= ~PORT_LINK_FAST_LINK_MODE;
 	val |= PORT_LINK_DLL_LINK_EN;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 0b48298362cd..d8771db247f4 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -34,6 +34,7 @@
 #define PORT_AFR_N_FTS_MASK		GENMASK(15, 8)
 #define PORT_AFR_N_FTS(n)		FIELD_PREP(PORT_AFR_N_FTS_MASK, n)
 #define PORT_AFR_CC_N_FTS_MASK		GENMASK(23, 16)
+#define PORT_AFR_CC_N_FTS(n)		FIELD_PREP(PORT_AFR_CC_N_FTS_MASK, n)
 #define PORT_AFR_ENTER_ASPM		BIT(30)
 #define PORT_AFR_L0S_ENTRANCE_LAT_SHIFT	24
 #define PORT_AFR_L0S_ENTRANCE_LAT_MASK	GENMASK(26, 24)
@@ -253,6 +254,7 @@ struct dw_pcie {
 	unsigned int		version;
 	int			num_lanes;
 	int			link_gen;
+	u8			n_fts[2];
 };
 
 #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
@@ -271,7 +273,6 @@ void dw_pcie_write_dbi(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
 void dw_pcie_write_dbi2(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
 int dw_pcie_link_up(struct dw_pcie *pci);
 void dw_pcie_upconfig_setup(struct dw_pcie *pci);
-void dw_pcie_link_set_n_fts(struct dw_pcie *pci, u32 n_fts);
 int dw_pcie_wait_for_link(struct dw_pcie *pci);
 void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index,
 			       int type, u64 cpu_addr, u64 pci_addr,
diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 333f11561807..5650cb78acba 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -67,7 +67,6 @@ struct intel_pcie_port {
 	void __iomem		*app_base;
 	struct gpio_desc	*reset_gpio;
 	u32			rst_intrvl;
-	u32			n_fts;
 	struct clk		*core_clk;
 	struct reset_control	*core_rst;
 	struct phy		*phy;
@@ -138,37 +137,29 @@ static void intel_pcie_link_setup(struct intel_pcie_port *lpp)
 	pcie_rc_cfg_wr(lpp, offset + PCI_EXP_LNKCTL, val);
 }
 
-static void intel_pcie_port_logic_setup(struct intel_pcie_port *lpp)
+static void intel_pcie_init_n_fts(struct dw_pcie *pci)
 {
-	u32 val, mask;
-	struct dw_pcie *pci = &lpp->pci;
-
-	switch (pcie_link_speed[pci->link_gen]) {
-	case PCIE_SPEED_8_0GT:
-		lpp->n_fts = PORT_AFR_N_FTS_GEN3;
+	switch (pci->link_gen) {
+	case 3:
+		pci->n_fts[1] = PORT_AFR_N_FTS_GEN3;
 		break;
-	case PCIE_SPEED_16_0GT:
-		lpp->n_fts = PORT_AFR_N_FTS_GEN4;
+	case 4:
+		pci->n_fts[1] = PORT_AFR_N_FTS_GEN4;
 		break;
 	default:
-		lpp->n_fts = PORT_AFR_N_FTS_GEN12_DFT;
+		pci->n_fts[1] = PORT_AFR_N_FTS_GEN12_DFT;
 		break;
 	}
-
-	mask = PORT_AFR_N_FTS_MASK | PORT_AFR_CC_N_FTS_MASK;
-	val = FIELD_PREP(PORT_AFR_N_FTS_MASK, lpp->n_fts) |
-	       FIELD_PREP(PORT_AFR_CC_N_FTS_MASK, lpp->n_fts);
-	pcie_rc_cfg_wr_mask(lpp, PCIE_PORT_AFR, mask, val);
+	pci->n_fts[0] = PORT_AFR_N_FTS_GEN12_DFT;
 }
 
 static void intel_pcie_rc_setup(struct intel_pcie_port *lpp)
 {
 	intel_pcie_ltssm_disable(lpp);
 	intel_pcie_link_setup(lpp);
+	intel_pcie_init_n_fts(&lpp->pci);
 	dw_pcie_setup_rc(&lpp->pci.pp);
 	dw_pcie_upconfig_setup(&lpp->pci);
-	intel_pcie_port_logic_setup(lpp);
-	dw_pcie_link_set_n_fts(&lpp->pci, lpp->n_fts);
 }
 
 static int intel_pcie_ep_rst_init(struct intel_pcie_port *lpp)
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 91ef4b3e860d..1560c449757d 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -881,17 +881,6 @@ static void tegra_pcie_prepare_host(struct pcie_port *pp)
 
 	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_0, 0);
 
-	/* Configure FTS */
-	val = dw_pcie_readl_dbi(pci, PCIE_PORT_AFR);
-	val &= ~PORT_AFR_N_FTS_MASK;
-	val |= PORT_AFR_N_FTS(N_FTS_VAL);
-	dw_pcie_writel_dbi(pci, PCIE_PORT_AFR, val);
-
-	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
-	val &= ~PORT_LOGIC_N_FTS_MASK;
-	val |= FTS_VAL;
-	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
-
 	/* Enable as 0xFFFF0001 response for CRS */
 	val = dw_pcie_readl_dbi(pci, PORT_LOGIC_AMBA_ERROR_RESPONSE_DEFAULT);
 	val &= ~(AMBA_ERROR_RESPONSE_CRS_MASK << AMBA_ERROR_RESPONSE_CRS_SHIFT);
@@ -1794,17 +1783,6 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 	val &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
 	dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
 
-	/* Configure N_FTS & FTS */
-	val = dw_pcie_readl_dbi(pci, PCIE_PORT_AFR);
-	val &= ~PORT_AFR_N_FTS_MASK;
-	val |= PORT_AFR_N_FTS(FTS_VAL);
-	dw_pcie_writel_dbi(pci, PCIE_PORT_AFR, val);
-
-	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
-	val &= ~PORT_LOGIC_N_FTS_MASK;
-	val |= FTS_VAL;
-	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
-
 	pcie->pcie_cap_base = dw_pcie_find_capability(&pcie->pci,
 						      PCI_CAP_ID_EXP);
 	clk_set_rate(pcie->core_clk, GEN4_CORE_CLK_FREQ);
@@ -2033,6 +2011,9 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 	pci = &pcie->pci;
 	pci->dev = &pdev->dev;
 	pci->ops = &tegra_dw_pcie_ops;
+	pci->n_fts[0] = N_FTS_VAL;
+	pci->n_fts[1] = FTS_VAL;
+
 	pp = &pci->pp;
 	pcie->dev = &pdev->dev;
 	pcie->mode = (enum dw_pcie_device_mode)data->mode;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
