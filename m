Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C63C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:12:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C315206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IeX+oGH+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WINfnIZC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C315206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wlnzAB7Xnum4kYt1eb2K8N4NK3vjp2dDt88Pm5WUg0U=; b=IeX+oGH+EmaAwnL3GWX1AAQeT
	TGZXydx+QUwcqcTkd4K8tZQKFV0XubY+3qsef1TzSawisCcFExBdeBwdoaejcsSrA9Lh7w0MV7Mt8
	HesP1I1ceUKsuco0I0U7rB8uA+qEEl1WJd5h21cjD5tynoQAL5rUUj1EexANk1uINYiXehsGilYCU
	PdHQERSTLSXpINScRmb+cw+V36PBH9dyx+t9+fypAbtP7O+z5PiXzZczwiHlCqfscU205ej6kleTi
	0gawh0Fy8XMVSTyn19eeL+kMholAL7K501OZYU2VDNjMAw5o/IO2QTZk5v0xYph/sCAJcGsSzePTY
	bIQs0kVMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yP9-0003pk-Ll; Fri, 21 Aug 2020 04:11:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yO5-00034Q-8N; Fri, 21 Aug 2020 04:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qBhQHSRC5b7EjXLe1wtIsk2mRWkusWFFlluCqZMlR3s=; b=WINfnIZCtU3mqO0dWEhW/O+JUw
 tQ0FJx6rdvyTprymmeWdutlmQ9X3nfJ7dzDSfrUi4YgtwuMxYwb+Vxh2hj1LugWvPTz2JslwCAFBe
 DRNUWiUZQp/DLdks+skPatQioifrWtbW6rMat/3MPQEPX42acOs22Hshf7gnLxnniUPk13wDSn9/p
 hLta9YkSmKPX0SJcsL7jgGVx9Ji+lZCucW25FkDd8zERDb5UnDI8VbIW0YYQ0eFQP4ZZE2bmdVX7+
 NvkHckrg1k8pjVhrci/nUoSWlY9YnOo1+7pwxyHMg9sHtuz23sfZy9c8438GR2LI3wO9B+C1GcHNy
 TmCFpYYg==;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAH-0001Mg-Rs; Fri, 21 Aug 2020 03:56:34 +0000
Received: by mail-io1-f68.google.com with SMTP id g19so466792ioh.8;
 Thu, 20 Aug 2020 20:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qBhQHSRC5b7EjXLe1wtIsk2mRWkusWFFlluCqZMlR3s=;
 b=KIJXHGgmR8RX/jq4n7hR2ZmrIlXebuBEmnqIcBd88EFJ3nOE8rv77NXO5yovbg8uY5
 PFGFg5hJqdEDq/XG8+S4W49cqgBzimD7b3sMEY0nytpNH9nA+AhszS2Aczd+JZyOcW+6
 jEWtrzYQuYJLPdknNLyN5+Sl6IdHNLEAsCtjSwQtWlM5y2IqZBTBGIPaj5gqWZgK6Vmn
 d1J5qv7ivsawJZg4YafIjDfgJc2oHjTQYm1zpBPmFmMQ+fjK9sUdqtO5MvraWufPeMzA
 kQWEMajiy2UM+TeLElL08QsTdTy/brYh/XF6ZYxsx/5w5VFe7SGVhqYBGyH68qE54CA4
 +UFg==
X-Gm-Message-State: AOAM532vUX4/BjLpqCa9dXDGE6/gcbyTE8zF+Qel4qr5Xg+RPxrie63H
 GT1GaN4rpH2a17UJz2Uw3g==
X-Google-Smtp-Source: ABdhPJyWAiaexmdeVEgzO5iZxSuqRD4JaSKu7ZG07XYDvC9mxMC+ZPTsXVXlnNGxxM2MFiKu9NmqRQ==
X-Received: by 2002:a6b:e517:: with SMTP id y23mr896790ioc.190.1597982188440; 
 Thu, 20 Aug 2020 20:56:28 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:27 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 30/40] PCI: dwc: Remove hardcoded PCI_CAP_ID_EXP offset
