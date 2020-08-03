Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4FAC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:03:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8978322BED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:03:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qMLmcKjB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8978322BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6ME7ST126PnK12crrCL3ugdla07VLjLrtxcw4eLV2+U=; b=qMLmcKjBYtpf845eFyroY27Ow
	sQ43+skGvNQZSRg/4vewktwjSNZaaoBcwxqGNiv4Fw/y8+G0vD4j6O4PxlRqE0rH6h3DnlnzUcZDS
	CgMuWih1XcUEISvpJ1CnYsm1KsL0u1LZps2MQiQladUvoYsWC5kOpC4e4Izy6RBL90t/xLdqsPsF+
	75IiNQMYMj4iyq8VKVziphIuHb5GTfbQ0k2c+aVoKBE5G0suuMRMXf7HTd4kJBSFqfFEwc28KC09V
	cVRS9jmtGbS31sHxFQH23AYie17ea3nApB9+YwTMsJPzn9hMCJT1ioj8Fqr5bdDQgqa6tzo/1GTP5
	VN+afo/4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hcH-000166-Lv; Mon, 03 Aug 2020 21:03:29 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haf-000088-Ny; Mon, 03 Aug 2020 21:01:52 +0000
Received: by mail-il1-f196.google.com with SMTP id 77so3879722ilc.5;
 Mon, 03 Aug 2020 14:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/8WdlxIj2tgo5PZc1xxYI0moFux1woMX4shol7l+Cw=;
 b=HF80X+0H28mZYH1MfCM5gB5EgiaaHSLP3l9z6LkbTr/S5TSeeBeScuH9TQb5XDefXJ
 E1y9YMe+QEFfOMMpn9BGfRPyCeKYtqNntp0/F5OPSqTcOzMOx/V8fjOXvea9JSh12lU8
 ALpYOTnlMAtJOsGp7AVPdjp62HVPn8p9k/3Sbm1ATGMHNx1dippbb8ZCox83oMJAtrre
 a1SA99yKNVwdWxMA4v2aH0U6gtaYY+UjAiAflns2P5BjEeMt+puYBNsnvjWix8UXj8/f
 gPKqiXxCqx1+kQ+LOT5rdljqMHnNJCRM0DloTuN3Hqm0DYwDItVCisCDapYRcR4RxH+z
 R1ow==
X-Gm-Message-State: AOAM533gzqLta/1Y99Hgcmvosfl7hWgsee2iLNIH4gzKmtr7GHDlaMeD
 mC2Ca1/ZrYWq6Vk6MAm+oQ==
X-Google-Smtp-Source: ABdhPJzrmbAcmNdnEbm0tgBp/5AY07aPIAywXllP5h77tMmzndDaOvLh9Qs6NLwuucPoLn76/UlYDA==
X-Received: by 2002:a05:6e02:ee9:: with SMTP id
 j9mr1332603ilk.163.1596488507637; 
 Mon, 03 Aug 2020 14:01:47 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:47 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 12/27] PCI: dwc: Remove dwc specific config accessor ops
Date: Mon,  3 Aug 2020 15:01:01 -0600
Message-Id: <20200803210116.3132633-13-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170149_873854_82B1E605 
X-CRM114-Status: GOOD (  13.39  )
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

Now that all the drivers needing custom config accessors have been
converted to define their own pci_ops, we can remove the DWC specific
function callbacks {rd,wr}_{own,other}_conf.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 14 --------------
 drivers/pci/controller/dwc/pcie-designware.h      |  6 ------
 2 files changed, 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index e9d31c341881..6e9f106e8e05 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -26,9 +26,6 @@ static int dw_pcie_rd_own_conf(struct pcie_port *pp, int where, int size,
 {
 	struct dw_pcie *pci;
 
-	if (pp->ops->rd_own_conf)
-		return pp->ops->rd_own_conf(pp, where, size, val);
-
 	pci = to_dw_pcie_from_pp(pp);
 	return dw_pcie_read(pci->dbi_base + where, size, val);
 }
@@ -38,9 +35,6 @@ static int dw_pcie_wr_own_conf(struct pcie_port *pp, int where, int size,
 {
 	struct dw_pcie *pci;
 
-	if (pp->ops->wr_own_conf)
-		return pp->ops->wr_own_conf(pp, where, size, val);
-
 	pci = to_dw_pcie_from_pp(pp);
 	return dw_pcie_write(pci->dbi_base + where, size, val);
 }
@@ -548,10 +542,6 @@ static int dw_pcie_access_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 static int dw_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 				 u32 devfn, int where, int size, u32 *val)
 {
-	if (pp->ops->rd_other_conf)
-		return pp->ops->rd_other_conf(pp, bus, devfn, where,
-					      size, val);
-
 	return dw_pcie_access_other_conf(pp, bus, devfn, where, size, val,
 					 false);
 }
@@ -559,10 +549,6 @@ static int dw_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 static int dw_pcie_wr_other_conf(struct pcie_port *pp, struct pci_bus *bus,
 				 u32 devfn, int where, int size, u32 val)
 {
-	if (pp->ops->wr_other_conf)
-		return pp->ops->wr_other_conf(pp, bus, devfn, where,
-					      size, val);
-
 	return dw_pcie_access_other_conf(pp, bus, devfn, where, size, &val,
 					 true);
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index dbe53e464e11..28e7ad3eb89f 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -160,12 +160,6 @@ enum dw_pcie_device_mode {
 };
 
 struct dw_pcie_host_ops {
-	int (*rd_own_conf)(struct pcie_port *pp, int where, int size, u32 *val);
-	int (*wr_own_conf)(struct pcie_port *pp, int where, int size, u32 val);
-	int (*rd_other_conf)(struct pcie_port *pp, struct pci_bus *bus,
-			     unsigned int devfn, int where, int size, u32 *val);
-	int (*wr_other_conf)(struct pcie_port *pp, struct pci_bus *bus,
-			     unsigned int devfn, int where, int size, u32 val);
 	int (*host_init)(struct pcie_port *pp);
 	void (*scan_bus)(struct pcie_port *pp);
 	void (*set_num_vectors)(struct pcie_port *pp);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
