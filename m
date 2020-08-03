Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AABBC433E5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:02:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B2E222C9F
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ys1c1U+f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B2E222C9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DboZgzhor7lNDy2oHv6W+4IE3J1NBDhbu3uLYPULI4E=; b=Ys1c1U+fap4rmANGfVaUl6PzJ
	+zWc4Jw5Ahdn6qxMHp7XnSq/12AIpRoI/8zJ0ROlDDHy+Gb+jTywt/jh7jhXRew34A9rqToXprS6y
	MnQgDj2i7FmoA9np5KlxBLbk7YTJdIbX1n5uhYODLLq5ODjpRw/I3pGDmn+AnWREwy8dxNPYv9vkA
	v2nl5Qiinzq2HEf5zFrGLlWrJuWk5+ONCgSiJ6XLTioign3cKlEKcU91sI9tDHbk1XXENKDe6Pil6
	Kv6fDSoM2x480nTJOH/s7aAVQJBYNU7qN87W7zxL0WSHaB71EPmSWrT+ia1hKLZJwgOxjZKMsA9vk
	wXthMJ10g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hbW-0000cJ-8k; Mon, 03 Aug 2020 21:02:42 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haS-0008SJ-JR; Mon, 03 Aug 2020 21:01:37 +0000
Received: by mail-io1-f68.google.com with SMTP id t15so31076832iob.3;
 Mon, 03 Aug 2020 14:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DhVIHy/Rw3yhAfrDggAhIwfl4PW3KaTrEVn3uFz3dc8=;
 b=Sk7t4pED4ff945dDdGexsFD6tM3FqBDjO+ZKk0ZJ2TJa0c8B78RBoGsDg+19MjTRBq
 DBvjoSRETiAOzecZvbYPXmotxzeV7pUdYQMTvrkJ3YNS97j4oasXxt55OK58V1CbL3Iy
 JMTdmQNVK0coY5KNJk1gRC0lghz67twVKwOyoat+59n9oPyJ/DYgsxf20k9+7cD0wHZ7
 onYmY6mmYF8XBXoqVuCyUx++j+C6boCUfz5p9L7fOBa9iZyD5e8ecimIvniOTtfMzlO6
 1YzLsyaT/zFVAQmu+SsmyFmwHk0U7WZkbRZLWxrYlF1Zsd5pjU3kWSiA4MG/p2flxATE
 fxIQ==
X-Gm-Message-State: AOAM5300sTfl8GuYaCp4WPcVcJ4cyza2X7PoSI1TBJcVZYzwA6yMCUwX
 L+hAvBd9qA7ejycxZHfBCkSB6kxPew==
X-Google-Smtp-Source: ABdhPJyjX1+wO5hyGV3g2v/BQHcjESE2gsWA9W9Ke9+7b6wyQJsyc0STPcQ+YQyGpmdVfbKRm8sSqg==
X-Received: by 2002:a5e:d519:: with SMTP id e25mr1841622iom.36.1596488495414; 
 Mon, 03 Aug 2020 14:01:35 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:34 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 07/27] PCI: dwc: tegra: Use pci_ops for root config space
 accessors
Date: Mon,  3 Aug 2020 15:00:56 -0600
Message-Id: <20200803210116.3132633-8-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170136_902687_645A5F67 
X-CRM114-Status: GOOD (  19.15  )
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

Now that DWC drivers can setup their own pci_ops for the root and child
buses, convert the Tegra driver to use the standard pci_ops for root
bus config accesses.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 30 ++++++++++++----------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 92b77f7d8354..52bb145c42d1 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -568,42 +568,44 @@ static irqreturn_t tegra_pcie_ep_hard_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int tegra_pcie_dw_rd_own_conf(struct pcie_port *pp, int where, int size,
-				     u32 *val)
+static int tegra_pcie_dw_rd_own_conf(struct pci_bus *bus, u32 devfn, int where,
+				     int size, u32 *val)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-
 	/*
 	 * This is an endpoint mode specific register happen to appear even
 	 * when controller is operating in root port mode and system hangs
 	 * when it is accessed with link being in ASPM-L1 state.
 	 * So skip accessing it altogether
 	 */
-	if (where == PORT_LOGIC_MSIX_DOORBELL) {
+	if (!PCI_SLOT(devfn) && where == PORT_LOGIC_MSIX_DOORBELL) {
 		*val = 0x00000000;
 		return PCIBIOS_SUCCESSFUL;
 	}
 
-	return dw_pcie_read(pci->dbi_base + where, size, val);
+	return pci_generic_config_read(bus, devfn, where, size, val);
 }
 
-static int tegra_pcie_dw_wr_own_conf(struct pcie_port *pp, int where, int size,
-				     u32 val)
+static int tegra_pcie_dw_wr_own_conf(struct pci_bus *bus, u32 devfn, int where,
+				     int size, u32 val)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-
 	/*
 	 * This is an endpoint mode specific register happen to appear even
 	 * when controller is operating in root port mode and system hangs
 	 * when it is accessed with link being in ASPM-L1 state.
 	 * So skip accessing it altogether
 	 */
-	if (where == PORT_LOGIC_MSIX_DOORBELL)
+	if (!PCI_SLOT(devfn) && where == PORT_LOGIC_MSIX_DOORBELL)
 		return PCIBIOS_SUCCESSFUL;
 
-	return dw_pcie_write(pci->dbi_base + where, size, val);
+	return pci_generic_config_write(bus, devfn, where, size, val);
 }
 
+static struct pci_ops tegra_pci_ops = {
+	.map_bus = dw_pcie_own_conf_map_bus,
+	.read = tegra_pcie_dw_rd_own_conf,
+	.write = tegra_pcie_dw_wr_own_conf,
+};
+
 #if defined(CONFIG_PCIEASPM)
 static void disable_aspm_l11(struct tegra_pcie_dw *pcie)
 {
@@ -970,6 +972,8 @@ static int tegra_pcie_dw_host_init(struct pcie_port *pp)
 	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
 	u32 val, tmp, offset, speed;
 
+	pp->bridge->ops = &tegra_pci_ops;
+
 	tegra_pcie_prepare_host(pp);
 
 	if (dw_pcie_wait_for_link(pci)) {
@@ -1057,8 +1061,6 @@ static const struct dw_pcie_ops tegra_dw_pcie_ops = {
 };
 
 static struct dw_pcie_host_ops tegra_pcie_dw_host_ops = {
-	.rd_own_conf = tegra_pcie_dw_rd_own_conf,
-	.wr_own_conf = tegra_pcie_dw_wr_own_conf,
 	.host_init = tegra_pcie_dw_host_init,
 	.set_num_vectors = tegra_pcie_set_msi_vec_num,
 };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
