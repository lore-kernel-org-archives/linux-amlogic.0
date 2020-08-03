Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26293C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:03:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC98F22BED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:03:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="spxJDyyV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC98F22BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2L1t/Bp3U3a2g105Qij1J9Jjb1hI/wA8U7BVRmkW/Dk=; b=spxJDyyVeF+40bRX9eXDRG9pc
	h1kzljN1CTSfWp1maPz+GCjMyQXJ+GIRIbGWDCBPY8Qup02tCo6OM+4301ro99bXdsGKMUSXoLVXU
	fbxoKqtDz/np1KBET72SFE5QG8L+zZsYHA9+9CGpc6IR0XPpggFnuWnFKEB75X4SRyG2ffH1hr7qx
	DPsrJvOyH5Ogh1ZsAngaIJRavpJgROm8u35SXJSC35L2r5e4h2tUTLn91GcFHhlwPTclgvdx8lQg3
	NPBTV96XUD14GaqvWqp3QPoGcv/tpy+YoTsRpZs74zIRYe1UUpOwOD4jImn6HNEZ0vyzYAcI+Ry65
	QmHb7RhGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hc8-000100-67; Mon, 03 Aug 2020 21:03:20 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2hab-00005c-Ip; Mon, 03 Aug 2020 21:01:46 +0000
Received: by mail-io1-f68.google.com with SMTP id s189so32772460iod.2;
 Mon, 03 Aug 2020 14:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cgcVbPqzxoZQ8BD2LBqh5z0DmxU5aGMCc3S38te1hMk=;
 b=Kmttq/H2jMrR9JIEPM7pD4AE/DpmJ+e6x3DCzzOUYWf954HYpWcCqK6r1lTHnjioGX
 tHfbGMh5l3ShD9ltn49mVl9bZu+7mJmLEGESKwUseeac7gm0pdte/NkShxAXzLTkFy1H
 nUy5j1KnFCpCv+vw+XZiQEHCnAEJ/ogod2xTq3z94jTGY9QP1JtT1+Qm1CSDxyDigsT9
 /O1acsZOmXpaf6YBnUM3vV4326P883D2FVb1S5ysHXnFI1wrCUew67pA3leXw3f5VzA7
 /WzAYzmbdCnjKErP2enM7qvCHjuPhj6H/E6qBNAKEO3YG8gKlln+JnuScp46PT2a/+Bl
 05WQ==
X-Gm-Message-State: AOAM531viZX2ryLmlwrDzwcB/HH0wctJOQal9uYG8FLE5JBOzno+YLwu
 W9aYcUUd4cFtAz0TZYoZ+A==
X-Google-Smtp-Source: ABdhPJwZ2v3QRbVXEHElHg+0cQOqL+nUwqS+NoWUw+dR20bJGFNYxn6FK+LKQ0Ij90nYJuTJGr2nyQ==
X-Received: by 2002:a05:6638:1690:: with SMTP id
 f16mr1822826jat.91.1596488504104; 
 Mon, 03 Aug 2020 14:01:44 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:43 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 11/27] PCI: dwc: histb: Use pci_ops for root config space
 accessors
Date: Mon,  3 Aug 2020 15:01:00 -0600
Message-Id: <20200803210116.3132633-12-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170145_708643_DB2630F5 
X-CRM114-Status: GOOD (  17.02  )
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
 Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that DWC drivers can setup their own pci_ops for the root and child
buses, convert the HiSilicon histb driver to use the standard pci_ops
for root bus config accesses.

Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-histb.c | 41 ++++++++++++++-----------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index 811b5c6d62ea..0d93088deea3 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -122,32 +122,37 @@ static void histb_pcie_write_dbi(struct dw_pcie *pci, void __iomem *base,
 	histb_pcie_dbi_w_mode(&pci->pp, false);
 }
 
-static int histb_pcie_rd_own_conf(struct pcie_port *pp, int where,
-				  int size, u32 *val)
+static int histb_pcie_rd_own_conf(struct pci_bus *bus, unsigned int devfn,
+				  int where, int size, u32 *val)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	int ret;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(bus->sysdata);
 
-	histb_pcie_dbi_r_mode(pp, true);
-	ret = dw_pcie_read(pci->dbi_base + where, size, val);
-	histb_pcie_dbi_r_mode(pp, false);
+	if (PCI_SLOT(devfn)) {
+		*val = ~0;
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	}
 
-	return ret;
+	*val = dw_pcie_read_dbi(pci, where, size);
+	return PCIBIOS_SUCCESSFUL;
 }
 
-static int histb_pcie_wr_own_conf(struct pcie_port *pp, int where,
-				  int size, u32 val)
+static int histb_pcie_wr_own_conf(struct pci_bus *bus, unsigned int devfn,
+				  int where, int size, u32 val)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	int ret;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(bus->sysdata);
 
-	histb_pcie_dbi_w_mode(pp, true);
-	ret = dw_pcie_write(pci->dbi_base + where, size, val);
-	histb_pcie_dbi_w_mode(pp, false);
+	if (PCI_SLOT(devfn))
+		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	return ret;
+	dw_pcie_write_dbi(pci, where, size, val);
+	return PCIBIOS_SUCCESSFUL;
 }
 
+static struct pci_ops histb_pci_ops = {
+	.read = histb_pcie_rd_own_conf,
+	.write = histb_pcie_wr_own_conf,
+};
+
 static int histb_pcie_link_up(struct dw_pcie *pci)
 {
 	struct histb_pcie *hipcie = to_histb_pcie(pci);
@@ -194,6 +199,8 @@ static int histb_pcie_establish_link(struct pcie_port *pp)
 
 static int histb_pcie_host_init(struct pcie_port *pp)
 {
+	pp->bridge->ops = &histb_pci_ops;
+
 	histb_pcie_establish_link(pp);
 
 	if (IS_ENABLED(CONFIG_PCI_MSI))
@@ -203,8 +210,6 @@ static int histb_pcie_host_init(struct pcie_port *pp)
 }
 
 static const struct dw_pcie_host_ops histb_pcie_host_ops = {
-	.rd_own_conf = histb_pcie_rd_own_conf,
-	.wr_own_conf = histb_pcie_wr_own_conf,
 	.host_init = histb_pcie_host_init,
 };
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
