Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A6ECD8CB9
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2026 04:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMcUvVGSiI7u1bg7lCDMk6/5TSPHHvfL1QclLtY/gNs=; b=Fi2c2t4PR+3jxrz+iiJl+UZm8c
	S/Uy7Pp2g5e2f8LO30Q0zo6DUwQLj/X9mDuhyMFleI0SbFpPSxn4Dqdmh+OWMvRyrDFvB7vNbbYQ+
	U2nyPERk7vcYF90Z7OkAPfQYQyDXjhmxYnv21gGJkoB8i25zGHudc3eDlOzcRQilGKnZxEJINK/QG
	c13EfpX0GEU76g+rZYBHCjMFSEl2U42yLQ5o6NJDsuaXJ1IJN8P03g5yw2jcMcB1Zgsm3FexMAonI
	TA1ax7xluLtu5gAkIna7ntEzI50skqb3fNo6dMAzLPACDfNKEkEdSKp46sHFsOFUI+qRC79fmJtj/
	sqllFkhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXAPa-00000006mJR-3jXp;
	Wed, 10 Jun 2026 04:19:30 +0000
Received: from mail-koreacentralazon11023098.outbound.protection.outlook.com ([40.107.44.98] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXAPY-00000006mIo-1Dda;
	Wed, 10 Jun 2026 04:19:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZqbKeY9h3+EBt3dpv4sFC597Yo2dPgUJjDBjGVNvzEK+Jp2v0vfbyjmD+9W3jjBGmXFWzeYBNFgK6zwJGxJD5UTsIK2D+WeJwObn1Aeni3N+EgR0qVafrs1zc9I4CoiZ2hCgkxl+0BJ7JmhsaY9dCE5L+v0sjXblL+qlBeUoTJQrOoQmb7wzres7uQ9+ycLafWO/1HJkBQ/gpnZMYgAzuLyWNo9c39ghy+3XihxKXoSmvma3ixFST2BUSnJGlLBVlymscg1empCx2Home/BNeWpzECWGQFcGtqXHM95gTMQNUA63H8/emobgnxM9pyf3QJ/FnL7xjPMMzatl1rYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7EgqrSeB9xNlz0Rcurj5NI7eLQtaUNh9jWOytKla0Q=;
 b=OJNocZonm4aPeJHqJrk1yh9Dhdh3M2HMWf/B74AL4t5WTzlXahAWkxzMXACk3rU1/ZOWBfHzPwPMEyaBPjXB9pgthhHrAr7TafchcscOG67+A8YBj5u4ph2Ea5j4Bd0JuBY6EQmiTi2NHOyp/Yr6dSouL4d54HS9rOOsos6cbPVYjye3MAhL5LDfmETNSjIGPjWT075aGDCqTxws4EAQndhW6BhT6v8Vuq/KtU0qO6d/eAL9akoVjt7giaJcefol/V+PqLjOgGMofJO/X0KIA9gNVKzMZcFCAxirxOkX5p7Z/oCPyaidj4lvOhZLQj9kg5k/zZamaBAve+SoAhMSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7EgqrSeB9xNlz0Rcurj5NI7eLQtaUNh9jWOytKla0Q=;
 b=HtfTuActOR0scnn6P+qvKJzPouNJJwfwmh4qDMJpYWksnNkpI6133pUbyETSiXC+9WYSgviZaq0OyNPPqmOmVAHU+CTAqNQOVNYcdLq5ppCFQFGibHV9FW7P9Mf7o99DiArOsUMCPF6sLi+ddGUdo9MleqGAfEm/xxKmIPmkzbKAFRgDLEvjHXtVuv4q5sts90NDDEDkI7lRE2RDWirc8eOI2AtKrWus/RTj1WyKtHUv9VBHBC2a2/IqxJkgs936yocw5miXGERDz3MtIFqdmDJFVZwjidg0kvT6/+7j+xLqtQSeul8/hpddNFol2WawNcx2XA9HjOnNj3VqzIevYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by JH0PR03MB8024.apcprd03.prod.outlook.com (2603:1096:990:3d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.9; Wed, 10 Jun
 2026 04:18:58 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0113.006; Wed, 10 Jun 2026
 04:18:58 +0000
Message-ID: <67fcf9bc-0ac7-4812-aa7c-4d42d8f1c162@amlogic.com>
Date: Wed, 10 Jun 2026 12:18:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: amlogic: Add A9 AO clock controller driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com>
 <20260603-a9_aoclk-v2-2-f47ea616ee78@amlogic.com>
 <1j7bofd7dr.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j7bofd7dr.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SE2P216CA0164.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::16) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|JH0PR03MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d41eeb-61c2-432f-c233-08dec6a76449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|4143699003|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kOkU5cks1y+b7tRWPMSfhSxzror4rqRMCNYFOtBexJGby+bZ3zpjVwM5S+y9h1lhQccp2vQXku74uqO1YuDkLRXz/dJRhoqpuo7vM2hUXmsrr7b1lh7HwBpDrvQRZt4n4Ca0qrxVYZVut2UZuYoxTHGkA1nEiPC7kxXTFfBGes/eEvzTkgEnoGC28RnCybHSVC6LkCx/qdRz9yj2Hvj+RcHBV3LKNsN1L0wrOt2Qs6yU7pDzfsvxsYyMArxJiV0LFmEwdGJUNyEwGDw6SRTjMKH4qGBg00dqG8Bc0fvOlmpTDAp3LlOZUcKhhb7l09EScTM5V9vF+ijuDekPODnevw8M5MD+BD1J8M4bosdj3sgwunr4f7tnfj+SqTRWg4zgNmabCXInBGhlAggsBcer5Z7Z8bdYhqAX3oZSpeba3NGwCCNF6vw1l22yl0Ht7rDh4FTSiBzqwe2FzK70mbacDo2IQ8ElGgoSeIkihnG8GVfQ6Ni5REWVkWyncbE0tEYxbYxgr1sjoDut1jh+ZCLl03YVOd32CoSKUQpE1zQ8Bo22xvLwE92RcBSwnF3kk8GnFA8lfBHmyYdAS9tmkY+WSBtcOt/C2QOBIwdol1DK8xlpUp6JGEnvmMNb5NQQg+0OFXSdHE7A+MH9EfcAZ+t1GNdWoigxG9hMUktsS0wMDZT9Orr+ce+OywzeG/9nWwhA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(4143699003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDJMZ2RVWWRtUzVuSENweXcvL25CTGVCSW81T1YrK0ovQ3VXLzd6YVBVRUZJ?=
 =?utf-8?B?QkpYcUw4eStSMzRqbmRkZTBWbHp6QkI2c1BnaGNpRktpMERzcmQ3WUxjd0ZR?=
 =?utf-8?B?ZDd1WjBwdEp6L0hJRXdLbW1rbXpoWDZkYWdvQ1BNa1dVbnJZRHU4MUhkWkF3?=
 =?utf-8?B?YXVEbkpHSVYzcWVYN3Y3Z2pMRmUvT3hwTmVxeGZBUUsvNjA2dmd6cTBRU1Fy?=
 =?utf-8?B?QlEwVjVLQzlLN0ROeldLMUVheU5zdkx6TlJBNlQ2Q21YU3VuaVR5SXhRVG9S?=
 =?utf-8?B?MWFCLzJTNmo3N0kvZk5pWnJ3N3pDTjUxRWkxZlJ6UlFjcTlFdmVWMUxIT3Fv?=
 =?utf-8?B?aE9mNER4dFJMRnNFS2VDa21KMWQ2K3RDaGlGcVpyUDZOcjlWTkhwNXI4ZEdz?=
 =?utf-8?B?aDJIdFNvVFZMWGtQZy9aTUZ3RDJQcWc3c0g2UlM4bUNyUmpHbnNNR2I3NjZU?=
 =?utf-8?B?Rk1naEVPZTVmYVVpS0tyc1RDeWMyQlJvNWViVkZGeDd5bm9mcnBqa1FyZ2JX?=
 =?utf-8?B?NURuempLY0M2YVIwbnVjeWpZQzVWVUZtZ1kvZU84TVhCU2I5RXgzN0pqL2wz?=
 =?utf-8?B?R09qM29WeVl2NFZDZXBobHc3bUVHV2ZqeTRCMngrOURSMnMwWTRnN205UDI1?=
 =?utf-8?B?VHh5TkRjY0JVMTBZT1crRGxwTnpZVzd5Z1F4NzRSM3YwQ2s0S2lFbXZwUENS?=
 =?utf-8?B?VUMvRmdzY2FUTDkzZStGMDBhQkpMSm1FSTJiNXplYnM2ZEpaWjh4Z1FMenlH?=
 =?utf-8?B?cmY5cWE4cW0yS3F6NVBudE9tRFQvUEsxcmRIRVdRWVk3dDZSTHExbDFFUitQ?=
 =?utf-8?B?Y0xaODVqZm45Nk42RldDNC9UdXhUL29vL0xZNGJkMWFGQ3hPekhZeEFpVm8x?=
 =?utf-8?B?U0JGelYrTTVhM2U2eUJaZml5ZDdTMjEzVFNEckFybDliZDhVUUdiZ3Q5dWMz?=
 =?utf-8?B?NHBEcTAyYXpBWHlwMkdqandobmIrZytkTjBONVdTQzFaYjdZQ3NvU0xWQWNR?=
 =?utf-8?B?ZHZOOC95TWt0SjNyMzdxQmoyVE56Z0VnbDBoNWM1Yk1ZLzlHaWgraHlEMzNS?=
 =?utf-8?B?dXlpMWU2c3pkMFVpOEJwamZMekV3ZEc0T3RtYndSWWthNTR4V3JpQTM1Vy9H?=
 =?utf-8?B?NlF0eS83TlN3bXRuVWlHblQ0YnQ4YndVWDdHV2JNa0lDZ01JK3B4SWJRb09u?=
 =?utf-8?B?V1RkK1ZBMkx6TXRsNlhIMnM3K2pWdWZVdUJCaDYrS3JiRlhnbkMrVHJ2akIy?=
 =?utf-8?B?Y1hzcFJYSW1hOTk2VVcvYkpwRHBjdDFyNHgybHQwaXNsdmhWeTQxTWNFeXZp?=
 =?utf-8?B?bVFoNU1KRHQ5VGhWRnVneWlqRmIvRmdYNG1JbDhpN3BXeWJmNURUZkhQdm9x?=
 =?utf-8?B?dDBkU0hjbEdaRVBQRGgvNEw2T1lUOUh1UWd5dUtDMjFCR2dTTGxZeEJhUVF2?=
 =?utf-8?B?MVZDL3l5cndUZUNXSFZRL3NkOWJLSWNKTXBXSzJ2YUhvZU1YWS9oKysrblYz?=
 =?utf-8?B?akRXbFh5RE1aK2FUSTRyNldNTzZGT000RXpBSWNnb3pzaWRBb3JQWFpwYS93?=
 =?utf-8?B?N2t1VFlJQ1pyZ0RJMFJ3R1V2NnZUc3RWVS9MdFI1bGI0ZXBYdHFSczNBaDBj?=
 =?utf-8?B?cGcyUHhIRFpxUGRTYlBSditVcGlibjlDcUlRdFovdWQ5b0grakhvZHNRdnhz?=
 =?utf-8?B?T2hkTTNDZzdCeHcxYnp0Sm9kK2VzZG9iV2ZaU1ErbE1HR0RvZW1OUzYyL0NF?=
 =?utf-8?B?TWxhb3Y4TGRjOVgxU2NscDZybE51SzRlSHQ2cDJ1SXJ4ZWd5U1dpVTFjUEQ0?=
 =?utf-8?B?OUk5cy9GVUFIMjUxZXNxNXY2QWRHbEFBcWwvTGN3V2ZqYTYvUGJPbk1DeFd1?=
 =?utf-8?B?bnM5WkZ2c3ZhZkpMZzhkWGFVTzV4Q0NMZFoyaS9wc2UyckJ1bFpqYWZIZ01L?=
 =?utf-8?B?cDBaOVord2Iya1MvTXh4cmZ0Ulo3aUFkSkk3RldlNnZiMU5zV0pqbC9tQ0hm?=
 =?utf-8?B?d2ZROWFjeVR6UlgzSldZT1NURHJ0Q2xtTTRrOHRHbDBUTTBIRHFyUTc1ZnYr?=
 =?utf-8?B?QVVRc2dZN1J4R1FyYlVrQTBoLzFESjliVk05UUxFbzlOMUFnRVZQdlV2cmFy?=
 =?utf-8?B?Yk9PNTgyZXZhUzhZbFhGVm9kZkMvTkdYcWVQN05paUovV3FKK1Z5K0JYTjh4?=
 =?utf-8?B?S3JFR2NRSkFSbVVSUUoxcEMzWDRlcVZHZE5IYXh2aWdRWEFDNkVHck03Wm93?=
 =?utf-8?B?bVVsZ3RNSlYxU1JpSDdVeUxDU3VCVEJxbDdnTDZmdDg4WWY3SkZTUk8vemxR?=
 =?utf-8?B?TVN4R05Oekx5QWVlK0FUTURkeDZhR0V3WTlBZEhKZVFQQngzMGtGZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d41eeb-61c2-432f-c233-08dec6a76449
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 04:18:57.9535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/KIxsjvFUZjeHJgU9KsT+pGfyRsZpXTJvS5eabPolY7r8a2YXZnOIdoCQ7adFFmM4+vnrdbMmWY5TaZlOeNIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_211928_361533_ACA27BD5 
X-CRM114-Status: GOOD (  24.52  )
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

SGkgSmVyb21lLAoKVGhhbmtzIGZvciB5b3VyIHJldmlldwoKT24gNi8zLzIwMjYgMTA6MjkgUE0s
IEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4KPiBPbiBXZWQgMDMg
SnVuIDIwMjYgYXQgMjA6MTcsIEppYW4gSHUgdmlhIEI0IFJlbGF5IDxkZXZudWxsK2ppYW4uaHUu
YW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPj4gRnJvbTogSmlhbiBIdSA8amlhbi5o
dUBhbWxvZ2ljLmNvbT4KPj4KPj4gQWRkIHRoZSBBbHdheXMtb24gY2xvY2sgY29udHJvbGxlciBk
cml2ZXIgZm9yIHRoZSBBbWxvZ2ljIEE5IFNvQyBmYW1pbHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvY2xrL21l
c29uL0tjb25maWcgICAgfCAgMTMgKysKPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSAg
IHwgICAxICsKPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9hOS1hb2Nsay5jIHwgNDE5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICAzIGZpbGVzIGNoYW5nZWQs
IDQzMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9L
Y29uZmlnIGIvZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZwo+PiBpbmRleCBjZjhjZjNmOWU0ZWUu
LjYyNWU2Nzg4Yjk0MCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZwo+
PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnCj4+IEBAIC0xMzIsNiArMTMyLDE5IEBA
IGNvbmZpZyBDT01NT05fQ0xLX0ExX1BFUklQSEVSQUxTCj4+ICAgICAgICAgIGRldmljZSwgQTEg
U29DIEZhbWlseS4gU2F5IFkgaWYgeW91IHdhbnQgQTEgUGVyaXBoZXJhbHMgY2xvY2sKPj4gICAg
ICAgICAgY29udHJvbGxlciB0byB3b3JrLgo+Pgo+PiArY29uZmlnIENPTU1PTl9DTEtfQTlfQU8K
Pj4gKyAgICAgdHJpc3RhdGUgIkFtbG9naWMgQTkgU29DIEFPIGNsb2NrIGNvbnRyb2xsZXIgc3Vw
cG9ydCIKPj4gKyAgICAgZGVwZW5kcyBvbiBBUk02NAo+PiArICAgICBkZWZhdWx0IEFSQ0hfTUVT
T04gfHwgQ09NUElMRV9URVNUCj4+ICsgICAgIHNlbGVjdCBDT01NT05fQ0xLX01FU09OX1JFR01B
UAo+PiArICAgICBzZWxlY3QgQ09NTU9OX0NMS19NRVNPTl9DTEtDX1VUSUxTCj4+ICsgICAgIHNl
bGVjdCBDT01NT05fQ0xLX01FU09OX0RVQUxESVYKPj4gKyAgICAgaW1wbHkgQ09NTU9OX0NMS19T
Q01JCj4+ICsgICAgIGhlbHAKPj4gKyAgICAgICBTdXBwb3J0IGZvciB0aGUgQU8gY2xvY2sgY29u
dHJvbGxlciBvbiBBbWxvZ2ljIEEzMTFZMyBiYXNlZAo+PiArICAgICAgIGRldmljZSwgQUtBIEE5
Lgo+PiArICAgICAgIFNheSBZIGlmIHlvdSB3YW50IEE5IEFPIGNsb2NrIGNvbnRyb2xsZXIgdG8g
d29yay4KPj4gKwo+PiAgIGNvbmZpZyBDT01NT05fQ0xLX0MzX1BMTAo+PiAgICAgICAgdHJpc3Rh
dGUgIkFtbG9naWMgQzMgUExMIGNsb2NrIGNvbnRyb2xsZXIiCj4+ICAgICAgICBkZXBlbmRzIG9u
IEFSTTY0Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSBiL2RyaXZl
cnMvY2xrL21lc29uL01ha2VmaWxlCj4+IGluZGV4IGM2NzE5Njk0YTI0Mi4uZjg5ZDAyN2MyODJj
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZQo+PiArKysgYi9kcml2
ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZQo+PiBAQCAtMTksNiArMTksNyBAQCBvYmotJChDT05GSUdf
Q09NTU9OX0NMS19BWEcpICs9IGF4Zy5vIGF4Zy1hb2Nsay5vCj4+ICAgb2JqLSQoQ09ORklHX0NP
TU1PTl9DTEtfQVhHX0FVRElPKSArPSBheGctYXVkaW8ubwo+PiAgIG9iai0kKENPTkZJR19DT01N
T05fQ0xLX0ExX1BMTCkgKz0gYTEtcGxsLm8KPj4gICBvYmotJChDT05GSUdfQ09NTU9OX0NMS19B
MV9QRVJJUEhFUkFMUykgKz0gYTEtcGVyaXBoZXJhbHMubwo+PiArb2JqLSQoQ09ORklHX0NPTU1P
Tl9DTEtfQTlfQU8pICs9IGE5LWFvY2xrLm8KPj4gICBvYmotJChDT05GSUdfQ09NTU9OX0NMS19D
M19QTEwpICs9IGMzLXBsbC5vCj4+ICAgb2JqLSQoQ09ORklHX0NPTU1PTl9DTEtfQzNfUEVSSVBI
RVJBTFMpICs9IGMzLXBlcmlwaGVyYWxzLm8KPj4gICBvYmotJChDT05GSUdfQ09NTU9OX0NMS19H
WEJCKSArPSBneGJiLm8gZ3hiYi1hb2Nsay5vCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9t
ZXNvbi9hOS1hb2Nsay5jIGIvZHJpdmVycy9jbGsvbWVzb24vYTktYW9jbGsuYwo+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmI3YjNjYTIzMWE0Mgo+PiAtLS0g
L2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL2E5LWFvY2xrLmMKPj4gQEAgLTAs
MCArMSw0MTkgQEAKPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5
IE9SIE1JVCkKPj4gKy8qCj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjYgQW1sb2dpYywgSW5jLiBB
bGwgcmlnaHRzIHJlc2VydmVkCj4+ICsgKi8KPj4gKwo+PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2Nsb2NrL2FtbG9naWMsYTktYW9jbGtjLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvY2xrLXByb3Zp
ZGVyLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+ICsjaW5jbHVk
ZSAiY2xrLXJlZ21hcC5oIgo+PiArI2luY2x1ZGUgImNsay1kdWFsZGl2LmgiCj4+ICsjaW5jbHVk
ZSAibWVzb24tY2xrYy11dGlscy5oIgo+PiArCj4+ICsjZGVmaW5lIEFPX09TQ0lOX0NUUkwgICAg
ICAgICAgICAgICAgICAgICAgICAweDAwCj4+ICsjZGVmaW5lIEFPX1NZU19DTEswICAgICAgICAg
ICAgICAgICAgMHgwNAo+PiArI2RlZmluZSBBT19QV01fQ0xLX0FfQ1RSTCAgICAgICAgICAgIDB4
MWMKPj4gKyNkZWZpbmUgQU9fUFdNX0NMS19CX0NUUkwgICAgICAgICAgICAweDIwCj4+ICsjZGVm
aW5lIEFPX1BXTV9DTEtfQ19DVFJMICAgICAgICAgICAgMHgyNAo+PiArI2RlZmluZSBBT19QV01f
Q0xLX0RfQ1RSTCAgICAgICAgICAgIDB4MjgKPj4gKyNkZWZpbmUgQU9fUFdNX0NMS19FX0NUUkwg
ICAgICAgICAgICAweDJjCj4+ICsjZGVmaW5lIEFPX1BXTV9DTEtfRl9DVFJMICAgICAgICAgICAg
MHgzMAo+PiArI2RlZmluZSBBT19QV01fQ0xLX0dfQ1RSTCAgICAgICAgICAgIDB4MzQKPj4gKyNk
ZWZpbmUgQU9fQ0VDX0NUUkwwICAgICAgICAgICAgICAgICAweDM4Cj4+ICsjZGVmaW5lIEFPX0NF
Q19DVFJMMSAgICAgICAgICAgICAgICAgMHgzYwo+PiArI2RlZmluZSBBT19SVENfQllfT1NDSU5f
Q1RSTDAgICAgICAgICAgICAgICAgMHg1MAo+PiArI2RlZmluZSBBT19SVENfQllfT1NDSU5fQ1RS
TDEgICAgICAgICAgICAgICAgMHg1NAo+PiArCj4+ICsjZGVmaW5lIEE5X0NPTVBfU0VMKF9uYW1l
LCBfcmVnLCBfc2hpZnQsIF9tYXNrLCBfcGRhdGEpIFwKPj4gKyAgICAgTUVTT05fQ09NUF9TRUwo
YTlfYW9fLCBfbmFtZSwgX3JlZywgX3NoaWZ0LCBfbWFzaywgX3BkYXRhLCBOVUxMLCAwLCAwKQo+
PiArCj4+ICsjZGVmaW5lIEE5X0NPTVBfRElWKF9uYW1lLCBfcmVnLCBfc2hpZnQsIF93aWR0aCkg
XAo+PiArICAgICBNRVNPTl9DT01QX0RJVihhOV9hb18sIF9uYW1lLCBfcmVnLCBfc2hpZnQsIF93
aWR0aCwgMCwgQ0xLX1NFVF9SQVRFX1BBUkVOVCkKPj4gKwo+PiArI2RlZmluZSBBOV9DT01QX0dB
VEUoX25hbWUsIF9yZWcsIF9iaXQpIFwKPj4gKyAgICAgTUVTT05fQ09NUF9HQVRFKGE5X2FvXywg
X25hbWUsIF9yZWcsIF9iaXQsIENMS19TRVRfUkFURV9QQVJFTlQpCj4+ICsKPj4gK3N0YXRpYyBz
dHJ1Y3QgY2xrX3JlZ21hcCBhOV9hb194dGFsX2luID0gewo+PiArICAgICAuZGF0YSA9ICYoc3Ry
dWN0IGNsa19yZWdtYXBfZ2F0ZV9kYXRhKXsKPj4gKyAgICAgICAgICAgICAub2Zmc2V0ID0gQU9f
T1NDSU5fQ1RSTCwKPj4gKyAgICAgICAgICAgICAuYml0X2lkeCA9IDMsCj4+ICsgICAgIH0sCj4+
ICsgICAgIC8qCj4+ICsgICAgICAqIEl0IG1heSBiZSBhb19zeXMncyBwYXJlbnQgY2xvY2ssIGl0
cyBjaGlsZCBjbG9ja3MgbWFyawo+PiArICAgICAgKiBDTEtfSVNfQ1JJVElDQUwsIFNvIG1hcmsg
Q0xLX0lTX0NSSVRJQ0FMIGZvciBpdC4KPj4gKyAgICAgICovCj4gSSBkb24ndCByZWFsbHkgZ2V0
IHdoYXQgeW91IG1lYW4gLi4uIENvdWxkIHlvdSByZXBocmFzZSA/CgoKVGhlIEFPIHN5cyBnYXRl
IGNsb2NrIGNoYWluIG1heSBiZToKCmFvX3h0YWxfaW4tPmFvX3h0YWwtPmFvX3N5cy0+IEFPIHN5
cyBnYXRlIGNsb2NrcwoKImFvX3h0YWxfaW4iIGlzIHBhcnQgb2YgdGhlIHBhcmVudCBjaGFpbiBv
ZiB0aGUgQU8gc3lzIGdhdGUgY2xvY2tzLgoKU29tZSBvZiBpdHMgZG93bnN0cmVhbSBjbG9ja3Mg
YXJlIG1hcmtlZCB3aXRoIENMS19JU19DUklUSUNBTC4gVG8gZW5zdXJlCnRob3NlIGNsb2NrcyBy
ZW1haW4gZnVuY3Rpb25hbCwgYW9feHRhbF9pbiBtdXN0IG5vdCBiZSBkaXNhYmxlZCBhbmQgaXMK
dGhlcmVmb3JlIG1hcmtlZCBhcyBDTEtfSVNfQ1JJVElDQUwgYXMgd2VsbC4KCgpJIHdpbGwgcmVw
aHJhc2UgaXQgbGlrZSB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb246CgogwqAgwqAgwqAgwqAgLyoK
IMKgIMKgIMKgIMKgIMKgKiBhb19zeXMgY2FuIHNlbGVjdCBkaWZmZXJlbnQgY2xvY2sgc291cmNl
cy4gT25lIHBvc3NpYmxlIApjbG9jayBwYXRoIGlzOgogwqAgwqAgwqAgwqAgwqAqwqAgwqAgwqAg
YW9feHRhbF9pbi0+YW9feHRhbC0+YW9fc3lzLT4gYW8gc3lzIGdhdGUgY2xvY2tzCiDCoCDCoCDC
oCDCoCDCoCoKIMKgIMKgIMKgIMKgIMKgKiBhb194dGFsX2luIGlzIGluIHRoZSBwYXJlbnQgY2hh
aW4gb2YgQU8gc3lzIGdhdGUgY2xvY2tzLgogwqAgwqAgwqAgwqAgwqAqIFNpbmNlIHNvbWUgZG93
bnN0cmVhbSBjbG9ja3MgYXJlIG1hcmtlZCBDTEtfSVNfQ1JJVElDQUwsCiDCoCDCoCDCoCDCoCDC
oCogYW9feHRhbF9pbiBtdXN0IHJlbWFpbiBlbmFibGVkIGFuZCBpcyB0aGVyZWZvcmUgbWFya2Vk
CiDCoCDCoCDCoCDCoCDCoCogQ0xLX0lTX0NSSVRJQ0FMIGFzIHdlbGwuCiDCoCDCoCDCoCDCoCDC
oCovCgo+PiArICAgICAuaHcuaW5pdCA9IENMS19IV19JTklUX0ZXX05BTUUoImFvX3h0YWxfaW4i
LCAieHRhbCIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY2xrX3Jl
Z21hcF9nYXRlX29wcywgQ0xLX0lTX0NSSVRJQ0FMKSwKPiBJJ20gaG9uZXN0bHkgbm90IHN1cmUg
YWJvdXQgdGhpcy4gSXQgaXMgY29ycmVjdCwgc3VyZSBhbmQgdGhlIG1hY3JvIGV4aXN0IHRvIGJl
Cj4gdXNlZCBidXQgLi4uIEl0IGRvZXMgbm90IHJlYWxseSBoZWxwIHJlYWRhYmlsaXR5IGhlcmUs
IGRvZXMgaXQgPwo+Cj4gKEkga25vdyB0aGF0IHdhcyBhIGZlZWRiYWNrIHlvdSd2ZSBnb3Qgb24g
djEpCj4KPiBPdGhlciB0aGFuIHRoYXQsIHRoaXMgbG9va3MgZ29vZCB0byBtZS4KPgpPaywgSSB3
aWxsIHVzZSB0aGUgb3JpZ2luYWwgY2xrX2luaXRfZGF0YSBmb3IgdGhpcyBvbmUuCgoKWyAuLi4g
XQoKPiAtLQo+IEplcm9tZQoKLS0KCkppYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
