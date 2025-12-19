Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567AFD711CC
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Dec 2025 01:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AwteN4JmOQYqLEJ9MTioANvDRTImaHinFOHal5WZhw=; b=xf4T8lA46H3ghsC65ujf+x30ml
	9sxmM2qhGmXnNLhBAaqOwshhJvc474fxU+tcbw8TX4NilGFTSzoakHpc8fL5XKlaJIgRgHROke/gT
	3hstMpJGPHwTVv8pcyv9x+Kf416LJNi4r3zdI3C2DTEQy0leK/ouzx7GQfuEptBlQGRgrw5ceGv6K
	pgjZlnisHYZPaBY6UekoiDxsVPF614QTXO4665gEzPXpav+Q3lRg1YAliXpkGuzZlhTqZ9edirzOC
	dINiAyLf7rhsTSxBGHUKAZkBV1bQDLaHLQb3oBlOYFYLhNuKEzTAc2eaZvCghVJUkl1UYe9JHGl2i
	eDeo4ICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPm1-00000009Skj-3mzD;
	Fri, 19 Dec 2025 01:59:17 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPlz-00000009SkL-0LSv
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Dec 2025 01:59:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGfctZRk8GWiWxiV9Jmk/eGxFog5pk4KUq/CaSnUb5S3hRnFDKVwVg197nIzzQMauapaBGKay6jNSon1n3lV+nzcTV+aWMUKN4LmBDVXvPznKKpIsgDQgBL4agqtYrAilI2IIRjn+mPwjbKQGoJGIgQ5iDvJslKNMD3AAw9uQ/n/JmH3mnfabiyERu0odftucsI/ahOcw3yqdH8AJ7FnLyagLF0Gplrs7/wSATpwBFwQWF8CIkSQLB87+v3yFuWxTbNopj6sIN+6gHKlhwjBJUoEXkSVLZd+33Okyo+caR2xVIxOjNlFhfFrAwa8CwpV2fRaZVc4QcRCuz1fsmX0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFO16gC/JprhYDnjpX9RvnQCxAIfhmIyz9B44ulYMOg=;
 b=mBrkBQ7umtK0NfM2Vdjxwmjwf9/Gm58s1xKJY/S/oUT6LZMu+IIiKvlaKtXVH6gGRxEaS5HIlpYSZjtSuHJMHiLW5ZhzwP6wy9rJ7p3mtZR3xUhcKTJbqtTLTqjaQbu+zPZLp3moZcv7/a7J+EiMNalHIiowWi4M504PDA/k8Qt+Cj84Vk6HKxRplc0YWNMXeZMJxdNSiCjMhV4Dn3pcx/vY5CCzZx3VTO9CMaWvgmettKMKrHBH+ouS94UaN8x85UCL3B3wgDshLfOGtfDFEsv2IztxNkDb4CE1WIy5B9PRXGnA4b0ZmEQJuSzFpMdvJY6+rEa3KADEs9wNpLvk7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFO16gC/JprhYDnjpX9RvnQCxAIfhmIyz9B44ulYMOg=;
 b=u92kvQpCCTX6ak3NnZ5QQTnfe9o1mMc0f1NHkd0YguZYIYY+jn3zJVXTgo/PgHcPk1nBva8L62CQQt634zDjhDCncq8q3aAOI2Zli1OJFWUjut//JNpVVPxg7nkl6B54tkUnAmtRrvriai/x3fXlMKi8KUIbK5kOxirv1WB5nKGeCfylgdG9O5m2fGeCMZoU/tp/h9Xk7BRafonKOLO3VcbAAZWICHsugjqu3uSuaACNfW8b6c8UCdb9V4ykYT///jDPFnUkmop8NG2JU/GoSXWfuhElzZvAcvq5nhMfgBRkjP1naGqt4XHuXqZps6K8ZFOxjcBNjiXZ1XMbF5mCig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by TY0PR03MB6449.apcprd03.prod.outlook.com (2603:1096:400:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 01:59:06 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::5fc1:b7a:831:340f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::5fc1:b7a:831:340f%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 01:59:05 +0000
