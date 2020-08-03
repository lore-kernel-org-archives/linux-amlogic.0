Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30FBC433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:03:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC52222BED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:03:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iXh+inHQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC52222BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k4P2JLxFKVX3W777GElru6s7ADc+1QntFVEPAFJB2mw=; b=iXh+inHQuE+3k1IXGg0EkllNE
	FId8KPalk9sgS83oN49fnc5fEUJijFpcei5xl2N1e3E1zZaG4+GalYI0qZtz5GMUwE/ns4OidC3kY
	G6/XoW9EswmPlPr2VYZEiL5iZTqbsZo2BLttfbIieQsAdKe9w0+1xsOiir/lZGUviJo/mnLGsZxoP
	QCb3YO7/EChEo3C9MGgEg2GvYoWDh4siGxwqRXAk4B2USpoeEvlpg9mCkr5l6cxFmftv2rHXPpYKq
	n7SulY/szukkOdDGC5TE7l5+cdKhH0Nd5WLC/HxdbVsMYSZa7J+Q+oWCfcThKyxmEGDvHL8w3uqqc
	NUnIEcDuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hc2-0000vJ-RF; Mon, 03 Aug 2020 21:03:14 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2haY-0008VR-DJ; Mon, 03 Aug 2020 21:01:43 +0000
Received: by mail-il1-f194.google.com with SMTP id p13so3872679ilh.4;
 Mon, 03 Aug 2020 14:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w74e1Ztc1qAn6gEbliDEy8D1xkphK6dVWVgtaNcLV4w=;
 b=dk5ZJtv9v03EZ/bjm+8o+728EMj8XAB6wkqsDaMZa18Dx6qtAy3g3gphfFFO4fwO2R
 xhgErUoUG8dciq1msu2tAPVgLJxVP4By1WFoGwHb/IR8FsZAjyiHS6Goj9ZidNhrwuTg
 3Ejijrm7URspqh5mrxRGfrthEds1JRIc7yQCGmfO1D4gfBLemxBjIyx5IA0IWcNFGWAq
 I3CqFcSD8LU8rGr+8cHadDXxV59YwdWKIDwwlIZKn7UA3VycV7PdPdhnV4iMPhyUeMI2
 yAmHLw5E/09jX7XJ3NX3Q8j3h7h5+16BZxJj2ML7et+Va5pCtF4XltjLDUktEhS19Dp4
 q+PA==
X-Gm-Message-State: AOAM532o4AKvjZO2a2x4Qd1hJXHOHCkinGrfqSbDN9TYAgRN3+TJY0Xj
 iE56s8ek3bYuIDCXmMLTzA==
X-Google-Smtp-Source: ABdhPJxfAjXpg9S6OMpw6Nsv1iLQNUvPbf7BO8gLdDkl8+aUBf9YmuX7VSlCNgb+o/i5Ag3SVp1l9g==
X-Received: by 2002:a92:1b42:: with SMTP id b63mr1415959ilb.76.1596488501865; 
 Mon, 03 Aug 2020 14:01:41 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:01:41 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 10/27] PCI: dwc: exynos: Use pci_ops for root config space
 accessors
Date: Mon,  3 Aug 2020 15:00:59 -0600
Message-Id: <20200803210116.3132633-11-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170142_747693_A5C13FA1 
X-CRM114-Status: GOOD (  18.29  )
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
buses, convert the Samsung Exynos driver to use the standard pci_ops for
root bus config accesses.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-exynos.c | 45 ++++++++++++++-----------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index c5043d951e80..d5d37cffa441 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -338,32 +338,37 @@ static void exynos_pcie_write_dbi(struct dw_pcie *pci, void __iomem *base,
 	exynos_pcie_sideband_dbi_w_mode(ep, false);
 }
 
-static int exynos_pcie_rd_own_conf(struct pcie_port *pp, int where, int size,
-				u32 *val)
+static int exynos_pcie_rd_own_conf(struct pci_bus *bus, unsigned int devfn,
+				   int where, int size, u32 *val)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct exynos_pcie *ep = to_exynos_pcie(pci);
-	int ret;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(bus->sysdata);
 
-	exynos_pcie_sideband_dbi_r_mode(ep, true);
-	ret = dw_pcie_read(pci->dbi_base + where, size, val);
-	exynos_pcie_sideband_dbi_r_mode(ep, false);
-	return ret;
+	if (PCI_SLOT(devfn)) {
+		*val = ~0;
+		return PCIBIOS_DEVICE_NOT_FOUND;
+	}
+
+	*val = dw_pcie_read_dbi(pci, where, size);
+	return PCIBIOS_SUCCESSFUL;
 }
 
-static int exynos_pcie_wr_own_conf(struct pcie_port *pp, int where, int size,
-				u32 val)
+static int exynos_pcie_wr_own_conf(struct pci_bus *bus, unsigned int devfn,
+				   int where, int size, u32 val)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct exynos_pcie *ep = to_exynos_pcie(pci);
-	int ret;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(bus->sysdata);
 
-	exynos_pcie_sideband_dbi_w_mode(ep, true);
-	ret = dw_pcie_write(pci->dbi_base + where, size, val);
-	exynos_pcie_sideband_dbi_w_mode(ep, false);
-	return ret;
+	if (PCI_SLOT(devfn))
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	dw_pcie_write_dbi(pci, where, size, val);
+	return PCIBIOS_SUCCESSFUL;
 }
 
+static struct pci_ops exynos_pci_ops = {
+	.read = exynos_pcie_rd_own_conf,
+	.write = exynos_pcie_wr_own_conf,
+};
+
 static int exynos_pcie_link_up(struct dw_pcie *pci)
 {
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
@@ -381,6 +386,8 @@ static int exynos_pcie_host_init(struct pcie_port *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
 
+	pp->bridge->ops = &exynos_pci_ops;
+
 	exynos_pcie_establish_link(ep);
 	exynos_pcie_enable_interrupts(ep);
 
@@ -388,8 +395,6 @@ static int exynos_pcie_host_init(struct pcie_port *pp)
 }
 
 static const struct dw_pcie_host_ops exynos_pcie_host_ops = {
-	.rd_own_conf = exynos_pcie_rd_own_conf,
-	.wr_own_conf = exynos_pcie_wr_own_conf,
 	.host_init = exynos_pcie_host_init,
 };
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
