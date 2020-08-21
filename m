Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83EFC433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:02:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70408208C7
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:02:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="So2S7HMo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70408208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3+QkntHDXFP5Ul7OckVJjR8htzPRZOtvF5QmljKBt9o=; b=So2S7HMoIQQwe90+RdwFnWs8D
	6F4NVhNL9wchmztHW53yp2ZBxkFlN5W2LoKZzHUtBD++bPLhb7wUGYeTK2Ld5V3LFioooXTVbQVCu
	A71SfZDN1FuH1SW2AB8O2YLiu1htrKM0uMjiMbPtN4mcodtrmNMa7HxkVC0mWf5/RXMlLP43r/fnw
	u7Nzoa+fR4kIgnUE++DRe8K8KKgx6hERWiYZeOAVyaCWBsub1TcrSBJdsvAKGj3lF8N4f+avy3ENl
	avj16Aa3gUtRvxpNmqzekyVIt9L2T4nmaBq7aYKYGieKC0ExuBd6YVzUTIQ8fEr6fjQHVhgPnbieg
	asFRspN+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yFb-0007cf-7f; Fri, 21 Aug 2020 04:01:59 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAE-00051G-EQ; Fri, 21 Aug 2020 03:56:52 +0000
Received: by mail-il1-f196.google.com with SMTP id p18so331562ilm.7;
 Thu, 20 Aug 2020 20:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UY2fPz0NO05RXL9vePRt/cRMQCQrnZKBpfHarfvkz5Q=;
 b=YpmBE3wk69zCEcWUVcktgTUQFDIpDQ1HE2glPZY6d84gFt0eIutxwl857CG2yMGlUF
 z3mffU0g4hGizqjcNU/eSNAuVR0DujAe2IhZmvrtCSZSnfr+najEYi4WKXOmBcv8ERoS
 BBdlOidw4u2P8lfA/FNnCQlpKRuFp+si4ONkNmx9qI6iwnmfV/oTp6dpoedFdWYNKyyK
 JaqLhZc3kAaYQctpIZgEHkD+d23Buulo9tpeXLSXvAwsUjMHU+kD6VZUrEb0AzydGPYG
 Mz4PILOhg/nNrfO44PGlCKO8qCNu1fwNohxwg7voh0yZ8CrYcvA4w4sYoLsifPGdNsBW
 uDxQ==
X-Gm-Message-State: AOAM533FOxo4zHDG0hPfIJUX/cMIv7OSBOkJGnS4OVCJvVoR6p5DUYxp
 mYUSzkk39vwBaz7bPhZOtA==
X-Google-Smtp-Source: ABdhPJz5gb7SbCmow1gnu4VRVRjNASATy8ZJ3fF6Oeyl4ezMABhw3IGS66vddsKWQh3VagZpXEQ3Aw==
X-Received: by 2002:a92:914a:: with SMTP id t71mr963369ild.298.1597982183177; 
 Thu, 20 Aug 2020 20:56:23 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:22 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 28/40] PCI: dwc/imx6: Use common PCI register definitions
Date: Thu, 20 Aug 2020 21:54:08 -0600
Message-Id: <20200821035420.380495-29-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235626_813349_C256867F 
X-CRM114-Status: GOOD (  17.71  )
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

