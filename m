Return-Path: <SRS0=il4G=DB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE381C4363D
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2020 11:10:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F4F520702
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2020 11:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CDgOHABZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.b="hw3dFdzK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F4F520702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tQssuE3MIRAuALwHcGAA2w4lKIb0hdqhl1S18k1kU6M=; b=CDgOHABZO8qigPCBJDEl8F1Jj
	9dthRqmYer/KSzZ7lO6MIi4XNYNRd4+RtqHL3x4J7Ay2bM66Y+p1nmAvOsOJPgKpJCSpwhdJ+Zi0T
	sd0Vy2rY/sPS0XmPD4ugTUFwUUl3JiIE4R1SdLCF7i+DlRWQ/OzZeUtk9JsLLUrQDHNh5Px6OnPJq
	4XwdJTawEi/QSeg1VSpLPbl3S/umUGi/EzpUuuJbwPU+TxrvPWDpic84xoQ/zxWU9gcSxSVDWxpk7
	fd1DPhaoZgQGU4iqgNKqqaXC3DlLHwN04MmG7hh2t2ofmYz97xmLcj7PCHCVOKQTH5nVE1Py4PF1K
	KkwCPN0Bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLP8j-0002QZ-1B; Thu, 24 Sep 2020 11:10:17 +0000
