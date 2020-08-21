Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422C2C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 03:58:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F419020714
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 03:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bxlgVDYt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F419020714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AesBe7aPLZ7k9fXPYkm7/7R8WCsL/bV2zAjGrtNkRYI=; b=bxlgVDYt3cXFWcB1t8oFXJLRt
	BYtZdWhAfzZdt2cIa+lTNtfcLlsMJTKWoXQP/OtyznwuxGfltwAgABEi6Y8KS4i7XV809uktKV57C
	7EEbNSCqRGtPVotwz3wCeNYapzhOx8P/xINtsJBO1U5PVvHj6eT3vZJMnzNTXS07o5qoOrB5yGdJp
	izWHVywtpbpCVhX6/D/Q4QqaAkAav650PWnrxbw4samPtrsFwlXlBKblTk1S6vk5fOUZJwicA+ipQ
	UPLaflISXySVLjjbclEdRbbkF/ShIcq2ADwxipLSkogWOeJh+c3Bq7tHH5z8MS2gA1vTiQz54oCkK
	FgL+1OnjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yC0-0005kh-OB; Fri, 21 Aug 2020 03:58:17 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y8X-0004K7-TA; Fri, 21 Aug 2020 03:54:56 +0000
Received: by mail-il1-f196.google.com with SMTP id 77so337072ilc.5;
 Thu, 20 Aug 2020 20:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f/IvjYa5DXUibjLWw7waxronaC1wa8EQJH9Sk/FD8us=;
 b=O+5fpwmeW5mdDy7ovkseC6R2L9qNgkeGOdio9EshCZ+pOxpxKs2FSezrvlgVfaRDqW
 y1ydQPGTbiSdopyvQbK4xlIXCLC0pHSZVgtICU0QK1MfcId6D/yWo7N7aDO3UJrFOP3M
 w4ZLbRG5v8Jtp/PZldBvOQC6LagT+DLOxBh2heg/ifgSJ28zaUwsPpUYyi+96sIoHy8z
 E5J3iGUFiUGRQ61nIzbxXX6z+OHy0HOgKJSuR3cD09EEPV0XlRnwkxOygbEIQ1JoknTh
 YfuLgYiq+czXkN2yCK6lQAahWSzNsZ8M7Etsc3vSwD1gBzW/vYs0BoxUJX0DSaayjOmv
 L3Rg==
X-Gm-Message-State: AOAM532EHxvoh/Gh0jXBPv1r1HNQGCZeLbT3GUcFnJTzw9GqqM1huy/0
 89AkAAAMbVPfXdZ1fzd05g==
X-Google-Smtp-Source: ABdhPJzx1XUyo1pUb5w9dpeKbEN5h9j21HHKo9Ua9s8saE1f+uVstVEcWcw/FzmtX5xjumcHr7w9jg==
X-Received: by 2002:a92:ab0e:: with SMTP id v14mr921076ilh.35.1597982080411;
 Thu, 20 Aug 2020 20:54:40 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:54:39 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 03/40] PCI: dwc: Allow overriding bridge pci_ops
Date: Thu, 20 Aug 2020 21:53:43 -0600
Message-Id: <20200821035420.380495-4-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235442_375094_AF933A24 
X-CRM114-Status: GOOD (  19.58  )
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

In preparation to allow drivers to set their own root and child pci_ops
instead of using the DWC specific config space ops, we need to make
the pci_host_bridge pointer available and move setting the bridge->ops
and bridge->child_ops pointer to before the .host_init() hook.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 15 ++++++++++-----
 drivers/pci/controller/dwc/pcie-designware.h      |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 1d98554db009..b626cc7cd43a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -344,6 +344,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	if (!bridge)
 		return -ENOMEM;
 
+	pp->bridge = bridge;
+
 	/* Get the I/O and memory ranges from DT */
 	resource_list_for_each_entry(win, &bridge->windows) {
 		switch (resource_type(win->res)) {
@@ -445,6 +447,10 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		}
 	}
 
+	/* Set default bus ops */
+	bridge->ops = &dw_pcie_ops;
+	bridge->child_ops = &dw_pcie_ops;
+
 	if (pp->ops->host_init) {
 		ret = pp->ops->host_init(pp);
 		if (ret)
@@ -452,7 +458,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	}
 
 	bridge->sysdata = pp;
-	bridge->ops = &dw_pcie_ops;
 
 	ret = pci_scan_root_bus_bridge(bridge);
 	if (ret)
@@ -654,11 +659,11 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
 
 	/*
-	 * If the platform provides ->rd_other_conf, it means the platform
-	 * uses its own address translation component rather than ATU, so
-	 * we should not program the ATU here.
+	 * If the platform provides its own child bus config accesses, it means
+	 * the platform uses its own address translation component rather than
+	 * ATU, so we should not program the ATU here.
 	 */
-	if (!pp->ops->rd_other_conf) {
+	if (pp->bridge->child_ops == &dw_pcie_ops && !pp->ops->rd_other_conf) {
 		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REGION_INDEX0,
 					  PCIE_ATU_TYPE_MEM, pp->mem_base,
 					  pp->mem_bus_addr, pp->mem_size);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f911760dcc69..8b8ea5f3e7af 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -200,6 +200,7 @@ struct pcie_port {
 	u32			num_vectors;
 	u32			irq_mask[MAX_MSI_CTRLS];
 	struct pci_bus		*root_bus;
+	struct pci_host_bridge  *bridge;
 	raw_spinlock_t		lock;
 	DECLARE_BITMAP(msi_irq_in_use, MAX_MSI_IRQS);
 };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