The i.MX6 driver has its own defines for common PCI config space
registers. It also hard codes the capability register offsets which are
discoverable. Convert it to use the standard register definitions.

Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-imx6.c | 37 ++++++++++-----------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 2b075a468104..9f6018d3d338 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -94,15 +94,6 @@ struct imx6_pcie {
 #define PHY_PLL_LOCK_WAIT_USLEEP_MAX	200
 #define PHY_PLL_LOCK_WAIT_TIMEOUT	(2000 * PHY_PLL_LOCK_WAIT_USLEEP_MAX)
 
-/* PCIe Root Complex registers (memory-mapped) */
-#define PCIE_RC_IMX6_MSI_CAP			0x50
-#define PCIE_RC_LCR				0x7c
-#define PCIE_RC_LCR_MAX_LINK_SPEEDS_GEN1	0x1
-#define PCIE_RC_LCR_MAX_LINK_SPEEDS_GEN2	0x2
-#define PCIE_RC_LCR_MAX_LINK_SPEEDS_MASK	0xf
-
-#define PCIE_RC_LCSR				0x80
-
 /* PCIe Port Logic registers (memory-mapped) */
 #define PL_OFFSET 0x700
 
@@ -759,6 +750,7 @@ static int imx6_pcie_establish_link(struct imx6_pcie *imx6_pcie)
 {
 	struct dw_pcie *pci = imx6_pcie->pci;
 	struct device *dev = pci->dev;
+	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 tmp;
 	int ret;
 
@@ -767,10 +759,10 @@ static int imx6_pcie_establish_link(struct imx6_pcie *imx6_pcie)
 	 * started in Gen2 mode, there is a possibility the devices on the
 	 * bus will not be detected at all.  This happens with PCIe switches.
 	 */
-	tmp = dw_pcie_readl_dbi(pci, PCIE_RC_LCR);
-	tmp &= ~PCIE_RC_LCR_MAX_LINK_SPEEDS_MASK;
-	tmp |= PCIE_RC_LCR_MAX_LINK_SPEEDS_GEN1;
-	dw_pcie_writel_dbi(pci, PCIE_RC_LCR, tmp);
+	tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
+	tmp &= ~PCI_EXP_LNKCAP_SLS;
+	tmp |= PCI_EXP_LNKCAP_SLS_2_5GB;
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, tmp);
 
 	/* Start LTSSM. */
 	imx6_pcie_ltssm_enable(dev);
@@ -781,10 +773,10 @@ static int imx6_pcie_establish_link(struct imx6_pcie *imx6_pcie)
 
 	if (imx6_pcie->link_gen == 2) {
 		/* Allow Gen2 mode after the link is up. */
-		tmp = dw_pcie_readl_dbi(pci, PCIE_RC_LCR);
-		tmp &= ~PCIE_RC_LCR_MAX_LINK_SPEEDS_MASK;
-		tmp |= PCIE_RC_LCR_MAX_LINK_SPEEDS_GEN2;
-		dw_pcie_writel_dbi(pci, PCIE_RC_LCR, tmp);
+		tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
+		tmp &= ~PCI_EXP_LNKCAP_SLS;
+		tmp |= PCI_EXP_LNKCAP_SLS_5_0GB;
+		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, tmp);
 
 		/*
 		 * Start Directed Speed Change so the best possible
@@ -822,8 +814,8 @@ static int imx6_pcie_establish_link(struct imx6_pcie *imx6_pcie)
 		dev_info(dev, "Link: Gen2 disabled\n");
 	}
 
-	tmp = dw_pcie_readl_dbi(pci, PCIE_RC_LCSR);
-	dev_info(dev, "Link up, Gen%i\n", (tmp >> 16) & 0xf);
+	tmp = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
+	dev_info(dev, "Link up, Gen%i\n", tmp & PCI_EXP_LNKSTA_CLS);
 	return 0;
 
 err_reset_phy:
@@ -1184,11 +1176,10 @@ static int imx6_pcie_probe(struct platform_device *pdev)
 		return ret;
 
 	if (pci_msi_enabled()) {
-		val = dw_pcie_readw_dbi(pci, PCIE_RC_IMX6_MSI_CAP +
-					PCI_MSI_FLAGS);
+		u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_MSI);
+		val = dw_pcie_readw_dbi(pci, offset + PCI_MSI_FLAGS);
 		val |= PCI_MSI_FLAGS_ENABLE;
-		dw_pcie_writew_dbi(pci, PCIE_RC_IMX6_MSI_CAP + PCI_MSI_FLAGS,
-				   val);
+		dw_pcie_writew_dbi(pci, offset + PCI_MSI_FLAGS, val);
 	}
 
 	return 0;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
