Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB062C5CFDB
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Aug 2026 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PYp+wObr6MCKD3nK72TWiDgjaEev9eeSGfOGXc5dKk=; b=QtkgDvSRIcnS+jeUDyoXq0FKyC
	+ZIuEPWzJ1QpC3QH9l9x/SYUzBVFllZ7AyY/pvokBkdd/W/KgiRq9b2ok56rUSUalY2Kq4wzgIucH
	U0zsUZzxRbxhSmgoRwAzpfVOGkJwU6R3cXRqf0uTajZzI9pYYOJfzyt9+7UW2Y7pbIRZwikQX+ixi
	v4Dp6nNaRFap0gdaVnChrVfotz3FPO81WwWXZDbXDI4eiSmhSAgCH7D/ZeDPRNhNeqsAr/3zSwNq1
	ehntx0Cv+nHql5QHdw4iqYJJzNPz662A/OheSwoyZYZ40dHFI2RevtysT1FVNEVq3PnN67jIL2R5g
	U8y8EtLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRuh-00000000LCt-3X9y;
	Thu, 13 Aug 2026 09:39:51 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRue-00000000LB7-414v;
	Thu, 13 Aug 2026 09:39:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fc2rCbIjvu1RBTlAUPcNsO/z8BMuxGt55h7QwUxkfqQv7PdArkdY7IZZpf7c66UyLnkpcs7gZsBiPaDm9edB/hq0V9L+UKxotjo4gv7Hzcn8NLNr0A/VKYsiqxaRJyIzPyAyCX2B8iQe3utTmkZLirj0gwpkIVhwk5JJWblAMDzrl7s9X2S5TKJMqpj7oVOVFeMR3nBQtn7pw0Cnzz+E0LJSchWDc1eWLfO4G4UsebhtMnbOyTzDF7KpWlCBLmR99ZyvHetDsftOQAT6XHeBmKQ5xZtOnIDIa29Lg1hvYN3VUxloU1lSyj+JfyV8CMsro7EMLtRHkdoNIT9qQjeetQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/LQCbvOoVAWp9Q0pfWjKn07UIzYqfWb2erj+/83zyg=;
 b=xIPHmtthXFTAHv8wR39qPuok1guGUpN7CbPv3eNzEEO+Ly3UqcwyZk31ZorBpTIotD7aSqbg72W15B7y9Usl4OH6/NndTOVpXkqTR/AO8NH2PNhsPRXPUSF9KL5O17yQwGdHaYRmqzcbfGwrMbETLGitT+xHQH0JwTb2LYKBH6mTShgiye27FNPwL7gT6RJe2Dd3PJk4ofo+pMW/rnMHGVLm0GFi+LOMAEq19Zl4xOPdOEqOsR5jHkf6NkxZfMWjr4PlekhOuA86rTdyAFAI5Gwa77lKvDDansYT+xonmjlFmKeV7yjk9gMMTjbFvD5aAjug+I0ai030uh++Wc01cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/LQCbvOoVAWp9Q0pfWjKn07UIzYqfWb2erj+/83zyg=;
 b=s9zimO/VNPIzm67dRlSmHVeI/aILexxyK0bOHedGLKixOVDW8ZF0m+PpvrTOXMRfVYfRhChV3ksq590mGw9AwBuN0n8hyVN90VLzui7OkkTe0J7S0YWHuTJl2+I5S2Gqpl1S3KskJhMHnS8lwKCWKtcVpTu+38ARsTjsfymNaUCjqHbjq5FfkhTXLC24w14J0Tk79AEssgz3G5KueKOezGx2HfX1uUeYb2YNGq+NAS2/Dvj11nALUDL43x+Usa8yTy7RDaxU/dnzaPsBfeWms6OQt1L5ZIj76Oe7ITexzLvU+N4oQcB2IGSzO+kArAey9YcQibUBtNS3PGJJ5bJVdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEZPR03MB7702.apcprd03.prod.outlook.com (2603:1096:101:10d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 09:39:28 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 09:39:28 +0000
Message-ID: <3e00b38c-70d2-452d-a71f-7e82d85fb610@amlogic.com>
Date: Thu, 13 Aug 2026 17:39:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-3-3fae085861bd@amlogic.com>
 <20260813-rustling-sassy-terrier-11b99d@quoll>
 <80e58bd7-7eb7-4d05-b309-115643767a43@amlogic.com>
 <cb21a4d5-9a8e-4530-90bf-d48e13f79b4b@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <cb21a4d5-9a8e-4530-90bf-d48e13f79b4b@kernel.org>
X-ClientProxiedBy: SE2P216CA0084.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::8) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEZPR03MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: bd930ed1-a58a-4379-65f3-08def91ec4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|56012099006|3023799007|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 8MxGJo8rKeYJDXxLLm6KywEpE0pPoDsIT8D435M4tmPiV3OoP9bouRIL/54/qEdjqD249SKyr3g1D/IbPVS+Y5pNHKPP3GO+gZ9qhhxk4d9/ePEAGJIGf9ooF/mna/Kh710eqZbOn6LY4cdCh+DsoHKrud+7lYnhQbcyOPdsWExt2kqEwBsaIduwicQzjoGLIrFXXYlvUkQaHZ1njxdQ70mfPYpKPLjtIu47xI7sgw+Q6sCNPfTVfIFvsPveEQVh5fD5eHV2K5hZGWO0vIih9961HhUlhlpNB7wBo1hZ6OzNzqTNWmPQ0H4k2N+HH5OpDZabWAlmiv1DNb4pL8fxzXYUSmA+cGMFXKV3ATgOj5J03ZIX+bPS2QY0L5WkRK7n2sBW2+itXbWxx8wkFxXVkoiitBdkxVa1m/qD+lkaVWvKYcxJPReNr0n8RFqgCVPcAW+VthsB8hCFl/alVPceyZ/DrTHtS75KLq94ELY24UcCc15v2/5SV2g6XldIsYQyuHD2xSU0TNZ2msQswY0m2zHYm8T34Q+8+Bz3Bn+DMZA+LkZzDZjK/xp8xoP+Vll56N17BFYlBUs/uXQuYeuntFj6PmEit6+60lqFnnYN+J8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(56012099006)(3023799007)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnpydHZ4NzdyUmcycVJ0Z0piYVY5eDJRbkZadFdDZXBKQWpqVWFwZlc1MzRr?=
 =?utf-8?B?aUlNU0dUM2YwU0NLSmNNMlNSMWVvNmR4enhWaEYrLytDWjhjYStMeEo2aFZG?=
 =?utf-8?B?MzYvdENXeTZ6UmRzcEtGSGhhWnJVQWFjblE3Q1RHbi9NYk9OSFk0N0FISGFu?=
 =?utf-8?B?RzJOYkVadkZHTFI3MGNsaStkL0tNNERBVTdic0crbVF6ZzU1TkhvUERoNlk2?=
 =?utf-8?B?bmo2VHNFYlVucXVHdDJtQmJiT0Q5V2FXSnlHZnZ2aCtqc3RSMXlCSXlLbTRu?=
 =?utf-8?B?Mk45MTJXUWRSUks4MHJhdFZqcGdvTUdNUHA0bHFwUUNlZkZGK1VQaFZrNWNl?=
 =?utf-8?B?ci9nMXdtems3VnRoRUpzQnpjL0J4STF4Z0N4UHJuQWdvRzhjQlV3WSt2WUJC?=
 =?utf-8?B?SmlKQU5GcjdvdmNmbnVsTU1vOWFXeDZDYWtOYVVTRlhKTENpSVhLSFR2YTBv?=
 =?utf-8?B?Ry90VFkwMzRGakN6bkZtT1FPTElySERVaU5YUDIvczMraE51YW4zTWVPajhR?=
 =?utf-8?B?YU5aWjhjM3J2bFlaMmRIVEZkRitaMlg3M0E3NG1icjg5MDVzM3FyakZxUGx5?=
 =?utf-8?B?RlRQZVVSYWNlNTVIQ3ZFb1ZQWjhDYTB6U0JZV3JJK01XR0lGVndxNng2M1JF?=
 =?utf-8?B?cElXTWR2N0xtM1BwSGdRanZLaVRLUHlXb1JHdlhZWVk5Vy9lWTV0MjhNcmNu?=
 =?utf-8?B?VjFyWjVVYTg0NUtHNjFYd0dyZ2J2NmFqL3RJZ21yUjlmOER4N2J3NEttalc0?=
 =?utf-8?B?Q2dDc0pxa0l0M01NUVVEaVFnak0yakxhSytDajNsYXh6QVJPYkFEeTVaTllC?=
 =?utf-8?B?TDY4VVdZZUhoWU9oNnFreC9VQVk5eER5MjJCQ25DcVUwZEVyWGhWKytldXJz?=
 =?utf-8?B?MWJaMnVTd0IzRTA4NEI2bURRVThsWmdhUFVhMmJBR05TYzgyU2lDS2F6RjVH?=
 =?utf-8?B?VjQ3WG5rWlBRdG80L3dYblozeEd4OWR3MDZiRjIremNvdXR1eEExaTFzZ3pH?=
 =?utf-8?B?bnh2THo1NTFRRW1pNWZTdS9ONnFWN3BLam5NOUNucHRHVHFweDMxb25sYkZV?=
 =?utf-8?B?ektzZ3I4RmxLYnR1Vyt4OHIyVkk4N1cyYjBUNFJoMU9TRlRjNGJZM3FjaXlF?=
 =?utf-8?B?bElUejZxZWdES2VZLyt0Lys4K0dFVXZrNE1pK0RtWHNmdjFCSnJ4MHFSTTZO?=
 =?utf-8?B?OWNvNUwxNVNBWVc3N094OW0ydnlkaEk0cXFzbUpSUFhPM2ljMThaamtSdFk4?=
 =?utf-8?B?enhzemdTM2cxeUl6RXRYcU9wbVd4R2FWN3NHdFJ5MG5KOUFpQzd4UkpjQkdZ?=
 =?utf-8?B?YjlEdWV5Q0lDNmhlMHR0VTBxSEp1Z3lQRlljNUkra1o5K0FmK2p2RHlKVE9X?=
 =?utf-8?B?MXR2a1VnRkR3NW5tNVBZWHFSNEJLNlBSMzZERkhDM0Vjby9URGRJRjhzY2Vy?=
 =?utf-8?B?aHl4Y3FpdER6MGhGNUM4S3cwSWRlMkgzMWdvRjM3Tk9mY0UwNFA1MUZYU1lH?=
 =?utf-8?B?SW1LVG4zbjNVK3REOXlUSzBDVERIeGpleHkrVEI2QmFEYThuTWI4N2R1bXVh?=
 =?utf-8?B?UzRlQkxqek45bU9nbmJibDR4WTIxSlZsam1HK0xxOEhva05lcTF1bUR4NUpQ?=
 =?utf-8?B?Mkh2dzZJMmptMFNEU3Q5WGdPeW1odlBnZTlDSlBHTnlzcGdkWGFQVVJSeFRY?=
 =?utf-8?B?NWdBSDBwaU5jdUlQNkN1emUyVzUzcHNPU2NoTUhQY1dvbWlJa0xWRjhVSGtH?=
 =?utf-8?B?WGQzQWdNb1BEazNpb09nUW1nREU0VHo3Z3EvTkRjS1VsdFNVRndQalJBOFRJ?=
 =?utf-8?B?SjNGV2cvdWhSYjNmVUNETnNzN3dWdGQ0YzI4bDRvdlYxK0F6ZitUQ0NuQTZm?=
 =?utf-8?B?QzR3V0hkdFFFNFJab2x1V0pZdTRqL0lqK0luSlR5V2FXNncwelI3SWVsT0tK?=
 =?utf-8?B?SnRtbi9KcC9jNkt5Y3JaeE9RL2dxZWp3MHYvVVdWMXVKMmErbnUyZGRKL3NG?=
 =?utf-8?B?aVgwSHY0QnNSYnkwNFEwaVdJZDBaWjNyYnZ1OGt0dmh2UDVpbDBWa0JWOHcr?=
 =?utf-8?B?bXFGMThyUkt4UXBhNlI3ajhHdnE5S0hoVlhHdGtCK09LMWwxaURrbXd4eHJX?=
 =?utf-8?B?MzVGYU80WHcvblRhS3d2ZFh2TE1vR3ZPdDZ4ZmZScnN4NisvVU5acHBEWHlE?=
 =?utf-8?B?M0pQajVaQ2h0N25mbmhFUkJWS0RWTFNqaDd4alBldTNKcHFCSVQ5OFZLQXpE?=
 =?utf-8?B?dFI1ZmxBUE14ZEJ3UTN3U1A0TXoxNm55QmIxMWQ1aGs2UnBMTHA5ckVqWkJI?=
 =?utf-8?B?dTBUYk5yY3dKM20xYURGd1NBaE1zZmhhYllEVzcyNi83U0VaQ3JTZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd930ed1-a58a-4379-65f3-08def91ec4d5
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 09:39:28.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10QPQXtx25XSdnOdYYUodYFLS/bcPdoEvSy33HTEOT+iL2BI5mimVhF4Gh5GkICInBMDLBQS0XGPNXJMjEZ7GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_023948_999895_F26B1A6C 
X-CRM114-Status: GOOD (  16.89  )
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

