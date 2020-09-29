Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021C7C4346E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 10:49:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 975E0208FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 10:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j4UIOQAf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.b="fzGWL+Dt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 975E0208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AYye1cwfiDB4HRYMDBuwwkOlzX4Gbp4qdi5e4a6IkRg=; b=j4UIOQAf/EpTA8zYnVYb4TBm1
	iIRLoLzShIp/HL7EHzKHWZOVZb5lGP0ZvG0+G/tp78i7V35e3WoFhnXPv/6tmm/6VObWOX2p26Jax
	SvCQC6Qmg3a1E5ctMqSUpxs4TpkihyKZ7Tmta211znVHrkAjTrxy+uX6U9RkWU1Feo8vTjh4a4PGr
	31DyKM9DdHdhuXLEn0gyxQspS4Mu0mgpACt20zaoMsRYBkLuvl49DvmvdTQCRHYE24c+zW6sASHUH
	w+YyLmFBWpMxxq/4IxHwqIYfblzjJ8lVi/+jB9Y2gWT9pLfsu7f3ZsoKeeg+5TwR8zhtku1VM6waB
	ujIyTQ3Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNDCR-0002gv-G3; Tue, 29 Sep 2020 10:49:35 +0000
Received: from mail-bn8nam11on2056.outbound.protection.outlook.com
 ([40.107.236.56] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNDCN-0002gC-12; Tue, 29 Sep 2020 10:49:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgK4TbOnr0fczpx5TAK6RA2ni7US/7NnDQ+LvZW8WoKUpwIPuLYiLtUsw1hfq05CLJDyTf/LaK488Qq33vHlh+Yxf9DsSMzvu5i5lmFbhjDNn3m+itfDeDIBGz2xHYecjRSxLpa9MGlANfT8qd9vN6iQz/FYD1jthiVQUJm0wIGuQG0VxKu9dWnOcKmb8GL85xCjesKevcxiSYZG2xum/5ptx045qcw7snH6BIAGjtUx93X30OnjzHdWreE9UpGlXb1RMiPCqqfv0DR3HHQET3Lx4J5N3qkdvW70XXwJ2XdqSA6NKkaXkMtGZR6Z4CrvxUIJZbDpxu9A6/wLFMFBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrEqLeOG0e+YEU9Ew3Jbjzgylpn3z6Ewcxvzj7PRsog=;
 b=iwGWAcbqwq5ivUMM3n8DQNgsckZFsme7VLkdsyWxRFDVYywsvYSEhf4zL2WDvfL9fySw6VhuKrTPnxw8TJmLYAjy+MZNjdR+qdpEhlMs/9ksg0r7sv4lk6QMgxbxvIU39A5OXQC7XAJ7sqrg6ODL8wvIEIdwGg6Z/0wPFLEo8SPO9x0G6d2CtjE9F/JKVhHhgCF3KkHW2r1xMGyCF3Da6q35WTpEedEyO9YHePl/IhSI0ZXKO8Qs4UrwNrumveAicLuBWFkAJC/tflH89Tx4Ppc9Ku5coWsCsBi5gNWYUoP1UL8mfe4xFUHcBJVOiksCPhSyUikAPUlewJ3PO+iwnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrEqLeOG0e+YEU9Ew3Jbjzgylpn3z6Ewcxvzj7PRsog=;
 b=fzGWL+Dtmv1fbrzf/1UqoiwBl4DNVP8RYtDYz8YuHO6crpagZ1TAA0Fj5DVPqzC6PE/7L9J/Jep9nES1qMUNSKsWyfziinUmfbT6uRs4sziCKH4vpY4KRthBrm0R2Im5jNpKbqoX66pG4dr9kdx+SPih/r2nKZlYZucEA8snNNA=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB4442.namprd03.prod.outlook.com (2603:10b6:5:10a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.26; Tue, 29 Sep
 2020 10:49:28 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 10:49:28 +0000
Date: Tue, 29 Sep 2020 18:48:51 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 0/5] PCI: dwc: improve msi handling
Message-ID: <20200929184851.22682ff1@xhacker.debian>
In-Reply-To: <de4d9294-4f6d-c7d1-efc7-c8ef6570bd64@nvidia.com>
References: <20200924190421.549cb8fc@xhacker.debian>
 <de4d9294-4f6d-c7d1-efc7-c8ef6570bd64@nvidia.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-ClientProxiedBy: TYAPR01CA0054.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::18) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (124.74.246.114) by
 TYAPR01CA0054.jpnprd01.prod.outlook.com (2603:1096:404:2b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32 via Frontend Transport; Tue, 29 Sep 2020 10:49:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7998fb7-2a5a-4760-9244-08d864655641
X-MS-TrafficTypeDiagnostic: DM6PR03MB4442:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4442DDA95D15D07A19C05B42ED320@DM6PR03MB4442.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bdv1cSzH0wAYG1qqqX9oVTw7xry1CEJvAkVhoAYoETIovnkvhyU9bR2l8SJsKl/2HDwWFtggQHCE02U5rq7nmuvzIlBk+Q05L+5vvP0AOf32sg3STsncAFYVV5mPvGUmte6Bl1L2RR6Z4aCq4wla9AkyAYf2fqEgv+xXdkxurNvxjoOvcy+aFXPh0NyE+uLGOJDmAiXmIETWWQ556OXr5g3yvYTsaTM0H8rgbyfsYTw6yCSt8gPHpHtv628GpNVvcFmiW83uRD1m0OLV8y7RhEzkpPANRTg41ICHSRdEzlTJnVcm26IyCIPiXYfq+X0Kw+bk85hh4oMbCnua/Xahush3rUUFt3YK6vBN9Gzswd+WrIP3fLkDpr+kiGnDEU8D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(346002)(376002)(366004)(396003)(66946007)(956004)(6666004)(8676002)(86362001)(478600001)(8936002)(1076003)(6916009)(4326008)(5660300002)(7696005)(52116002)(7416002)(7406005)(53546011)(2906002)(16526019)(6506007)(26005)(186003)(66556008)(316002)(66476007)(9686003)(83380400001)(55016002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: mXCAddAnPLSkQjPzsCwpnlw31nefGW/Yx2Iy7B5gG4NvIlsPMeoj+EycO5dJ+1dVLM4SMg1eYvdh0/J4xRdUKxV7hyi8HkEmu5s3ikYHSViqYO+qdYIwse6fRJahYUy2WRPvTJLxZAeyOHpYnfzRQiQ8S5uNddpGtkt24/VGOn8TDwAN3LpOj4a6cSiCHvUwkAarEoOFdAMkVBbu+1TpATEBRxv2qLS08noWBQLcfiBD2FZOXiHB5KkhEA5t7QrCRi2nvDwHio/JzxjDOFQNhmXez8HKEDGT9g1FNVQyXSvYvZjhDmnOAx3jgOyDH9c01jjz6r9UpcXNArgsdAy60sEETGRsKusk9/bkIfpGMJpl/QNQ9DQ1T7CN+uShmyBjGFRmUeQrXxLiNUpiaNtHf1Fu5JPXQJXHfHUg7932UXTwzsQpiJv9YMZrBYJJjIpbh7RXIG1P+BB+m7ntLyMTbz9m1jbnFtk/0Px1Zrgxv2DhjmwJxNTS5Uba/lKCgu2XsPF1aZpWGt1wQF4eIvxz+E6fyhNHagR3OniEkeJ3TUx27m+3hFEhI0pV5GrXLuOekQPRcTiYrWrtAF6y4DVaJQeCzPhwnB8MGZfS5+CT18dTXYefIZ6ZQInu4H9tICnzeMht4P2QLbwsNfNzCvng/A==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7998fb7-2a5a-4760-9244-08d864655641
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 10:49:27.6996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lL2OHFP21JIEiE6gpUPB0JP6ixr9g7VrYwQhCn1EXTXxDmQDeFIIIviGQOFYASIUIctBsQ9kmm1z1Za8IFSsjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_064931_073648_C6E13386 
X-CRM114-Status: GOOD (  13.33  )
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

I tried to reproduce this issue on Synaptics SoC, but can't reproduce it.
Per my understanding of the code in kernel/irq/cpuhotplug.c, this warning
happened when we migrate irqs away from the offline cpu, this implicitly
implies that before this point the irq has bind to the offline cpu, but how
could this happen given current dw_pci_msi_set_affinity() implementation
always return -EINVAL

thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
