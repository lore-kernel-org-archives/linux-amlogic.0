Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800E1C4363A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B703024822
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="goMnQf8H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B703024822
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K7ym1LBS/LnBpqWpfKLg5uSxl5u8+FGD7XTViqQEudE=; b=goMnQf8Hlz5yF5GAPFvbASBoE
	Xw9adv/FJxLOL6bL3yvuCLMg+J5xVv/71Sybvjy5KWk34UoLqa3UWtecbTYnrY8DQF9I1AB7+6u6Q
	LyTum2JQY4S4yoMpCcL9SAU7OMWLv1TVXBgGKD24fjwb8rly1GMvf00xXRH4ttNOsGtHrEmzXbtFu
	+uvRBHcLr2rU9LE0kWydsslOacLxLIPwzJ0gtEf8s8LG9/bL+GtN/8mDqiD2FbhXDAEobVQH7PjZ6
	5TQDOAfryTfzwAOnG9FgqODU3qQprsfq7rE+Ogo+rp3g8GvR/O/7r6cG37uxBdUVitC9TOhuUdtpA
	/gv9uRxkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXsMC-0000qD-OP; Wed, 28 Oct 2020 20:47:44 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXsLV-0000c3-Og
 for linux-amlogic@lists.infradead.org; Wed, 28 Oct 2020 20:47:04 +0000
Received: by mail-oi1-f194.google.com with SMTP id k65so954932oih.8
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Oct 2020 13:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IzJpgC50B1aEr5UEqZkrsDaDZthdlXtSVmgpDKQvfR0=;
 b=ebbrcmcwtZnQ9kc9f/ZkgN0bwpCCiG1iY3A1xNaQAr0tzUstSq635df7lTAdpQHjDa
 k9lJ4b9fUbnfpSP2tuq8ry+yxX7TqOgUJGxXxA3fiSregqxMCiszCMSEp9nfHUjizwRQ
 /b6oYVmXrqm9uP5NTl86UgD6GSnC9HhTvctf2BppmlPPrduyrAuuvBQCrNHYLLcsCnHu
 OriYSEIX93O5nPzLoeAs38tTf9HjVHEy9gDPhAQ7cCj0RO/trqPTqEhIVe01J6kTDByt
 G1ERDwLrTKKWyQXbEK7+WRPmloSxX9LBcDBF0HWSGglov6oiutyHio/UzxXJGHbftUNu
 UTrA==
X-Gm-Message-State: AOAM532PLn9YLoG6JuDFNx3yMnJawHxnXJgJvyX+P8m819XcGvqSF2O0
 R1ieykPWbmvk4wt6O9EjJg==
X-Google-Smtp-Source: ABdhPJwkVdug/4qdZCJhvQsjCEVeaO4AKUvKQygW6QFcLOHfAO/BojTtu59syxrkhQvjVSXU4OEQTQ==
X-Received: by 2002:aca:b145:: with SMTP id a66mr658786oif.92.1603918019964;
 Wed, 28 Oct 2020 13:46:59 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:46:59 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 04/13] PCI: dwc/intel-gw: Remove some unneeded function
 wrappers
Date: Wed, 28 Oct 2020 15:46:37 -0500
Message-Id: <20201028204646.356535-5-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028204646.356535-1-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_164701_969407_9EDC1D75 
X-CRM114-Status: GOOD (  14.60  )
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
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Remove some of the pointless levels of functions that just wrap or group
a series of other functions.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-intel-gw.c | 47 ++++++++--------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index 88782653ed21..c562eb7454b1 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -152,19 +152,6 @@ static void intel_pcie_init_n_fts(struct dw_pcie *pci)
 	pci->n_fts[0] = PORT_AFR_N_FTS_GEN12_DFT;
 }
 