CuWcqCAyMDI2LzgvMTMgMTc6MjIsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgo+IFsgRVhU
RVJOQUwgRU1BSUwgXQo+Cj4gT24gMTMvMDgvMjAyNiAxMDozOSwgWmhlbnRhbyBHdW8gd3JvdGU6
Cj4+IEhpIEtyenlzenRvZgo+Pgo+Pj4gT24gV2VkLCBBdWcgMTIsIDIwMjYgYXQgMTA6NDE6MjVB
TSArMDgwMCwgWmhlbnRhbyBHdW8gd3JvdGU6Cj4+Pj4gRGVzY3JpYmUgdGhlIGluaXRpYWwgc3Vw
cG9ydCBmb3IgdGhlIFY0TDIgc3RhdGVsZXNzIHZpZGVvIGRlY29kZXIKPj4+PiBkcml2ZXIgdXNl
ZCB3aXRoIHRoZSBBbWxvZ2ljIFM0IChTODA1WDIpIHBsYXRmb3JtLgo+Pj4+Cj4+Pj4gU2lnbmVk
LW9mZi1ieTogWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMuY29tPgo+Pj4+IC0tLQo+
Pj4+ICAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsczQtdmRlYy55YW1s
IHwgMTExICsrKysrKysrKysrKysrKysrKysrKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMTEg
aW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZkZWMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZkZWMueWFtbAo+Pj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iNWFmM2Y5MzFiMjYKPj4+
PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL2FtbG9naWMsczQtdmRlYy55YW1sCj4+Pj4gQEAgLTAsMCArMSwxMTEgQEAKPj4+
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpCj4+Pj4gKyMgQ29weXJpZ2h0IChDKSAyMDI1IEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyBy
ZXNlcnZlZAo+Pj4+ICslWUFNTCAxLjIKPj4+PiArLS0tCj4+Pj4gKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvYW1sb2dpYyxzNC12ZGVjLnlhbWwjCj4+Pj4gKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4+ICsK
Pj4+PiArdGl0bGU6IEFtbG9naWMgVmlkZW8gRGVjb2RlIEFjY2VsZXJhdG9yCj4+Pj4gKwo+Pj4+
ICttYWludGFpbmVyczoKPj4+PiArICAtIFpoZW50YW8gR3VvIDx6aGVudGFvLmd1b0BhbWxvZ2lj
LmNvbT4KPj4+PiArCj4+Pj4gK2Rlc2NyaXB0aW9uOgo+Pj4+ICsgIFRoZSBWaWRlbyBEZWNvZGVy
IEFjY2VsZXJhdG9yIHByZXNlbnQgb24gQW1sb2dpYyBTT0NzLgo+Pj4+ICsgIEl0IHN1cHBvcnRz
IHN0YXRlbGVzcyBoMjY0IGRlY29kaW5nLgo+Pj4+ICsKPj4+PiArcHJvcGVydGllczoKPj4+PiAr
ICBjb21wYXRpYmxlOgo+Pj4+ICsgICAgY29uc3Q6IGFtbG9naWMsczQtdmRlYwo+Pj4+ICsKPj4+
PiArICByZWc6Cj4+Pj4gKyAgICBtYXhJdGVtczogMgo+Pj4+ICsKPj4+PiArICByZWctbmFtZXM6
Cj4+Pj4gKyAgICBpdGVtczoKPj4+PiArICAgICAgLSBjb25zdDogZG9zCj4+Pj4gKyAgICAgIC0g
Y29uc3Q6IGRtYwo+Pj4+ICsKPj4+PiArICBpbnRlcnJ1cHRzOgo+Pj4+ICsgICAgbWF4SXRlbXM6
IDIKPj4+PiArCj4+Pj4gKyAgaW50ZXJydXB0LW5hbWVzOgo+Pj4+ICsgICAgaXRlbXM6Cj4+Pj4g
KyAgICAgIC0gY29uc3Q6IGh2ZGVjCj4+Pj4gKyAgICAgIC0gY29uc3Q6IHZkZWMKPj4+IHZkZWMg
aXMgdGhlIG5hbWUgb2YgdGhlIG1vZHVsZSwgc28gbm90IHJlYWxseSB1c2VmdWwgbmFtZS4KPj4g
T2ssIEknbGwgY29tZSB1cCB3aXRoIGEgbmV3IG5hbWUgYW5kIGNoYW5nZSBpdCBpbiB0aGUgbmV4
dCByZXZpc2lvbi4KPj4+PiArCj4+Pj4gKyAgY2xvY2tzOgo+Pj4+ICsgICAgbWF4SXRlbXM6IDMK
Pj4+PiArCj4+Pj4gKyAgY2xvY2stbmFtZXM6Cj4+Pj4gKyAgICBpdGVtczoKPj4+PiArICAgICAg
LSBjb25zdDogZG9zCj4+Pj4gKyAgICAgIC0gY29uc3Q6IHZkZWMKPj4+IFNhbWUgaGVyZQo+PiBP
SywgYnV0IHRoZXJlIHdvdWxkIGJlIGEgbml0LiBJbiBmaWxlCj4+IGRyaXZlcnMvc29jL2FtbG9n
aWMvbWVzb24tY2xrLW1lYXN1cmUuYywgVGhpcyBjbG9jayBzb3VyY2UgaXMgYWxzbyBuYW1lZAo+
PiAqInZkZWMiKmlufGRyaXZlcnMvc29jL2FtbG9naWMvbWVzb24tY2xrLW1lYXN1cmUuY3wsIHdo
ZXJlIGEKPiBTb3VyY2UgZG9lcyBub3QgbWF0dGVyLiBZb3UgZG8gbm90IGRlc2NyaWJlIGhlcmUg
dGhlIHNvdXJjZSwgYnV0IHRoaXMKPiBkZXZpY2UuIEhvdyBpcyB0aGUgaW5wdXQgY2FsbGVkIGlu
IHRoaXMgZGV2aWNlLCBub3QgaW4gdGhlIHNvdXJjZT8KWWVzLCBJIGdldCB3aGF0IHlvdSBtZWFu
Lgo+PiAqInZkZWMiKmNsb2NrIG5vZGUgaXMgY3JlYXRlZCBpbiBkZWJ1Z2ZzIGZvciBjaGVja2lu
ZyBpdHMgc3RhdHVzLiBVc2luZwo+PiBhIGRpZmZlcmVudCBuYW1lIGluIHRoZSBkcml2ZXIgKGlu
Y2x1ZGluZyBEVCBhbmQgYmluZGluZykgd291bGQgbWFrZSBpdAo+PiBpbmNvbnNpc3RlbnQgd2l0
aCB0aGUgZGVidWdmcyBub2RlIG5hbWluZy4KPiBXaGF0IGluY29uc2lzdGVuY3k/IEhvdyB3b3Vs
ZCBwcm92aWRlciBuYW1lIG1hdHRlcj8KVGhpcyBpc24ndCBhY3R1YWxseSBhIHByb3ZpZGVyIG5h
bWUgZWl0aGVyLCBpdCBtZXJlbHkgZGVmaW5lcyBhIGRlYnVnIApub2RlIGFuZCBuYW1lcyBpdCAi
dmRlYyIuIEkgZG9zZSBub3QgbWF0dGVyLCBJJ2xsIHJlbmFtZSB0aGUgY2xvY2sgaW4gCnRoZSBk
ZXZpY2UuCj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgpCUnMKClpoZW50YW8KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