Date: Thu, 20 Aug 2020 21:54:10 -0600
Message-Id: <20200821035420.380495-31-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045630_229764_628DC707 
X-CRM114-Status: GOOD (  15.25  )
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

While the Designware controller appears to hard code the PCI_CAP_ID_EXP
capability register at 0x70, there's no need to hard code this in the
driver as it is discoverable.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Pratyush Anand <pratyush.anand@gmail.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c     |  4 +---
 drivers/pci/controller/dwc/pci-keystone.c   | 11 +++++------
 drivers/pci/controller/dwc/pcie-spear13xx.c |  4 +---
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index dc387724cf08..d42e0664f378 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -73,8 +73,6 @@
 #define	LINK_UP						BIT(16)
 #define	DRA7XX_CPU_TO_BUS_ADDR				0x0FFFFFFF
 
-#define EXP_CAP_ID_OFFSET				0x70
-
 #define	PCIECTRL_TI_CONF_INTX_ASSERT			0x0124
 #define	PCIECTRL_TI_CONF_INTX_DEASSERT			0x0128
 
@@ -142,7 +140,7 @@ static int dra7xx_pcie_establish_link(struct dw_pcie *pci)
 	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
 	struct device *dev = pci->dev;
 	u32 reg;
-	u32 exp_cap_off = EXP_CAP_ID_OFFSET;
+	u32 exp_cap_off = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 
 	if (dw_pcie_link_up(pci)) {
 		dev_err(dev, "link is already up\n");
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 0fe792f6c253..39a5a72de340 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -96,8 +96,6 @@
 #define LEG_EP				0x1
 #define RC				0x2
 
-#define EXP_CAP_ID_OFFSET		0x70
-
 #define KS_PCIE_SYSCLOCKOUTEN		BIT(0)
 
 #define AM654_PCIE_DEV_TYPE_MASK	0x3
@@ -1125,22 +1123,23 @@ static int ks_pcie_am654_set_mode(struct device *dev,
 static void ks_pcie_set_link_speed(struct dw_pcie *pci, int link_speed)
 {
 	u32 val;
+	u32 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 
 	dw_pcie_dbi_ro_wr_en(pci);
 
-	val = dw_pcie_readl_dbi(pci, EXP_CAP_ID_OFFSET + PCI_EXP_LNKCAP);
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 	if ((val & PCI_EXP_LNKCAP_SLS) != link_speed) {
 		val &= ~((u32)PCI_EXP_LNKCAP_SLS);
 		val |= link_speed;
-		dw_pcie_writel_dbi(pci, EXP_CAP_ID_OFFSET + PCI_EXP_LNKCAP,
+		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP,
 				   val);
 	}
 
-	val = dw_pcie_readl_dbi(pci, EXP_CAP_ID_OFFSET + PCI_EXP_LNKCTL2);
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCTL2);
 	if ((val & PCI_EXP_LNKCAP_SLS) != link_speed) {
 		val &= ~((u32)PCI_EXP_LNKCAP_SLS);
 		val |= link_speed;
-		dw_pcie_writel_dbi(pci, EXP_CAP_ID_OFFSET + PCI_EXP_LNKCTL2,
+		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCTL2,
 				   val);
 	}
 
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index 62846562da0b..056c94541a22 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -65,8 +65,6 @@ struct pcie_app_reg {
 /* CR6 */
 #define MSI_CTRL_INT				(1 << 26)
 
-#define EXP_CAP_ID_OFFSET			0x70
-
 #define to_spear13xx_pcie(x)	dev_get_drvdata((x)->dev)
 
 static int spear13xx_pcie_establish_link(struct spear13xx_pcie *spear13xx_pcie)
@@ -75,7 +73,7 @@ static int spear13xx_pcie_establish_link(struct spear13xx_pcie *spear13xx_pcie)
 	struct pcie_port *pp = &pci->pp;
 	struct pcie_app_reg *app_reg = spear13xx_pcie->app_base;
 	u32 val;
-	u32 exp_cap_off = EXP_CAP_ID_OFFSET;
+	u32 exp_cap_off = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 
 	if (dw_pcie_link_up(pci)) {
 		dev_err(pci->dev, "link already up\n");
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
