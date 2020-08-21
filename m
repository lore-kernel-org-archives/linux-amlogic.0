Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE165C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:12:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F481206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="auk3K67x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lUf0Y/cY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F481206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4wntPXjDlPzg6n+hHIvOSAO+86KjA4i1Ua7EPR7ynko=; b=auk3K67xSm0oiVK1xD1NwNcAz
	aK+YOxGeRMFC5qW6ibUx883CuRvKuYv0egcSn4b2o/pIBjP/xbpG+AAHkkKTpLt4aHlNieFrEV+18
	AAtIMYJscxXaM1z6hdy29zHNbp63ZA+l8S1KoAD/sbDeyVrWzfsDn4FUfrEzz04ncCCWnlH6UQ7dG
	bsaXNM+H6JQmdlwTu5sRsqxBZEIe0FbUQdmTqvG8cqmhwGpGhisOK8TqyZ36oOWMw0g96bhBmV/3N
	LLcxTLAbqBPlLrmJZcxQ5Tu+Z+MGALuThddXB5y6jKw1pAeFh3/NDj1ES9xK4/rHw2kPNksFg2XlC
	DsCFmIRiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yPK-0003u4-Nf; Fri, 21 Aug 2020 04:12:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yO6-00034Q-AE; Fri, 21 Aug 2020 04:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=edvGUGpaPjRq5umLUm+6u58eZpeK1XpSMHPWcWJ22Uc=; b=lUf0Y/cYTPrP26+RHcF+kOLuYH
 rouRXaeANB1gunauqVtMDX5LFYKpEgU+tz6bRweDfRD7uSGJs+YsTH6hQZpWNQBKF17VusqiAaV6g
 7KKxhoNh2+bEIpS07pvslaSOp2VExXgTcA1m73+xRurKsUkx3Y/0Y+Dg5yN/KsFV0X3k/GoChCPkd
 jhsDpD5104pvMqHdxNAcD+8LQwFNNgH5g+C4AGZhA193JwucJ51DYPLEZ1skYcKuKl2bAhjHyNtZG
 xIQFufB/2S60pL2k0YW8YFxDPcubl9cUad5gqoEDd6TA0e9H7QaUI4vEl/Ro83SLghQOzc0TRv5om
 iBsMN5Og==;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAF-0001Lx-7A; Fri, 21 Aug 2020 03:56:30 +0000
Received: by mail-io1-f66.google.com with SMTP id 4so450277ion.13;
 Thu, 20 Aug 2020 20:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edvGUGpaPjRq5umLUm+6u58eZpeK1XpSMHPWcWJ22Uc=;
 b=KSR7fgfxdPTlxBPOIrD5n2WafIl6MUeQxDlvHiHIzA4NDiJzluNV4W18wECMk19p82
 rt7SCtaPWXZQ1RfhTjxstqsKu/kVH/unYYYwwBZWCeWy2vWSznVTOTvLKgQDZ4BqX5FF
 haScnXfh7qu2Dwf3k61JXL+qhwqSQl3ZJd6QS6ZKqjG+sInXyJnwJ4BYxjrIhRULyjmD
 f2w6/3Lmm7hQS7UU4c6Ve2ZM1SY70vYVwpu/z004SRSoOtYc934kixjHHIh0fGR6Tfn7
 7UQJKdCAKkrBocxTR4oIzPKVKFutW6VPJgA7oSXYOrOhKVR7KrZkA0dkOLx0lSiYKyh8
 0X3w==
X-Gm-Message-State: AOAM533TKywUZIs9SKYsGTTySxoTXJSQf6s8lbCxfrBvvWzpC8r+nFWt
 UEP0I31e38ADAWKNQLNfog==
X-Google-Smtp-Source: ABdhPJzMKcXOoA67DdtZomKXJ3hcCjg+p+4UND5Vd7stRJubIRYKDJim6SwRyBPjPn5FZKEVR20Ruw==
X-Received: by 2002:a6b:c94e:: with SMTP id z75mr898531iof.196.1597982185446; 
 Thu, 20 Aug 2020 20:56:25 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:24 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 29/40] PCI: dwc/qcom: Use common PCI register definitions
Date: Thu, 20 Aug 2020 21:54:09 -0600
Message-Id: <20200821035420.380495-30-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045628_067233_A0DD60A6 
X-CRM114-Status: GOOD (  12.64  )
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

The QCom driver has its own defines for common PCI config space
registers. It also hard codes the capability register offsets which are
discoverable. Convert it to use the standard register definitions.

Cc: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index fe7fc2ccd76d..d8d1fb7e0b8f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -67,10 +67,6 @@
 #define PCIE20_AXI_MSTR_RESP_COMP_CTRL1		0x81c
 #define CFG_BRIDGE_SB_INIT			BIT(0)
 
-#define PCIE20_CAP				0x70
-#define PCIE20_DEVICE_CONTROL2_STATUS2		(PCIE20_CAP + PCI_EXP_DEVCTL2)
-#define PCIE20_CAP_LINK_CAPABILITIES		(PCIE20_CAP + PCI_EXP_LNKCAP)
-#define PCIE20_CAP_LINK_1			(PCIE20_CAP + 0x14)
 #define PCIE_CAP_LINK1_VAL			0x2FD7F
 
 #define PCIE20_PARF_Q2A_FLUSH			0x1AC
@@ -1017,6 +1013,7 @@ static int qcom_pcie_init_2_3_3(struct qcom_pcie *pcie)
 	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
 	struct dw_pcie *pci = pcie->pci;
 	struct device *dev = pci->dev;
+	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	int i, ret;
 	u32 val;
 
@@ -1092,14 +1089,14 @@ static int qcom_pcie_init_2_3_3(struct qcom_pcie *pcie)
 
 	writel(PCI_COMMAND_MASTER, pci->dbi_base + PCI_COMMAND);
 	writel(DBI_RO_WR_EN, pci->dbi_base + PCIE20_MISC_CONTROL_1_REG);
-	writel(PCIE_CAP_LINK1_VAL, pci->dbi_base + PCIE20_CAP_LINK_1);
+	writel(PCIE_CAP_LINK1_VAL, pci->dbi_base + offset + PCI_EXP_SLTCAP);
 
-	val = readl(pci->dbi_base + PCIE20_CAP_LINK_CAPABILITIES);
+	val = readl(pci->dbi_base + offset + PCI_EXP_LNKCAP);
 	val &= ~PCI_EXP_LNKCAP_ASPMS;
-	writel(val, pci->dbi_base + PCIE20_CAP_LINK_CAPABILITIES);
+	writel(val, pci->dbi_base + offset + PCI_EXP_LNKCAP);
 
-	writel(PCI_EXP_DEVCTL2_COMP_TMOUT_DIS, pci->dbi_base +
-		PCIE20_DEVICE_CONTROL2_STATUS2);
+	writel(PCI_EXP_DEVCTL2_COMP_TMOUT_DIS, pci->dbi_base + offset +
+		PCI_EXP_DEVCTL2);
 
 	return 0;
 
@@ -1252,7 +1249,8 @@ static void qcom_pcie_post_deinit_2_7_0(struct qcom_pcie *pcie)
 
 static int qcom_pcie_link_up(struct dw_pcie *pci)
 {
-	u16 val = readw(pci->dbi_base + PCIE20_CAP + PCI_EXP_LNKSTA);
+	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u16 val = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
 
 	return !!(val & PCI_EXP_LNKSTA_DLLLA);
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
