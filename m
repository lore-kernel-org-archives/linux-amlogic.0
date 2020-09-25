Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB80C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 09:17:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 780F3206E5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 09:17:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fZHzI2A3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.b="oCBt2t7Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 780F3206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pEPxXX0DNdHcb6IIlZN7+vw68xsMIXZt6/RH9tIgbwA=; b=fZHzI2A3jr37vMH9PSjKFuN/D
	H/eNxiu1ld483eNrK/+tKpoOIHwchDtVElTnmRjb53p1W/USQYWJTaL8ACMFdnmXqnSbQK+RuD/ae
	bpCkjRD7WEUrmR18Q0au0JmDM17fGLtucW5+RZwXBtsqsUL1MUdpVRYOSLKF1/C759RIlqv1EhA49
	OURoZyIFwN3PGx5UMMa5T+nRpNrrZyKGT8AeVznk+zN8KRXKkkUW9ui7S/hZXJYnK8OzpH6c/O+60
	j9Nixt1FWFDRnIWg0GusyxyTw4obHIvb3X0MWaLHk6c5EtFJA4p9BYz0qjKKprUhbbhxPAyWCVKUJ
	uvqMmPgSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLjrS-0002Oy-2r; Fri, 25 Sep 2020 09:17:50 +0000
Received: from mail-bn8nam11on2064.outbound.protection.outlook.com
 ([40.107.236.64] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLjrN-0002O4-IV; Fri, 25 Sep 2020 09:17:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct8WpGb/kr9byxd2bCY9GxlRIUM19XEJRXS6npJbpQ50f2IHkUAYYsAE3D3UnVYlg+lyPED2RO/ZQ5dWR4uEnkknJV/x8QVQvqju70vFCA/JK9xlASyFCF8Tm7ruE3CYKK4OUikcnwiNS0op5Mxl+bpe5FWF1NtmvQCvaVpku9buRCzCwR0HaxqLy8UMXAYwRAbuVelJfqHnjosD/u3+y+ZbLn2rt1+lHPzxlOThXRzDfBTEv2+0SQEgX5GIeA/3S+6ZQ3MCT8Vq+//2VbTSFjLI5KGIQrJ8oqkQK9eS0QDd7d4EFv+FJXO16Pc4/NY7Y9XUdD+S8VW+YGCcXYb6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MJjtIL2AEpcEzM17DEANEGzkN/9eam0aF96BBJJE3w=;
 b=Cmvpw7gIAWBt/s6FEXRKcuMeWhASW6+mmL92V4Pd6+av+5pdn+Tb7PR9qCdG9mHrwBMRs2Z8LgNPYyLHtf3F9z1YzSIDQJxRFe+Z7BAUNQdmv4GRO2IsGq1UV4CjQHRY+ruTP6E/Xrpu/JFkgGmG7N7h4aNlG22hTITcpDY7GZ4oyQ/AhP3+drsADyU/ydDz8EQZaoB4hI4GFNMvxm1Ayn2gYgAAS4h/eJGy2Tp/FkA3KodFsoxx9BLEskgoGn5xfJVoOCs7VtNRENp66CpOTbCFISSpd18vsB3k6nUPziMg8YO3jAckri1+UFvuG02BhPgklKVvrjm4WpMExAA1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MJjtIL2AEpcEzM17DEANEGzkN/9eam0aF96BBJJE3w=;
 b=oCBt2t7Y9g5q5wQ0DE6JLJR38NMhJZEzuCxsv4FhwpiHMM4sSPwNier0flicChNqrFJXaTcbP8sqhEg70S6mag6Mi2MUOkMDPIsELLWz2Nxhd2fqqqikBPe855k42ojh8aXF+ktzCzkKNttb19hgS2FA4MP6CHSOhWcDbPClkVg=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM5PR03MB3259.namprd03.prod.outlook.com (2603:10b6:4:3c::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.26; Fri, 25 Sep
 2020 09:17:43 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3391.028; Fri, 25 Sep 2020
 09:17:43 +0000
Date: Fri, 25 Sep 2020 17:17:12 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 0/5] PCI: dwc: improve msi handling
Message-ID: <20200925171712.254a018d@xhacker.debian>
In-Reply-To: <de4d9294-4f6d-c7d1-efc7-c8ef6570bd64@nvidia.com>
References: <20200924190421.549cb8fc@xhacker.debian>
 <de4d9294-4f6d-c7d1-efc7-c8ef6570bd64@nvidia.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-ClientProxiedBy: TYCPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:1::19) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (124.74.246.114) by
 TYCPR01CA0031.jpnprd01.prod.outlook.com (2603:1096:405:1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20 via Frontend Transport; Fri, 25 Sep 2020 09:17:32 +0000
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d93dd60c-b84d-4de7-047d-08d86133db61
X-MS-TrafficTypeDiagnostic: DM5PR03MB3259:
X-Microsoft-Antispam-PRVS: <DM5PR03MB325958C515BF9A4F282614F5ED360@DM5PR03MB3259.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zfkwaHOTLAKAYnUoWYo/Fk8yhxtcjvMzFJz17VVvh4fbPZJQXXFy+Oz2YjQvMcipNy0EIXplsTMKwdC2HWBkmyLzSjn7dMj++PAa56RnoN5TNaNMXNd+6omSQ7v0C48mRxBdrlHoPls1B5JVHJ0PaEPpwyg4WcZ06RL3KmZ9GmuWmaUehNe9Yovu4fkR1iXhCtWJnsrbbalup9DCqB0wp1MdEXtg27xTM0oJ6RyqUJaeufu3S2wLeZlNPrYeIg1CD+SNqX69/AjU1IDwRH3B7YI9yRUcgkRqHpaBXri7jqdob3dxN9bF2q05VrLpFPfn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(396003)(376002)(39860400002)(346002)(8936002)(2906002)(83380400001)(66556008)(956004)(66476007)(66946007)(6916009)(7406005)(5660300002)(86362001)(54906003)(9686003)(8676002)(26005)(7696005)(52116002)(316002)(4326008)(186003)(6506007)(55016002)(6666004)(1076003)(7416002)(53546011)(16526019)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5vJ8B2kYtheC9shaepwaK5RLUXRuAfL3qjOISqdwkdsaT7vC1ISZkopHoq5r57fR6ZRXAY8J1OccaVeFmaCU/y6yetW0qVqUi3eR3Dr8BdjeslVwe2CHgSoNtX3EywSHVuZ/juODg7k0uysbvfem7U9rF1DdaJaniV3gp2UVUaT1dWgYif6CIk3IwSHJ7NIRVRfxoJXiHkCdacD9gJoQ+6qQ82qdTTj0+b6Lx6iAH1BptGnr8BMdcVOwPexHmswOSlh33bdggIH3paJ9GWGCy/j0hQOWA/Wxo2XBRMsjnZegTGAlWJ3n0HAmP+DL6cet3gBMJ8yWxPjGw8PRu1ws9q/Wu+Q4g9LH3l2Ej64laHP7OF9hA2Lr4GLBhrEy/xGe9TI+FDFfzU1ZFLZOmFiMU8YXeMENaDYm8soJwfo9nsyCZrwYM3qCokI15jXL+bUWhHO/yrZx6V3/mGYRn3r7DRPGRmcrBT4YtGh72pUprHGm9rV+6/Cyb2cCYzduf4svAYzJ6M11oULICYsFKZQPtPoCALLj7gaGUHG5CSfka+7iz4x05K9V4SVs08HfTu5DfPYlgrCk/e5m9+EESEU5yGhjtjKCYMYNol5GW/JxsioCpwenoawUmX7fMABlNOrvExNn8wAhi7qMUE+lehLkog==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93dd60c-b84d-4de7-047d-08d86133db61
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 09:17:43.3925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obAQt4C5pM6hC+a7zBUzKZIIeqhNcifGDoGMu+xJfE7V3rrlkZmiLl7PNiakvjpsXJ3ymBQ2jQRdZLQ2v2Vumg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_051745_619796_7611CF92 
X-CRM114-Status: GOOD (  19.24  )
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
 Vidya Sagar <vidyas@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, linux-samsung-soc@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jon,

On Fri, 25 Sep 2020 09:53:45 +0100 Jon Hunter wrote:


> 
> On 24/09/2020 12:05, Jisheng Zhang wrote:
> > Improve the msi code:
> > 1. Add proper error handling.
> > 2. Move dw_pcie_msi_init() from each users to designware host to solve
> > msi page leakage in resume path.  
> 
> Apologies if this is slightly off topic, but I have been meaning to ask
> about MSIs and PCI. On Tegra194 which uses the DWC PCI driver, whenever we
> hotplug CPUs we see the following warnings ...
> 
>  [      79.068351] WARNING KERN IRQ70: set affinity failed(-22).
>  [      79.068362] WARNING KERN IRQ71: set affinity failed(-22).
> 
> These interrupts are the MSIs ...
> 
> 70:          0          0          0          0          0          0          0          0   PCI-MSI 134217728 Edge      PCIe PME, aerdrv
> 71:          0          0          0          0          0          0          0          0   PCI-MSI 134742016 Edge      ahci[0001:01:00.0]
> 
> This caused because ...
> 
>  static int dw_pci_msi_set_affinity(struct irq_data *d,
>                                     const struct cpumask *mask, bool force)
>  {
>          return -EINVAL;
>  }
> 
> Now the above is not unique to the DWC PCI host driver, it appears that
> most PCIe drivers also do the same. However, I am curious if there is
> any way to avoid the above warnings given that setting the affinity does
> not appear to be supported in anyway AFAICT.
> 


Could you please try below patch?


diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index bf25d783b5c5..7e5dc54d060e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -197,7 +197,6 @@ static struct irq_chip dw_pci_msi_bottom_irq_chip = {
        .name = "DWPCI-MSI",
        .irq_ack = dw_pci_bottom_ack,
        .irq_compose_msi_msg = dw_pci_setup_msi_msg,
-       .irq_set_affinity = dw_pci_msi_set_affinity,
        .irq_mask = dw_pci_bottom_mask,
        .irq_unmask = dw_pci_bottom_unmask,
 };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
