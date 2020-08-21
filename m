Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEF7C433E8
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD53D21741
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 05:05:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YniBzDO6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD53D21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dgh56JG9rIGOA+93E1psf/6p0HcHi1zYFdAsQ2cPPp4=; b=YniBzDO6zB9ukfkkJpW5wGsLZ
	k2ibOlI+5rB/2ubcD0qcXOLb/91Dt9UVB+xmV+acJhC0VlsOvBY9kFeb28aR+C/fePj2ZyTzzRZxU
	ttop6HD51WjxSTVKjXasFAZ8kldeFP71worvQLH/AaqGAzSsIjn/SWgAXGr3jLR1XlIN5KZ+Hg8pD
	QDwMqC5j2VoMKmMC7GkRYoIxMQuDRX5ZEmiZj7+yWpI0ezmCt2uCsQ//ag7u09YR+/3biNfQdZCMw
	jtsJRwNIX+HsdPG025os6Lx71sRd9XEJpo6ubMYmR4Zp9jusfrL8MWN42u418AIVm7pUYrEg2s19l
	63pcqysxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8zEW-0005kf-0f; Fri, 21 Aug 2020 05:04:56 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y92-0004YJ-6A; Fri, 21 Aug 2020 03:55:36 +0000
Received: by mail-io1-f65.google.com with SMTP id s1so459876iot.10;
 Thu, 20 Aug 2020 20:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nFg1YpOXTjGvAAjYWr6Bj6FfzEbwYJGtjSsSCN/Mie0=;
 b=iGbZzPXOofyjE8IeI/hG6mJ/UngtrQW66dr0d6J+PmI8XTLAltpu+rpEeGaeHE379n
 ej1/P/Fy+fIBQZtDGfAWCc2diatLAmWZ0FFzLvd040UB2MJ3hRvkA9HCIFm9KV5frTaQ
 FDGnnTKorn1MkUt1YxlvSgsRz23MQlgTqXy94WdMm4oa+uiP2RhFR/aPDzWdGS+wG9lN
 22PtPu4tIfhYW1E5UomzbF8zLyQw2CqlbkTW7hsItosKYAru2I6KgObKUJRtaus6yQKq
 zte8ftxafRABeMuTaGxhcVts3BaECgCHJpVxY/hDJpJojJLZDl4vbw8+PyAt4RvDnDmo
 Idnw==
X-Gm-Message-State: AOAM531Naa7RDLBkWlrS/ml/BRgJb7oRJ0Xfhe6OYX9ks97ptjMhpaus
 V0NsFiokf/RK/HrMTuboFg==
X-Google-Smtp-Source: ABdhPJxYgLoP8TuODrHoVFznYdMs1PDoYAX/0YMmlaFkI6tCOH/kTSu793FCitBMJXoZOfNcnv5Smg==
X-Received: by 2002:a6b:dc0a:: with SMTP id s10mr898987ioc.18.1597982109347;
 Thu, 20 Aug 2020 20:55:09 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:08 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 09/40] PCI: dwc: kirin: Use pci_ops for root config space
 accessors
Date: Thu, 20 Aug 2020 21:53:49 -0600
Message-Id: <20200821035420.380495-10-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235512_433380_0318D17F 
X-CRM114-Status: GOOD (  17.86  )
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

Now that DWC drivers can setup their own pci_ops for the root and child
buses, convert the HiSilicon Kirin driver to use the standard pci_ops
for root bus config accesses.

Cc: Xiaowei Song <songxiaowei@hisilicon.com>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-kirin.c | 39 +++++++++++++------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index e496f51e0152..8a01ab0a4a65 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -330,34 +330,37 @@ static void kirin_pcie_sideband_dbi_r_mode(struct kirin_pcie *kirin_pcie,
 	kirin_apb_ctrl_writel(kirin_pcie, val, SOC_PCIECTRL_CTRL1_ADDR);
 }
 
-static int kirin_pcie_rd_own_conf(struct pcie_port *pp,
+static int kirin_pcie_rd_own_conf(struct pci_bus *bus, unsigned int devfn,
 				  int where, int size, u32 *val)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct kirin_pcie *kirin_pcie = to_kirin_pcie(pci);
-	int ret;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(bus->sysdata);
 
-	kirin_pcie_sideband_dbi_r_mode(kirin_pcie, true);
-	ret = dw_pcie_read(pci->dbi_base + where, size, val);
-	kirin_pcie_sideband_dbi_r_mode(kirin_pcie, false);
+	if (PCI_SLOT(devfn)) {
+		*val = ~0;
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	}
 
-	return ret;
+	*val = dw_pcie_read_dbi(pci, where, size);
+	return PCIBIOS_SUCCESSFUL;
 }
 
-static int kirin_pcie_wr_own_conf(struct pcie_port *pp,
+static int kirin_pcie_wr_own_conf(struct pci_bus *bus, unsigned int devfn,
 				  int where, int size, u32 val)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct kirin_pcie *kirin_pcie = to_kirin_pcie(pci);
-	int ret;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(bus->sysdata);
 
-	kirin_pcie_sideband_dbi_w_mode(kirin_pcie, true);
-	ret = dw_pcie_write(pci->dbi_base + where, size, val);
-	kirin_pcie_sideband_dbi_w_mode(kirin_pcie, false);
+	if (PCI_SLOT(devfn))
+		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	return ret;
+	dw_pcie_write_dbi(pci, where, size, val);
+	return PCIBIOS_SUCCESSFUL;
 }
 
+static struct pci_ops kirin_pci_ops = {
+	.read = kirin_pcie_rd_own_conf,
+	.write = kirin_pcie_wr_own_conf,
+};
+
 static u32 kirin_pcie_read_dbi(struct dw_pcie *pci, void __iomem *base,
 			       u32 reg, size_t size)
 {
@@ -423,6 +426,8 @@ static int kirin_pcie_establish_link(struct pcie_port *pp)
 
 static int kirin_pcie_host_init(struct pcie_port *pp)
 {
+	pp->bridge->ops = &kirin_pci_ops;
+
 	kirin_pcie_establish_link(pp);
 
 	if (IS_ENABLED(CONFIG_PCI_MSI))
@@ -438,8 +443,6 @@ static const struct dw_pcie_ops kirin_dw_pcie_ops = {
 };
 
 static const struct dw_pcie_host_ops kirin_pcie_host_ops = {
-	.rd_own_conf = kirin_pcie_rd_own_conf,
-	.wr_own_conf = kirin_pcie_wr_own_conf,
 	.host_init = kirin_pcie_host_init,
 };
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
