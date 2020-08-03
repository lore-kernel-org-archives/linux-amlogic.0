Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAA3C433E3
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:03:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A3B322CB1
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dOfgN46R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A3B322CB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+IA8syn+llbOFQt9sffnUgMzm7y/0v4OlgErxbAqeDk=; b=dOfgN46RiCd+pJD42iJGAXV0Y
	uddQRduQPpZZspbn54iAWnW/MiNkMhc+KoEMJIM5XUSxLjXUsqt/gBytr193VqCZfphffaVZ9/yhs
	04n1eoy4GTjS3IWqJYnIJjm0UOGzXJbY3EXrgcirc/KXj0r38WSRFm1Ys2KBloNCR1PFr1xDaPAJM
	hRAQTx0pUSRoBA45Kpgk9yxODLSgs6AAqjpZY+Q2sJTDFYrrH30MH663zFkASDY4Yxi1/3INKbaI0
	D/hJodef4/IIjoEWF51X9EOBlSWStCHvy2ByFbv0faIuBr+FsGlGiFLjiE3TSK6dxMWPgbIMKdlXC
	NxUILzMMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hc0-0000uB-Cp; Mon, 03 Aug 2020 21:03:12 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haW-0008Ub-I3; Mon, 03 Aug 2020 21:01:41 +0000
Received: by mail-io1-f67.google.com with SMTP id k23so39948751iom.10;
 Mon, 03 Aug 2020 14:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uqMmmSdRu2mAJmxJVyfdC1UZDoCNddnAHqJmdw3g1qc=;
 b=Qm6atGTcrLwQBHO2ISc0bIcJIWu8ud9MI79NdiQohp1Os7KD2ijjZap3FeVkD94mid
 x1MUnShbmRX1lqzTQN3oNYEYesT1jcXUpGZ/U/Oc+2SjM+OkH/btBo4dGKohRjRIiJaI
 8p4txaMWRp2TWYCY0MEPyyGWUNc9RbmB6QiHo4CJMhHHGN0waN426Ww055UQ5hrCyIco
 YrjyGppFk3Oc6p3rKHw9syiGk7gQcfnyVCWHTjB6p0nsuM+YIdmB5UFejBhDhoDXwQ9k
 Hz0Dc5L23yhW3dGYWaCzPpnzsRoBxwV2nHNHm1SRi1Er5C8JyxT7vaI++jCKebgIgPOT
 WYCg==
X-Gm-Message-State: AOAM533zKa0zpkyyqlmaorywVUUDrilO03xkmMcMvP/iE/rVBk1fNeKM
 gREPxInnl2AvjbH7zTuVCA==
X-Google-Smtp-Source: ABdhPJw7+kSjYhGRYEIhQk6tNLudHqZmYvJC/9LNtA8wCqiPqZlbDpGdf2cy3RCei6R9SOjDM6lY5w==
X-Received: by 2002:a5e:930b:: with SMTP id k11mr1852419iom.30.1596488499811; 
 Mon, 03 Aug 2020 14:01:39 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:39 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 09/27] PCI: dwc: kirin: Use pci_ops for root config space
 accessors
Date: Mon,  3 Aug 2020 15:00:58 -0600
Message-Id: <20200803210116.3132633-10-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170140_639602_95F3C9D9 
X-CRM114-Status: GOOD (  17.37  )
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
index c19617a912bd..1680dc72b416 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -335,34 +335,37 @@ static void kirin_pcie_sideband_dbi_r_mode(struct kirin_pcie *kirin_pcie,
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
@@ -428,6 +431,8 @@ static int kirin_pcie_establish_link(struct pcie_port *pp)
 
 static int kirin_pcie_host_init(struct pcie_port *pp)
 {
+	pp->bridge->ops = &kirin_pci_ops;
+
 	kirin_pcie_establish_link(pp);
 
 	if (IS_ENABLED(CONFIG_PCI_MSI))
@@ -443,8 +448,6 @@ static const struct dw_pcie_ops kirin_dw_pcie_ops = {
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
