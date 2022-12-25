Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFE6C4332F
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Dec 2022 03:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2Nbxs/g6w6qWkF2iwQC3CJTqtXPX0eUNZD1S1FIMIE=; b=1C3qtkA8yszC6Y
	nzVA0Y5vo6tkKU/bNUAhyzfiNSSbbKuZ86kZ+FYm044SpuoHjSmi3w4EwOn7P7JzzPCPJmq9JIAxq
	zEyof3MP9STiC9TT/xULOodQB37lLXCkf3GoIykFhGw5HPgxaLUOQwjfnwPhHGQhViTc09/ZjN3+X
	kk63LtbmAq6NLOuISObWFnBmZB+SIWa2x/dFcX0rvNC2RJAvEErZ5x4FF8sKv444WME9kVYg1TxWS
	PV2Hp3pyifTCeG+3wtl7CjqDrPzr1RdAv5hNLdVh4Kyq02abA68RBGlPssm+K2Ls2boDlAGgaK2gq
	xLTgKf2hQ3zEWb9+AOjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9HZp-006AJM-Ex; Sun, 25 Dec 2022 03:21:29 +0000
Received: from mail-tycjpn01olkn2021.outbound.protection.outlook.com ([40.92.99.21] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9Gyf-005nEW-QA
	for linux-amlogic@lists.infradead.org; Sun, 25 Dec 2022 02:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+2ckmP/B6ZQB/mbHGdvn0RuritI5XO6KQB6JKoZcw8CUh1EoH8+zn5fd9s2Vqkj2PlN9ntTo8opGERCZ1V3fogEPuYTJyMNWlrgbbJuy5O247x85uiJ9jhZYB21Jnr61L2l/pyWgHeAbblaQdbB5nz7RHEJ9NrPPch2YLKlULZYraSmHZBTEDj4OENRXfW1pw390Y4Vsw/pv0WJS1iUEMYC/5P3eikKP+WITDiiZ5wD1bY5RoSMCk3J50qkLe7dOyzjnaV4PFo66bIBC96ml2F2cGId6NVzunS9aBRLAP0r05/3BeTzkEQBY2v1sFFe1j4J5KcAJVWMG1TNElSy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1mSr/oyUvig6Sd0UTly8ObgJ6zhUntt9gJxuDVg4Ls=;
 b=db8aBeQzFyrTRlCha6BEFr60T3mMby0eYJZ4rtkn8V3oZxf5vt7PZNE2OYNO77TCh0r8IfeP/nID3u0OUT9mG+C+d/fPKW9EUuMHLT/svuYEB2IoDELPDWWkPIYHaHssKoMfgZ1kiKw99OBmS/nf/MlTq0WGtgCeIzHUlC2eReXMp/o2vbLkKZ8LOFvAEZuYMfvsvsYB7RLZCUh2nSJgaOc7vI41+C1Bw5EBTfjg9dg7BPKygsPx42nV0TAWSaS+eRow0uQNBzcRQ0I+R+EOYUPhczlNS2LE7s+2jP/ma8jbP81HDNJw+9ho1XzA/YOmjDMKJ1k8y5PUe/+ts622Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1mSr/oyUvig6Sd0UTly8ObgJ6zhUntt9gJxuDVg4Ls=;
 b=lkRBcG8h7f7i81Id1EOp2yU9jOW1DYuVskb+T4UCUatZlbmqMSR3ioU9H/dKpdG6T71c9XpWQBTPgFkPDYsZSpY+k5hr/rb4kt0piWCwNGihZ/xNWnLjRtmGkKJNaVSiIrlD73GxHBN/rIKF5gvUnnbDjOC3ZROwmX0jplWlsUEJmQ5z3a6dOj/0tZqhu8K+SrR0s4t0n6JJtzK8DnoK2YbbV6DHH351shkdJL06YfQSTLc4+eVNCWLkDpmG9jQl6klFAT1TnEKOUj8yA4zkcdVu8tSgoC7wnsDaOpwsCyTP0n/CkG0cMuS5hlu+QLNEuxnEDIFQUu40ScBCoayT9A==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by OS3P286MB2011.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.14; Sun, 25 Dec
 2022 02:42:59 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46%3]) with mapi id 15.20.5944.016; Sun, 25 Dec 2022
 02:42:59 +0000
Date: Sun, 25 Dec 2022 10:42:53 +0800
From: Zhang Ning <zhangn1985@outlook.com>
To: linux-amlogic@lists.infradead.org
Subject: Re: Update: Re: VIM1's wifi doesn't work after update to Linux 6.1
Message-ID:  <OS0P286MB06412371C5E6FE4DFDEC1DB1CDEF9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
References: <OS0P286MB0641C7CE54DE2CFD928AD1ADCD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
 <OS0P286MB06414BA3239D9BE69DA18E0CCDEF9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Content-Disposition: inline
