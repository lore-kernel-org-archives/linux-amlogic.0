Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26E2C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:10:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9923822BF3
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zr+CZw7y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9923822BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fuyQjY21GJGhcKzr42+TRTSmR2jWEskH57ee5UrRU8o=; b=zr+CZw7yfJFbKDnigy/i/7hjH
	Pv4+nEBPr8J5QKor/fwVXCYNWAqetxEQy5WdQ+NrfCHyctjr2kuRLB+evPp1Ix7/8ypjJepzzTe8E
	cSWDSDMwjrQUn3XaF/stOs6Loazb5CBAykgfctKJV88AreKu19qlnpjUyyFc20MjGhfBvm7vigJmy
	l/Cs7nWKAM8ljIHKYAopmHVAzh2b4UGQGlhmPYBJbrgh39vBkxFjkR0ep1Hao30JubxNAsPIM402w
	2pLgneCCR2ltkJSnOrTWaocnQOI5//Q6i3DxTfDyM2Ti/Ncvy0+OCGGzdjq7vr5FrtX90mu93qFq/
	02GqedWww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hiS-0004nv-Qx; Mon, 03 Aug 2020 21:09:52 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2hbK-0000VI-10; Mon, 03 Aug 2020 21:02:33 +0000
Received: by mail-io1-f66.google.com with SMTP id g14so2509795iom.0;
 Mon, 03 Aug 2020 14:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VwFTr4t0lrmNy8f4Fgv3/l49uahHgczW7Wdy7hSwZ1w=;
 b=scaQbwZIUnJY378XPaFKigyOHtN8fJTMKeA+Dc8mWxUKBns6KtnEpv4l+NCQNmmoZr
 /wK5ioWB71YbF8GEOwJXsjMoQd9L6CxOJGW081Y7Ov1IoUMbJoQz129L6Y4yXdx02Rg6
 yoEYE0ls+DNQYMeQfFJVR0phbojhWYFnZM1s/ot6rSYlTmdjq9fvNayNQkfLEB3jbZPZ
 SSzGxhUVWfSQqqqJorORdzkJPNzOS8bNVlhejeOJGm5+r48FQKLJiSIH3AJ/5PQcwWHF
 h3pHlUMw5OPZpmgFbzJFQGXtXtskduIdsQ2GQF+oFVw9E2wlK5dUguFd85ely3VL6l6b
 HNlA==
X-Gm-Message-State: AOAM533HFNTFGK+c6Uz7HyuBgGoSwhlNN4eWZ1jjWZPprqbSE0ZDHyk1
 rMBFuB61FaCqinRq+M0n9Q==
X-Google-Smtp-Source: ABdhPJzMEhzv37+IQcarhuMxavAyD+FE8gqZIx02+KuoDY977KQ4tDj1eOPm1iwpPoPc4bKstznlOA==
X-Received: by 2002:a5d:9b96:: with SMTP id r22mr1878334iom.66.1596488549634; 
 Mon, 03 Aug 2020 14:02:29 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:02:29 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 25/27] PCI: dwc/qcom: Use common PCI register definitions
Date: Mon,  3 Aug 2020 15:01:14 -0600
Message-Id: <20200803210116.3132633-26-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170230_322999_97FE0A6F 
X-CRM114-Status: GOOD (  14.11  )
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
 linux-arm-kernel@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>, Kukjin Kim <kgene@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
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
Cc: linux-pci@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 27 ++++++++++----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 9f1d3ba686fa..dba5f7d7f727 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -39,11 +39,6 @@
 #define L23_CLK_RMV_DIS				BIT(2)
 #define L1_CLK_RMV_DIS				BIT(1)
 
-#define PCIE20_COMMAND_STATUS			0x04
-#define CMD_BME_VAL				0x4
-#define PCIE20_DEVICE_CONTROL2_STATUS2		0x98
-#define PCIE_CAP_CPL_TIMEOUT_DISABLE		0x10
-
 #define PCIE20_PARF_PHY_CTRL			0x40
 #define PCIE20_PARF_PHY_REFCLK			0x4C
 #define PCIE20_PARF_DBI_BASE_ADDR		0x168
@@ -65,10 +60,6 @@
 #define PCIE20_AXI_MSTR_RESP_COMP_CTRL1		0x81c
 #define CFG_BRIDGE_SB_INIT			BIT(0)
 
-#define PCIE20_CAP				0x70
-#define PCIE20_CAP_LINK_CAPABILITIES		(PCIE20_CAP + 0xC)
-#define PCIE20_CAP_ACTIVE_STATE_LINK_PM_SUPPORT	(BIT(10) | BIT(11))
-#define PCIE20_CAP_LINK_1			(PCIE20_CAP + 0x14)
 #define PCIE_CAP_LINK1_VAL			0x2FD7F
 
 #define PCIE20_PARF_Q2A_FLUSH			0x1AC
@@ -974,6 +965,7 @@ static int qcom_pcie_init_2_3_3(struct qcom_pcie *pcie)
 	struct qcom_pcie_resources_2_3_3 *res = &pcie->res.v2_3_3;
 	struct dw_pcie *pci = pcie->pci;
 	struct device *dev = pci->dev;
+	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	int i, ret;
 	u32 val;
 
@@ -1047,16 +1039,16 @@ static int qcom_pcie_init_2_3_3(struct qcom_pcie *pcie)
 		pcie->parf + PCIE20_PARF_SYS_CTRL);
 	writel(0, pcie->parf + PCIE20_PARF_Q2A_FLUSH);
 
-	writel(CMD_BME_VAL, pci->dbi_base + PCIE20_COMMAND_STATUS);
+	writel(PCI_COMMAND_MASTER, pci->dbi_base + PCI_COMMAND);
 	writel(DBI_RO_WR_EN, pci->dbi_base + PCIE20_MISC_CONTROL_1_REG);
-	writel(PCIE_CAP_LINK1_VAL, pci->dbi_base + PCIE20_CAP_LINK_1);
+	writel(PCIE_CAP_LINK1_VAL, pci->dbi_base + offset + PCI_EXP_SLTCAP);
 
-	val = readl(pci->dbi_base + PCIE20_CAP_LINK_CAPABILITIES);
-	val &= ~PCIE20_CAP_ACTIVE_STATE_LINK_PM_SUPPORT;
-	writel(val, pci->dbi_base + PCIE20_CAP_LINK_CAPABILITIES);
+	val = readl(pci->dbi_base + offset + PCI_EXP_LNKCAP);
+	val &= ~PCI_EXP_LNKCAP_ASPMS;
+	writel(val, pci->dbi_base + offset + PCI_EXP_LNKCAP);
 
-	writel(PCIE_CAP_CPL_TIMEOUT_DISABLE, pci->dbi_base +
-		PCIE20_DEVICE_CONTROL2_STATUS2);
+	writel(PCI_EXP_DEVCTL2_COMP_TMOUT_DIS, pci->dbi_base + offset +
+		PCI_EXP_DEVCTL2);
 
 	return 0;
 
@@ -1209,7 +1201,8 @@ static void qcom_pcie_post_deinit_2_7_0(struct qcom_pcie *pcie)
 
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
