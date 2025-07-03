Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A867C83030
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jul 2025 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7DS0PxbDGeH/L0kv5UU3QdPVbZ7CNuZmyn6KP4v1UY=; b=Xel+H5UxpfAdJMGC1lRzAckGam
	IoO1wiHTKVQNQidCoc7qRqi37D2TlF5DvSRTcuzZGPTcTHpuH6qTnGNni1f/Gl++wMm30a4Khh+ky
	6w6bT+cL00huz1VW4O3AgPosguB2gTt1aMtZxrBk30i0MqEJNw9IUANasf6LC/8cdGhzpNOYXCVPj
	1n+upY5KTHwf3mCQ4jhubUaDEFnaq/fgbM+yHhLYzZ+XccSFgF6UVOlXkILFl2KfsCeIeZuOjj3pI
	sgqqAJhVeghaMkYOscYcPb5BLLhwtI/hnkWcfRV+cYxUhcjOqMseuQLKDSskFmRf6PmUkzIMQn4zT
	6pc49adQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXF02-0000000AcZW-2ezt;
	Thu, 03 Jul 2025 08:08:54 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXEoW-0000000AaOX-1GoP
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Jul 2025 07:57:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngvDVV95wVc9eAursBDkLAtr2afXCjX5bVkjCK3oAQtjP0oII5sPjG9hfUpi9BHUdFihQ8mXv7a3cnxUIB/lNgonfWHAEJB3daFol6qLzwQ+MKWb15V1+WRddYzSTg/cOaWMMxYz7TbyItVEqS3z05CeFdrUgO3+711sWUmYFC7aPvxFkAM+7nAcEBAeO+kJ2hjvBpKYpbxYPOreHu651GDkzdyRwBKKcouvbhhRvEpoPYzCJISUSEBnvZ1CUBKP8GskCkWBsPIEWosBY4ppx1uJ4gumZ2LTzPdSAprug59rpRsdB76GW9SsDSja6vBCQ3cF+VSZ5y02BiU2rptRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3mmffRve6kwAXnTxVTjzGiBPOhx8xhuG31q/OpdwV4=;
 b=YeTMEbPD/n4TBcnXmmRYJUKyLj8JdpFFmNl0ZAae40YT21BKZWS2m212H4OhyU/04dwctzB/6vzyk0do9vovqWSUxuQZeuiyFl3ZWZ2VUq6YsggfuSTOA5/EbpuggtwkdejyENPsQgtz3RhbX892gIMjl+zllbrprubyqnMWpnz0SMxVGXuF6W0s0rX5w17kTZU95QCUhgD6l3UC7kKEqCAE58HwHmRQw+HUUfuSdx+LugOHZyxGrEG7RN/caYVGyc9p9t+8PKX3GRiSPitABgi8IYaC1H862dfdODjtx9YyYW5+66jj/egr34PdirPD3Mkpp8fd5+hXoHaedCw5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3mmffRve6kwAXnTxVTjzGiBPOhx8xhuG31q/OpdwV4=;
 b=om0Brb+VTlVERmGMixB6m+dfo7WKlrfzw5lSvL2azh5mDrD24NN94S3FZUQxneThB0uaTXssCiuYvvCVbD3TRsZT6fDD2vuQCl+eLvOSG7Co1xQVqQ9jZHIT2YqqEQZmY3uk07dlTInqi4iJHfyv+LdH9ATOWUqkrrFnCAaNrHgnEtQaNXNXwu+PGkwA0R/BUWPtXobHjnKps6W3TGBf5fDDw1fKkuZMG4bl4g/Z3KuTFYpb9721E14sIZdaYCpmqcC4GfZ7xGeu3vJLvghaD7l2NZbst4DG18UklLoy31tpzKjcvH+HyKeN4u6LNrnVRRFkIzafDv/JlOelqBwGsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYUPR03MB7232.apcprd03.prod.outlook.com (2603:1096:400:354::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 07:56:51 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 07:56:51 +0000
Message-ID: <27ae4f23-7a41-4810-9639-5bcc4cebc8dd@amlogic.com>
Date: Thu, 3 Jul 2025 15:56:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/26] clk: amlogic: c3-peripherals: use helper for basic
 composite clocks
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-26-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-26-e163c9a1fc21@baylibre.com>
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYUPR03MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b55439-3755-4718-0230-08ddba072b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2k5V2xCcHFnZVJUbVd6RmhyaDhURUh3NVVBbC9WRmlyakYrSmZzaDhIQU1y?=
 =?utf-8?B?U1VKWVN5RGVaSU5iNmw2eExkZkdKRFZFQ04yVkVsRmU4YWNMWDNNdzIzVVp2?=
 =?utf-8?B?d0ZKOUV4bHUwNjY5UU4zTGREZ0lmMUJPbmdwQ1UyQlQ4M1dCUzl1RUdncVNF?=
 =?utf-8?B?VzYwTExxZ2J1NmpjTkFIRW0ycXg4ZFIvaWVmczNrc0pHajU2YThwUmFNV3lt?=
 =?utf-8?B?N2FCd0Q4azBaRDV5SlNKb3FMcVlsOFRQcnFHcnJGeEhFU3JLYTM5M1BZaFpJ?=
 =?utf-8?B?blZZTC9FWnV0VlpCZEZFTldwS21XY0lSNnJGUE9pQmlRak5qaXVYSW91ajFi?=
 =?utf-8?B?eFBhSHdsYWJuRHRNNnpzYi9SQkFYT1VZL3BTbTkzblZKOTRjOXZaWG1jemtu?=
 =?utf-8?B?ZEQ5YmZ5T3oxdDZYNmtPT0l5TlRvTGlibTZCNjJldmdZTm03VVZnMjhHcFk0?=
 =?utf-8?B?WHg1TE9MUnNOYmk5Y0JvdHZES290cGJRbWNVdGNlSVBFcGZsZ1RTaHVza3FH?=
 =?utf-8?B?Nk9TK01XdVY0T25MSWU4WXNOS1I5OCtQQ2poZWo2SlhiR21SZTd6MU8vVUh4?=
 =?utf-8?B?KzFFOEpPQU5wSTNlOWlBZ1k2enZEbFJWT1FELy9yWnJTUktVYTJXaFh6bjF2?=
 =?utf-8?B?blJUTUFSbGJMRHpYKzhvaXIvd295YVl3MThTUVZTcHkxaEtWSEhzOTErNDdJ?=
 =?utf-8?B?YURkVUZDWWNPdlRWN2k0Z2JzdlVkanZNUVVFYURjQi9lT3pSU3lCNkJsYUl1?=
 =?utf-8?B?am9Dd3RwN3Vuc1FxTmhham15My9VODQ5Y0gxUElrZWFJK0s4dFBnRHU1dXI3?=
 =?utf-8?B?ekhNekxtVmpKQS9ORkp6elNzSHlXclA0U0dVNVJ6M0xLNmRlNW9jcmEwQnhy?=
 =?utf-8?B?ejM3Rmg5RW4vdEs5ODBIVzdwVXNCKzlOMVora1dnR2E5eFBMZXJ3L05ENXVj?=
 =?utf-8?B?bVUxTE43RytyelR1RGw1akJCMmQzeGtteWpZcC9BenVYL1F5WmR5dXVBTUVO?=
 =?utf-8?B?S3QvTVc5U1NhSmJRUmZ6NEJuKzh5Ti9ZRUMxd0ZYRjIyblRlb0hCczIwdmRu?=
 =?utf-8?B?Tk9acUhUVjQvOXhHeCsrYXI5Uy81QSt6WFo0L3plemZIaXU1NWdGNXZhMWRp?=
 =?utf-8?B?TSs0WTFYYzhZSVl5NEFxaytxK2xVdWxMSFNKMjdjTStZSGtFRUxYNzVKbWRZ?=
 =?utf-8?B?WnR3RTFiTmUxekNBVzQ2VExtQ3JFa3R5TnJtL1lQQ3FORmxXbEx4WjF5dUU0?=
 =?utf-8?B?NERia2t4ZHdWL3IwZXA2a1NGYXI0TSt2NGt2WW56YmluZVU1dUdGdFlxblFo?=
 =?utf-8?B?SUF4aWpMRDZ0TW1CdVNrM2EvcFVPUU5PNFhOLzN0T25HQXZkeVBBU3NmZjVt?=
 =?utf-8?B?c3VlQk9PUll3dkpoSlVZZGRBMlRoekhUYmx3SFkxRTJudEt6ZG1tVDZDV3J1?=
 =?utf-8?B?WVovOS9PUDhCRDNoVXVsNVF6K3FGRzg0NnFzZUh1SXJkSzIyaEpkWUsvbmdw?=
 =?utf-8?B?QTBwbFJkQUI2cUFJM090UXZ5Wmg0QlF1VURUcVFmZmZKV25xMlgwV1NORjFq?=
 =?utf-8?B?UEpQamw4OHA4UXBKcy9BV05GbVdna0lzTjdHd1lTa2hQV0V1eEpaZGp6YWsz?=
 =?utf-8?B?Z3QzTldLZ1NYbFIxZVFUeGNNb2tMMnU0QzhhbzNJTDhQU1BaVDF1bFlzSFha?=
 =?utf-8?B?ZUpxRDBXekM1bW16ZG5SRmgyb3Yvc1ZLMTVoQmxkdmhGY21tQTBhcVFZaDEr?=
 =?utf-8?B?TzQ5ajArUDQwMlF0N0RMRFJ2R2FDZXJsMHpwRkpWMUZva1lhalhsMEJPQ3Fa?=
 =?utf-8?B?SlRFeXc4VS9XNFdzOEY3UEV5TWVzeGVydnIzOXNpc1ZPWjRaUFpCUDdSSHUz?=
 =?utf-8?B?Vks3U21ZcWdqeXNKS09yVGpWUTlFSGhhUDUwRnFxbVd3dW52VDlXWWoxZHMw?=
 =?utf-8?Q?0QKvcCgihDs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm1FaGY0aURNU0toZ2ppa3JhWkRKa0h5ZnZOa0VQWXRmZmh2ZEVSZ0ZGbHVo?=
 =?utf-8?B?bnhPNzFIQ0tQb08zZnVhYVN6a0NkeEpiOHpqemJzMG9VRWIyVHpZRGFEYVJD?=
 =?utf-8?B?aUVhakpqNmZUSE8rV2xCazFOc2s2cHZkc3o0UWN0YmdTSTNvd3BQeEY2UkE2?=
 =?utf-8?B?SjZVbWphbVdrM1BxVkZjWWx1Q3RReWlkbGhZdzBub0pRU1lYakR3dG9yT0pR?=
 =?utf-8?B?OExxYmIwTDBEc0dUUW1zQTFHR1BJU0cvR3VyU0lYaDJZZkZCMlB0b0cxaFk3?=
 =?utf-8?B?SCtRYzFGSmxPd3Zjdk5OM0h3MVpWWHVBOG5lK0FrbGlybDNIMEJxR3l5UHQ2?=
 =?utf-8?B?cEwwaFdwb1JhS01UNnllbFd1aW9QTXV3UEJNc1ZWYVdZU2FrUUVUTzJEZ2x4?=
 =?utf-8?B?TW91N0dWNnN6eG1vM3pleWpORDNVQzEzbHgyVUR0Wi9lSVhIMmk5QWZHM2Ra?=
 =?utf-8?B?ekpvWnlyVUlucFRQQ0lpeWdOalB3SjhLbDR6ZHh1TUg0aE85dE9tWTV3MHQx?=
 =?utf-8?B?a0VWbXJjbkpNNmpZWG93ZFpocElQeTJTL0tpUGFKMHZaT1plbjRHclh2VUJ5?=
 =?utf-8?B?ZG5kaFhJL0poQ01FcW5aMUtUQTVVTWZabFl2QXNIaC9LbTBybThRQUJiRndq?=
 =?utf-8?B?dXNiT1plSG9nU1NIWFhqaExGK0VEcmRKam5IcVhWVHJLc1VkZlo3NDA3R204?=
 =?utf-8?B?Vk91VHo2OU93TXdvYU5oZm1ER3FmbjQycG1JQnNBWmJjQU5qSmNFamR6RXRu?=
 =?utf-8?B?VEpTb2FubUZvUk5LWDZBVjV0enpxSWNicUJXaFdrVUozaGp3ZlVXUzVCalcw?=
 =?utf-8?B?eXpyMk5pZ09pK2oyZ09HWTk2bXI4ZWM4aTl6RFBCWUo4NlNtQTRZR1g4Z3VH?=
 =?utf-8?B?NUtqdWhGR2pGVmN4ODVjUzhTZFBWaGhnNk5ZZkJXR3lXTW40RW5lT284a3Yw?=
 =?utf-8?B?ZGgvUlRVOGdxdG0rSUJSbmR4aC95WVF5VHR5QjhCTTV1ZUNxeWp0UHRCNWVV?=
 =?utf-8?B?czNPTUpqTk5ycFhReWtnMW9wN0RJZ01hUk5xejA1TmVuQ0xNRkJTNWx1dnZ1?=
 =?utf-8?B?MXVVKzdvOWxTaWZiU2Y1aGFqVkJoUWhLSVF5aHZIdlBYaWcvTjg5QlVnRmVv?=
 =?utf-8?B?bERkR1JFQU1wZXpFR0dBVW1NQW82dmNuTk1vUEdFVmJmOWttaHJlQnFtcDFn?=
 =?utf-8?B?aFc1d1k2dVJsOGNVT3dIZk1DemdNL0ZrbW5ZQU5sbkNwYWVvQnprYlFhS2J2?=
 =?utf-8?B?akxUK2dBOXBmVTlCaVFESVB3aXNBUUxUNkw3MUZvTGFqMVc5RzBENDBJT1lF?=
 =?utf-8?B?aiswVTBXOVZZZUZaWmg5bEwraDFuWG1YWS94K2lrMGh1ZUNrUGVXQkJsR1F6?=
 =?utf-8?B?WlRsRnA3Z1hwK3kvVjFvZEtlZFI0bVYxM0Ftd1Z0dnRpVC9zRityV0lGelV0?=
 =?utf-8?B?dmZCcVU5V210THhhMlhaMHhkNlljQXFaN3NQQlpXMnh3RmxHdlZiZnNtNWs2?=
 =?utf-8?B?bkdqUnRPZXQrY0R2NVc1R2FKQ0JDS3QyWGd3bVN5eGpod2tuUU9QZTJJVEYv?=
 =?utf-8?B?Z2dzNS9pSzA5ZVZQOXNCdXhmYkh2cWExMy8wdllZM3J3b1Y4NUhYVG16Uk5q?=
 =?utf-8?B?NHpmeThwZnN3cmE0WW85YytOTVltQ3VOaHJlbSt5QVY2WFJRdjR5NzcrNlk0?=
 =?utf-8?B?dGdxSDVoRkRETXNCaStvZklBZjhiZXptN28vL3o2aWlxSzFsbWM1ZHp0Z1ZU?=
 =?utf-8?B?OWFLalQrQm5BZnlaR3J6UmhPZlVlOE1RcndWdkJzL0NEMW5ESGRtL3ZzTVhK?=
 =?utf-8?B?UlVrQ04rWFNnUnZmVUpRRHhOVEQ5dUVUK0x0SW9UN204bEdDRXRJemlrSW92?=
 =?utf-8?B?VVNtdzllNEVzUmZ1WmY3QkNjYkdCTFN5eko3dkRIejhNM3RITWdCQlgyUExD?=
 =?utf-8?B?MEFGMjNpMzhhOW0rcVpLRWV3N2lmbHdLZW4zbFhrRnZFdk9uZkc5NDFpanBC?=
 =?utf-8?B?SFNYYXFzbW9qVW1LeUdZbEM0T0p5OEFFMkYwSEVpYUZxL1MwNHZySEoyRHVZ?=
 =?utf-8?B?Tmh0WXVORllXUVdSRVNvaEVGSFNRYnc2OUlEUFI3SUNvbEFuRTNjZzg0endN?=
 =?utf-8?Q?OMAgP3KSULMMXvYIwRXusmiNP?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b55439-3755-4718-0230-08ddba072b3a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:56:51.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzWjimKbBrgYHAskAr7qwd4i31T7pqnT9iBulIP1C3qvOqUObdio+3wEEwe6u1Vhs8wvHQ+OgfcCo6YK3OJMZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_005700_475529_368FFDD2 
