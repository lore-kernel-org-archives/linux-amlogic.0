Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3FAC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:15:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B84F2076E
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:15:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0wE5rvkg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="o1/1AyAZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B84F2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UfCwgmdcuRsot+zjNMsA/Ie5kvg13EPFXRD/FCKzlEE=; b=0wE5rvkg22NNjpk6bISklKZRA
	QDakWj716tIv/e3WPrmzx0waJXmTpjF7Y58wCeyAIy81GIPqMzcNkQdo78S81B66l3ROojuIOaKL7
	zpSRxPmU9kD77Z0bN0DNubfsFapiruoSjs374e9SJ8CCSwtTCfq0oGfukTFwjrvujGyw7dIxcIDfc
	HjTD0dGDlbSG4aOt6BcUTPj7efkrEg6G9uavMHcLZh8kKhaHYADH/RElaK5A+rRAx2turvrk4u7gM
	hDgFn/jh5gnljb1Dy6UKcv1erEbu+VmeBxEn1vc+1b2JySci91L/sCvs6QupPKL8SnL9O2+M9L60d
	VHNjPC/8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8ySC-0005gd-GN; Fri, 21 Aug 2020 04:15:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yON-00034Q-L5; Fri, 21 Aug 2020 04:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=EWe/hGwQkMqkRgfmf3CKztYtr/mVIP4aBkGHJDTxqi8=; b=o1/1AyAZGWeN9IucH3mCZhHjqI
 R/jbBZd6k41rEC9Ot5sXFKWIoNyUXFjFyEvo7M/tdfRqcs8Q8D6TnMMlOJJJsDgTxna/Y8urxGokj
 A0M2/z8Yq/v8v0zIxwRSi5aL5Unx8j9noi9Kg4SusRLJhVL6v7ID9hDdlcbGllsSzpVKoEXyCMVqs
 BI4NIUbIlmG+qOFmJpoolFSCSeo+VcYHq6Syg0ixpg4qYFDiI3VXaBbpoPYhdF9AGnnT9U6LX35QW
 ZPSZTyW0vaHXHu3EabRVOUMT2lznAAtR3wHF279n9+qrw0V3OO59U6mLKxhW/NX2AOdcbNG+DJp8/
 U0I7jckA==;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y93-0001DB-EE; Fri, 21 Aug 2020 03:55:17 +0000
Received: by mail-io1-f67.google.com with SMTP id b16so482494ioj.4;
 Thu, 20 Aug 2020 20:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EWe/hGwQkMqkRgfmf3CKztYtr/mVIP4aBkGHJDTxqi8=;
 b=A/Lm5ryislvGnK0XipsotpMXscmEyToiaGZECHejlj3fuxSeZBlWdXcuiJW0Ck3Nzl
 ngmkHxJ2cyJA5qPe2Y7DnziDRXExxGBsnp49T9ca1r6AuuvQG6ux2LdEbOwfEsu3tp7C
 s24MQBWnFp0o5PRAA3l8totz/aS2wTypgGBz9SMAdKFDwqn4EMzS852Cl3TmcE+vnf4u
 KlH+MolAkNUl8g3Cn9hnq4gNRgnDWpvSc8qkhZviYSTWaVbqqU6QhfVqzTkU4Fhjm6cn
 4VxQd2pSH2jFPkEv9NkUWpynlxpUKvRwi85whOjiitj5SjqguYqakIntR1EQdHkAguWO
 VPxQ==
X-Gm-Message-State: AOAM533uJHzL+Rb8cQCkbo5U6kedhVOtlNaPY6rGlLkiilCGtiqunh3x
 6WTYCu2nQ84VEDUlJpdv+w==
X-Google-Smtp-Source: ABdhPJx50jcI3UQ9zpFKWNK4wLbfs5QeqO/cNtsCvlwq+y2ijT3aunqglLB1Z5kaXzxkIBmgGxKWaw==
X-Received: by 2002:a05:6638:2515:: with SMTP id
 v21mr824983jat.109.1597982111917; 
 Thu, 20 Aug 2020 20:55:11 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:11 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 10/40] PCI: dwc: exynos: Use pci_ops for root config space
 accessors
Date: Thu, 20 Aug 2020 21:53:50 -0600
Message-Id: <20200821035420.380495-11-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045513_763903_985A99AB 
X-CRM114-Status: GOOD (  15.75  )
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
buses, convert the Samsung Exynos driver to use the standard pci_ops for
root bus config accesses.

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-exynos.c | 45 ++++++++++++++-----------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 8d82c43ae299..242683cde04a 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -336,32 +336,37 @@ static void exynos_pcie_write_dbi(struct dw_pcie *pci, void __iomem *base,
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
@@ -379,6 +384,8 @@ static int exynos_pcie_host_init(struct pcie_port *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
 
+	pp->bridge->ops = &exynos_pci_ops;
+
 	exynos_pcie_establish_link(ep);
 	exynos_pcie_enable_interrupts(ep);
 
@@ -386,8 +393,6 @@ static int exynos_pcie_host_init(struct pcie_port *pp)
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
