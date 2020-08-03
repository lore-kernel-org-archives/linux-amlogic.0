Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3D2C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:04:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C66E22BED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GBl0FhMX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C66E22BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LbZnvSo/92FTy/bGHdaapMprv3QYGa40YDHjMEoOt6I=; b=GBl0FhMXJWjuXsV2Ou8PhcX2+
	rXpDSsq1BeNHzshrQyP2ASjUq8EotXOR4yc9sWnnxqeOGEGILMJY2ryHczbjcEpHyLP/M8THsi80/
	W9N6iqSG6yPa/aFZfBy/npEBBJsh+G1ZA46WNq1fMLGhx1IFVXOHAaqk2pZwVGLsIxWze0ElGwr59
	SCc1qoMljKN+vfhXHYY8olPmbe5wjvzTQyntWZgbbgc4N9UJc16cwZtdHypFrPmTmHL7hHucAmV+5
	A1Xq7ZrbzJsmvgca4q0k/ph/KUKAt/xka+VfLugIbzcuZI5bosokBemWkzbJLOKy3knjxEnmxmEJJ
	z1IlDvV2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hd9-0001fu-9T; Mon, 03 Aug 2020 21:04:23 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2has-0000Fr-Cd; Mon, 03 Aug 2020 21:02:03 +0000
Received: by mail-il1-f195.google.com with SMTP id x1so12027337ilp.7;
 Mon, 03 Aug 2020 14:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+aVzUrW/b+OR7PsyqkF7d3uV9W2kuObPvJUPmZOvAKM=;
 b=CfOyGVu3LVPdvlfrp4Y+pgt0h40zRESmg6rwKGxAiHB2gh/D/T8zLHgxqxB9+v6jkB
 7HFEKXsqQdFv7KmcSSDn3uQGY9igeTPsRsJBlLPBP9NFWtyGBVGKIjJpxWWQOFLDD0pc
 Tab4sZj/XFNdMdfFUGFUV7fQ25eOJM4V/VwMOGYFbcDrR4QN94ErVy1Sr17NjN+6gcVe
 EsnJ4KHNh6GGQxRVexj+1Jn7Sx4mO+H6OzE5VseJ7Wv1/dntDA9rqQeRIoxHM+DRLR/1
 6mm7fIvS/EbBnYNpbsTZKAKGXnsI55L2OJ9lTTYqJHq5chpjP0+SnxBzZ1q8Dg3Dmvun
 qKKQ==
X-Gm-Message-State: AOAM530l6JZsgUxCLI/HwhudHj3sMvRD12xPNkaVWPpECICXewjTUvIR
 JWIajYJ6wX19LilTZZVfHg==
X-Google-Smtp-Source: ABdhPJzvMiwNh6mYspCSiLag2A19Z5Dkvf/eGkppl3qfixJbFF7IVuurRzwNE2IrpB0eB0YCgBL/0A==
X-Received: by 2002:a92:c883:: with SMTP id w3mr1144796ilo.2.1596488521305;
 Mon, 03 Aug 2020 14:02:01 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:02:00 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 16/27] PCI: dwc: Convert to use pci_host_probe()
Date: Mon,  3 Aug 2020 15:01:05 -0600
Message-Id: <20200803210116.3132633-17-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170202_484470_67CDC719 
X-CRM114-Status: GOOD (  16.27  )
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

Now that there are no more .scan_bus() callbacks, we can remove it and just
use pci_host_probe().

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../pci/controller/dwc/pcie-designware-host.c | 21 +++----------------
 drivers/pci/controller/dwc/pcie-designware.h  |  1 -
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index e9778f8ee955..dc336163104a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -300,7 +300,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	struct device_node *np = dev->of_node;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource_entry *win;
-	struct pci_bus *child;
 	struct pci_host_bridge *bridge;
 	struct resource *cfg_res;
 	int ret;
@@ -447,23 +446,9 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
 
-	ret = pci_scan_root_bus_bridge(bridge);
-	if (ret)
-		goto err_free_msi;
-
-	pp->root_bus = bridge->bus;
-
-	if (pp->ops->scan_bus)
-		pp->ops->scan_bus(pp);
-
-	pci_bus_size_bridges(pp->root_bus);
-	pci_bus_assign_resources(pp->root_bus);
-
-	list_for_each_entry(child, &pp->root_bus->children, node)
-		pcie_bus_configure_settings(child);
-
-	pci_bus_add_devices(pp->root_bus);
-	return 0;
+	ret = pci_host_probe(bridge);
+	if (!ret)
+		return 0;
 
 err_free_msi:
 	if (pci_msi_enabled() && !pp->ops->msi_host_init)
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 28e7ad3eb89f..10d22269254a 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -161,7 +161,6 @@ enum dw_pcie_device_mode {
 
 struct dw_pcie_host_ops {
 	int (*host_init)(struct pcie_port *pp);
-	void (*scan_bus)(struct pcie_port *pp);
 	void (*set_num_vectors)(struct pcie_port *pp);
 	int (*msi_host_init)(struct pcie_port *pp);
 };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
