Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D29DC433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:04:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D003222BED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:04:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LeQfDAl3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D003222BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ib2bEuE+HRrqBo3oC4kLhF9dNhapueUia+SWw38uyOA=; b=LeQfDAl385s0skuwGx2OAiUZy
	GYtL0DZNytdGL2KmGn4pdTRuR4jkfJgMyyIeM/UJwo+zXBdaqIVsYE4MBCgBZUbkj0F0Xg3GkrR2B
	SoVI8gITwCBn5v0NZkVh8Eg7GYbSH/Kd/G2lNveXY8szSUlfJ2KSrY1zXgVtF4FT0VmkxNQRdFU8U
	d5nWeSGIQBsHi34DklmW9L4IYOauzeG4V0f7k0C40OUcaFA+UPsvN/+VCQQ7+ePT+WFoEvrOqb312
	Cj73ncnwye1ZOmYgTNsOvYtPXiMbyHwDSuUyyxiuZj+vNBcl4vIjPwGNcfxTDnKuPa+BOCgMaEs1q
	P1w3nEctg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hd7-0001ei-0r; Mon, 03 Aug 2020 21:04:21 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haq-0000E6-KM; Mon, 03 Aug 2020 21:02:02 +0000
Received: by mail-io1-f66.google.com with SMTP id g14so2508208iom.0;
 Mon, 03 Aug 2020 14:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+G09sVWmLiEk+qlmhnIPsi/B/n4JiVilLbMwDzTJ8Fc=;
 b=bYjYLZ5f1HrsYMeKuvvswoViluGVBDoVg6thDfGgsjFaXyFUfcXBlLbMCJsFXC06g7
 htHZ7+JBh5mc6w0M6AUjiAhiNKn9UO5aWpCjCTpWzrQHWLlTnkIdISnhLQytnmTZvvjh
 YCGGgQ06AK3PYjWvXAupWAE1mGtPLbYRFSdCNApxYgmNLf5bRSgiFjxjK+QeAoIAsq2z
 8oOpu8CzYAV4DxipAeOIhUE8fjBKnQSDm8ogy8ifAQNEiG5linGLNGsi4wo5Sb3xWqNq
 9Do1QgBKY5jMAv985cYotw986oHebyBFULSVEFainHlHorUUW71twkEzuBZJ2T2P0tnN
 KiTA==
X-Gm-Message-State: AOAM531kl8ztCL0zV/fuuKbYpSdhgb8NcLuAG1erTy/Nb5ke5fXZnSvJ
 NfJznAJKgF5eH3jWHjedfw==
X-Google-Smtp-Source: ABdhPJwMMkdyajQxcuVfgyMatvkAGgozf6l/jhIrQdnBe0B3HLM8TfQxbxa+NUmVrm7WcBb9dbLq7Q==
X-Received: by 2002:a5e:c311:: with SMTP id a17mr1821353iok.12.1596488518872; 
 Mon, 03 Aug 2020 14:01:58 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:58 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 15/27] PCI: dwc: keystone: Convert .scan_bus() callback to use
 add_bus
Date: Mon,  3 Aug 2020 15:01:04 -0600
Message-Id: <20200803210116.3132633-16-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170200_832627_0AEE24A9 
X-CRM114-Status: GOOD (  16.61  )
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

TI keystone is the only Designware driver using .scan_bus(). This
function pointer is the only thing preventing the Designware driver from
using pci_host_probe(). Let's use the pci_ops.add_bus hook instead.

Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-keystone.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index df1194d186bc..17271b21fb7d 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -454,15 +454,19 @@ static struct pci_ops ks_child_pcie_ops = {
 };
 
 /**
- * ks_pcie_v3_65_scan_bus() - keystone scan_bus post initialization
+ * ks_pcie_v3_65_add_bus() - keystone add_bus post initialization
  *
  * This sets BAR0 to enable inbound access for MSI_IRQ register
  */
-static void ks_pcie_v3_65_scan_bus(struct pcie_port *pp)
+static int ks_pcie_v3_65_add_bus(struct pci_bus *bus)
 {
+	struct pcie_port *pp = bus->sysdata;
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
 
+	if (!pci_is_root_bus(bus))
+		return 0;
+
 	/* Configure and set up BAR0 */
 	ks_pcie_set_dbi_mode(ks_pcie);
 
@@ -477,12 +481,15 @@ static void ks_pcie_v3_65_scan_bus(struct pcie_port *pp)
 	  * be sufficient.  Use physical address to avoid any conflicts.
 	  */
 	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_0, ks_pcie->app.start);
+
+	return 0;
 }
 
 static struct pci_ops ks_pcie_ops = {
 	.map_bus = dw_pcie_own_conf_map_bus,
 	.read = pci_generic_config_read,
 	.write = pci_generic_config_write,
+	.add_bus = ks_pcie_v3_65_add_bus,
 };
 
 /**
@@ -842,7 +849,6 @@ static int __init ks_pcie_host_init(struct pcie_port *pp)
 static const struct dw_pcie_host_ops ks_pcie_host_ops = {
 	.host_init = ks_pcie_host_init,
 	.msi_host_init = ks_pcie_msi_host_init,
-	.scan_bus = ks_pcie_v3_65_scan_bus,
 };
 
 static const struct dw_pcie_host_ops ks_pcie_am654_host_ops = {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
