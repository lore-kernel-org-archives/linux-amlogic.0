Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3829EC71155
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jun 2025 10:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lves0RvKoq+BEtYfjvOIenLFY+EhYmEupb/jEEdfZzM=; b=kObkyB0nv2gvRInNirrWQixuJo
	2PL9jrl2pK+GZTxKzkjmyyI3SGAvCagOML9qLCuBRy0Wk1mwrzqee+uLRaprYpLq0TM2wdrr4EB5x
	UAjFHyP3Gere11rJiJ1OG+t8FcxVGNaptPNjruJG18ROORQM6gE211in3kscpcONX5d1LRm0dQH7G
	QFTc3U5kB07eNjH68Pezco+ye3ks2y0M7w5l8hPdUk5ojPgi9nBymfe31F6g3PrFceZTW2JQBfzsn
	POZvYldAXlXWdBzHV1k5Udp4Rp/PYcIos4XaFqr93IY9EPl7dV4TWqZ4sDNhVPUhVoJIYP9zWsZoi
	jCIIWhMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYxo-0000000FKhY-147B;
	Fri, 20 Jun 2025 10:27:16 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXw6-0000000FAyJ-3shR;
	Fri, 20 Jun 2025 09:21:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZTGbQxuuVE6Cv8cvVPvI4wpz4LH+OUXm54T/BxMFkhj3OBtnfUfsMeK00x7lWh0rgrcXBVxLiUDRw4ZCYv7DLEdQIf864J0QgUUVQc+IG7JWtLmgaFAOwuUx36y5RIfWoJtMXOqCHnOE+8mzGzhNYyUpqRNXm/P+gMUI3f22rnD7ZjRBV1dsPe9dp/zOTmw9aXTzIzWx8qJr25v7hmnxnRHgFz95aWKJXEr602ssT806e3qrAb9nBCJ4qNIkwl2nWVBU2xljaValWA0mGehbAN1B1dqG9kjh9mSbwGzjJ4PJfw3kjecbfCMNQ5PAy9r34WElwtFFi8blOlAnKQB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krtgKmIZ4+cgGj8sKGuQ4fzO1lo4Jytvs46OGzR+OKA=;
 b=JS4/IXKP5BnR9rSQO2JQeThrHwTr+hEtIh4D6rgk0LDlJhNKeoIDj0KTvrH7lgIXh7W6Nk8Lh8nFuCllHBEBt2CwHBxis1/5Mogs2JOSKk+jo7pnw7qTJKBor8yTVQ+IC75DjI71SmsyIbRkhJTLil5ObYWLy6Rc/nuVxEZVxebHVdnjltqbwsMAzSDQ8UqyWxOFicXXpIU+pwUyoweA1/iGfxOduznksvsyHGuKMJG/Xs5Yahu0D3oY5lWiwjuUhHII7R7mA8UzOcZYy/zQ2yJmytBvC2/OmeL2SzH7we3B+/U6WI4dwtbLUgw7LfGMu5Ddt22zEcYy5KMyYAE8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krtgKmIZ4+cgGj8sKGuQ4fzO1lo4Jytvs46OGzR+OKA=;
 b=Mu0fOWbjbAlW6/O0ONE/XLksst4YuuUcK+5hws8LqKydpKiIKO718ADYxF+Qv5Kx9cK+TqJoSmm2gptrVVWqC/ZN4gc7aMAy85w+duqeMIq8HuxFIZ/M0y1jJUBS1mWqZxzvysS3ujZ+QtymHQb92YTrAPTOfZnI3JNhESPVZMEZWQfmFvzislSZhQH9Y5Opc0pmgFrg9fbtsk4WEAi3PFHWGi2WALTG8DsLAc9kVYB4KaLLwaSkiGzEpT1pwWszl9AeQTtgZVJAJWdf3OGL8eWcLclf3glr0yWgGrbvu+QZ7QKG0kMVeFYQmeCvPm47cDbz9ukB61idSSJRfw4uQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SEZPR03MB7146.apcprd03.prod.outlook.com (2603:1096:101:ee::14)
 by SE1PPFB8A17DC0E.apcprd03.prod.outlook.com (2603:1096:108:1::861) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 09:21:14 +0000
