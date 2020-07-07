Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E72C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 20:04:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4B33206F6
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 20:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fmPmRLSj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="M0RiF84r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4B33206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DmhPXVAuzqy6+lScB4r3Y6OadcAnFBdEqUGRo4dIZoQ=; b=fmPmRLSjhvGRTZC1WeeGme8ut
	NyD3LwR5+82QnzGv6B6Dz1EwtZiqL5Wj2sPP7JT0q1H7bUcGjjZ1nYNMm254kv359kAYbOKBSegd2
	hEl+kpRvJ9eCETV+9hpVJKOQN0Mrli+CTUZo2z1QnARERTaekGeG4A/gAyxFLhe+rXRdWxFejyW69
	58MMNp/+dE5Q3h6c4RY8mo5FaHbGseLjjqGxqDBytrilQnfnorG7Ss5SC6I7eTu/W9Nr68jyM1usg
	I8F9Yq+FfX2hc4zxg0rUrMJng8Ths1Tas0+PczhUhptJBtyaAZtetv2WGFEWV8hyW6jWJSqgrgMtY
	5hjcOKWCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jstpT-0007l9-9i; Tue, 07 Jul 2020 20:04:35 +0000
Received: from mail-eopbgr770042.outbound.protection.outlook.com
 ([40.107.77.42] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jstpO-0007jp-HF; Tue, 07 Jul 2020 20:04:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3J1E3gxEDrBoVdt3rs0YqDl0m7JrbipgUQ38EFkLOurh5HzHsRxbuIqHtJrCgBNJJk886LBxl5u1k/9FThjMs4sUAjYF9GRx6Zf1QKyuJrLDTktiMhhminUSBSYXwko1UAxQo7NCLkpzS1Rrb6Jvd2cQhaLn+oND4sdOzge+Lo+Ebja72JoCPy6RHGNOgt6yz4TDDLNmOD3r+jCP24h5zRprwXvW/3964Q955xpoZrIzkK8qGjkKQufiBPeFmoUbkWCJJMiLaxQpEpbiI5OKSwSzBqGwaBNdos/6hRoZ9oH7eorIR/LuduU9hDJVbTllMjxVOgFL1+KImNNO3Qyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQWNGQ2dJvXojFQN6qUP29zvrHH/0lVt3ygOEfkEEUI=;
 b=M6vy+BU4YQaUPgJo3Has8tz8XWmdfEdXGVsbEthavnaygNkkaCc120tPJcnUNcduEp1qzdf/QchnOtvG73PN++ilWMRNFSetNncao2s3CFhgk0dycowTOUfHd/FZFqNmUU1lr/eCqVtsz9ASfOAJuuzsliT3GOdaQ8EXRC9VyNnjGP2DeRBEqWIvyC+yy2ooRdQnTyci9boxVpaM50VIckZSziLxF/wr8w3Qx/Z567AyX3zD20vBRrDU8zonZEtPHE7s83UDpYVBL2dkRiOb5YXz66FUv9DkueYqsLDcaUr0TNW+PLilv8/wY6KM/lQw8zxobH4MjJVmgnwXElhC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQWNGQ2dJvXojFQN6qUP29zvrHH/0lVt3ygOEfkEEUI=;
 b=M0RiF84r9WoS0HaFb7IsUOm10qWfCA5d2PrAGxQPk0IwYGm6Dwj07VelDMsmWxr9ueRcdA/+CajW6Ryn+2Nut7KeyI905sJR7jsZixDMQDmLaXbtBVH6c6qgbegtgHFiDzaaKQoqR0oP4dhkOTdXf98IIVKPKionSVBJp5vsY2k=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2590.namprd12.prod.outlook.com (2603:10b6:802:2e::17)
 by SA0PR12MB4496.namprd12.prod.outlook.com (2603:10b6:806:9b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Tue, 7 Jul
 2020 20:04:26 +0000
Received: from SN1PR12MB2590.namprd12.prod.outlook.com
 ([fe80::c179:ec27:4476:8e05]) by SN1PR12MB2590.namprd12.prod.outlook.com
 ([fe80::c179:ec27:4476:8e05%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 20:04:26 +0000
Date: Tue, 7 Jul 2020 15:04:18 -0500
From: John Allen <john.allen@amd.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v4 07/13] crypto: ccp - permit asynchronous skcipher as
 fallback
Message-ID: <20200707200348.GA127522@mojo.amd.com>
References: <20200707063203.5018-1-ardb@kernel.org>
 <20200707063203.5018-8-ardb@kernel.org>
Content-Disposition: inline
In-Reply-To: <20200707063203.5018-8-ardb@kernel.org>
X-ClientProxiedBy: SN2PR01CA0051.prod.exchangelabs.com (2603:10b6:800::19) To
 SN1PR12MB2590.namprd12.prod.outlook.com
 (2603:10b6:802:2e::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mojo.amd.com (165.204.77.1) by
 SN2PR01CA0051.prod.exchangelabs.com (2603:10b6:800::19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.23 via Frontend Transport; Tue, 7 Jul 2020 20:04:25 +0000
X-Originating-IP: [165.204.77.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b393c32a-c880-47e9-8314-08d822b0f300
X-MS-TrafficTypeDiagnostic: SA0PR12MB4496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4496C2646662A9928D444C619A660@SA0PR12MB4496.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dTwtxGCgVESod0ofTo3TKbYK9RkbqXd+92ipVnWyU6aDNm/wv4Ejq6qRBMjo1DQWKZ5Z+NxUILgqmerv6oqqL6HkY8EKFPqqx/CJi5r2xHSC81SmzBouWIvC3sT/ryaU1GbuAzdSnlehlFPd3ZAWvTLvvFlmyDplz1d3ECopqaTF3qGmCGmndzJQ+P5xSCC4o/RiEMkuN5AQsquS6jRdA28wr1vthNzJjhmcjg2VHVVbw4nwHFwbRoIeomrU9XFX2e/XvmId91gh7isbWFziFM07c1X4g4q5xyfFR58vn6Iu4AgDfExQgYgoij1Zh1uY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2590.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(44832011)(83380400001)(6666004)(316002)(956004)(54906003)(66946007)(66556008)(66476007)(7416002)(4326008)(6916009)(478600001)(55016002)(8676002)(2906002)(52116002)(7696005)(5660300002)(33656002)(1076003)(8936002)(26005)(186003)(16526019)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YeGb2stMMcMRTzsP7vfzpcpVwMdaSBN/IHzlOoGT089aC/PJIeIpMLWcymQeEY5cAcn/aKNBCodZQt/OslIGZbWQlOxMYZHlBqlYsotojHvj8qS10ItkfvebGx0Mt/tNJURku69/VqM0eth89LVmhgGvpPt8k2/bNuvGwYGKq4DFnASjTaKgNws3IldTbDXX+wjKUUDSP9zUHNMBET/z6eVqKnqhljyI0D4FxbALq1Zjv2CuagdtNi66i1mqm63anadT4kpPt/qm7tli3sbb3IBxV0T7WbknmP8PBSUMWJq36wCw5yb2DPQOqOYTVn5knM2+rBWYXyEi8IKStLfrLdcKcgH48NBoCjICzBN6JTqNw5F+ZZa70Bdh/NmizfFgGWoQg7Gt9SSamudyfEnUMkZ8f4PwjMD+1LJh/xlv9IdFsNMKKUs1+UD7R2yiYLE8U5eCvUVkmoRFoa34qfD2b/kN5gFRmQexoFhaCoklokw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b393c32a-c880-47e9-8314-08d822b0f300
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2590.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 20:04:26.3218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IW32qZl7sQGZLPjTFnIkn89LCajYPQBiho9LKjrkka+RWllG4/o/V9a7bdu1S/2Q3wmlMulhYMs+ROcBfCc2yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4496
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_160430_699630_63F2106F 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: Eric Biggers <ebiggers@google.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Ayush Sawal <ayush.sawal@chelsio.com>, Jamie Iles <jamie@jamieiles.com>,
 Fabio Estevam <festevam@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Corentin Labbe <clabbe@baylibre.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Maxime Ripard <mripard@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <t-kristo@ti.com>,
 linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Jul 07, 2020 at 09:31:57AM +0300, Ard Biesheuvel wrote:
> Even though the ccp driver implements an asynchronous version of xts(aes),
> the fallback it allocates is required to be synchronous. Given that SIMD
> based software implementations are usually asynchronous as well, even
> though they rarely complete asynchronously (this typically only happens
> in cases where the request was made from softirq context, while SIMD was
> already in use in the task context that it interrupted), these
> implementations are disregarded, and either the generic C version or
> another table based version implemented in assembler is selected instead.
> 
> Since falling back to synchronous AES is not only a performance issue, but
> potentially a security issue as well (due to the fact that table based AES
> is not time invariant), let's fix this, by allocating an ordinary skcipher
> as the fallback, and invoke it with the completion routine that was given
> to the outer request.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Acked-by: John Allen <john.allen@amd.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
