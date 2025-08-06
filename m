Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918D7C87FD3
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Aug 2025 07:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cl9JF5iD6qNyCL0Swzlh+4O+Y8HRmUOGxTCY13MSE/c=; b=BlrNnJhuahOWs9KGdv3uy1l0lr
	AdCc9EQT2JWd4pdlcFIPOFQAmoJEFOQzvW/L+DWkgJiTiK4PQtTiXGNMQEAY/4wDD0pFkDQ9gbAaB
	SNb403uUGrk5P1zNxPQmaaIrgtuU13hOANvXMuvqLw6KAghHdomDixMSKrvPkKIqIUmaUntCg62vF
	J6jp8iyPkZIncmugmzmzaL92uogeORBVG/ETEdpnZbeg0X5vDWsvO/ZM4T6RdQ8JAIyusM8j7KumL
	dDIaAiQBuZpnTt1HRluwL/xt742CZVx1Ht5iC8+bV12jdpc3xey+6F0k5vRv4tENOAwofVox8Cj18
	YF1XAoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYSS-0000000EV2L-2dcS;
	Wed, 06 Aug 2025 07:21:08 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYJ1-0000000EU0z-1B3K
	for linux-amlogic@lists.infradead.org;
	Wed, 06 Aug 2025 07:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+zLfmcuIpr7sczCyQUJcbQSltU0664NNjOrPCbKqJx+Zekoxaj26+X3wrC55k6Ljymv2FJqP+sqrIk6h4y+/vuyWfoDl1exAADBdLS6TZRigAwel8OemAlAW+JDxdKO/Zqz+4lS7Bfi7akjxd5fy1UNC5Z4etlwk1PWytdDxzoTh4qePd+URls6WyQik7SWxDVqA8wAbhpWSSvXta0ETJsD6opQE2hb6hRpxo2LskPVySWmq3VclmvWNRIRv1Q/2xBCc+ZyJ1e8FIBu04D2ef7TUPR4vXWeaq1/uID1pUaZLw2KXD0mSHrPmcf4ri1N31c6nUIA+S0xxJIFstZ0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN/pAJsu0htqg1nzyUA65wGuemcERU2yI4AnOMeXtkU=;
 b=CQAlCZTcDu3ITmRbVuddafqh8w/wpII1rZM2PGMDwC7iqyCqbsjig9QJ/C6mWkXNoMaOrgo++L2Q8grp0pbea6Gxm9JXeo4vHFGpKjZ4pjtfOAxGb6JCoLFsjSZz7rHuwj+j/5Oz9v2qr+mFLAy/RKQu1R0evGWE5I3oqILgDFHjIaiu08GYLgirHxehkMNMa24lVozsC6LRE7FSyGWNsTRifN83zQq2p1eNyfregslkbd7/7OOpD5gzHutpwS8/7GxHUR6ns+KT7aV5bpVXfR4dhR5yypOSzyCN73nA716AALm6Dv3Is9vB0nYYsc50rN99wdrofc0BTF5TNc1Qdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN/pAJsu0htqg1nzyUA65wGuemcERU2yI4AnOMeXtkU=;
 b=fGyekUTtu731O01+ieN5FzYa7szg7fn1OvGWpSPUF6SrbTTl4JjMTRgQvHmV8HJzG1Ivr60MBFjTWeWncJdh5Gja/Gz4atgT80gWi0qm3SyrcL32V4pUTXTrc2eGtG7SJ0snEfyeplklciS7e0hg2brMLnHbpfKgcl0FX/g9BW2p8y7ZFlhgXmtccWYOG8jSoja+l8VKRmBi+i+saO6sBHpXH7CAvQghxzz5wfWse6vmpBeAj0Y+XlW0HUQau4FCah5RHVhhXUVT2QrS4cxcOmvMaJTnfX+6eaxhupv5RHGTyk6/EvFFmOXlrst9pB4KwjAKCW63iN/LL+iMPcfgXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB7958.apcprd03.prod.outlook.com (2603:1096:101:17d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 07:11:13 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 07:11:12 +0000
Message-ID: <3bcde794-c120-4a74-90b8-efbe3d61f448@amlogic.com>
Date: Wed, 6 Aug 2025 15:10:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] clk: amlogic: clock controllers clean-up and
 factorisation
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 19641189-087e-4670-7f51-08ddd4b86cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXRuSVFJWnA3aVV4amV6NlNrSVM1K3I2M2tzV2NUU0hDQnVRa0dIZ3B5ZDBQ?=
 =?utf-8?B?TFY5Q3BWd1dsWGswbDdqTDhBaDdXcGEvMitVRCs4ZHd6ZG9QaDdGbGtCb3BI?=
 =?utf-8?B?MlBzdE9xTHhwVnRDcERBVDlHcmw2OHgxWVlzSXlmdWc0NksvdG02NzNIRzI5?=
 =?utf-8?B?OVNkdFNpRWNWY0FFOHlyM0czM0FhU0NJbzhIQ3MwSnhmc2NkRU1ueDRRVGhE?=
 =?utf-8?B?NW5FQ2pERm94RGVkcGExN2JxWC8rLytOTUhoT1BKbjFNTlZtZldCUEM0RjlT?=
 =?utf-8?B?bkY1Y2NvRzdEM2xqZTJDY2xmRVAxa3k0d0ZNdzloOTk4ZG42c25zL3NGNVlm?=
 =?utf-8?B?OHFsVW9SSG5ET0RacndXN1dmTFcwTHNaVGp0dzU0M216RmNYRG5EanZ4ay9W?=
 =?utf-8?B?RVE1TWJ1elIvekN2K2ZseHZvYkpneDN4bHBYQllFaEllMzhzb25UWDNMWllO?=
 =?utf-8?B?RkllRkRDVGdSbzZGbnZDZjZsTnRFRHorUGZ2dUQxSFZrOThyQVRqM1FtTmFQ?=
 =?utf-8?B?YjNRa2J1RTRvYzhaM0hRczBvdmlySjZpbkdqTVJiS1ZURkNPUWl4a3pQK2Vz?=
 =?utf-8?B?RTVpY3NMdGYwSG0yR3VncUVBaFQ5YjA1N0VVWjBXT25kb1Zob3VxOWlnb3VF?=
 =?utf-8?B?cHhVRW1rbkV1VWlFaktrNGJUcnFESEFXNDE4cFZSRDdoSi9GSlVQVmF4QVJh?=
 =?utf-8?B?QUtDR2xXdTZoNVdkTVhEaUxxL3hSS2tyYkxZMzVSOTE0SkVPYmRFdW1aTE5h?=
 =?utf-8?B?WVArUTRTL2JoUWd5UUQxb2ZUV1hTVlROaWxWVVJ3TEFwZVp0Q1BjeW1OR2FO?=
 =?utf-8?B?alhlRitHNWhNbkdxVWJSQjhSTWVTVXJLOG9MOUdXZjZZTjZNbTVHalpQcGhX?=
 =?utf-8?B?Uk5KWjFnSm04MGRzNU5tRCt3K1lEdFU4cFpHZ0FBMUZqWXBvSENwZVltSGFP?=
 =?utf-8?B?L3h4amM4QS9RWk51RWRGbm94WGhDYW11aVpTMWs4N1ZiUDFnOU1SRjFCc1Vr?=
 =?utf-8?B?NVVUYWNVWlB6cWI3K2NpTW5mcWtSNXdqS1VEd0lQd1RaWGEvUThrZ3paT1Uv?=
 =?utf-8?B?Q2R0RER6ZTA2a3ZrcnBPNGpnTUMxVWNuZnUwWW13bEpXZzlQK2JDOU1VMGl6?=
 =?utf-8?B?L3IzSjl2bzZZMXFtaGp1RmsxSGdvTGI4RmNBTnhNdUFFZXVQUERzRjNKdEE3?=
 =?utf-8?B?NE1Na0kwd2xyNDRubWVqVHhwSHprMkNla2lWSjlzOE1ISFk2UE1aVUVRVHJW?=
 =?utf-8?B?Z0tIVjE2T09vK2JGanVVZDZJVGxESWFCbllxV2VwL3RGb29tYkV4eVlFM1kv?=
 =?utf-8?B?SzFPeXREMnVwVFhkR0hrdm5nWW43UFp5SG9CdHladjhCbFIyL1FYbGlzbmx5?=
 =?utf-8?B?WDJYdVZjSHpIOENJZDk4WFYzWHZEekx2VktyN2diUTF5dEVmbDkxMUZjOE9J?=
 =?utf-8?B?dDk3WVVuSVJ6bnBaYVBaS0RrZWJEUzVmVXNodUoyVVFLWmIxQzNqaURZNnVv?=
 =?utf-8?B?bCtGZWVNOUNpcUE5NXJ6dFBhTGIvQTAzVlNQOEt2d2xScDZyQWU5NmxsTERx?=
 =?utf-8?B?UGg4bjk0MUpkcFNzZFNrZ3Z5a24vbkU4QWpkVmVjMzZHdmtvdk5Fc3haRUdU?=
 =?utf-8?B?V3NiNlJHWmtjdGVHNlA5Uy9Ld3o4WlJLYzhVdEhtYVYzZFZveE91SFVyMm85?=
 =?utf-8?B?VW1zK0RadWRWd2o4ZWVpOVZETm81V3c0RTZJc0xkbEgwRFJVcVRXNGFWWEJ3?=
 =?utf-8?B?MVJ0aXptc052ckY1OXd1R1FWK1NjaGRxN3ZBcTE1UzNJY1FLbEdFZFU5UDRu?=
 =?utf-8?B?MHBCYytXZ0hGdXlwWWhkSVVhaVcya3dBT2syY21nR2dqa1hLTFVMUTFjbW9L?=
 =?utf-8?B?VnY4NFphbDgwVDNHNVAwMFIvdTgzUy9FTjJ6Y0txZzNzZEJhdWhQWGhTR09m?=
 =?utf-8?Q?ZLCektb/CcE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODBKaVVRZGFjN1N4Z3VyTG02Z1gxRFQzM0hjZ2NKZStjNDgzdFVzaGFpUTVW?=
 =?utf-8?B?VkFRQjM4Z2UxbDhKMTF1NGs5MFY5RFdzT1owdVFud2FmSVdWWnBxQlVoendx?=
 =?utf-8?B?dkZ2WnRWMTJ1K0lPbVBDZmN4QTAyTXNjOFB0VDZFMldyTHpITEF0Y2QwaTRS?=
 =?utf-8?B?b2w5UUloNmVwYS80VDBKYk1ucG1OYUhvejZzc1U0OUZRMlR1b0RQSzk3M09W?=
 =?utf-8?B?SmpIczN4SEZTaGxXTXZ5U0V1aTNrazV4Nkw0R1lNZTg0ZnFNaW0xbWxzemVw?=
 =?utf-8?B?cjRXeG0yTzI2eVptc1lVY3k5a1JZK0dFYjV1TFJHd3ZFek9lZFBkRmxIQ090?=
 =?utf-8?B?TU5BQzhSWGpnMU9aVDNCeUR0ZnZLQzAzN2s3YWlmOUJVN1BESTRtMjdvYnBR?=
 =?utf-8?B?cU5ORGlDSzBGNW45U3BPaDVuZDJ1UFZ5c2RWK3RnSXJZS1VibndpWmtQaXhz?=
 =?utf-8?B?QlI4UitmQmRKalhNYXlsM1dub1dFOUFqb0VQTm4yMXBDbitNaG9hZUEzbjN4?=
 =?utf-8?B?YmNWTCtTNXhYY0FvVkR3MVVUSk1OVlNPakJRWnRubTdzUDZkdkNaK1ZteGRM?=
 =?utf-8?B?T3p3Ti9oVzdBZ2MxUEFGNklON3VlQWRzVEZpUWt2QTk5WU9SbkJQdkJPYTNK?=
 =?utf-8?B?OTJFWFZkQzdWWk9Jd0tYMG1oektUNHJ4YlN1NlkzbE4vTkNIcit5aXJjbG5I?=
 =?utf-8?B?OGp6QksydFZLUkdIR2JxQ1Q5YitYSWFlVk9xaVFScHdEWUtyUXZaL2VxRUcz?=
 =?utf-8?B?aDMzcXc2YWlVbE9USml6WksyNHlIRVNwTWV5bGRNUS95S2d4bm1GeXRwd3Fy?=
 =?utf-8?B?OFhWbjd6YUZ3b1l0SDN6Y2QwM2FkVjhlR3czd3hEcjRvdHhoSHdHTUJuTUYy?=
 =?utf-8?B?LzFMc2FmRUs3cU01K082eCtlR2ZLaW1JUVB4N3ZJSXgxU1c5Mng4RGs5M2F0?=
 =?utf-8?B?UllleG5GT3p6UnRXeVNXTHR1SUVOc01pT3dqMytKMFE2ZXEza083QkZBKy9T?=
 =?utf-8?B?NSttblQxTkRsSktoVGZFWVpyNnpiY1VUNW1QYjl5bXkrR0k2ajkzMmUzZTNp?=
 =?utf-8?B?aGJWWDRac0xJK3ZQQlNVdTBaTFBnYWk0Ri94NlRMUUFwNk5oNzBLT2VhdHlE?=
 =?utf-8?B?NjU4YTh0V3EvVTVBMWdzNjlRMCtDSWZseGRnVXNVb3VMRHNRdmJsOEtyWVVw?=
 =?utf-8?B?NXZZWlN3S1ZPZm4yOVBxc0dpTUxwN3BaMHNqTDVxSi9vZmJsUTFVYWVPOE1z?=
 =?utf-8?B?b1I1enVHTHc5bEZBN1RGcVlRNW4zckxTbEdSTGV0ejB1ZU96WEdUWTF5VG83?=
 =?utf-8?B?cGpJTjdPVE9HVmF6cFBQZmZVc0VtaWY5V25XWHpHS2xQZUVJS05IWk1ZcWxq?=
 =?utf-8?B?RnE0Z1JhUExkMGdob1dNMWI5ckRySVorL0Uvd1hrZllzOCs5c1VlSkYzMXZC?=
 =?utf-8?B?NmxaMTRTMlJmZ1plWjNHcHV5U2NqY1ozRjdJd0Y5Tnd0MElnTXovUTkrMG5s?=
 =?utf-8?B?TnNhQytDMHlRbHYwMWxhcmVBU3VCRE9LMGc1dUdMdjRmTmxOSkZqb3E3OVd5?=
 =?utf-8?B?YU92Y3QzbWRZTCtybUlodkZ4OFZVenJhb28vT2xEcGpibDFTSHNFTVp3T2la?=
 =?utf-8?B?MEUvZHdzMzhNck1Oc3RYYWl1dHJBNmo0YmZqOEgzbEx3aGoxTW4zRDNjMExp?=
 =?utf-8?B?Qk9UZTlhVlc3encyc2V5YjV6N1QwTjdYNTg4aUpISnIwR2t1RXZPditUNHlH?=
 =?utf-8?B?bGlxQzdINUJFaExvSTdZaVc4UWxlMTErbXNWTUpFQ0NCb2xaajlCVjd3QVR0?=
 =?utf-8?B?QmYvTnAxTHQzS3dkR1ZKMkxPLzV3TVVEQ0pIVW1Ua1hvaS9KMC9BR3FBUDlx?=
 =?utf-8?B?K1AwbUNhR1NkNm84VVZKQ1JieUpQbStSSUtXWTVXUFhIemJ1VEN6eGtId0I2?=
 =?utf-8?B?QUdFTUIzdlJRbW9Kb0pBUjI1S3l0amtPWjA0NFEwM09qZSt0QWN5ZW95VXdm?=
 =?utf-8?B?NmEzbk9sWDJJLzNuRFVDekpmTU9FaGxUNUZhTVE4NksraFN0L04wWFMxYTVo?=
 =?utf-8?B?ZXU1NTZHWkIvY2Z1dE4xeHk0MTFHSER6WVdDeGJGYVRYVjhzKzk3dE5jcTNF?=
 =?utf-8?Q?t7sTGAc9IhcQ7DqB5Be5/Yhvn?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19641189-087e-4670-7f51-08ddd4b86cf4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 07:11:12.7455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBsbeB+h+jAlpvvXrlSqeisjZnwhUP8/S9cEPHbnyYad54g6QdgnjvT7nry4fF99du7S02lWF93r7pM0rJWx4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_001123_440045_514F1FFC 