In-Reply-To: <OS0P286MB06414BA3239D9BE69DA18E0CCDEF9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
X-TMN: [IBcDOuxN5/yQFCViZYBE1d614AfOcCBbdYVMwy3Er2mnpbLe56Twr3CqH7M2mYnY]
X-ClientProxiedBy: SI2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:195::6) To OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:cb::10)
X-Microsoft-Original-Message-ID: <Y6e4rZCSTR+MeA1X@orangepipc>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS0P286MB0641:EE_|OS3P286MB2011:EE_
X-MS-Office365-Filtering-Correlation-Id: 10399e6a-ea7a-43b3-23ce-08dae621bbfa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PWbdX7wvXK/LFlgHZU9ctC9INfNtRzna2Wmy8s1yqVlsoG+IyYmW5jsE4/LHhNaBBussmi0Fb1R9J7H5xhnLTmGHRwiEm2+zrruVA+VnKkMTP33vwjeXi5xhuZaFVPG5Cd+egBIsG95GuEYpXLmrknc0E7f9C6Z0eyPFaFLpWVuQ9umL/egPABadZ3ygC2/MU906EWFyMdx0zsI6/Hkom4p9dWk1k6azeRsYqWDluUpiW0QIPcsJBtsOHmKtSMfUKGOAahCWQX9V4GKTHS0SQEEJbIfs0GXg30MX8YMsO5b3pxF/eXiThu3JR4TvNVzFpTJ0t4czAYj6pPA42P+5w4kmXs3xDS1GFuQaS4H6OE68CTdBqgnNXW1EILG7IgDUMReFeCb2z8jK/zrccjJFxhBNzSFK3UxomiB8C3LAxPBknjlDVzS38JTkB16PPGaMoWepB2kDT4+8p80FHbjkR2jpErJhoFJVnojo1B17XxFajqK8w3Zlj0FCFxul61q9WPuW+jEdcUhXeDy4+Xfh2LGQBNUEBXudc71j8SBoyDyOX6pdhrJaAXmFP5aeCm4/K1dbjJC78Uh8DM97IHuu58oMLCZyC20A4BdF7sU11aij5b3cYUzHeC7EndWSLBd/dEfc5aZFpuyzY1USPX6Sk/HgXf3fK6Ln6sHFhKsLVnI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?a2VtTFRwSXZoTzJFelF6T0JHV1hUUXIvVklFdGpBcHM4N05FalpHNUhBQUR5?=
 =?utf-8?B?K1dTaWlOWmlTaGdtSmJLb1dRNEEzblVLZGt1MTFCZ0IxM21NOFM1UWkzTjRS?=
 =?utf-8?B?S0xVS1E5dHg5ZXFGT1drM3NRRGxTMVhEQUV4aDN5Y1hkK2pmTXorOUZnRFVL?=
 =?utf-8?B?K090aEl5dmc4aFl0TzgvYjArUG5Gd2t3Zm8xRjhBNnhlaE45VUp5Y0RWbUxM?=
 =?utf-8?B?T3RndFErNFk1U2RQbjJmU1dVSTdiYmlYWFJWUDV0ajQ1WEtwVHh4clZBSUEy?=
 =?utf-8?B?aVU5WllJaEk3MW9Ed1YwNXZEU0ZHcFNiYjJWU29Zb0N0a0tKbHFMWldvYkRu?=
 =?utf-8?B?aEU1TnJkYW5TMmticW1GOUZaVjJqUytLbkFmUDJPWW1yU2g5ZmYwcWJhUEFh?=
 =?utf-8?B?WGJkK1R3TzBMODJQOWNKS09UQ3lVQ2V2cCt1Qi9KRStRZzRlZW9McUxKTm9C?=
 =?utf-8?B?a1FrZW1pK0orY0dyZUhlT0Z2VzNxenRxcjQ2SkFaVHVNS2JKUUhYT3grUHc3?=
 =?utf-8?B?YU1pWnBlQmdialB1cERtYnhGUWFHN29vSGpzNDhxamI1TzdoVll3ZThQZUdq?=
 =?utf-8?B?QktKTEVCc2I4UGtQYWlFT2ZqQmViamQ5TElUblljeThSMG03ZE1Oa0I3Sjdm?=
 =?utf-8?B?TU5QL0hudlgrUVRzcTZ1aTY1SDNxL2NsL0N2eUlyWGN1a09MYXQ4STdyMzZG?=
 =?utf-8?B?ZzZBZzdmejRaZDZRTjZETVJET3lFTWNTZ25HWU9zYU91MnVyOFJ2RkdnVUta?=
 =?utf-8?B?T1NyY3kwYjdNZWxtaEEwRk5OcEZ1YlpoMm9yUzdxWllVVmd6WEsxa05RZVdS?=
 =?utf-8?B?bG9yM0ZkQzlMQll2dFlaM1lhNmZHRDNpQWFaL20xeG9vY2VvNVI1ekx5dDha?=
 =?utf-8?B?S3NJcGlmSitSOHdQZkFjRmgyeHIyNXo1WVYyZThrNmlhRitqaURya3RMZXVI?=
 =?utf-8?B?dzhoZTJoVldmRDNKRGFwOHE0VU9NdHllQjdtOFFiOVgxTXptMTVWRi9tQXY4?=
 =?utf-8?B?WWRGOE1Fdk4ycnNsc2g5aEhtenZic0Z5TzUxd3RzM1RtdjdpdVgybW9vWUN2?=
 =?utf-8?B?dmM4RkdPSzBER0FiUkVHMC9lRXd2aUhyM1Q3L3dvK0pJcFZ3enlsbWR1SC9i?=
 =?utf-8?B?MWdrZkRMMkFDeEh6c2hYdG9tb05QcGlhdVRDc2h0RHdzYXh5UTVKSGdxanRY?=
 =?utf-8?B?OTdBMFRBdTJSZ0JpYVRJbkZXUW82ZG92aHJLWnVOWWNpMXJ4WkdGNlY0Zk15?=
 =?utf-8?B?a1k2a0ZnQUdKdzlJTHEwR1RJT3JWY1NEcEVaMTZJbmN2NUFEbWJwQ2x3NTRq?=
 =?utf-8?B?TXVCQzNJQWJCcEFaN09OVlRyMjYrR1YybXBPM2tCOEt2b1pMT1NlNCtKTmNl?=
 =?utf-8?B?YkFuVmNja2pYZHQ1Y0tSVytoZUpucVdwRUU3RDFPT0RvRUFhWVNEUUNDMnVp?=
 =?utf-8?B?MFZvWGthcklDVVM0aGd2bG1VeFFoRlhUMkNCVGlHd1dwZE4wSmF4N29CK1FB?=
 =?utf-8?B?R3UrSFk3MXU3L1hFNTZJVThiMVlZcHMyUkJ6Y1NHL3RLZndiK1VUYmphOElC?=
 =?utf-8?B?dWRGWnBEMkcyS2FHVlZTYkZHc0htRDAwYzdPdTRFblV5SzVva1U3NGRBQjR2?=
 =?utf-8?B?ODRkUVF2dENmeDl4UTNGNW1XaSt5a3hzZG5RVFFUdmFubnp1ZXR3dk04UmpE?=
 =?utf-8?B?eTZ5ZEMzYjN0dzlzaEovYTlJaGdsR3UxenBTeXlZWHZnVlFiSGJxTzQya3ZM?=
 =?utf-8?B?UjFQNlNaT0xZTUl3NkdhMlA4bE1FNmNubWNWRS9Pb0pGa0lEaktIWmZxOWN2?=
 =?utf-8?B?SmFzcWRFdk9Rb25GQklFQT09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10399e6a-ea7a-43b3-23ce-08dae621bbfa
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2022 02:42:59.0262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_184305_955482_79AB495B 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: martin.blumenstingl@googlemail.com, nick@khadas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Dec 25, 2022 at 09:14:56AM +0800, Zhang Ning wrote:
> Hi, All
> 
> In previous emails, I heard WIFI works fine.
> 
> I asked Nick for their tree for linux-6.1.
> (due to their tree have some package patches, which make fail to build
> deb, I picked other patches)
> here is my tree: https://github.com/zhangn1985/linux-stable.git

bisected: "mmc: meson-gx: add SDIO interrupt support", which is pointed
out by Martin, I don't know why I'm wrong in first try.

> 
> I build it in an arm64 chroot env (faster than real arm64 board), with below commands:
> ```
> make kvims_defconfig
> make bindeb-pkg -j`nproc`
> ```
> 
> install to my VIM1, connect it to WIFI router and run:
> ```
> while true; do curl www.baidu.com; done
> ```
> 
> it stucks after 3mins, same logs shown in previous email.
> 
> here is my brcm firmware md5:
> 501ca4e8307ad8e71c32f0d24369bada  brcmfmac43455-sdio.bin
> d3ad92472ef030c3897062ff809a9083  brcmfmac43455-sdio.txt
> 
> BR.
> Ning.
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
