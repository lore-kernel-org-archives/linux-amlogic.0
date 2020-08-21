Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE69C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:11:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 747D3206FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:11:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hw8HgjVx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CPpf09m+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 747D3206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9uoEpng037Xh4C4q7yzGjnSYX5d3BXQMWgojjbel6rQ=; b=hw8HgjVxxgJvutjp0eA2bidd8
	0zqEl0gwTrXsvZy74JxV7Eg7ncPsPRomPDptwWoWmNEMTX1zq7VYAxpJAKkHTGQL5MRmm1ufRbvsE
	hS14eX18VhTMOQsbYFhtcC1+c4RM2LyP4xzIogMeilgjcchfkf/hLekLuZGEDeFaoLPfd5kYKn3Kg
	RiGvn93P9m43la9MNrU5nVfQhS7lSeYRz+D6Tr7GqTytJJ7pGgx07Y1EzZh8PmiUVwwSnF0LHZX0f
	isgbgE+3J/Mvm71PAFbE/8oGBp6+yh/zrtcru2Dqmuh1Pqswbj3Q+n06X48WxZDe3SQO66oJiCOKI
	t6sxvedsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yOl-0003fi-UB; Fri, 21 Aug 2020 04:11:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yO2-00034Q-VH; Fri, 21 Aug 2020 04:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=AfxIdt959NXaODT/XtFkfeDPzE0A42F3V0bVD6SSbnw=; b=CPpf09m+nNFcCuJ2+hwRkgfUvc
 zA26pzjkIrQllAJRqf2djsE4vOL1o2AhztZZoIVs2FbpDhmlt4YJAilX21RIJtChfojELsHM8B26Y
 o4vmQm15Ed1N/HlNZLholiTp8bcDBaGxVaPDKEbt2tC6IG8Ab7jP56MPqcdV4ti/BhDpyfKqgEL3R
 Av9SAncC9U64C3JlL66iAcWy2ft+mh+DmtE8F8kRQAVi3jJVt36JlswVwRQTt9Zo4f3oumzJ0vfrh
 di5eXNyGyADvFNdmrxt2hJjp3VLycQ8ye5MabYPJtLYHzUXoCiliccSew4jNy4ZjgT7nipegX1pvl
 Dv/abg2w==;
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yAN-0001Nx-1o; Fri, 21 Aug 2020 03:56:37 +0000
Received: by mail-il1-f195.google.com with SMTP id v2so342392ilq.4;
 Thu, 20 Aug 2020 20:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AfxIdt959NXaODT/XtFkfeDPzE0A42F3V0bVD6SSbnw=;
 b=P5IzrS+sf3JXyvWfXifz3AbSqDzuATgNfg65H66wVtlRiR2Pv8TS3JWJQQvz1c1/Gm
 xDlbDtdGAirb/kbAL/S7lof8UkjcBWqG4jay3wAyAI0pp3hCGjGCbHlvS84MrtsJMvhU
 kd76hZzpEZncitnV1SLyqs2u0+LOasmTIBVvzkAYUuInoFqZ3VRgUbd6E/E73FkZEeHp
 c+OzSMmKNZwl1TXQGdb2RytB+n1SMFCdxfa/TJN4WPVrGMseZ5ijzT5G7D7WG3Ubex4g
 9PvTVbOJ/eSkDfOSfdO/svhUeLj8iXSQaoF6fLhN0eHu1fdcXy6R+GP1gaEoSiAtgk0J
 9Sbw==
X-Gm-Message-State: AOAM533+uIU0GnaCvt6A7NE3V1PSBDxRX0RwOsVBtQdbT6XUpERBaAPo
 BRjjwdXFh7CXi05/Tp/PCQ==
X-Google-Smtp-Source: ABdhPJwIZRy5y8U2oZCmoEan4JCLiYFHYKY7Mdb+uGDu2bXq6IpofYkmhrk+pIkkQsc8nrWPFFtHUQ==
X-Received: by 2002:a05:6e02:14c2:: with SMTP id
 o2mr1030464ilk.54.1597982193525; 
 Thu, 20 Aug 2020 20:56:33 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:32 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 32/40] PCI: dwc: Remove read_dbi2 code
Date: Thu, 20 Aug 2020 21:54:12 -0600
Message-Id: <20200821035420.380495-33-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045635_309473_7F85379F 
X-CRM114-Status: GOOD (  14.09  )
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