-static void intel_pcie_rc_setup(struct intel_pcie_port *lpp)
-{
-	struct dw_pcie *pci = &lpp->pci;
-
-	pci->atu_base = pci->dbi_base + 0xC0000;
-
-	intel_pcie_ltssm_disable(lpp);
-	intel_pcie_link_setup(lpp);
-	intel_pcie_init_n_fts(pci);
-	dw_pcie_setup_rc(&pci->pp);
-	dw_pcie_upconfig_setup(pci);
-}
-
 static int intel_pcie_ep_rst_init(struct intel_pcie_port *lpp)
 {
 	struct device *dev = lpp->pci.dev;
@@ -216,14 +203,6 @@ static void intel_pcie_device_rst_deassert(struct intel_pcie_port *lpp)
 	gpiod_set_value_cansleep(lpp->reset_gpio, 0);
 }
 
-static int intel_pcie_app_logic_setup(struct intel_pcie_port *lpp)
-{
-	intel_pcie_device_rst_deassert(lpp);
-	intel_pcie_ltssm_enable(lpp);
-
-	return dw_pcie_wait_for_link(&lpp->pci);
-}
-
 static void intel_pcie_core_irq_disable(struct intel_pcie_port *lpp)
 {
 	pcie_app_wr(lpp, PCIE_APP_IRNEN, 0);
@@ -273,11 +252,6 @@ static int intel_pcie_get_resources(struct platform_device *pdev)
 	return 0;
 }
 
-static void intel_pcie_deinit_phy(struct intel_pcie_port *lpp)
-{
-	phy_exit(lpp->phy);
-}
-
 static int intel_pcie_wait_l2(struct intel_pcie_port *lpp)
 {
 	u32 value;
@@ -314,6 +288,7 @@ static void intel_pcie_turn_off(struct intel_pcie_port *lpp)
 static int intel_pcie_host_setup(struct intel_pcie_port *lpp)
 {
 	int ret;
+	struct dw_pcie *pci = &lpp->pci;
 
 	intel_pcie_core_rst_assert(lpp);
 	intel_pcie_device_rst_assert(lpp);
@@ -330,8 +305,18 @@ static int intel_pcie_host_setup(struct intel_pcie_port *lpp)
 		goto clk_err;
 	}
 
-	intel_pcie_rc_setup(lpp);
-	ret = intel_pcie_app_logic_setup(lpp);
+	pci->atu_base = pci->dbi_base + 0xC0000;
+
+	intel_pcie_ltssm_disable(lpp);
+	intel_pcie_link_setup(lpp);
+	intel_pcie_init_n_fts(pci);
+	dw_pcie_setup_rc(&pci->pp);
+	dw_pcie_upconfig_setup(pci);
+
+	intel_pcie_device_rst_deassert(lpp);
+	intel_pcie_ltssm_enable(lpp);
+
+	ret = dw_pcie_wait_for_link(pci);
 	if (ret)
 		goto app_init_err;
 
@@ -345,7 +330,7 @@ static int intel_pcie_host_setup(struct intel_pcie_port *lpp)
 	clk_disable_unprepare(lpp->core_clk);
 clk_err:
 	intel_pcie_core_rst_assert(lpp);
-	intel_pcie_deinit_phy(lpp);
+	phy_exit(lpp->phy);
 
 	return ret;
 }
@@ -356,7 +341,7 @@ static void __intel_pcie_remove(struct intel_pcie_port *lpp)
 	intel_pcie_turn_off(lpp);
 	clk_disable_unprepare(lpp->core_clk);
 	intel_pcie_core_rst_assert(lpp);
-	intel_pcie_deinit_phy(lpp);
+	phy_exit(lpp->phy);
 }
 
 static int intel_pcie_remove(struct platform_device *pdev)
@@ -380,7 +365,7 @@ static int __maybe_unused intel_pcie_suspend_noirq(struct device *dev)
 	if (ret)
 		return ret;
 
-	intel_pcie_deinit_phy(lpp);
+	phy_exit(lpp->phy);
 	clk_disable_unprepare(lpp->core_clk);
 	return ret;
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