X-CRM114-Status: GOOD (  31.00  )
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

aGkgSmVyb21lOgoKIMKgIMKgIFJlZ2FyZGluZyB0aGlzIHBhdGNoIHNldCwgaXMgdGhlcmUgYW55
dGhpbmcgSSBjYW4gYXNzaXN0IHdpdGg/CkZvciBleGFtcGxlLCB0ZXN0aW5nIHRoZSBtb2RpZmll
ZCBjaGlwIGZ1bmN0aW9uYWxpdGllcz8gYW5kIHdlIGhhdmUKbW9yZSBjbG9jayBkcml2ZXJzIGZv
ciBvdGhlciBjaGlwcyBhd2FpdGluZyBzdWJtaXNzaW9uLgoKCk9uIDcvMi8yMDI1IDExOjI1IFBN
LCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gVGhlIHdvcmsg
b24gdGhpcyBwYXRjaHNldCBzdGFydGVkIHdpdGggdGhlIHN1Ym1pc3Npb24gb2YgdGhlIEFtbG9n
aWMgdDcKPiBwZXJpcGhlcmFsIGNsb2NrIGNvbnRyb2xsZXIgWzFdLiBUaGlzIGNvbnRyb2xsZXIg
aXMgZmFpcmx5IHNpbWlsYXIgdG8KPiBleGlzdGluZyBjb250cm9sbGVycy4gT25jZSBhZ2Fpbiwg
aXQgcmVkZWZpbmVzIHRoZSBwZXJpcGhlcmFsIGNsb2NrIG1hY3JvLAo+IHRoZSBwcm9iZSBmdW5j
dGlvbiBhbmQgY29tcG9zaXRlIGNsb2NrIGhlbHBlcnMsIGV2ZW4gaWYgaXQgaXMgYWxtb3N0IHRo
ZQo+IHNhbWUgYXMgaW4gb3RoZXIgY29udHJvbGxlcnMuIFRoaXMgY29kZSBkdXBsaWNhdGlvbiB0
cmVuZCBoYXMgYmVlbiBnb2luZyBvbgo+IGZvciB0b28gbG9uZyBhbmQgbm93IGlzIHRoZSB0aW1l
IHRvIHByb3Blcmx5IGFkZHJlc3MgdGhlIHByb2JsZW0uCj4KPiBUaGVyZSBpcyBjbGVhcmx5IDQg
cGFydHMgaW4gdGhpcyBwYXRjaHNldC4gVGhlc2UgYXJlIHNlbnQgdG9nZXRoZXIgZm9yIHYxCj4g
dG8gc2hvdyB3aHkgd2hhdCB0aGUgdWdseSBmaXJzdCBwYXJ0IGlzIHVzZWZ1bC4gSWYgbW9yZSB2
ZXJzaW9ucyBhcmUKPiBuZWVkZWQsIHRoZSBwYXRjaHNldCB3aWxsIGJlIHNwbGl0IGluIDQuCj4K
PiBXaGlsZSBhbGwgY29udHJvbGxlcnMgYXJlIGRvaW5nIG1vcmUgb3IgbGVzcyB0aGUgc2FtZSB0
aGluZ3MsIHRpbnkgYW5kCj4gb2Z0ZW4gcG9pbnRsZXNzIGRpZmZlcmVuY2VzIGhhdmUgZW1lcmdl
ZCBiZXR3ZWVuIHRoZSBjb250cm9sbGVycy4gVGhpcwo+IG1ha2VzIGl0IGhhcmRlciB0byBleHBs
b2l0IFNvQyBjb21tb25hbGl0aWVzLgo+Cj4gVGhlIGZpcnN0IHBhcnQgb2YgdGhpcyBzZXJpZXMg
ZGVhbHMgd2l0aCB0aGF0IHByb2JsZW0gYW5kIHJlYWxpZ24gdGhpbmdzCj4gdXAuIFRoZXJlIGlz
IG5vdGhpbmcgY29tcGxpY2F0ZWQgZ29pbmcgb24gdGhlcmUgYmVzaWRlIHJlbmFtaW5nLiBJdCBp
cyB0aGUKPiB1Z2x5IHN0dWZmLCB5ZXQgbmVjZXNzYXJ5LCB3ZSBoYXZlIHRvIGdvIHRocm91Z2gg
dG8gZ2V0IHRvIHRoZSBpbnRlcmVzdGluZwo+IHN0dWZmIGFmdGVyd2FyZHMuIFRoZXJlIGlzIG9u
ZSBjaGFuZ2UgcGVyIGNvbnRyb2xsZXIgZm9yIHRoZSByZXZpZXcsIHdpdGgKPiB0aGUgaW50ZW50
IHRvIHNxdWFzaCB0aGlzIGludG8gYSBzaW5nbGUgY2hhbmdlIG9uIGFwcGxpY2F0aW9uLgo+Cj4g
U2Vjb25kIGlzIHRoZSBmYWN0b3Jpc2F0aW9uIG9mIHRoZSBwcm9iZSBmdW5jdGlvbnMgc28gdGhv
c2Ugc3RvcCBiZWluZwo+IGNvcHkvcGFzdGVkIGluIGVhY2ggY2xvY2sgY29udHJvbGxlciBkcml2
ZXJzLgo+Cj4gVGhlbiB0aGUgY2xlYW4tdXAgYW5kIGZhY3RvcmlzYXRpb24gZm9yIHRoZSBQQ0xL
IG1hY3JvcywgYWdhaW4gdG8gc3RvcAo+IGNvcHkvcGFzdGUgYnV0IGFsc28gdGhlIHNpbGVudCB1
c2UgQ0xLX0lHTk9SRV9VTlVTRUQuCj4KPiBGaW5hbGx5IHRoZSBpbnRyb2R1Y3Rpb24gb2YgbWFj
cm9zIGZvciBjb21wb3NpdGUgY2xvY2sgZGVmaW5pdGlvbnMuIFRoZQo+IHNhbWUgcGF0dGVybiBh
cyB0aGUgZm9yIHRoZSBQQ0xLcyBzdGFydGVkIHRvIGFwcGVhciBvbiBzNCwgYzMgYW5kIHQ3LiBE
b25lCj4gcHJvcGVybHksIHRoaXMgY291bGQgYWxzbyBoZWxwIHJlZHVjZSB0aGUgdmVyYm9zaXR5
IG9mIHRoZSBvbGRlcgo+IGNvbnRyb2xsZXJzLgo+Cj4gV2l0aCB0aGlzLCB0aGUgYzMtcGVyaXBo
ZXJhbHMgY29udHJvbGxlciBtYXkgYmUgdXNlZCBhcyBhbiBleGFtcGxlIG9mIHdoYXQKPiBmdXR1
cmUgc2ltaWxhciBjb250cm9sbGVycyBzaG91bGQgbG9vayBsaWtlLgo+Cj4gQWZ0ZXIgdGhpcywg
dGhlcmUgaXMgc3RpbGwgc29tZSBob3VzZSBrZWVwaW5nIHRvIGJlIGRvbmUgaW4gdGhlIGFtbG9n
aWMKPiBjbG9jayBkcml2ZXJzOgo+IC0gTW92aW5nIHJlbWFpbmluZyByZXNldCBkcml2ZXJzIHRv
IHRoZSByZXNldCBzdWJzeXN0ZW0KPiAtIFByb3BlciBkZWNvdXBsaW5nIG9mIGNsay1yZWdtYXAg
ZnJvbSB0aGUgY2xvY2sgY29udHJvbGxlcnMKPiAtIFJlZHVjZSB2ZXJib3NpdHkgb2Ygb2xkZXIg
Y29udHJvbGxlcnMgd2l0aCB0aGUgY29tcG9zaXRlIG1hY3Jvcywgd2hlcmUgaXQKPiAgICBtYWtl
cyBzZW5zZS4KPgo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY2xrLzIwMjUw
MTA4MDk0MDI1LjI2NjQyMDEtNi1qaWFuLmh1QGFtbG9naWMuY29tLwo+Cj4gU2lnbmVkLW9mZi1i
eTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gSmVyb21lIEJy
dW5ldCAoMjYpOgo+ICAgICAgICBjbGs6IGFtbG9naWM6IGExLXBlcmlwaGVyYWxzOiBuYW1pbmcg
Y29uc2lzdGVuY3kgYWxpZ25tZW50Cj4gICAgICAgIGNsazogYW1sb2dpYzogYTEtcGxsOiBuYW1p
bmcgY29uc2lzdGVuY3kgYWxpZ25tZW50Cj4gICAgICAgIGNsazogYW1sb2dpYzogYXhnLWFvOiBu
YW1pbmcgY29uc2lzdGVuY3kgYWxpZ25tZW50Cj4gICAgICAgIGNsazogYW1sb2dpYzogYXhnOiBu
YW1pbmcgY29uc2lzdGVuY3kgYWxpZ25tZW50Cj4gICAgICAgIGNsazogYW1sb2dpYzogYzMtcGVy
aXBoZXJhbHM6IG5hbWluZyBjb25zaXN0ZW5jeSBhbGlnbm1lbnQKPiAgICAgICAgY2xrOiBhbWxv
Z2ljOiBjMy1wbGw6IG5hbWluZyBjb25zaXN0ZW5jeSBhbGlnbm1lbnQKPiAgICAgICAgY2xrOiBh
bWxvZ2ljOiBnMTJhLWFvOiBuYW1pbmcgY29uc2lzdGVuY3kgYWxpZ25tZW50Cj4gICAgICAgIGNs
azogYW1sb2dpYzogZzEyYTogbmFtaW5nIGNvbnNpc3RlbmN5IGFsaWdubWVudAo+ICAgICAgICBj
bGs6IGFtbG9naWM6IGd4YmItYW86IG5hbWluZyBjb25zaXN0ZW5jeSBhbGlnbm1lbnQKPiAgICAg
ICAgY2xrOiBhbWxvZ2ljOiBneGJiOiBuYW1pbmcgY29uc2lzdGVuY3kgYWxpZ25tZW50Cj4gICAg
ICAgIGNsazogYW1sb2dpYzogbWVzb244YjogbmFtaW5nIGNvbnNpc3RlbmN5IGFsaWdubWVudAo+
ICAgICAgICBjbGs6IGFtbG9naWM6IHM0LXBlcmlwaGVyYWxzOiBuYW1pbmcgY29uc2lzdGVuY3kg
YWxpZ25tZW50Cj4gICAgICAgIGNsazogYW1sb2dpYzogczQtcGxsOiBuYW1pbmcgY29uc2lzdGVu
Y3kgYWxpZ25tZW50Cj4gICAgICAgIGNsazogYW1sb2dpYzogbWVzb244LWRkcjogbmFtaW5nIGNv
bnNpc3RlbmN5IGFsaWdubWVudAo+ICAgICAgICBjbGs6IGFtbG9naWM6IGRyb3AgbWVzb24tY2xr
Y2VlCj4gICAgICAgIGNsazogYW1sb2dpYzogYWRkIHByb2JlIGhlbHBlciBmb3IgbW1pbyBiYXNl
ZCBjb250cm9sbGVycwo+ICAgICAgICBjbGs6IGFtbG9naWM6IHVzZSBwcm9iZSBoZWxwZXIgaW4g
bW1pbyBiYXNlZCBjb250cm9sbGVycwo+ICAgICAgICBjbGs6IGFtbG9naWM6IGFvY2xrOiB1c2Ug
Y2xrYy11dGlscyBzeXNjb24gcHJvYmUKPiAgICAgICAgY2xrOiBhbWxvZ2ljOiBtb3ZlIFBDTEsg
ZGVmaW5pdGlvbiB0byBjbGtjLXV0aWxzCj4gICAgICAgIGNsazogYW1sb2dpYzogZHJvcCBDTEtf
U0VUX1JBVEVfUEFSRU5UIGZyb20gcGVyaXBoZXJhbCBjbG9ja3MKPiAgICAgICAgY2xrOiBhbWxv
Z2ljOiBwY2xrIGV4cGxpY2l0bHkgdXNlIENMS19JR05PUkVfVU5VU0VECj4gICAgICAgIGNsazog
YW1sb2dpYzogaW50cm9kdWNlIGEgY29tbW9uIHBjbGsgZGVmaW5pdGlvbgo+ICAgICAgICBjbGs6
IGFtbG9naWM6IHVzZSB0aGUgY29tbW9uIHBjbGsgZGVmaW5pdGlvbgo+ICAgICAgICBjbGs6IGFt
bG9naWM6IGFkZCBjb21wb3NpdGUgY2xvY2sgaGVscGVycwo+ICAgICAgICBjbGs6IGFtbG9naWM6
IGFsaWduIHM0IGFuZCBjMyBwd20gY2xvY2sgZGVzY3JpcHRpb25zCj4gICAgICAgIGNsazogYW1s
b2dpYzogYzMtcGVyaXBoZXJhbHM6IHVzZSBoZWxwZXIgZm9yIGJhc2ljIGNvbXBvc2l0ZSBjbG9j
a3MKPgo+ICAgZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZyAgICAgICAgICAgIHwgICAxMyArLQo+
ICAgZHJpdmVycy9jbGsvbWVzb24vTWFrZWZpbGUgICAgICAgICAgIHwgICAgMSAtCj4gICBkcml2
ZXJzL2Nsay9tZXNvbi9hMS1wZXJpcGhlcmFscy5jICAgfCAgOTk1ICsrKysrLS0tLS0KPiAgIGRy
aXZlcnMvY2xrL21lc29uL2ExLXBsbC5jICAgICAgICAgICB8ICAxMjQgKy0KPiAgIGRyaXZlcnMv
Y2xrL21lc29uL2F4Zy1hb2Nsay5jICAgICAgICB8ICAxNTMgKy0KPiAgIGRyaXZlcnMvY2xrL21l
c29uL2F4Zy5jICAgICAgICAgICAgICB8ICAyMzcgKy0tCj4gICBkcml2ZXJzL2Nsay9tZXNvbi9j
My1wZXJpcGhlcmFscy5jICAgfCAyMDU1ICsrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVy
cy9jbGsvbWVzb24vYzMtcGxsLmMgICAgICAgICAgIHwgIDI0NSArKy0KPiAgIGRyaXZlcnMvY2xr
L21lc29uL2Nsay1yZWdtYXAuaCAgICAgICB8ICAgMjAgLQo+ICAgZHJpdmVycy9jbGsvbWVzb24v
ZzEyYS1hb2Nsay5jICAgICAgIHwgIDIzOCArLS0KPiAgIGRyaXZlcnMvY2xrL21lc29uL2cxMmEu
YyAgICAgICAgICAgICB8IDMzMTYgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+
ICAgZHJpdmVycy9jbGsvbWVzb24vZ3hiYi1hb2Nsay5jICAgICAgIHwgIDEyMyArLQo+ICAgZHJp
dmVycy9jbGsvbWVzb24vZ3hiYi5jICAgICAgICAgICAgIHwgIDYxMSArKysrLS0tCj4gICBkcml2
ZXJzL2Nsay9tZXNvbi9tZXNvbi1hb2Nsay5jICAgICAgfCAgIDMyICstCj4gICBkcml2ZXJzL2Ns
ay9tZXNvbi9tZXNvbi1hb2Nsay5oICAgICAgfCAgICAyICstCj4gICBkcml2ZXJzL2Nsay9tZXNv
bi9tZXNvbi1jbGtjLXV0aWxzLmMgfCAgIDg5ICstCj4gICBkcml2ZXJzL2Nsay9tZXNvbi9tZXNv
bi1jbGtjLXV0aWxzLmggfCAgIDg5ICsKPiAgIGRyaXZlcnMvY2xrL21lc29uL21lc29uLWVlY2xr
LmMgICAgICB8ICAgNjAgLQo+ICAgZHJpdmVycy9jbGsvbWVzb24vbWVzb24tZWVjbGsuaCAgICAg
IHwgICAyNCAtCj4gICBkcml2ZXJzL2Nsay9tZXNvbi9tZXNvbjgtZGRyLmMgICAgICAgfCAgIDYy
ICstCj4gICBkcml2ZXJzL2Nsay9tZXNvbi9tZXNvbjhiLmMgICAgICAgICAgfCAgNzQ2ICsrKyst
LS0tCj4gICBkcml2ZXJzL2Nsay9tZXNvbi9zNC1wZXJpcGhlcmFscy5jICAgfCAxMTYwICsrKyst
LS0tLS0tLQo+ICAgZHJpdmVycy9jbGsvbWVzb24vczQtcGxsLmMgICAgICAgICAgIHwgICA4MiAr
LQo+ICAgMjMgZmlsZXMgY2hhbmdlZCwgNDQzNyBpbnNlcnRpb25zKCspLCA2MDQwIGRlbGV0aW9u
cygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiAyYzM3ZTFjNjcxNDI4MDAyNTE5ZTc2MTVkNzg2Yjli
NjkyMjYxMDUyCj4gY2hhbmdlLWlkOiAyMDI0MTIxMS1tZXNvbi1jbGstY2xlYW51cC0yNC00MWNi
ZTE5MjQ2MTkKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IEplcm9tZQo+Cj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0Cj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