Received: from SEZPR03MB7146.apcprd03.prod.outlook.com
 ([fe80::f608:5d7a:df6:35f8]) by SEZPR03MB7146.apcprd03.prod.outlook.com
 ([fe80::f608:5d7a:df6:35f8%6]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 09:21:13 +0000
Message-ID: <7ae5cc8c-410b-4be7-84b8-7a6273a45717@amlogic.com>
Date: Fri, 20 Jun 2025 17:21:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] clk: meson: add MESON_PCLK_V2 for sys gate clock
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
 <20250509074825.1933254-6-jian.hu@amlogic.com>
 <1jzfffy738.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jzfffy738.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To SEZPR03MB7146.apcprd03.prod.outlook.com (2603:1096:101:ee::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR03MB7146:EE_|SE1PPFB8A17DC0E:EE_
X-MS-Office365-Filtering-Correlation-Id: 542765eb-b083-4b4b-a5d0-08ddafdbcd6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVh2WmNlUWowVVF5akJDdHBJU3lNUDcrbGNvTmg0ckFvREw0QzdTamRDcVgx?=
 =?utf-8?B?MC93a3BPWFlOUlNXeVkwdGh4M2lSQlYza3l4VkFJRzg5MGhSNzBOR3N0ZTZG?=
 =?utf-8?B?RElrcHVnNmpEeSt6bW55SWp1WEtlcGFtSUw4UDc5QlBNeFRVbzJMOFJjWXpJ?=
 =?utf-8?B?aEJFMUt6Mkg3dGlHNU1JZG9jWEdCVXdwenlxQ2tPcnlhZmE3OWoyUFNIZ1ZQ?=
 =?utf-8?B?MjNrYW5rTkgrQ2tNZzRJK21QdGF0Zml4QW5vOHBvVit1UmZ1TU42UGJ6QkNU?=
 =?utf-8?B?Kyt3Rk95cytvVis0NTZFZDMzNUlMam9ubVd0dXVYcjh5SXltR1kydlFJUXlo?=
 =?utf-8?B?UDJVNDkrY0VDQnVLdHBKcUpkVmdUK2FlY2NzalRUNytrQmlqbVRwWUxCK3gy?=
 =?utf-8?B?eTVWZXNQdzRzNW9lRXUreUI3RDJHR1hadDZXanMweGlYcHZEaTRUNmRZM0RZ?=
 =?utf-8?B?SWJOc2FzWHNkMmppY09GZGQzS3l4bU43TVU2dEdJVXJwZWk2dWdjWWw3THJZ?=
 =?utf-8?B?akRVaGdlb2NmOFVuNjV1VGYrcmFIUnFscXByeHcxeXpxZzVtcDFCdWZWOVFZ?=
 =?utf-8?B?Q1NnS0huaGFBZnZkaURPZWNiN29PRUFPeUdzNldnVHkwRzFlL2lGLzhUcVJi?=
 =?utf-8?B?R2lwdkxJQXM1RzBKSzVLREdJaXZXVUNPaUJpd0dQTExjOXFvTjdDUGlPMFFY?=
 =?utf-8?B?Y3BZSlR2TVZ2cTRwaUJyRnN5K2RTc1l5NnBqYzh1ZXZLVHRiaGt0TjFVbWNV?=
 =?utf-8?B?S3MrL3pYbFJjbVJCblZGbXFrQzBJb1dRZXppSjk4WnU2U2dETm5ta3pjQnhM?=
 =?utf-8?B?c2p0SFk1dFJYZGNybldHVzNGU1dRemFkK2ZSa3QzVW1nNnlUTXp3TUtDdXpK?=
 =?utf-8?B?NEY4VWNOWThMbWoxaDhKalBDOWc2NWF6WHpBUzIzNHdSWWpTYlMxdmFKSmlu?=
 =?utf-8?B?VUNtQWtsektKbWNybGhMRUtNeTRCdTdHajVqMGVvYXpuT0FrWmVpVVAyMEp1?=
 =?utf-8?B?U2VqYU9LNU5mNjlYYnA3V0NZVlUySklIOWFrYk9BWG5QOWtpQ0FuMnZqekhV?=
 =?utf-8?B?WW1TcGZXN1hRYUdLcjVhY094TDdGY2lwTjA2aEt6a3FCbkt6S0RzRGtGdEp5?=
 =?utf-8?B?a0FBc3g1elR2Ky9CS0h6QWtmelVmbXdtdWZJU0lZUGZpZnQ1ci9mK3FLdFVZ?=
 =?utf-8?B?WitjamZEeEh2N2I2UlJZZ0NKU3A0N0w0Q3VFS0pEWXVnaEQ2S1RudGtGenFj?=
 =?utf-8?B?N25vbk1CcEtFRU14S2RRbFgvYkFnMFBScU9BTjdlNDJROTJvdEhDdnBCb1FV?=
 =?utf-8?B?U0JjN0I1TXQybUhUaldya0tyVFFPUjZVd1A1MlJQcWZwWFFNRng2OHJXbkVw?=
 =?utf-8?B?bWpRMTVMK2xpYmtGSE1NTHJFUHNZcHluNE90TW1iYmNCL01wdjFnMmFXSzkw?=
 =?utf-8?B?dFg5Vnd3Sk9WS2Y3anppWHVyRm1UWEVGR25TVkwwVHVVZzdpNGRNQ2E5VlJZ?=
 =?utf-8?B?Q3NRajA1djNIbDA4VTk1dXZvZkFOdFh4U3MrbG12a3g2MDNBaWgxUzRseTdo?=
 =?utf-8?B?NkRSWUJkaWpLMkUwd0RDNUlobXhpb25NWnBvOE9QOFRvdkNITWd2VnRjbGVT?=
 =?utf-8?B?c3ZKWTBKb1dFUThxdm9rR0lHQ2JTcWtEV2tvMXVUb3FHbXJldmJDcjZxZlho?=
 =?utf-8?B?bVR5S0o3NXY4NzlicFFpWGdmUGg2aWZpeFJXb1Y2MktVSkRSdmJMdVFJL3BJ?=
 =?utf-8?B?NDRjcXFHdTA5WVNaTTkwdjNOVmNGQ28vVEx5K3VyTm4zS0xVcmEyV2JEbGpO?=
 =?utf-8?Q?0An3XZISJB6PJ3hNEmwdZnXXaCqVL/f2ljXHs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7146.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlU0RmdSVm8wYlZucnM2bGl4Vy9OZ0c5M3NLTDgwR1VRdFdqY2J5MnB3Q1J2?=
 =?utf-8?B?ZGRDWHg4RzBjVmtjOGFJdnNsbjdpb1hYd2hxWHNmeWQ3dTNZYTUzaHJ0V090?=
 =?utf-8?B?L1ZRVkZvWkNMcTJDQ1lBc2xibGxsVGVFd2dMejQrL0JSUjN1T1ZGbmYwaWQv?=
 =?utf-8?B?dWh2VDVqNkZmanhEcjJVM3dwV2JWMExHdjhWOUdObWdaN0F1ODErYy9tcnBD?=
 =?utf-8?B?U0Nmb3JYRWxQaDh4aGFmYXlKY0JVb0c2U0dqbnRnYS9IOUo4ZU5abnFIR2o0?=
 =?utf-8?B?RlVRL0pCRVdRYU52MUs4WFY4NTkyS3hQS1ZuVUhFZ2JIZFlkK1dhZmFNNkN1?=
 =?utf-8?B?d0VDTXhxQmtYdUtCb3ZBTWZBSUxnRTRVeWNxUk9uT0taNU1Ed05ocno4ZS81?=
 =?utf-8?B?ZWRnOEY2aDFyL0drekhPYUVwSXNpN2ZQNGFobGpOQjBBRGlVYzZqa2VDYlBI?=
 =?utf-8?B?NTVtM3JBVTlUbkZUZWFEVktURWIwZjYvZ3M3cXNUQWhSOEkyZ2gycjZHL3hl?=
 =?utf-8?B?UTU4b0ZkL3VQb3pNcXdGOXJNZGlqUHBSYXZBNCs1VUhQWGhkdnZiQWhBK2tZ?=
 =?utf-8?B?ZE52MlR2dldtcHJkVFNYUWlqZ0hFbllmL243L211WlV6T1NoaS9jY0lOQ1Bz?=
 =?utf-8?B?K3VST01LZzEvb3ArZXZLaTdBU29XalhHV09OdGRSWmpNUk1QYktnMUw3a1J4?=
 =?utf-8?B?NWJCcCtRN1hMMlppQWRTK1p4dlFTOFRqWExJa1pqOWtUWDg3VlBVMFdFMVVp?=
 =?utf-8?B?aUY4ZWpTU1JVYXdUNVc1c0dTdkxMdXhTb2xpbUM4djdOc0VPdmF3bEFiOVUr?=
 =?utf-8?B?cmF6dzZSYWMvOEVJay84cG1qbEsvMkx6M2plRWFjdmRYRUN4QW9WbWY0aGhH?=
 =?utf-8?B?TkNxWVI4OWsxYUVOSFhIaGpTNjRMcVNCQlZsanplNm4yUHJzYmU4Q2MvemJi?=
 =?utf-8?B?V3ZkZVRKdHMvby9CMXR3TGhXQTVHZXVtWUg4dVAzTUxPeUZ3TDlsNXRjL3ZP?=
 =?utf-8?B?WWp2VXpWZ2h1V01vTVZRZEtvTE05ZTFoTGhBbjVvbTV2S3A4WHVjVFNKaUxy?=
 =?utf-8?B?ZmhkSmh5ZG53QVBEUFpZK3dQT1FyQU5WSFdES1Y1VldvVXhKdENMWE5DcFlI?=
 =?utf-8?B?Um9Xby9LdnBTUVovZGpuZ0ZGaVlua1hQU3FjN0FRN0NBdlBEMmVsa0RCNlpC?=
 =?utf-8?B?MFI4ZlovTk8vUXVBa2s3SXRJbVlxY3N1cG0rbVlwUXFpYnNnblBrZFVsckVS?=
 =?utf-8?B?Mi9EQmUzcWl2NE9tbmdtRHZSTDgwcEZya29mTXdkUEJpRHZPamJ4SmU5VXI2?=
 =?utf-8?B?ajg4WlJ6Z2lVa0VVUVRzVFFLbGZEeWkyVVowdmFFZ1pPTXM1dkM2SHQzNHpG?=
 =?utf-8?B?VUdrOGFoWXI3RkdjZE9BTkFHblRwOHR2bzJuNWFSUXRocWk4VS90aXBOaWg5?=
 =?utf-8?B?OFBBRlBRYnVuYVhwTzlTK3dSYWhyajNycWJlVVdUVDRTTkhuczZzd01IWnNH?=
 =?utf-8?B?MmNreGN6a2dCY0w2Qy9PZlhQRHQ0cWdDRnpKVWVmaWVVNlY3V3JCTk1Oc1VI?=
 =?utf-8?B?eklKSUpFd1ZTam9sc1duRUFuMkhRa29ObVZHemxTQ2NtTWx4bERZUGYvMXNT?=
 =?utf-8?B?blRZMTY4bHl6TDNUaGlUNjNDMEFKbENXREpocUhhdWhZWDJPK0w3a3Ruelh3?=
 =?utf-8?B?WmNBM0NiSUx1TkFTamFaUTc5Qzd4VnlWU1Z0eHdXM056N2tVOHl1K1hQTFJJ?=
 =?utf-8?B?K2IvL2dIa01iemIrdmdnWFdxeWI2bUxrN0I0bE9tbnFWbE5HLytnM0RlVk45?=
 =?utf-8?B?RkIxQ3RoY0QzUnphSExrS1NRd2U2Y0RwK3JkbzhVN2h5L1RnYTJWYnFocnFi?=
 =?utf-8?B?bWliWGhUanI3T0pZeTg5OG0rVlBBL2g3dmswQk5oWmNOZnpEQTJDai9uN05W?=
 =?utf-8?B?TjFyT3hTb3hHZEdzblZ2RlBGYVpnMC80aXRMQ3VuU25PeTc1cE9HUGw1VnJU?=
 =?utf-8?B?dnRIcTloaklTZ3VnSXh6S2I4SkJjR3VzMG5sakdwY3RRZ3JkY0F2djRVVXdL?=
 =?utf-8?B?SnZuU3Q3eFV2dnE5TWs5K3FLUTI1OEF6SUhxY3R6UFgyU2R4RkpHSlp0NU1F?=
 =?utf-8?Q?cZx5HRI1Ac32brQ1+6vFG0IMu?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542765eb-b083-4b4b-a5d0-08ddafdbcd6b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7146.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 09:21:13.7501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67SbzYjDRFVx76TYuFeNyHMvnYg1Vd3T3OvuuxlqoDeIMAs2qVwV0J3qkiSCa4xzKrK0p3eKixx4G98BEYXN1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFB8A17DC0E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_022126_990732_F39FB45A 
X-CRM114-Status: GOOD (  22.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

UmVzZW5kIGl0IGJlY2F1c2UgaXQgcmVmdXNlZCB0byByZWNlaXZlIGh0bWwgbWVzc2FnZXMuCgoK
T24gMjAyNS81LzE0IDE1OjM5LCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IFsgRVhURVJOQUwgRU1B
SUwgXQo+Cj4gT24gRnJpIDA5IE1heSAyMDI1IGF0IDA3OjQ4LCBKaWFuIEh1IDxqaWFuLmh1QGFt
bG9naWMuY29tPiB3cm90ZToKPgo+PiBBIG5ldyBNRVNPTl9QQ0xLX1YyIG1hY3JvIGlzIGludHJv
ZHVjZWQgZm9yIHRoZSBzeXMgZ2F0ZSBjbG9jay4gSXRzIHBhcmVudAo+PiBpcyBhbiBTQ01JIGNs
b2NrLiBJdCBiZWxvbmdzIHRvIGFub3RoZXIgY2xvY2sgY29udHJvbGxlciwgYW5kIHRoZSBwYXJl
bnQKPj4gY29uZmlndXJhdGlvbiBpcyBkaWZmZXJlbnQgZnJvbSAgdGhhdCBvZiBNRVNPTl9QQ0xL
LiBUaGlzIGF2b2lkcyBuZXcgbWFjcm8KPj4gZGVmaW5pdGlvbiBpbiB0aGUgcGVyaXBoZXJhbCBj
bG9jayBkcml2ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEppYW4gSHUgPGppYW4uaHVAYW1sb2dp
Yy5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvY2xrL21lc29uL2Nsay1yZWdtYXAuaCB8IDI0ICsr
KysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcmVnbWFwLmggYi9k
cml2ZXJzL2Nsay9tZXNvbi9jbGstcmVnbWFwLmgKPj4gaW5kZXggZTM2NTMxMmRhNTRlLi42MWI4
ZmMyZDg3NWYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1yZWdtYXAuaAo+
PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcmVnbWFwLmgKPiBUaGlzIGZpbGUgaXMgbm90
IG1lYW50IGZvciBhbWxvZ2ljIHNwZWNpZmljIHN0dWZmLiBJIGtub3cgc29tZSBmb3VuZAo+IHRo
ZWlyIHdheSBpbiByZWdhcmRsZXNzIGJ1dCB0aGF0J3MgYmVpbmcgZml4ZWQKCgpPSyzCoCBJIGZv
dW5kIG1hY3JvIE1FU09OX1BDTEsgaXMgdXNlZCBpbiBHMTJBL01FU09OOEIvR1hCQi9TNC4KCk5l
dyBtYWNybyBpcyBuZWVkZWQgZm9yIFQ3IC4KCj4+IEBAIC0xMzQsNCArMTM0LDI4IEBAIHN0cnVj
dCBjbGtfcmVnbWFwIF9uYW1lID0geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4+Cj4+ICAgI2RlZmluZSBNRVNPTl9QQ0xLX1JPKF9uYW1lLCBfcmVnLCBf
Yml0LCBfcG5hbWUpICAgICBcCj4+ICAgICAgICBfX01FU09OX1BDTEsoX25hbWUsIF9yZWcsIF9i
aXQsICZjbGtfcmVnbWFwX2dhdGVfcm9fb3BzLCBfcG5hbWUpCj4+ICsKPj4gKyNkZWZpbmUgX19N
RVNPTl9QQ0xLX1YyKF9uYW1lLCBfcmVnLCBfYml0LCBfb3BzLCBfcG5hbWUpICAgICAgICAgICAg
IFwKPj4gK3N0cnVjdCBjbGtfcmVnbWFwIF9uYW1lID0geyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgLmRhdGEgPSAmKHN0cnVjdCBjbGtfcmVnbWFw
X2dhdGVfZGF0YSl7ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAu
b2Zmc2V0ID0gKF9yZWcpLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
Pj4gKyAgICAgICAgICAgICAuYml0X2lkeCA9IChfYml0KSwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgfSwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgLmh3LmluaXQgPSAm
KHN0cnVjdCBjbGtfaW5pdF9kYXRhKSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4g
KyAgICAgICAgICAgICAubmFtZSA9ICNfbmFtZSwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAub3BzID0gX29wcywgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAucGFyZW50
X2RhdGEgPSAmKGNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEpIHsgICAgICAgIFwKPj4gKyAg
ICAgICAgICAgICAgICAgICAgIC5md19uYW1lID0gI19wbmFtZSwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICB9LCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAubnVtX3BhcmVu
dHMgPSAxLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICAg
ICAgICAgICAuZmxhZ3MgPSAoQ0xLX1NFVF9SQVRFX1BBUkVOVCB8IENMS19JR05PUkVfVU5VU0VE
KSwgICAgIFwKPj4gKyAgICAgfSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gK30KPiBUaGUgcHJvbGlmZXJhdGlvbiBvZiB0
aG9zZSBtYWNyb3MgaGFzIGJlZW4gZ29pbmcgb24gZm9yIGZhciB0b28gbG9uZywKPiBhZGQgdXNp
bmcgQ0xLX0lHTk9SRV9VTlVTRUQgaW5zaWRlIGlzIGNlcnRhaW5seSBhIG1pc3Rha2UgSSB3b24n
dAo+IHJlcGVhdC4KPgo+IFRoaXMgd2lsbCBiZSBwYXJ0IG9mIG1vcmUgZ2VuZXJhbCBjbGVhbi11
cCB0aGF0IGN1cnJlbnRseSBkZXBlbmRzIG9uIGEKPiB0aGlzIFsxXSBwYXRjaCB0byBnbyBmdXJ0
aGVyLiBZb3UnbGwgaGF2ZSB0byBiZSBwYXRpZW50Lgo+Cj4gWzFdOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjUwNDE3LWNsay1ody1nZXQtaGVscGVycy12MS0wLTc3NDNlNTA5NjEyYUBi
YXlsaWJyZS5jb20KCgpPSywgQ0xLX0lHTk9SRV9VTlVTRUQgaXMgYWRkZWQgZm9yIGFsbCBnYXRl
IGNsb2Nrcy4KCkFuZMKgIHF1b3RlIHlvdXIgY29tbWVudHMgaW4gdjIuwqAgdGhlIFQ3X0NMS19H
QVRFIGlzIG5ld2x5IGFkZGVkIGluIFQ3IApQZXJpcGhlcmFsIGRyaXZlciBpbiB2Mi4KCklmIEkg
dW5kZXJzdGFuZCB5b3UgY29ycmVjdGx5LsKgIEEgY29tbW9uIG1hY3JvIHNob3VsZCBiZSBhZGRl
ZCBmb3IgaXQgCmFuZCByZW1vdmUgVDdfQ0xLX0dBVEUuCgoKU28gSSBhZGQgYSBjb21tb24gbWFj
cm8gaW4gY2xrLXJlZ21hcC5oLCBhbmQgaXQgY2FuIGJlIHVzZWQgZm9yIApkaWZmZXJlbnQgU29D
cy4KCk1FU09OX1BDTEsgYW5kIE1FU09OX1BDTEtfVjIgZGlmZmVyZW5jZSBpcyBhIGNsb2Nrcydz
IHBhcmVudCBkZWZpbmF0aW9uLgoKdGhlIHN5cyBnYXRlIGNsb2NrIHBhcmVudCBpcyBpbiBhbm90
aGVyIGNsb2NrIGNvbnRyb2xsZXIuIFNvIHBhcmVudF9kYXRhIAptZW1iZXIgaXMgbmVlZGVkIGZv
ciBpdC4KCmFuZCBwYXJlbnRfaHcgbWVtYmVyIGlzIGZvciBwcmV2aW91cyBTb0NzIHdoaWNoIGNs
b2NrIGFuZCBwYXJlbnQgY2xvY2sgCmFyZSBpbiBvbmUgY2xvY2sgY29udHJvbGxlci4KCgpIb3cg
c2hvdWxkIHdlIGRlYWwgd2l0aCBpdC4KCjEuQWRkIHRoZSBtYWNybyBpbiBUNyBQZXJwaGVyYWwg
ZHJpdmVyLgoKMi5PciBhZGQgYSBjb21tb24gbWFjcm8gZm9yIHBhcmVudF9kYXRhLMKgwqAgYW5k
IHdoZXJlIHRoZSBtYWNybyBzaG91bGQgYmUgCnBsYWNlZD8gbWF5YmUgcHV0IGl0IGluIG1lc29u
LWNsa2MtdXRpbHMuaD8KCj4+ICsKPj4gKyNkZWZpbmUgTUVTT05fUENMS19WMihfbmFtZSwgX3Jl
ZywgX2JpdCwgX3BuYW1lKSAgICAgXAo+PiArICAgICBfX01FU09OX1BDTEtfVjIoX25hbWUsIF9y
ZWcsIF9iaXQsICZjbGtfcmVnbWFwX2dhdGVfb3BzLCBfcG5hbWUpCj4+ICsKPj4gKyNkZWZpbmUg
TUVTT05fUENMS19ST19WMihfbmFtZSwgX3JlZywgX2JpdCwgX3BuYW1lKSAgXAo+PiArICAgICBf
X01FU09OX1BDTEtfVjIoX25hbWUsIF9yZWcsIF9iaXQsICZjbGtfcmVnbWFwX2dhdGVfcm9fb3Bz
LCBfcG5hbWUpCj4+ICsKPj4gICAjZW5kaWYgLyogX19DTEtfUkVHTUFQX0ggKi8KPiAtLQo+IEpl
cm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
