Return-Path: <SRS0=il4G=DB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162A4C4363D
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2020 11:09:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92DD820702
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2020 11:09:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NLLlp+YZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.b="RbHSaCf0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92DD820702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UFN5BlKBFrj8/gjMMIkKPOqpUygUkXe2b9y8nRETuVQ=; b=NLLlp+YZ60zDy3a5UBlXXHXO8
	S3XvFiUs7MQ2Y8qIz+XRdG5UNpS8XWVrIz5wNbqYnAeC4G9eR7DOMLngaaLhYl2TiGPbun8JNWZzN
	rss2nf4etKkcHpO9I+4OVPIvs6OzU5WfDjn5leRFZLAlMRWHMIyuhI8uN96bQfaZYZctjZN1n6GQG
	L12VSIlbv3hOEu9uMl/Q8f/1cLKbQjOlHHLwwd1HYrxrJwxDhzYDNWSgisYX6xcy+A3sifR6uWieR
	uk8aS3uVIuzQvroBHTmmXc7gxA947TdGh6s+cx5f+EbMCVnYxyZixL06HwGJK7qFMNY3D43fHF31S
	JvQzsduFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLP7x-00023h-S9; Thu, 24 Sep 2020 11:09:29 +0000
Received: from mail-bn8nam08on2075.outbound.protection.outlook.com
 ([40.107.100.75] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLP7h-0001w0-Ai; Thu, 24 Sep 2020 11:09:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NN63WzLqfgiVjMApbMdERdPzHyYwwpTblAlGcK/aY/jdk0/w6t4MXo9ag3jfu+omCFJIRBRiWs+Ays2p/1d3HwuvhllxVOtg5gUx+6mjMoEjzgOfZuFdimh/EUewDNfrZqCfz5c/ogrrTU7gr59E2vzoc1Q+3iUIeoZzEWhxccEbfw02FHIEgcXiMJGowC8aFbZXbhtCs5VbPDWEmL7ruPeGglD8N+P7T74E9vgY/CFGc45lvUACTOvwclTScSEFmDedqE6OdZjW3BBiYLKlfocDmIGrYj7i8X47t2cpg15MQOINpwwNMFdZTO0d1wzF2RJf7OlZj7LlRVGPF0dTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUNQDYZ9rMtqPs8FD/2qndtHl/sKXX6XLTpbfHpTPjI=;
 b=PISMAJ5/xIASxQ4cc6f/OK++dqy0FwSJlTMRsZ0HLHmIfYmlYmvVGfiOckh3/u1tYwHf8MpAyYIgBBJDp8hwXsKbxM4e5dH+irIWr3GVA/zfSTW3CRniR/YL1FHwCRjAVAm8qt6m69pVEr2+PmpJ+wyOUAcmBC5ybb3ErLhJn48sIJhHew3uw8q0REvHs+yKN0D0I9eAbBL1E8nkAG1HyypL0PAdB/S3ZQk1MUYXn2dAQfnzuFSBBQIHQ0Gl9tAN7SWDFaOx8myZSrhhn7cxWO8nwX0YSlj28Aaa6J5bX+az8ALQlBSo0XogMHhiZnhXRjuCA7ogGUA+uPqjyTzewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUNQDYZ9rMtqPs8FD/2qndtHl/sKXX6XLTpbfHpTPjI=;
 b=RbHSaCf02xATKfDCh0a0ELsjV8gKwRsr3FwT9W/A+xUVPdZrWnFOGhYMyHgCeuzAbkZzUQO0mVDFNg3nLZiHkRYGMT7Rh0JGgfX8PqCS8sUkRSxm122+CDPctYHUzJ6k3yD03cJZHrWSJGVAfR/b6ha85itEC67wEGd+QdPdr+Y=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4698.namprd03.prod.outlook.com (2603:10b6:5:180::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 11:09:11 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 11:09:11 +0000
Date: Thu, 24 Sep 2020 19:06:50 +0800
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
Subject: [PATCH v2 3/5] PCI: dwc: Rename dw_pcie_free_msi to dw_pcie_msi_deinit
Message-ID: <20200924190650.24c0ff8c@xhacker.debian>
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
 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 11:08:59 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d82951b3-e5a0-464f-600d-08d8607a43a9
X-MS-TrafficTypeDiagnostic: DM6PR03MB4698:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4698241E3FE19D7A7B05BAB1ED390@DM6PR03MB4698.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c58m6BnVFVuqq+u8mtMx0QULUVIkBXS8UUTKjHsQk8GLzJgSYdeLrePi+33M9QnlKO+KAT036xCrCgqQ9a36FBchaZ5YgZkdh6YiQfpcAh69bY3GGI4kK23rgfEf2h0Sh0fucoACMDAt1KPFpOv3tnUnGwSO8BTjNMhel6ZSGCcjvVPtNCviJ1OlFIGM9ZF8eR5RTTA+xKWFUBUSOr5SHYXqOxvFzxFuxvgO26UheMPf6HNA0bn3r6+fAQN9C2E5+34w/9BKV3fILQZMRci1JmRrcyJAbPnSsYawrnIAIjw0VhmOUzleewsL2V58AedJNiHlToZ4PP8hpEyxQ4GsKXelvtuTQeplqJGox6BosqivGaZG1ZUfgAub5LGveqgB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(39860400002)(376002)(136003)(2906002)(86362001)(6506007)(52116002)(7696005)(83380400001)(478600001)(5660300002)(6666004)(186003)(66556008)(16526019)(956004)(1076003)(26005)(316002)(66476007)(7406005)(66946007)(9686003)(55016002)(8676002)(8936002)(110136005)(4326008)(7416002)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: V8596LdB2ey4bVQREk1T2QDQ+we/64vEdOEbR0tk32bMl6axDZIUbgnTkru6Y223GYnBaYqDMJC++/W1UNbu3mpQUSrVcS50wh6+OEET3K03Fg+QNVVQO3JxMa/ZS8KO5AcAUZQA1sLg3lxThKSvN4klRA82ed09RTe67F2O1XxfwGY/K70IJdNn3rwQiFnMeuLd026qk4Adj4uxaj6sE6rHxsTRJ/nNB9WWGEO9BNp9df8G34CQtYE9JjgC8OdktiFK/tWXi5zuXfvjK4I8OuFfjqFsUiTkbmFlWBxMV+SGqJUcxX+IQYeG/yW1rJG+bb3RZQ1B2t5cVxwcFONuAwIzWQTnb6Ji5DXouQIkSeIhCF1pAi1jTXS6QgzuWbi590cMYZypDstRDixIUT0Cnql3Z3+VK1LXAjkvaesI02ZzYyIn/HQmDX3CjIbRHBj6din1WHBePqrnFlnB2wma1xEJnNdi35Cqng9cdb9Y0muL1wWx7vjN2O557nUGdUL4NCLJ2SWEiIRChb+6xE8jS47SmCrNXw5VgPmapts3QNojwgYr+iuP2oPfaM7fIsd/nKdtzKWjKJbcyA6HgPe59DP8tbDOqsXQ3wKyfX6MvbAE6d6KoKvaFA+iTC19/9taONI3haGATtsHbHtDkPOv7w==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82951b3-e5a0-464f-600d-08d8607a43a9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:09:11.3883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXafrv2u/U7dpykpeXQ+d8GzArDWb+WRVaJ0Frhb9VzfeMxXZPpOcLbZRkmAmNhtMKzEd/fNkE2g1rcNW1B4SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4698
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_070913_445121_84C8249D 
X-CRM114-Status: GOOD (  14.33  )
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

The dw_pcie_free_msi() does more things than freeing the msi page,
for example, remove irq domain etc., rename it as dw_pcie_msi_deinit.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 6 +++---
 drivers/pci/controller/dwc/pcie-designware.h      | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 9e04e8ef3aa4..d2de8bc5db91 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -278,7 +278,7 @@ int dw_pcie_allocate_domains(struct pcie_port *pp)
 	return 0;
 }
 
-void dw_pcie_free_msi(struct pcie_port *pp)
+void dw_pcie_msi_deinit(struct pcie_port *pp)
 {
 	if (pp->msi_irq) {
 		irq_set_chained_handler(pp->msi_irq, NULL);
@@ -500,7 +500,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 
 err_free_msi:
 	if (pci_msi_enabled() && !pp->ops->msi_host_init)
-		dw_pcie_free_msi(pp);
+		dw_pcie_msi_deinit(pp);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_host_init);
@@ -510,7 +510,7 @@ void dw_pcie_host_deinit(struct pcie_port *pp)
 	pci_stop_root_bus(pp->root_bus);
 	pci_remove_root_bus(pp->root_bus);
 	if (pci_msi_enabled() && !pp->ops->msi_host_init)
-		dw_pcie_free_msi(pp);
+		dw_pcie_msi_deinit(pp);
 }
 EXPORT_SYMBOL_GPL(dw_pcie_host_deinit);
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f911760dcc69..43b8061e1bec 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -371,7 +371,7 @@ static inline void dw_pcie_dbi_ro_wr_dis(struct dw_pcie *pci)
 #ifdef CONFIG_PCIE_DW_HOST
 irqreturn_t dw_handle_msi_irq(struct pcie_port *pp);
 void dw_pcie_msi_init(struct pcie_port *pp);
-void dw_pcie_free_msi(struct pcie_port *pp);
+void dw_pcie_msi_deinit(struct pcie_port *pp);
 void dw_pcie_setup_rc(struct pcie_port *pp);
 int dw_pcie_host_init(struct pcie_port *pp);
 void dw_pcie_host_deinit(struct pcie_port *pp);
@@ -386,7 +386,7 @@ static inline void dw_pcie_msi_init(struct pcie_port *pp)
 {
 }
 
-static inline void dw_pcie_free_msi(struct pcie_port *pp)
+static inline void dw_pcie_msi_deinit(struct pcie_port *pp)
 {
 }
 
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
