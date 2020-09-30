Return-Path: <SRS0=xPAz=DH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA83CC4727C
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 01:23:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4815520B1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 01:23:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QifkZqIZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.b="TbGAkIpM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4815520B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synaptics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KEhUtm1aQbaLd/M7gOkidZsWmjE8sqM5uNLINYiWkh0=; b=QifkZqIZgjM5GLhvib5MFaXeN
	igBj3uK0TNwT9uh/xEMyqHLaiHqNwznX9NJp637lN6w5olt7YSH0srksLi8n9sgR3amneNmgvKOyd
	q4vDNMMrLrgLfbkLw4IlYYIRLYq8sV5899bw07YdJSOHQYyBFeCDNn3oqpv5orkS08DAwTsBpOAZ9
	FkE9i6cGYnFLtNJAXKPJkUJ6akI7AeJTttzfrYiOSxEJpaAY1w8HZ9vVlDz1BkousbsaoAfNmz4eZ
	jhLRbELyPXUfEso/o3oP7D9n4o/JCkD49e9DFGlDHjDgh8gMM7s/woM+/37aaBA02lIKRz1Sm4P+Z
	YYl7YDT8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNQqO-0006kF-D4; Wed, 30 Sep 2020 01:23:44 +0000
Received: from mail-bn7nam10on2054.outbound.protection.outlook.com
 ([40.107.92.54] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNQqM-0006jj-Kt; Wed, 30 Sep 2020 01:23:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3J6dHJfPVNv6CjeEta09Jj4kRH3sX0yo9jyK0xJtXIzEo+SOko0SWEzJ+xFGVcKL+JVTmjZGspjCE/2B6fEr6F0SORO3stqBkw9YmngSVnbcneeg5hxN0h6jCrMRsnClM4MhEyAvtR2BrvuN7UJDHX/LJLWumkn1cP+cbfNVzvhMMMkiloDjV7Q9bTLSyhKCbPigjB86IrXVFThPgKsSny/FvqMBfu3ZfaItXJCJSTF9BW4hrkxgVv1wrUOztxtaDQTz8coVBcBOSWpKEgAbZMkg8svTuPfn+UuJwjRjNQCcnzPiIhWcne6C9qlG6Xvx8EH9upWcNRqYM0wZHfOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8nw3Dec9uN1gNyB6+voYhdiaRUQvu6G396QHm35HN0=;
 b=JZu8PXDiv4Sn8NvdjLOjkTBXKdmywHyrR9BDWPc6xjxpRQko3HgOuacp/Or+buJb/6us4j0Vz22aLzCBtM75H+wqiYVMP4GJEG8sQaXN+FsRSrzrFN1Y26c4wvDfRbQhHfiVIz/Co4pnmw+PNypDVIooUUct/WRt7qoqj2/bsgIXoymesjWG/c0KppkKHiIGSt0rc0NEcb0wBtkrGW7JRMpcmfqAxecWlGXImzCduNuzeis64cxsNNKLoDd/5D71KCKkDU/0bdq629khxzIMe1uhJpCcFJDb1WSJ/18ZVWxuptzV/HMelb9YNPYPbaG9+cN49p3SpUn2rwA24njpxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8nw3Dec9uN1gNyB6+voYhdiaRUQvu6G396QHm35HN0=;
 b=TbGAkIpMlhPQJBajq0fJGDBMWLXgpjO6UHCm+rE8ju/vGhETQ4Xs1UH3RzhyK1F4Id7LwPA9gbAC/GdzZ1QF7NuEK/66R9g3aGxfBwUZNCnPPzpNOssIflsObszT4RhmaWutpcaqcmyGXpRcCTDGcbX23XLpMdmdKTCG+5q0AhA=
Authentication-Results: misterjones.org; dkim=none (message not signed)
 header.d=none;misterjones.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB4555.namprd03.prod.outlook.com (2603:10b6:5:102::17)
 by DM6PR03MB5099.namprd03.prod.outlook.com (2603:10b6:5:1e4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 30 Sep
 2020 01:23:40 +0000
Received: from DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38]) by DM6PR03MB4555.namprd03.prod.outlook.com
 ([fe80::e494:740f:155:4a38%7]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 01:23:40 +0000
Date: Wed, 30 Sep 2020 09:23:13 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Marc Zyngier <maz@misterjones.org>
Subject: Re: [PATCH v2 2/5] PCI: dwc: Check alloc_page() return value
Message-ID: <20200930092313.6124a082@xhacker.debian>
In-Reply-To: <74af578c79bd09f2111e5438917f2c6e@misterjones.org>
References: <20200924190421.549cb8fc@xhacker.debian>
 <20200924190623.3251c2ac@xhacker.debian>
 <74af578c79bd09f2111e5438917f2c6e@misterjones.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-ClientProxiedBy: TYAPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::19) To DM6PR03MB4555.namprd03.prod.outlook.com
 (2603:10b6:5:102::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (124.74.246.114) by
 TYAPR01CA0055.jpnprd01.prod.outlook.com (2603:1096:404:2b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32 via Frontend Transport; Wed, 30 Sep 2020 01:23:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24250ab-a243-439e-357f-08d864df7653
X-MS-TrafficTypeDiagnostic: DM6PR03MB5099:
X-Microsoft-Antispam-PRVS: <DM6PR03MB50995B1FCFA034BDAD2B05B0ED330@DM6PR03MB5099.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vASMwgp7dj6oRqrQKwOMOalj8jNKVyNV8jsplf4scAaN/Oj+7CLCGQANuxMgumUSZCzKbZmxfFXV0SirJd7PgeeY6lOZirPt1dU5F1bJfo84U/5O4nXvppjgDtQP2+1Pa04NTzi4hvfepVQeqMzRmcQ2gSj7uvXZw9vbsCvKHZIF59GDSTdpUOE3s39l5aVBYvAXEJvjbDa4e/yaW++Hus6PsonCi0zKX5WGdK8dPl0eWye9FzQY9mMLpwvQeNKIkH4pVRZ0WNQblyPRykBkLkwJNxXw0NKnAHUrl4V2zt31ZeNUg3+ZcLfm+y+rJXcqNFlmiz5RxYjpg1zbnu9yA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4555.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(136003)(376002)(39850400004)(9686003)(8676002)(66556008)(6916009)(66476007)(316002)(4326008)(66946007)(7406005)(7416002)(478600001)(5660300002)(6666004)(2906002)(1076003)(8936002)(53546011)(6506007)(956004)(83380400001)(86362001)(54906003)(55016002)(26005)(7696005)(52116002)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: P3UnmWd3vnE+fFbtVEPHm7djjY+q6NxF+7Yj5Af1XT/oCZUCZbaLHg81jjgNawX1sBXiHB27FHsZqCJV+jFbhtdp3LScteYXKLPR+0QcyH8jyd6ok2PilyZVcVMJ2+9kaLzx5t8FCKkAc494a/ESl4yPho54sbTA4Dn9Y4Jqgwk3TTXWK7t7150szNcYWAKaTsPz2aHPcvpqrY4wK/20qo0dye861XZ7YNLYcOgpFls67AHTFu1ul/9nAgDODxfB4/vvYWtYCRuMrJgu5qdCp8Pp0QEyftJMWHfXr2ObXhdIi5oTcvCToptdny2IlCt4D2RNrDvc7ffiigC8hCAgmQTzvbxGAsX05Nga3gapn9nq12KOSJET7stlMPXIamD0uF/+XBvLlek+dCRIGPQpcHmM6Qq7Qd1JbIuGA2XKYaOI7V6uc+fwb5d6aoWGrY/DLCGLuxhi7vTikVofqGHAIXv0m5gqmgVj7PVK3BLQaOeod4qur9iFbqB0AB3FI8itTGyRSplo9CkAwxcSK3AM7etJDHyuErqviJHJjr6OgxlIq9FcDDhSS4a5pwhA16ruuULXoATcGnSWA3HCCjhB0R4G/JcZiojRK3sJ3rkuALluZNhMuk9YC6ZgNukNjXz/TY30poFSa64M0VePSs8DgA==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24250ab-a243-439e-357f-08d864df7653
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4555.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 01:23:40.1912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKcNhXuEm07mcD4LtDFkb57sxMOOhAL5B/aTa7EbOue++PRWoIErKCd2JbYjrCIZsqEQFkREaLLYy6EecEwpEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_212342_700064_E3DBD091 
X-CRM114-Status: GOOD (  20.71  )
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
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
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
 Yue Wang <yue.wang@amlogic.com>, linux-samsung-soc@vger.kernel.org,
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

Hi Marc,

On Tue, 29 Sep 2020 18:29:52 +0100 Marc Zyngier wrote:

> 
> 
> On 2020-09-24 12:06, Jisheng Zhang wrote:
> > We need to check alloc_page() succeed or not before continuing.
> >
> > Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-host.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c
> > b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index 0a19de946351..9e04e8ef3aa4 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -303,6 +303,11 @@ void dw_pcie_msi_init(struct pcie_port *pp)
> >       u64 msi_target;
> >
> >       pp->msi_page = alloc_page(GFP_KERNEL);
> > +     if (!pp->msi_page) {
> > +             dev_err(dev, "Failed to alloc MSI page\n");  
> 
> A failing allocation will already scream, so there is no need to
> add insult to injury.
> 
> More importantly, what is this MSI page ever used for? If I remember
> well, this is just a random address that never gets written to.
> 
> So why do we allocate a page here? Why do we bother with this DMA
> mapping?
> 

Ard and Rob also pointed out that there's no need to allocate a page, instead,
we could use an address in the driver data for MSI address. So I refactored
the patches and verified this solution works fine. Could you please review
the V5?


Thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