Message-ID: <44150c9e-9a0d-411f-8532-ab03a632bfbf@amlogic.com>
Date: Fri, 19 Dec 2025 09:58:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: dma: Add Amlogic general DMA
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251216-amlogic-dma-v1-0-e289e57e96a7@amlogic.com>
 <20251216-amlogic-dma-v1-1-e289e57e96a7@amlogic.com>
 <83c771e7-f32b-48e4-91ab-d7c3b9746e14@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <83c771e7-f32b-48e4-91ab-d7c3b9746e14@kernel.org>
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To PUZPR03MB6888.apcprd03.prod.outlook.com
 (2603:1096:301:100::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|TY0PR03MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: a792f5a8-0abd-44b6-4331-08de3ea23059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFh3MFYySHFsOTZ1OHRteEt0c1o5NFVhOTRoQ1BDNlVHT2NQeDRqV2VwMTNB?=
 =?utf-8?B?Uit5a0Zlb05abXBNRTgyTEExMTBaT3BRYUZPblQ2NXZnUkllWXZrRS91Qy8r?=
 =?utf-8?B?OXVKamVnSlpPUm1GbXdCMHZVdmVGeSthUXFnQ0J2OE9uQUlwZDE3U011eXc4?=
 =?utf-8?B?aU9IU1A0SjNSbUcyZkF1VjFCS2FVUEdzNmdOWjBYZWFxeWYxNXdqZ2ZuSThB?=
 =?utf-8?B?dHVuSW5DSmZTY0lvbkltV0N3Um1aKzB1M0I5dlhPZXZXLzNzQ2ZmTTFveXA5?=
 =?utf-8?B?N004NnVtSGVhZDYvZXdoK0tPa3N1bUdoNC8zenhNbjVKK2d6V3h5Ri9yMlpt?=
 =?utf-8?B?YnZCUG9CWWNva1pNWFNGNkxhanh3ZSs3cHYvS2VLL1pZU0ZEQlc2a1ZpN3lw?=
 =?utf-8?B?bGRUbE42WmN3c01vQnM4cEVBd3hrUFp1SGlxaGRsSDdSdHE3WU9qUGZDaW1v?=
 =?utf-8?B?UWNOajZ5T0xwU2VVQW5QbVpQWHNLOW9EbnZtMGxFZVpPVFJId1hUQWRtRDFX?=
 =?utf-8?B?TDU3cFVYTU9zc1ZGMlBEMHN6U21LTE1reERHelBwTmdpUHBLYkV6bDU4ZSta?=
 =?utf-8?B?WjVZRkt4QzZlYWJwbTFlMEcvU0UybjBKY282SlUxYS9hcG9lS2JocldNYnAy?=
 =?utf-8?B?aHNaaVI3WTBTLzg2Q2pLcWplbDVtTjh2Ti9ZcVNldmFmOEpLdXQ3eU5nL2RM?=
 =?utf-8?B?ck4wZzluN0g2VkFCMUJ0cXkrUUk0Zk0wTUVJb0xiMno1b3RhV2UzK1lxTlMr?=
 =?utf-8?B?T2VTYXdGeGNidVhsOVY3VkYvNXVweWF0VktwZ0pURENrTzk5cklXVmUzTjBC?=
 =?utf-8?B?RXRsN1YwbGtTQW1FSkJqOGJhcmptSitRWk4wMzQwQ2p3dGY0OWxRSUJ6LzBH?=
 =?utf-8?B?R1g0QmtwTFdWSEtHOXdHNzNwSjlYaEdsTWZIV0JsWDUvOVZNOG1JNHk2bFpl?=
 =?utf-8?B?Q1ZoQTVqVytzU0xGL0kvdnd6K3J6N0RES3huckVHbkNMK1NrRnFoUkpuVHhi?=
 =?utf-8?B?Y3F3amxDeEtGeUVlZHI3bGhnZCtDME14eC9kUGs5V3N5SzlwbmFhb3dNT3BV?=
 =?utf-8?B?SEpnRzYvejFiSzM1a2IrYnlBa3VYV3ZwT2loVGxxSlpGZityQnlna2g0QWNO?=
 =?utf-8?B?dmgzTCs1SzJtR3dDdVRJWjFVbS9Felg1SzdJWTV1KzZlWHB3RllBOHp1Mmtm?=
 =?utf-8?B?S2hZT1M2YmUyTlFZdFlFVkpJNG5FT0ZYNDd2YVk3a05VMDZzZHpjTGRBbUgx?=
 =?utf-8?B?ckVaR0IybGFuYmNYYWU0TGdaWER0Y2VuSENFMVJhVWptYWF4YVkrQUlTeDF0?=
 =?utf-8?B?c2h1NVIyMU45aVM4elR2S0pTRFFkcE5Fam00cytLZjBjOGJTWnpmWW14TDdY?=
 =?utf-8?B?SmFXbU51aFpnRjcyL0FmaHdzUkhpKytVdFhtQ2gwWnJwTFYvZllJZTRDME80?=
 =?utf-8?B?bW9FMWVEeVRzV1NLL1ZsM0VaSm15a1Fvc2VsZGJYYWh2TnZES29qd2Q5SS9P?=
 =?utf-8?B?QTJKU2xHeEVvTnJiMEJUbWdrK2NxYnRCV1Z0eDdiK3BMdW1vVE5qV1A3QW9R?=
 =?utf-8?B?MjdLRlFyVC9zcFdGQi9IOFNMcnR1empwczVDUUwxbGJsYkJSZDU3K3FqSExr?=
 =?utf-8?B?SXdnZDVXSkEwQllDYmcrQVJMb3FwUWs0NHlJWWtISGJKemR2MEFrU25hUUFX?=
 =?utf-8?B?dnd0UnM2WG96RFl5WkZDWFBBT0FYY0k5MnhhOG50Y0RvNVhpeG9nTFpZNVVx?=
 =?utf-8?B?UXZaY05zTDBzRGhhVklHRjdXdkZTcGtQdlM4WG9yYjBvMG5QWHJHODN1ZWh4?=
 =?utf-8?B?UFNWcU9sUFBMR0puQVRPQkpCelVTeERqUk9PWU5WRzYzYmxHTmhSOWQ0RW1k?=
 =?utf-8?B?WldySGtLM0EzNThWQXJFUUNmNSt3VmF1QUZMTWlsQkorR0duVnpsS1h2SDlX?=
 =?utf-8?Q?DrNPISxYs5Il81ucqLcNP1A6ondxW5TB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U01mbWpuNFBaSEorc0kyZFkvWjZEN0ZTVFZ5bEtUNlh1bEFWN1N1czNyQnQx?=
 =?utf-8?B?VjNWZm1aK1ZLVlQyUlhFUXJJQ0pscVdMYm02SW9xdHdURzJHemhac2hkS0ZD?=
 =?utf-8?B?WmJFY3lQYjlsQ0dxS1pVbnZNR3VRQ3pUNUxzYzk2UkkrOUQvRWlRLzFKMmUz?=
 =?utf-8?B?d0VMYjlIcmhZenZJTlFLQ3pXSFUrWmVWQ0h4cjlCQmZ3cUJCR3FXUVcvbzhG?=
 =?utf-8?B?ODVuRUY5WHdWUk11UkUzbGdEL05OdGNaTDI1OFE5S3c2OWhrSmNoc3AvK1B2?=
 =?utf-8?B?R1FlSXVZbGd1cDljdXprbkd6MU9CYWlrbzFDN3ZJY2NaNExFR1EvVGUwbzVl?=
 =?utf-8?B?NkhvM01VbE15T1Y1cVZ1TGZ4NU9SdDFGT3JiVWNBOHAySGVhRVZOcHJSQzBr?=
 =?utf-8?B?bzA3aUNCK295WlI5SnNHMjRsejdieWlWdUdvYXVzWGpkMmpuRGIrNlhpL0tE?=
 =?utf-8?B?cFllYnNoMzZGZU8rR3JvSW5Lc3dIcmJ2WCtMakhrRVBUVEMweWk2WTF3NGwy?=
 =?utf-8?B?d3p0cGQ2cEF4VG9ZWUkxQUswSnBqSzMyOEsvazVUbnBpVkNFOVduQ0YxOGpt?=
 =?utf-8?B?UmIxa1ZOM09NQ1ZIQ1hVVU0vNmpCMmhTc252NWg4c2FSNGFKQlhwMVkyLysx?=
 =?utf-8?B?clRTQ2xRSHVUSGVDbVoyVEVGbDdsM29jeVQvS010cE1xdUpWYjQxNzRpQ2Y3?=
 =?utf-8?B?c253clo4MmdNWExUK2tWSVhXNDlPTHpaL0tsYW9yY0pVSFg5eTROclJlOXUv?=
 =?utf-8?B?RDN0ZHBjS2s3TXd3RklYTFdYYXkvcUF2NHZWVmJzYXRJUVJYQlRIaUtRQlNC?=
 =?utf-8?B?Yk1QZUZYWmtlVXBBUEcxa0hTOCtpRU5menFXUEJJR1JRZGswWGJlVEVJbUZF?=
 =?utf-8?B?MFFsZ2I0VDdTcDJWUHdUVldPekpldmdxbS9SV1lVQUZHODk5UE5oUFdRWTNi?=
 =?utf-8?B?NnZ6MENEYzZiNDdHZDF6NWsxZzBueG9sLzhlRXJhV3I0UkhQUDI3clRYRmlx?=
 =?utf-8?B?aU80RStXL1ZWdmJ4OXJma0drTVYvaTh6WVlKOUptTWUvcVY4VWx1K2IrV3dK?=
 =?utf-8?B?ZERxWFIxUmtaNEtyaGRKQVpvZURaZ3htSEpZNjg0UG5CZ25nM2dVZWl1ZnB4?=
 =?utf-8?B?bDh3Q3hzaExNUVY0OFZZeG9uamVzcEUvV3hzd01BTDlTYzdSNkkvcUVRNFdN?=
 =?utf-8?B?LzRiUDVHd3lyL0VxcjFmeklwYy9nWG5sRWlEZ2ZzTGg0c1NTUDc4TVg5SGVQ?=
 =?utf-8?B?TlRtYkJEVGt4UUlmNVNlRDZzUlVoNE02SjNxR29keWZyMG0vZDNNZlNZbWV5?=
 =?utf-8?B?ZlYwRVczRE8wQjBsUUJzeCtUTEp3eE9RbW9OcTRwUnR3cVIwSmhtQWlwOUd0?=
 =?utf-8?B?YS8ybWQxaHhoY0tWUm9rRXlSdFYxU3VRU09HK1dKbFlLdkpseDRHQXhzcWla?=
 =?utf-8?B?K3l6UVZVTWZhQm55ZHJxd1Q2ckltWndaVk1qVUZUTnpXSjU3eXJiSEhmTlZU?=
 =?utf-8?B?SWVmTFVKaWxmRXN3YzFJQ3h2Q0phZG1JQU5CUjhjSXgxdUlkeXNHdGpjeEV0?=
 =?utf-8?B?KzdTZDg0L3dXak1YTitWem9FQm52SC9mZGh4eGdNZUIycVJZSzN6Yjc4ZnVC?=
 =?utf-8?B?dWx1RDVvRUVoMWlHbTNJVjNscGtqOTd5MUhCdlhiVS9hZ0ZRemh1TVhjcktL?=
 =?utf-8?B?eWFtell5NFg1cWJra0EzeGE1QnZzTUFYZ1RmMk5QVkxqUTcrM0lCcm9xdkI3?=
 =?utf-8?B?ZzF3dGZVN3RqQVZYbjkzbDBpcUZYVGJkYmJNQStJOThXRjBzTTh5VG9JWDJ5?=
 =?utf-8?B?dC9XOEt2blc4bDdFY0tiUnNQS3FVcmFZVVZUVWxobHBlQnNiUzRHSHNGYm85?=
 =?utf-8?B?YWdyYUlrVituWnYxNFk2VHJ5dm9HeFBYNmR6dGEwSks5eG1hd2pJS1BLTkNu?=
 =?utf-8?B?WTJCSkdSM00rUklpd2MzcmNVVUFGRW1mdnJET2lRcHVQd2t5djg1Q25qM2dP?=
 =?utf-8?B?eE1ibVp4QVplL2dSQzUvbVFmQ2pLQm15dk5IV3hXMldOQlRUaWFveGV3c0Jl?=
 =?utf-8?B?ZER4TG9HNGxVSFk4REpYUS9vMU1nU3VpOVc3dkJrZ1ZTampiYU03M1k2bXhI?=
 =?utf-8?B?alBMSG5oYWh3d0pBVno0dklUOTdLOVIwTDBSNndOc3NVRHNaekRLUlNXcngv?=
 =?utf-8?B?bmdKSlZvaWpGK21EY2tKdGZkRjFVN2g3MFE5RXJieG1xaERhSWZwWnNlUFdr?=
 =?utf-8?B?QWczN3V1U2FxK0dTNDFDRytxb0tCeU11cHQ5M0JPcHQ2RFVITFhhR3BkT2d6?=
 =?utf-8?B?Q2g1TmhLeFZQVDhDWjFDVDJqUDV3MWphU2FoN091blN5V092Ykdjdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a792f5a8-0abd-44b6-4331-08de3ea23059
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 01:59:05.4712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGWmdRTA1nlnXJPOU56p8hkooBZr1mxWm+4km/fyQdEb83562wMCgI2QeLW1t5a6n47lRHVOSra6UhlNzhcpq0mQLx2dfHA77aRUch9e09U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_175915_137382_9066F6E7 
X-CRM114-Status: UNSURE (   7.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,
    Thanks for your reply.

On 2025/12/16 16:45, Krzysztof Kozlowski wrote:
> I don't know what you mean by "general" but it feels like wildcard, not
> SoC, so that would be a no-go. Read writing bindings or several talks
> about this.

I will named it using the name of SoC in V2.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
