Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617F8C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FC1221741
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AAJxP59l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FC1221741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pl4hR5SI7XeHsvUTUeu22RaU9SdvyjMZ2ictLrGWv6Y=; b=AAJxP59l3Q9NuAfuplbJwx0gp
	tNR51xVps/n+DQwo5a5Wel3w2qqjLeDlIaEG7bzDh4tLiDkJm05DWkKlqdNr3Mdsz44k/LMCAAcjg
	Udpzz04F5StLhfe1lp6VdK5ebeVxWd7LRMRTC9mpK3O06Y21fsZcFYnvCbkYPWlMrHe+40IRY/oNh
	5hJa6UVCNvj0Yap52fli6aC+dd5BUrf6M8eFSBGAQyt1cIHPgNO//e8hNFv2eiWNK+3IM4OYoyRU4
	ajsoyQft2bK5j32pUxncWUVUAfDXDVbtSrjRY4FTSm4IR9ymGQCi+Y8CRO67Ty873iDEiMMZPNfkO
	Xk3vX+jGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8zEW-0005kq-GA; Fri, 21 Aug 2020 05:04:56 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9E-0004dt-Oa; Fri, 21 Aug 2020 03:55:40 +0000
Received: by mail-il1-f193.google.com with SMTP id 77so337909ilc.5;
 Thu, 20 Aug 2020 20:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0qdov0F91JWjBX0RDvms+7RoXkdqALpZh74Eq1hAWng=;
 b=GW+4lnRCLxhhElgZ72QF6Tbefby9+poZJCS7qETqAwTEvg4lTzJW188ZdELyDKRKiy
 wspE6KKolMqaZosVpfgV9f7tDUhM8UqV3dBsFqkq3EUtFnRbcXmVX95IH8Ud4jroehiq
 JGG3RwHbbPQ8k60zYwR3qOudxzdiok8mCsls3N9BAIof5rB+uBYxD4BWK61DV0H6bNal
 ixl5v85IVnrIhFUmUv2tk2pRgzqYfCWF7ohImcev7HmM7rTZkK6Yjdw0umUtT9TV5W0S
 P8rvGQYH0fTG+NGd7Hpeh9SAaNPv7qCez/zVu+I6EA5mkPIJONGfVJSoeODEfW11sOAF
 8Uvg==
X-Gm-Message-State: AOAM531PdBL3t4Uj34HGOMvYD5D6OgtDgSf4j9mutOP0yoVoy03Kqq4p
 WJXX9AiR2rsyOdxm0uLPsg==
X-Google-Smtp-Source: ABdhPJxWfa3WQm5y8iByx2YiSDizCP8lwHMdCpOAAyhD1GwWnlqkAP+HsAEkjue1fkD8tbEL/F4XFg==
X-Received: by 2002:a92:dd85:: with SMTP id g5mr1026111iln.210.1597982124146; 
 Thu, 20 Aug 2020 20:55:24 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:23 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 15/40] PCI: dwc: keystone: Convert .scan_bus() callback to
 use add_bus
Date: Thu, 20 Aug 2020 21:53:55 -0600
Message-Id: <20200821035420.380495-16-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235525_372347_FA6F33B1 
X-CRM114-Status: GOOD (  16.89  )
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

TI keystone is the only Designware driver using .scan_bus(). This
function pointer is the only thing preventing the Designware driver from
using pci_host_probe(). Let's use the pci_ops.add_bus hook instead.

Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-keystone.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 2b0906e1e0d3..fd000384fd2a 100644
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