Received: from mail-bn8nam08on2041.outbound.protection.outlook.com
 ([40.107.100.41] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLP8V-0002KP-He; Thu, 24 Sep 2020 11:10:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myrwH2prxCysjqyRQ9NmsYKefdx6EODWmyKSiBkdJtjkP8jdNkWlQxd5GQ9RhOGUpNErPhkg8n/RANEnONJ4ha9YqSOtkklPYcRz/CBiuWejQdjyImM8JYyl5fADdU6StTryz7wrPjnSvhWgnf7BZPD1plmeRBXtlz4qK+7lGVPS6Y/4Ev0E5USerrUVJr3YkcEhQshe+2BLxja3RmcHlHnu4cKCyRi/jArBXJjAnYEAsi9GrNuNiFiCVRij3YmvKS+0pCxJXRgdfTLqhihCJYhozp4+Oe3KpTlLRErFpKwH4gKSgCE/FlvhrwfDziIZM5m62vHs0h0SDR+ra1KkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gr8URCQhuY2RFqeQmkI6Ro4/AoeXVwtQdjg2RLYvyI=;
 b=NM6mLQfxnoAj1COvU2IGRKDtm+RAc58kyQywpmA/KMTTHnQ9tiRidysor3272v50kaKgrZ4+emzmf7UzQZG2+BwlByXQkaph1O/xZ25Av5RmcW2mw9aLI8DBAy1dQtpqVP2dkirrZMFQGDZ0tOzN+6kAQxuwFDTJjm5v2AYOGtLRUnegOaIsO/j+AERdoZTGEfUJGgra9PcoQrz6jflGnlhJpd8GPuN3D5RgfeOt4j4/s4lUs9foEXVtfKKyT86GAMn8SXSE5DJeCfV1bySCr3o9cz3bUyhBedB2QnT9IimI0eo7ITbJQs1v45pIgIHGXnCsBqjmBkwy036ejEf2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gr8URCQhuY2RFqeQmkI6Ro4/AoeXVwtQdjg2RLYvyI=;
 b=hw3dFdzKT/m1Q4gd5j+bgyDBkJgEI7QnrDjIlZvgZ8n5VbDYw8ZAE+NO/dBB5ZAtjetqbC6urgpj/abyu8P6wFZS/AWMMiD/Jwsg5xC73QKmRI1zkLLbabVsc+ZFa+S04kenMrSTiC+KfhkjnsOGSbvg6CnQS1dbB9goJIweIH0=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4698.namprd03.prod.outlook.com (2603:10b6:5:180::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 11:10:01 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 11:10:01 +0000
Date: Thu, 24 Sep 2020 19:05:57 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, Kukjin Kim
 <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Richard Zhu
 <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Yue Wang <yue.wang@Amlogic.com>, Kevin
 Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jesper Nilsson
 <jesper.nilsson@axis.com>, Gustavo Pimentel
 <gustavo.pimentel@synopsys.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Binghui Wang <wangbinghui@hisilicon.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Stanimir Varbanov
 <svarbanov@mm-sol.com>, Pratyush Anand <pratyush.anand@gmail.com>, Thierry
 Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>
Subject: [PATCH v2 1/5] PCI: dwc: Call dma_unmap_page() before freeing the
 msi page
Message-ID: <20200924190557.48fddba5@xhacker.debian>
In-Reply-To: <20200924190421.549cb8fc@xhacker.debian>
References: <20200924190421.549cb8fc@xhacker.debian>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-ClientProxiedBy: TYAPR01CA0072.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::36) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (124.74.246.114) by
 TYAPR01CA0072.jpnprd01.prod.outlook.com (2603:1096:404:2b::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 11:09:49 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97e6328e-44ed-4b53-ea52-08d8607a61c6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4698:
X-Microsoft-Antispam-PRVS: <DM6PR03MB46982A550F04DB0CA9266A99ED390@DM6PR03MB4698.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YLRK+Q860l81NtKAbjitc9IGolFRH2/MNFk2SU7s2/CkGHmGfJNTJsn60BEl29d84AT2Db26qrQjNCEvab3Bp1dVzqzH2o14UoUEQcJaKm+AfLgXg7udxbTuIgcBuQcCjJGxklnbq3i8Wt6wWi0pbh50nrOTJ/IRIC8C8GxvIloFHJQxm0Rd3c1rh39FCocssaOTjQDTSiAyV9GjXDgUbegc5H1StWugO1dPEow7/MIGG0JJgnfmR2RFaVP0rdFwt4MrClRvoTF8LvGIL6Yp8KRdLwSYO5yUSn7s2gLxAgOsE0j6cl45+a+4qAqr5mUY1FfLA2qDEkuuU67EIG5UpLvDBbJdqh36Eg2LENnypjgxgVGTrANAquXLPMEqaSxe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(39860400002)(376002)(136003)(2906002)(86362001)(6506007)(52116002)(7696005)(83380400001)(478600001)(5660300002)(6666004)(186003)(4744005)(66556008)(16526019)(956004)(1076003)(26005)(316002)(66476007)(7406005)(66946007)(9686003)(55016002)(8676002)(8936002)(110136005)(4326008)(7416002)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: yBWSSQcE7+pQD/oYeVrS2GjzUN0irP0sYfuE8WT/gNfUdqPS2PXR2j0al1rVRoxbJef48hDMyFxZSJR4I7uv4Jyk2TwYgImaNcv1eYobXecCf9ju3tuYNswY8iSte4YSFZ3SSkSVHEf+MW0kHpygUDpeXB6N20r7nYYWzAWULFaGUtnujjTBEYLyf9MmarAvjG9OSs5oRF4oFKsfCFPBtus3JcBNN+StqRnsbxVDF2KhlUZsAuwnSAMiSOwLh079PgmIRZdx4V+Kvs2HcuA38QU2enPQpkJQKx664DIAo7vNqR5KnvHX39p6b6QhcP83K3htVeT1MA8EdaKd3LfO9T3eO2yCskjhmqWBdXbPYD4o5I4jcZzFFxubN+E0H4ENeyM7aVCg3VIzRdvhJj9At6nnEe60Dcb5QQxCY5SiZeyx0dqq2x7qX9H8uZ5csU2zWgGtWUc63WZqbwm966BjUXai/t1M9TXU8SNqiF/NV5FVBVofPAHTr3QYifKdUQmdx+ccJ7c46DuYGJ8SYosR7ZivpOxdVi+4CNjDrgsxL30oxlTKcGpZV7+fiCb5KkPfhuLLxMs9uqUay/r741atUoxApFkk8MaEMmNt5jq5GNGtDvuD5TSS6NnG/ZNoI3ipMfG73U2bSR+zVvBjbnjPkg==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e6328e-44ed-4b53-ea52-08d8607a61c6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:10:01.7916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6VpEICNadgMOphZdDbgMYnp3pOfn1ZKvcUI35slE0RXyQnC4/3nQlMoXR2HuIPnmzQf5Naix+x59047xx+VGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4698
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_071003_634663_6C47C8DA 
X-CRM114-Status: GOOD (  13.00  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In dw_pcie_free_msi(), call dma_unmap_page() before freeing.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 9dafecba347f..0a19de946351 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -288,8 +288,12 @@ void dw_pcie_free_msi(struct pcie_port *pp)
 	irq_domain_remove(pp->msi_domain);
 	irq_domain_remove(pp->irq_domain);
 
-	if (pp->msi_page)
+	if (pp->msi_page) {
+		struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+		struct device *dev = pci->dev;
+		dma_unmap_page(dev, pp->msi_data, PAGE_SIZE, DMA_FROM_DEVICE);
 		__free_page(pp->msi_page);
+	}
 }
 
 void dw_pcie_msi_init(struct pcie_port *pp)
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