X-CRM114-Status: GOOD (  17.02  )
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

SGkgSmVyb21lOgoKIMKgwqDCoCBOaXNlLCBUaGUgY29kZSBsb29rcyBtdWNoIGNsZWFuZXIgbm93
LiBUaGFua3MhISEKCgpSZXZpZXdlZC1ieTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5j
b20+CgoKT24gNy8yLzIwMjUgMTE6MjYgUE0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRF
Uk5BTCBFTUFJTCBdCj4KPiBVc2UgdGhlIGNvbXBvc2l0ZSBjbG9jayBoZWxwZXJzIHRvIGRlZmlu
ZSBzaW1wbGUgY29tcG9zaXRlIGNsb2NrcyBvZgo+IHRoZSBjMy1wZXJpcGhlcmFscyBjbG9jayBj
b250cm9sbGVyLgo+Cj4gVGhpcyByZWR1Y2VzIHRoZSB2ZXJib3NpdHkgb2YgdGhlIGNvbnRyb2xs
ZXIgY29kZSBvbiB0aGVzZSB2ZXJ5IHNpbXBsZQo+IHBhcnRzLCBtYWtpbmcgbWFpbnRlbmFuY2Ug
c2ltcGxlci4KPgo+IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGli
cmUuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9jbGsvbWVzb24vYzMtcGVyaXBoZXJhbHMuYyB8IDEw
MjkgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNjMgaW5zZXJ0aW9ucygrKSwgOTY2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xrL21lc29uL2MzLXBlcmlwaGVyYWxzLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9jMy1w
ZXJpcGhlcmFscy5jCj4gaW5kZXggZmQzNWY5Yjc5OTQ3MjBkMDY5YzVmNzIxNDJkNjA2NDc5MGQ0
MGI2MC4uYjE1ODc1NmNmZWU0ZGQ0YmFkNWMwYzk1NzZkYTAyZDJjYjhlZTUxNSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9jMy1wZXJpcGhlcmFscy5jCj4gKysrIGIvZHJpdmVycy9j
bGsvbWVzb24vYzMtcGVyaXBoZXJhbHMuYwoKClsuLi5dCgoKPiAgIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgY2xrX3BhcmVudF9kYXRhIGMzX2hjb2RlY19wcmVfcGFyZW50c1tdID0gewo+ICAgICAgICAg
IHsgLmZ3X25hbWUgPSAiZmRpdjJwNSIgfSwKPiBAQCAtMTIyOCw5OSArNzU1LDEzIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIGMzX2hjb2RlY19wcmVfcGFyZW50c1tdID0g
ewo+ICAgICAgICAgIHsgLmZ3X25hbWUgPSAib3NjaW4iIH0KPiAgIH07Cj4KPiAtc3RhdGljIHN0
cnVjdCBjbGtfcmVnbWFwIGMzX2hjb2RlY18wX3NlbCA9IHsKPiAtICAgICAgIC5kYXRhID0gJihz
dHJ1Y3QgY2xrX3JlZ21hcF9tdXhfZGF0YSkgewo+IC0gICAgICAgICAgICAgICAub2Zmc2V0ID0g
VkRFQ19DTEtfQ1RSTCwKPiAtICAgICAgICAgICAgICAgLm1hc2sgPSAweDcsCj4gLSAgICAgICAg
ICAgICAgIC5zaGlmdCA9IDksCj4gLSAgICAgICB9LAo+IC0gICAgICAgLmh3LmluaXQgPSAmKHN0
cnVjdCBjbGtfaW5pdF9kYXRhKSB7Cj4gLSAgICAgICAgICAgICAgIC5uYW1lID0gImhjb2RlY18w
X3NlbCIsCj4gLSAgICAgICAgICAgICAgIC5vcHMgPSAmY2xrX3JlZ21hcF9tdXhfb3BzLAo+IC0g
ICAgICAgICAgICAgICAucGFyZW50X2RhdGEgPSBjM19oY29kZWNfcHJlX3BhcmVudHMsCj4gLSAg
ICAgICAgICAgICAgIC5udW1fcGFyZW50cyA9IEFSUkFZX1NJWkUoYzNfaGNvZGVjX3ByZV9wYXJl
bnRzKSwKPiAtICAgICAgIH0sCj4gLX07Cj4gK3N0YXRpYyBDM19DT01QX1NFTChoY29kZWNfMCwg
IFZERUNfQ0xLX0NUUkwsIDksIDB4NywgYzNfaGNvZGVjX3ByZV9wYXJlbnRzKTsKPiArc3RhdGlj
IEMzX0NPTVBfRElWKGhjb2RlY18wLCAgVkRFQ19DTEtfQ1RSTCwgMCwgNyk7Cj4gK3N0YXRpYyBD
M19DT01QX0dBVEUoaGNvZGVjXzAsICBWREVDX0NMS19DVFJMLCA4KTsKPgo+IC1zdGF0aWMgc3Ry
dWN0IGNsa19yZWdtYXAgYzNfaGNvZGVjXzBfZGl2ID0gewo+IC0gICAgICAgLmRhdGEgPSAmKHN0
cnVjdCBjbGtfcmVnbWFwX2Rpdl9kYXRhKSB7Cj4gLSAgICAgICAgICAgICAgIC5vZmZzZXQgPSBW
REVDX0NMS19DVFJMLAo+IC0gICAgICAgICAgICAgICAuc2hpZnQgPSAwLAo+IC0gICAgICAgICAg
ICAgICAud2lkdGggPSA3LAo+IC0gICAgICAgfSwKPiAtICAgICAgIC5ody5pbml0ID0gJihzdHJ1
Y3QgY2xrX2luaXRfZGF0YSkgewo+IC0gICAgICAgICAgICAgICAubmFtZSA9ICJoY29kZWNfMF9k
aXYiLAo+IC0gICAgICAgICAgICAgICAub3BzID0gJmNsa19yZWdtYXBfZGl2aWRlcl9vcHMsCj4g
LSAgICAgICAgICAgICAgIC5wYXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgJmMzX2hjb2RlY18wX3NlbC5odwo+IC0gICAgICAg
ICAgICAgICB9LAo+IC0gICAgICAgICAgICAgICAubnVtX3BhcmVudHMgPSAxLAo+IC0gICAgICAg
ICAgICAgICAuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFSRU5ULAo+IC0gICAgICAgfSwKPiAtfTsK
PiAtCj4gLXN0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCBjM19oY29kZWNfMCA9IHsKPiAtICAgICAg
IC5kYXRhID0gJihzdHJ1Y3QgY2xrX3JlZ21hcF9nYXRlX2RhdGEpIHsKPiAtICAgICAgICAgICAg
ICAgLm9mZnNldCA9IFZERUNfQ0xLX0NUUkwsCj4gLSAgICAgICAgICAgICAgIC5iaXRfaWR4ID0g
OCwKPiAtICAgICAgIH0sCj4gLSAgICAgICAuaHcuaW5pdCA9ICYoc3RydWN0IGNsa19pbml0X2Rh
dGEpIHsKPiAtICAgICAgICAgICAgICAgLm5hbWUgPSAiaGNvZGVjXzAiLAo+IC0gICAgICAgICAg
ICAgICAub3BzID0gJmNsa19yZWdtYXBfZ2F0ZV9vcHMsCj4gLSAgICAgICAgICAgICAgIC5wYXJl
bnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgJmMzX2hjb2RlY18wX2Rpdi5odwo+IC0gICAgICAgICAgICAgICB9LAo+IC0gICAgICAg
ICAgICAgICAubnVtX3BhcmVudHMgPSAxLAo+IC0gICAgICAgICAgICAgICAuZmxhZ3MgPSBDTEtf
U0VUX1JBVEVfUEFSRU5ULAo+IC0gICAgICAgfSwKPiAtfTsKPiAtCj4gLXN0YXRpYyBzdHJ1Y3Qg
Y2xrX3JlZ21hcCBjM19oY29kZWNfMV9zZWwgPSB7Cj4gLSAgICAgICAuZGF0YSA9ICYoc3RydWN0
IGNsa19yZWdtYXBfbXV4X2RhdGEpIHsKPiAtICAgICAgICAgICAgICAgLm9mZnNldCA9IFZERUMz
X0NMS19DVFJMLAo+IC0gICAgICAgICAgICAgICAubWFzayA9IDB4NywKPiAtICAgICAgICAgICAg
ICAgLnNoaWZ0ID0gOSwKPiAtICAgICAgIH0sCj4gLSAgICAgICAuaHcuaW5pdCA9ICYoc3RydWN0
IGNsa19pbml0X2RhdGEpIHsKPiAtICAgICAgICAgICAgICAgLm5hbWUgPSAiaGNvZGVjXzFfc2Vs
IiwKPiAtICAgICAgICAgICAgICAgLm9wcyA9ICZjbGtfcmVnbWFwX211eF9vcHMsCj4gLSAgICAg
ICAgICAgICAgIC5wYXJlbnRfZGF0YSA9IGMzX2hjb2RlY19wcmVfcGFyZW50cywKPiAtICAgICAg
ICAgICAgICAgLm51bV9wYXJlbnRzID0gQVJSQVlfU0laRShjM19oY29kZWNfcHJlX3BhcmVudHMp
LAo+IC0gICAgICAgfSwKPiAtfTsKPiAtCj4gLXN0YXRpYyBzdHJ1Y3QgY2xrX3JlZ21hcCBjM19o
Y29kZWNfMV9kaXYgPSB7Cj4gLSAgICAgICAuZGF0YSA9ICYoc3RydWN0IGNsa19yZWdtYXBfZGl2
X2RhdGEpIHsKPiAtICAgICAgICAgICAgICAgLm9mZnNldCA9IFZERUMzX0NMS19DVFJMLAo+IC0g
ICAgICAgICAgICAgICAuc2hpZnQgPSAwLAo+IC0gICAgICAgICAgICAgICAud2lkdGggPSA3LAo+
IC0gICAgICAgfSwKPiAtICAgICAgIC5ody5pbml0ID0gJihzdHJ1Y3QgY2xrX2luaXRfZGF0YSkg
ewo+IC0gICAgICAgICAgICAgICAubmFtZSA9ICJoY29kZWNfMV9kaXYiLAo+IC0gICAgICAgICAg
ICAgICAub3BzID0gJmNsa19yZWdtYXBfZGl2aWRlcl9vcHMsCj4gLSAgICAgICAgICAgICAgIC5w
YXJlbnRfaHdzID0gKGNvbnN0IHN0cnVjdCBjbGtfaHcgKltdKSB7Cj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgJmMzX2hjb2RlY18xX3NlbC5odwo+IC0gICAgICAgICAgICAgICB9LAo+IC0gICAg
ICAgICAgICAgICAubnVtX3BhcmVudHMgPSAxLAo+IC0gICAgICAgICAgICAgICAuZmxhZ3MgPSBD
TEtfU0VUX1JBVEVfUEFSRU5ULAo+IC0gICAgICAgfSwKPiAtfTsKPiAtCj4gLXN0YXRpYyBzdHJ1
Y3QgY2xrX3JlZ21hcCBjM19oY29kZWNfMSA9IHsKPiAtICAgICAgIC5kYXRhID0gJihzdHJ1Y3Qg
Y2xrX3JlZ21hcF9nYXRlX2RhdGEpIHsKPiAtICAgICAgICAgICAgICAgLm9mZnNldCA9IFZERUMz
X0NMS19DVFJMLAo+IC0gICAgICAgICAgICAgICAuYml0X2lkeCA9IDgsCj4gLSAgICAgICB9LAo+
IC0gICAgICAgLmh3LmluaXQgPSAmKHN0cnVjdCBjbGtfaW5pdF9kYXRhKSB7Cj4gLSAgICAgICAg
ICAgICAgIC5uYW1lID0gImhjb2RlY18xIiwKPiAtICAgICAgICAgICAgICAgLm9wcyA9ICZjbGtf
cmVnbWFwX2dhdGVfb3BzLAo+IC0gICAgICAgICAgICAgICAucGFyZW50X2h3cyA9IChjb25zdCBz
dHJ1Y3QgY2xrX2h3ICpbXSkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgICZjM19oY29kZWNf
MV9kaXYuaHcKPiAtICAgICAgICAgICAgICAgfSwKPiAtICAgICAgICAgICAgICAgLm51bV9wYXJl
bnRzID0gMSwKPiAtICAgICAgICAgICAgICAgLmZsYWdzID0gQ0xLX1NFVF9SQVRFX1BBUkVOVCwK
PiAtICAgICAgIH0sCj4gLX07Cj4gK3N0YXRpYyBDM19DT01QX1NFTChoY29kZWNfMSwgVkRFQzNf
Q0xLX0NUUkwsIDksIDB4NywgYzNfaGNvZGVjX3ByZV9wYXJlbnRzKTsKPiArc3RhdGljIEMzX0NP
TVBfRElWKGhjb2RlY18xLCBWREVDM19DTEtfQ1RSTCwgMCwgNyk7Cj4gK3N0YXRpYyBDM19DT01Q
X0dBVEUoaGNvZGVjXzEsIFZERUMzX0NMS19DVFJMLCA4KTsKCgpOb3RlOiBoY29kZWNfY2xrIGlz
IGEgbm8tZ2xpdGNoIGNsb2NrLiBUaGUgY3VycmVudCBkcml2ZXIgbWF5IGZhaWwgdG8gc2V0Cmhj
b2RlY19jbGsgcHJvcGVybHkuIEEgcHJldmlvdXMgcGF0Y2ggYXR0ZW1wdGVkIHRvIGZpeCB0aGlz
IGJ5IGFkZGluZyBhIApmbGFnLApidXQgd2FzIGFiYW5kb25lZCBhcyBpdCBpbnRyb2R1Y2VkIG90
aGVyIGlzc3Vlcy4KKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9mOGMzYjZlNy0yZjVkLTQ5
M2UtODI1NC0yYTI3NjIzZjBkMmVAYW1sb2dpYy5jb20vKQoKVGhpcyBtYWNybyB3b24ndCBiZSBz
dWl0YWJsZSBpZiB3ZSByZXZpc2l0IHRoZSBmbGFnIGFwcHJvYWNoIGxhdGVyLgoKCj4KPiAgIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIGMzX2hjb2RlY19wYXJlbnRzW10gPSB7
Cj4gICAgICAgICAgeyAuaHcgPSAmYzNfaGNvZGVjXzAuaHcgfSwKCgpbLi4uXQoKCj4gLS0KPiAy
LjQ3LjIKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
