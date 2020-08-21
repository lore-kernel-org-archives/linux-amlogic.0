Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD60C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:01:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2693206B5
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l3GbDRKc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2693206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g7SFjYXW8QYgj+gdaG04KrToi9u2+rXHvAuEPkdoyM4=; b=l3GbDRKc1yH5/GB7tjrmsz1Tk
	QpYKuEsgnkk+uFcnah1i1+cQHcicTaZ5wrh5q1p7gB1Tfflswg7ITKUUzwbxd5/ZTaa2nILuanyhH
	IAl2X/YooIied3/+tlt9ArSCqkl9/G3RL6a1qDhqZgJEetCTzZl9ZJtU+CtWeDcKCtHs9vS/zK9Uj
	U0kHIP6V4xNkGtZsIKHrDo+hq6XYw5hpFur/z7Sjjv4V9ItlLMN5lBW0S68YVByhAZfg/efISC/h7
	1MU2pvGHCuWTJLY5BrrzUS1yShtlbnIfLGbVmOe0gcJDjuTsgH6K0Tzo8DwnLGPkJyziScX565OjK
	aNA4eQLGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yEi-00076r-5j; Fri, 21 Aug 2020 04:01:04 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9y-0004vR-L8; Fri, 21 Aug 2020 03:56:26 +0000
Received: by mail-il1-f196.google.com with SMTP id 77so338778ilc.5;
 Thu, 20 Aug 2020 20:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plPAfT6jsv3fD4ktL6XVG9iUJUN4lTKUvUyacbP7UOE=;
 b=F9y+zwO8ANRms3L4yb3aqYwVblJi87Vk0YmudutUAYhMUVLf3eWxJNWLjtlWe6r6pH
 +wPcmAL28NvUIZQhTlLV5J4GYvhb7vwaVTIDqlVWVwNOAI8V8lGZC7HP9LN7r2pWdhcX
 WvVChln4NmYQzZIqF9s8r5XUU/OPFq1pFvmnzd0ohn/nq90wEYrEatWopdTOkCrVD6kM
 RFPKO+aaQt/yuFD1kEjEV/pFuDJ3Vh8GOzpzUvSceEne0RgeJP8OpkrbjZ6PezdwJ2Zm
 YYDbScQazotEVDiTdyDlk3AiGojxjghNFpcFS9f9qNrT5tsGCT6UJohHyAHFmjOlcpyW
 SGxw==
X-Gm-Message-State: AOAM53051UyXXCZYHV0wBYp+0obuUvR3nMkVWOT3PqPSWpmGXp3h/7Bs
 aZLHN7jy/6p2w6INQkg/bQ==
X-Google-Smtp-Source: ABdhPJyRffWnopuuNv/0Z5NXVEnyP27O7kgM+pkiMrghGFx17DPrdLFvgAOgtagD9saPcgT9z5takQ==
X-Received: by 2002:a92:d089:: with SMTP id h9mr954256ilh.60.1597982168647;
 Thu, 20 Aug 2020 20:56:08 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:56:08 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 25/40] PCI: dwc/meson: Drop the duplicate number of lanes
 setup
Date: Thu, 20 Aug 2020 21:54:05 -0600
Message-Id: <20200821035420.380495-26-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_235610_817054_9B5BAE44 
X-CRM114-Status: GOOD (  14.07  )
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

The meson lanes initialization is the same DWC port logic registers as
in dw_pcie_setup(). We just need to initialize 'num_lanes' to 1 to do
the same init.

dw_pcie_setup_rc() sets the PORT_LOGIC_SPEED_CHANGE bit, so setting it
can be dropped.

Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-meson.c | 29 +-------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 67ca73528aad..96308743faf4 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -22,18 +22,6 @@
 
 #define to_meson_pcie(x) dev_get_drvdata((x)->dev)
 
-/* External local bus interface registers */
-#define PLR_OFFSET			0x700
-#define PCIE_PORT_LINK_CTRL_OFF		(PLR_OFFSET + 0x10)
-#define FAST_LINK_MODE			BIT(7)
-#define LINK_CAPABLE_MASK		GENMASK(21, 16)
-#define LINK_CAPABLE_X1			BIT(16)
-
-#define PCIE_GEN2_CTRL_OFF		(PLR_OFFSET + 0x10c)
-#define NUM_OF_LANES_MASK		GENMASK(12, 8)
-#define NUM_OF_LANES_X1			BIT(8)
-#define DIRECT_SPEED_CHANGE		BIT(17)
-
 #define TYPE1_HDR_OFFSET		0x0
 #define PCIE_STATUS_COMMAND		(TYPE1_HDR_OFFSET + 0x04)
 #define PCI_IO_EN			BIT(0)
@@ -288,22 +276,6 @@ static void meson_pcie_init_dw(struct meson_pcie *mp)
 	val |= APP_LTSSM_ENABLE;
 	meson_cfg_writel(mp, val, PCIE_CFG0);
 
-	val = meson_elb_readl(mp, PCIE_PORT_LINK_CTRL_OFF);
-	val &= ~(LINK_CAPABLE_MASK | FAST_LINK_MODE);
-	meson_elb_writel(mp, val, PCIE_PORT_LINK_CTRL_OFF);
-
-	val = meson_elb_readl(mp, PCIE_PORT_LINK_CTRL_OFF);
-	val |= LINK_CAPABLE_X1;
-	meson_elb_writel(mp, val, PCIE_PORT_LINK_CTRL_OFF);
-
-	val = meson_elb_readl(mp, PCIE_GEN2_CTRL_OFF);
-	val &= ~NUM_OF_LANES_MASK;
-	meson_elb_writel(mp, val, PCIE_GEN2_CTRL_OFF);
-
-	val = meson_elb_readl(mp, PCIE_GEN2_CTRL_OFF);
-	val |= NUM_OF_LANES_X1 | DIRECT_SPEED_CHANGE;
-	meson_elb_writel(mp, val, PCIE_GEN2_CTRL_OFF);
-
 	meson_elb_writel(mp, 0x0, PCIE_BASE_ADDR0);
 	meson_elb_writel(mp, 0x0, PCIE_BASE_ADDR1);
 }
@@ -513,6 +485,7 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	pci = &mp->pci;
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
+	pci->num_lanes = 1;
 
 	mp->phy = devm_phy_get(dev, "pcie");
 	if (IS_ERR(mp->phy)) {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