The DBI2 appears to be write-only and there's no read accesses in the code
anyways, so let's remove all the read_dbi2 related code.

Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-keystone.c    | 13 -------------
 drivers/pci/controller/dwc/pcie-designware.c | 15 ---------------
 drivers/pci/controller/dwc/pcie-designware.h |  8 --------
 3 files changed, 36 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 39a5a72de340..5fe36da0b7c6 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -881,18 +881,6 @@ static int __init ks_pcie_add_pcie_port(struct keystone_pcie *ks_pcie,
 	return 0;
 }
 
-static u32 ks_pcie_am654_read_dbi2(struct dw_pcie *pci, void __iomem *base,
-				   u32 reg, size_t size)
-{
-	struct keystone_pcie *ks_pcie = to_keystone_pcie(pci);
-	u32 val;
-
-	ks_pcie_set_dbi_mode(ks_pcie);
-	dw_pcie_read(base + reg, size, &val);
-	ks_pcie_clear_dbi_mode(ks_pcie);
-	return val;
-}
-
 static void ks_pcie_am654_write_dbi2(struct dw_pcie *pci, void __iomem *base,
 				     u32 reg, size_t size, u32 val)
 {
@@ -907,7 +895,6 @@ static const struct dw_pcie_ops ks_pcie_dw_pcie_ops = {
 	.start_link = ks_pcie_start_link,
 	.stop_link = ks_pcie_stop_link,
 	.link_up = ks_pcie_link_up,
-	.read_dbi2 = ks_pcie_am654_read_dbi2,
 	.write_dbi2 = ks_pcie_am654_write_dbi2,
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index ed5dadcbcb45..b2739b96659f 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -166,21 +166,6 @@ void dw_pcie_write_dbi(struct dw_pcie *pci, u32 reg, size_t size, u32 val)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_write_dbi);
 
-u32 dw_pcie_read_dbi2(struct dw_pcie *pci, u32 reg, size_t size)
-{
-	int ret;
-	u32 val;
-
-	if (pci->ops->read_dbi2)
-		return pci->ops->read_dbi2(pci, pci->dbi_base2, reg, size);
-
-	ret = dw_pcie_read(pci->dbi_base2 + reg, size, &val);
-	if (ret)
-		dev_err(pci->dev, "read DBI address failed\n");
-
-	return val;
-}
-
 void dw_pcie_write_dbi2(struct dw_pcie *pci, u32 reg, size_t size, u32 val)
 {
 	int ret;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 73c119437fee..c3178c8694eb 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -232,8 +232,6 @@ struct dw_pcie_ops {
 			    size_t size);
 	void	(*write_dbi)(struct dw_pcie *pcie, void __iomem *base, u32 reg,
 			     size_t size, u32 val);
-	u32     (*read_dbi2)(struct dw_pcie *pcie, void __iomem *base, u32 reg,
-			     size_t size);
 	void    (*write_dbi2)(struct dw_pcie *pcie, void __iomem *base, u32 reg,
 			      size_t size, u32 val);
 	int	(*link_up)(struct dw_pcie *pcie);
@@ -269,7 +267,6 @@ int dw_pcie_write(void __iomem *addr, int size, u32 val);
 
 u32 dw_pcie_read_dbi(struct dw_pcie *pci, u32 reg, size_t size);
 void dw_pcie_write_dbi(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
-u32 dw_pcie_read_dbi2(struct dw_pcie *pci, u32 reg, size_t size);
 void dw_pcie_write_dbi2(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
 u32 dw_pcie_read_atu(struct dw_pcie *pci, u32 reg, size_t size);
 void dw_pcie_write_atu(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
@@ -322,11 +319,6 @@ static inline void dw_pcie_writel_dbi2(struct dw_pcie *pci, u32 reg, u32 val)
 	dw_pcie_write_dbi2(pci, reg, 0x4, val);
 }
 
-static inline u32 dw_pcie_readl_dbi2(struct dw_pcie *pci, u32 reg)
-{
-	return dw_pcie_read_dbi2(pci, reg, 0x4);
-}
-
 static inline void dw_pcie_writel_atu(struct dw_pcie *pci, u32 reg, u32 val)
 {
 	dw_pcie_write_atu(pci, reg, 0x4, val);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
