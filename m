Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8613CC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:05:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC5B20738
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZv1fI8p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FC5B20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NRZbhDf+ZZ8gCxWGe+X2zvYLHc5WyCq4nOy2oxfHTXM=; b=mZv1fI8p/YpMLiE5kesFKO3CN
	bWDUGmanFKlGSYFlUy5FCNch2lvVEBbL1mejTmX8xJ0eSNvLnM7COj7r3zk+iEbebLENZXV/m/6fe
	UGcNjgfU9AfcZ7EPesFWFC10XBFEL1z+7qVxk7bqPgqkZKw/31zyChE+GUtFnYqZNNs8zIVvMENwH
	HfkV3KW70mtdKDyz2TYMur6o38sVmYYXzsZOUFxC1uy74WNaNNVsNgUYwU9LZu4TS7l1gQ3VbqEbS
	ZqFFyxDCRAI7WBKuZPpQgLghfFlObn18jtVTfOy1zxPyAST/3oegpS6268YJ6Yyqpj3QNedlwq8+A
	TLhRBcQ1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hdu-0002Dr-5H; Mon, 03 Aug 2020 21:05:10 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2hau-0000H7-DI; Mon, 03 Aug 2020 21:02:05 +0000
Received: by mail-io1-f68.google.com with SMTP id s189so32773471iod.2;
 Mon, 03 Aug 2020 14:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KBszrZoR6KfV8PIUJ9TAD0pOH/WhVXS7vLHSzuibxQI=;
 b=DqsMOFERQu6TtUVu0unI7iJEk+YeV/4hjP5TzHe4L6Wnu2Ikezp/1H9V3nZBsfrq7m
 iL4rhm8gAYheQSctx1du73AbohBZyOjC90OLDUbsdCAQd1saGpblldId3uQGfmUOk77L
 vH9wEY/kXrfAJ3qLBF30oQ7DmboPMkp8stLcV0MeYxQkVJ1RJq9evJKutCezmtoCKRwN
 WiRkKuL2zs/TX2+5UwG6UtLiTSbGHqXhPslFmaScK8Hadr0rmMNxBRkol06Xi0fxnb+i
 rS7kyd5f/vhsJitZA4ZfH9Ox7ckqNOMtjTFmfsh4Gy+XhlzJ8t0l9J6IMhDbU9p5mtVx
 0Dvw==
X-Gm-Message-State: AOAM530lHYLZlPWvJ0HW4mobjwgx28RF+anGlf2sz6GSiNwe1iByk8rH
 /9HZnj3Mr6AmEEe8HzNLjg==
X-Google-Smtp-Source: ABdhPJwRuSSPOninoBNPo5aHkonSJpYI9fAmTlwclA+BVNVifs96k/azUtlQrFpO1XKMGj3SdjN9iw==
X-Received: by 2002:a02:c735:: with SMTP id h21mr1877476jao.90.1596488523308; 
 Mon, 03 Aug 2020 14:02:03 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:02:02 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 17/27] PCI: dwc: Remove root_bus pointer
Date: Mon,  3 Aug 2020 15:01:06 -0600
Message-Id: <20200803210116.3132633-18-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170204_594885_C86993D3 
X-CRM114-Status: GOOD (  16.34  )
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
index dc336163104a..9528c8b1c9ab 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -459,8 +459,8 @@ EXPORT_SYMBOL_GPL(dw_pcie_host_init);
 
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
index 10d22269254a..67aac6fdca24 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -193,7 +193,6 @@ struct pcie_port {
 	struct irq_chip		*msi_irq_chip;
 	u32			num_vectors;
 	u32			irq_mask[MAX_MSI_CTRLS];
-	struct pci_bus		*root_bus;
 	struct pci_host_bridge  *bridge;
 	raw_spinlock_t		lock;
 	DECLARE_BITMAP(msi_irq_in_use, MAX_MSI_IRQS);
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 52bb145c42d1..c567c9c09ff6 100644
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
