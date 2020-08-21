Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95ADC433EB
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725A821741
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mBNp4721"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 725A821741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Evgvucj0eYBkw4Bymq1RDhG5i+qATEwBvhgQC/cT3JI=; b=mBNp4721CfpYvogS52i5I9vCy
	P7WAGKcx9ZtUjiCC7lzslTof+sUY1Pd5987M5EFCaojGGHRPzuWYiQDXq7rRSHfnvl3NR21Tp4B+V
	8EqaMK5mXOhh/tim3Bmykl02/MsKhAbl56NYPoB78JvGsbWLLMIf1B8/3YmT8BrrYm/XE4l/R8vUn
	OBmnVf89nnmoxzcoRe2utePGc2y8R9/kW/YjEHDoA+84KkH7UV2vG6z2WX71iD/WoKAQMJnKQ/Xlt
	VFFJ5tqc3c0kPk5p3H8l69ZAtRjXFYcx0X5Wt8WVxFVpIOreM7NisxOax0wdsWx4GPdoycMa5IEk1
	etbzkE0IQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8zEY-0005lY-7O; Fri, 21 Aug 2020 05:04:58 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9O-0004gQ-Iq; Fri, 21 Aug 2020 03:55:46 +0000
Received: by mail-io1-f65.google.com with SMTP id q75so487181iod.1;
 Thu, 20 Aug 2020 20:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eFXUpgtvn+rwMzgxFaofhzgT1ZGHQN0vFhCrA/SPcm0=;
 b=VvgAj9KgWBh4CfZYqLUT3YJ/hyreZOQy/HcYR9ZCXQDQzz/P9au+Lsh80tUWeAjKcH
 cm26d4tcw4licBT/MolvApBtfanXG2xDp9rTobsh0FUHHjPX8tzUaNsjATbyngfeec/a
 Fws70kdCEpqwHyXyFGi7CKwM6rqlxftfcMykBokOHos7dN+Q/sYT9KUEQ1/0HDQIrOLo
 5jrh8RspzRcf6xtjz4NNd7Twi0/c5WtL1FhBr2Rs9FFgk90yrCdQ4HMYAdmRVdXCxxmJ
 1l97fQbJvVj6+ex14dRCdCeljn0uAOwX7vp/TlsXcyOsF6ciPcA16exVUcq+yhzXmfN0
 PKMA==
X-Gm-Message-State: AOAM53153FLg8EF5fRiCizhDke7MoavWYuNgbE5uLFQ/LBUiBb1bi5hG
 Uy3LAhJ5YKXaC86Hts16CA==
X-Google-Smtp-Source: ABdhPJz9Cz36+anjfd85YKbaf2q062W+zrGMwvr+OxCyKKkArm368LLNcvPDR62l3V/N8uzBXYzXxw==
X-Received: by 2002:a05:6602:13d3:: with SMTP id
 o19mr929935iov.32.1597982131299; 
 Thu, 20 Aug 2020 20:55:31 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:30 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 17/40] PCI: dwc: Remove root_bus pointer
Date: Thu, 20 Aug 2020 21:53:57 -0600
Message-Id: <20200821035420.380495-18-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235534_937186_63AB250C 
X-CRM114-Status: GOOD (  16.84  )
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

The pci_host_bridge struct already has a pointer to its pci_bus, so
let's convert the one user to use the bridge struct and remove the
private 'root_bus' pointer.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 4 ++--
 drivers/pci/controller/dwc/pcie-designware.h      | 1 -
 drivers/pci/controller/dwc/pcie-tegra194.c        | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 42b13a7a7383..0f348b951ec3 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -448,8 +448,8 @@ EXPORT_SYMBOL_GPL(dw_pcie_host_init);
 
 void dw_pcie_host_deinit(struct pcie_port *pp)
 {
-	pci_stop_root_bus(pp->root_bus);
-	pci_remove_root_bus(pp->root_bus);
+	pci_stop_root_bus(pp->bridge->bus);
+	pci_remove_root_bus(pp->bridge->bus);
 	if (pci_msi_enabled() && !pp->ops->msi_host_init)
 		dw_pcie_free_msi(pp);
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 6cd61892f24f..78243909d2c5 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -192,7 +192,6 @@ struct pcie_port {
 	struct irq_chip		*msi_irq_chip;
 	u32			num_vectors;
 	u32			irq_mask[MAX_MSI_CTRLS];
-	struct pci_bus		*root_bus;
 	struct pci_host_bridge  *bridge;
 	raw_spinlock_t		lock;
 	DECLARE_BITMAP(msi_irq_in_use, MAX_MSI_IRQS);
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index b723c9f3ece4..a5dce56b3b7a 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1264,9 +1264,9 @@ static void tegra_pcie_downstream_dev_to_D0(struct tegra_pcie_dw *pcie)
 	 * 5.2 Link State Power Management (Page #428).
 	 */
 
-	list_for_each_entry(child, &pp->root_bus->children, node) {
+	list_for_each_entry(child, &pp->bridge->bus->children, node) {
 		/* Bring downstream devices to D0 if they are not already in */
-		if (child->parent == pp->root_bus) {
+		if (child->parent == pp->bridge->bus) {
 			root_bus = child;
 			break;
 		}
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
