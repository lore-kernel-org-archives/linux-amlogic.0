Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936F8C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:06:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D85722BF3
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 21:06:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0hvfqb9s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D85722BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t9xvBor88Wz+5cQVRZJr5+W8dx8RSlcGgYCvhGqSBSM=; b=0hvfqb9sjjiKuojRJc3xOdVyv
	k7LaIg40n3qGyq/BiIiRpLo87k34J9p0CWsCqbKA+nKnV/qvK8Z1902KW+oEACh6MFy29pkkyjhMI
	czOWUdS5qxjr63Mvk52ZZc2KU5zRh3Yw4vRaB8ezD8Iy987bJNHROWmBBEiQ+UrgSWftjm0Qaw3W5
	GhRqc2D+0tFrds1JhaVi9QD7MiFhxcsYaQbCITnqN8GBuxSrUF6ZMUuOoLq7bOSCKb8WJ7a+9S7Bc
	3BnvZ0DzETtBajNS1ViKyidT1UfJuC2Rhd32rZ8NPF88pNJp18pokcH/6Ki+LnJ+p8t8TxPvEwnpm
	HEgN/WCvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2hes-0002sq-Gb; Mon, 03 Aug 2020 21:06:10 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2hb1-0000Kg-MR; Mon, 03 Aug 2020 21:02:13 +0000
Received: by mail-io1-f67.google.com with SMTP id g19so27941613ioh.8;
 Mon, 03 Aug 2020 14:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TMmKGLqxoIiv5nH6EL2xp/hSv/Gz0ReZ5qtRf7b9+lE=;
 b=Ux/q6b1WG1AuMiJDegp0FUsSmws1WX+t2OfQ1/SKCvbTquO+Nj4GoKh1OGJ8vGSEIJ
 c7hZNEUQj99vNMdloE+ip9l2d3Erm9JQwVhLlELp+wXFk7KYQVVcDkFanbiaWaFaCJSQ
 eagq7UQYeWh6XmNavM9jKRkkQmYyLjFlkba75dpD+dRcfv4oWn8kG1f4Eqn+pc7aWzAF
 dYcEicJh1gcVNm9QvRA86XoFYE+Sdn/LQIdUhJjsdgS+mufDpaNH3BepeOHBTIiVaozL
 bkXnhaoVperDb9o+ThO2CwTv7er4vmcATY6aOKCOyxoUsL8insdAmf1PikL8jqUn77pD
 fsng==
X-Gm-Message-State: AOAM531snubF5jHPmu1gXbkmlkFqmaQDwAnVnyoa3hkPmbdCsQ42LDZs
 juVsq2Wer9ip2QNDafGLx0TQ5wSXkw==
X-Google-Smtp-Source: ABdhPJxeiUiiXL4Rua4Fu69Vg+K0w1bnYWMxWGlLFPHzRqQHvNY5emITrazErXZ1fYfEY9jR9WKX5A==
X-Received: by 2002:a05:6638:1005:: with SMTP id
 r5mr1866400jab.116.1596488530148; 
 Mon, 03 Aug 2020 14:02:10 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:02:09 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC 20/27] PCI: dwc/keystone: Drop duplicated 'num-viewport'
Date: Mon,  3 Aug 2020 15:01:09 -0600
Message-Id: <20200803210116.3132633-21-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_170212_826914_DA579011 
X-CRM114-Status: GOOD (  15.97  )
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

The DWC core driver already parses and stores the 'num-viewport' DT
property, so there is no need for the Keystone driver to store it.

Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-keystone.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index e9028c98d6c0..205754a6bc3c 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -123,7 +123,6 @@ struct keystone_pcie {
 
 	int			msi_host_irq;
 	int			num_lanes;
-	u32			num_viewport;
 	struct phy		**phy;
 	struct device_link	**link;
 	struct			device_node *msi_intc_np;
@@ -397,9 +396,9 @@ static void ks_pcie_clear_dbi_mode(struct keystone_pcie *ks_pcie)
 static void ks_pcie_setup_rc_app_regs(struct keystone_pcie *ks_pcie)
 {
 	u32 val;
-	u32 num_viewport = ks_pcie->num_viewport;
 	struct dw_pcie *pci = ks_pcie->pci;
 	struct pcie_port *pp = &pci->pp;
+	u32 num_viewport = pci->num_viewport;
 	u64 start, end;
 	struct resource *mem;
 	int i;
@@ -1199,7 +1198,6 @@ static int __init ks_pcie_probe(struct platform_device *pdev)
 	struct resource *res;
 	unsigned int version;
 	void __iomem *base;
-	u32 num_viewport;
 	struct phy **phy;
 	int link_speed;
 	u32 num_lanes;
@@ -1352,12 +1350,6 @@ static int __init ks_pcie_probe(struct platform_device *pdev)
 			goto err_get_sync;
 		}
 
-		ret = of_property_read_u32(np, "num-viewport", &num_viewport);
-		if (ret < 0) {
-			dev_err(dev, "unable to read *num-viewport* property\n");
-			goto err_get_sync;
-		}
-
 		/*
 		 * "Power Sequencing and Reset Signal Timings" table in
 		 * PCI EXPRESS CARD ELECTROMECHANICAL SPECIFICATION, REV. 2.0
@@ -1371,7 +1363,6 @@ static int __init ks_pcie_probe(struct platform_device *pdev)
 			gpiod_set_value_cansleep(gpiod, 1);
 		}
 
-		ks_pcie->num_viewport = num_viewport;
 		pci->pp.ops = host_ops;
 		ret = ks_pcie_add_pcie_port(ks_pcie, pdev);
 		if (ret < 0)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
