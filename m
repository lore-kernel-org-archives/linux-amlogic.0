Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A22CF9C71
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qtst+XURSBbgBKm4ZPyg4+gnRc+xropdZ1olQlq8fFM=; b=XmaGLpN6TruJ2IQuW99R+ltTZi
	HApNdx3CThoiC3BCtOmqIqkExRT+pETP9JOaYre/jF29DrRZFoGDyxZMvGDmj2Mtzpl/hiKvKcftR
	D64SVsn9po2u/5cCwpuxOsnLL7Kgint+qj3M3RBrlCfNKvzs0ItI2YNujW7zqTehBbAcaEiBus5I8
	jDMBpnQHAX10K52vKmnkqFISxV539CP+FN+qCY2vAhetktO39PzqVIZsK1vnbwCeM1UnACWAAaEje
	PynH9pkRa1aIiPf7EWgJCaLFAdmb/gph8Cqy2IxeQ1q5LQOFWhxqSIX6BHCFMwTHbeG9IvxNKYu/j
	2vnX6a5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1E0-00000001f7t-3CGV;
	Tue, 24 Sep 2024 08:48:48 +0000
Received: from mail-psaapc01on20714.outbound.protection.outlook.com ([2a01:111:f400:feae::714] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1Dw-00000001f3b-2q7I;
	Tue, 24 Sep 2024 08:48:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfLwRk5OU1LSXrvwKI3B3uVU1MfzncE/TL3phFk7G4G8LmtMGSK0pvKM3d677TRYSZwOmaK/bygfvp8+mIgevlJaJFQKUdA/f3ffHJk+r1eZv2PWVbffnT3VNSv7FQe+pMQSRE/pEmgw1sVjmn2ItwAmPi6lOZMJfXmjYX73+A0FNbTiEOCMSKQ5fl3KszXY+2JwT/enshwP8E9Mrx3rVaa7vzoorKxA78FqHxw5eFLci1aMVlAwqwAvI9rNHUYrqBT+ACld9S31UnLfdCbEEhKD4aVJ4FNuKvheeT5+52r3ZKgWdlL0C40HH6Mk0aSA4K4yRuqODpcn8+QHCnfjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHLvkQeom4kr55XQULqM/d+lQ37sC8PUiVG71WueSjQ=;
 b=rprz3Ctu5CG8vp9L8ISPxot+Vko+5FMq9JBvt9c09A22vlHCYtphuBK8lRKbIhJHasWmrnXtyrSccsSkH/491aEREbbqxOGx6HEXubr8n6YYllacUtYilp1Yz25EBQK7BuoYU6JkKqgrs768CK1f8qcDdYYfHR028pi0GJJbkrmiyf8TLIP7G835ylrGsIOBgOGLouM43w1+pXl0qKA+/xRC7VQQfRW6mTFBuTcKnDHMU8WiIT9lmzBzlhsRkrttG2baTxwoE0F5GJc2Yrk6bxsalu9TRj+UV0lYJzt9qxCUfGlq8OWEiZWAwKfU42sGuAVw4hAm7pavdlEKz5ePGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHLvkQeom4kr55XQULqM/d+lQ37sC8PUiVG71WueSjQ=;
 b=HPmP45bKEGqxkl8kATVuSCZkQcPOCB/ERWIczzzIGdjcB9j6w9p/vOgEojfcI3f/lagdAmUmYxhxKlkb24egBiDb9H6HrszRfmccViu7O0tg0lThTFVMXhUhjgNwIIRNrtplGeL+pMPSJ1PUCfaw6pehWJ86MsteGBsgI1gdcRoONfhaRMwcuzoePrZ0SkhL4gEI4GEfSPAEvjT8NAsPWdqJxcsBeMvu4x9AuMdTTQCkNobaOEFyMef40Kjb4xwhFziPcEJv8GrA7XRPgEzuXLrbGH1w+EfQUN/yyysWkvAF13eBKfd3GJjn99N05MgR/TZ5DKYWMCfXC9uVulHAwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by KL1PR03MB7598.apcprd03.prod.outlook.com (2603:1096:820:e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 08:48:31 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%7]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 08:48:30 +0000
Message-ID: <a5266439-8dc9-40e7-8708-f5b2e9b3c556@amlogic.com>
Date: Tue, 24 Sep 2024 16:48:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] clk: meson: Delete a meaningless spinlock from the
 MPLL
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240920-mpll_spinlock-v1-0-5249a9a7e2b7@amlogic.com>
 <1j34lpzbxr.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1j34lpzbxr.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|KL1PR03MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 48777223-f5d0-4b47-16eb-08dcdc75aa44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlNUN1lQN2wvNXZtS2ZVbzVzZXVEdk5PQXNkWmJONnVwN3k3M2lHZk1icEFs?=
 =?utf-8?B?N3hoc0lQaTVxU25XcU9ra3o4NTRiTzlKRit0eFFTQlNWYWNRQi81UDM3bG1o?=
 =?utf-8?B?NjRwSE96cDd0eDhUcFh3N3hKYnpPZ1hTNUtjL2dEZlV2TFNTVTY5Y1lHUXd6?=
 =?utf-8?B?V3hna2w0RGRRVFhBL3J6NTFLMFFhRkNtbEVDaXl5Q245U0IxaG4ydW14OXJ2?=
 =?utf-8?B?M203VDlwaEJrd1dZY0Jya2RVNjdSK3NmS0paYnBTMStOK0tlOENRNSsrUE5N?=
 =?utf-8?B?dXRsQ1huMXRQeFYwUEZZSHVZRHA3Wlk3RjhxTFVxTnVza2VNbmN0VGJwakc0?=
 =?utf-8?B?NlI2L0FwS3FjeUE1NGRKN0pGUytwMTE0anBHeHhlQ1cvektkY29admxkM1dO?=
 =?utf-8?B?cFJTSmh5ZytwNWt1N0dBRUdzVlNHanJCcXhkZWs3KythaFlNamFoVlFMakNk?=
 =?utf-8?B?bUhTZkFTZ0xZY2c4Zml6cEVodEZNSVFxVXVrM0NNcVFBcUhKR3o0QmpEeUNl?=
 =?utf-8?B?bEd4YVduWjdBMmRUbXg4Lzdoa0l1QWV1dFZ4WUlUOFllNCttMDBIb3o1RHgv?=
 =?utf-8?B?Q3RjMkpoMllINzBubnY0UGkzSkY3MExOTGY0UUo1VE5iV0ViRU5CcDYyNjd4?=
 =?utf-8?B?eEZWV1lnYXVMN1pVU1ZFRVVwWE1VM3VuamRoSUpLTEZ2T3VFMzhvaVJScy95?=
 =?utf-8?B?aStlM1FyTUptVEZOT1Z5V3V6MmVMemJlcTFhVUxjVFdpaHZRbmZiRkpyWVdM?=
 =?utf-8?B?T2NLUW5lZWYwV3BwYWVSS3JWOTRuelM0Y2toL0RDa1UxTGF5S0d1dWpJbGY5?=
 =?utf-8?B?UGhmUWh6N05sTXh4OWhGU1RZVm5qd1JUcnpKTm9OdUQyalBzRWZja2RGUnBx?=
 =?utf-8?B?VHhxWjFUdW9HYytHYWZqNVY1RWs5cnFIeTJxSEYrZ2VKSjR2ODYwV3VWVHhh?=
 =?utf-8?B?MFp1cTVxVFYyaWJHbGpwVk5naHBadmRxbWs4R21zSWRDUi9YZDNwYTQ2T2M2?=
 =?utf-8?B?ZXBGRWh1MTZhdDgvMlNyeGwwc3l2dWd1KzBLRkNzdzRKRTVCVFJHWlRGNzNL?=
 =?utf-8?B?bzEvclNjZmUzaEMvUG5tQ3FuWFJEMkJndG5Ec0J3ZFhRSUtnUkdaSTVWdk1q?=
 =?utf-8?B?djdkRXdNdEtTai9EdXkzQ09UU0thZmJKakV4eTZYNFc2TzhsWXlRK0dnUjYv?=
 =?utf-8?B?VSs0MTVjWi9WRnBVRUd2YTNyeUxad01qS3dSeDR5VzJLMVpXUEdnQ1lqZmNs?=
 =?utf-8?B?d0NWWk85VGFVemtwVURWblpraFIzc2VMNW9XK3RpWlN4Y20wK20wSXNhSUdJ?=
 =?utf-8?B?c3hjdG5uZ3BKSjBhNHhJKzFBKzFuQXpkcWdxdDJTMXpKd1l0Z3U2OUxVbkR2?=
 =?utf-8?B?dTBNRXNHNDBBRkFmRkQ2T2xEMnZGT1F0cFpldUZ1S0ZNV0J3R3d2TnBab2hM?=
 =?utf-8?B?b0JqWnptY3U0SFJRYnNHNk1xQUN4SHA1bHArdW5JWTdIVG1aVHFVOEtlQ1U4?=
 =?utf-8?B?bkZJN1V4OExzaGovbnh4cCs5Y1NPcHJuVWFYSTJLK0hXZWtibHAvZlAwaDlI?=
 =?utf-8?B?N09JQVhkS2sxeUxQTkluMy9UL0I5ZkoyclYwRkM4alFCUzNNd1V0R0xSL3N5?=
 =?utf-8?B?TXg1RzhPVEdkNEhJTytkYnU1dFZyRXpaQktFb1hyOTNRYitzOG1mSDU3SmFK?=
 =?utf-8?B?aEVkYndtdWM5L2M3TzUvSGJ4czRzT2dFMHdpcWZJWi9yT2F6cnUvK2F3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3loeExRMFpaNUtJRmhhZVdIWlA2QW1NQWdiOEhTVXJoYjhkcUxrT0FtOTkx?=
 =?utf-8?B?NjNrNzF3QVpKdlAxVUM5ZU1KR09rMVlFdzBza3BkNTd5NjRmZzU5NTlHaHZ4?=
 =?utf-8?B?OUY0U1UrTmJpVjBvTjBiaFdaMVdzUUQvRlFraWFNV3NqMXJrM2VkYThwVS9B?=
 =?utf-8?B?cFd1eFhZQjRWODMrNXV5MzMrRy9Ka09Td3MwbGNLRHd3NE40bEJrbVN2OFRa?=
 =?utf-8?B?aWtGeGRZcHRaQmhDNkIvYUlJUDVXY3BuQTFLbElqMTNveEVxTWhFOGNBSjBp?=
 =?utf-8?B?QndYQW9xYXdMOFhQQktwTVM0eThCVC9CNTNxc0dtNFFOQ3d3MVFkWHdHc0ps?=
 =?utf-8?B?MHM0UjhoZTFmc2dubUNFc1dBWG1xRzl5dUgxaVlIVzJ4YjhWWldXWHozaytz?=
 =?utf-8?B?bnhmVG1XWHBZTUZBOGVTdWZRYmN2ZUdxSVpKU1ZQWWZjOE44R3pQcFg3STVO?=
 =?utf-8?B?TCs5OXFGUjBzdks5Y0NnR3FLNzBCdmc3Qm5mUUprc01JQk5rUlVkWHFmeE9v?=
 =?utf-8?B?bXhJYWwvOWs5dGxFUHFIUEtibFpKK3VkMVNyZVVaZmpuOFN2UVMzUkV0UnQ5?=
 =?utf-8?B?Qy9QOTluL3Baekp6cE1yTzA0cVBJN21nSXZVTmVFaGNOY1B4eTE4aUdRTlBk?=
 =?utf-8?B?enlYUGRTbzFCdkorbkJQK1FTQTJMUUJVRnZsVy96TDFmaFQrcitOWDYydGNP?=
 =?utf-8?B?REZzY3I2ZVd2RCtQWjZoWEpPVERUeGsvNTVrMmI0c0ZVOHVwUlNqT083TkU1?=
 =?utf-8?B?U1hrSXVYYXMycHpDc3NoUktKUHc2QlFSdzRNOHdUUVZHczliRDdub2dFWnlO?=
 =?utf-8?B?Y3BodW9Hbm9Bck1MSzNlRDI2YU1xdVh0cmdma1lzZ2hkZDRRZnZyWUtUQUFE?=
 =?utf-8?B?REorSTIzNVE2WkhUL3BpWkt3WC90bU5SckhLSFlzWStWZWFDNWxYVWFITzBB?=
 =?utf-8?B?SFNKY3hqVlVOaGZmL2t2UTRqRHljbGJWVFBXM2FVYnJNYXREdGZhNEVJZnFH?=
 =?utf-8?B?M3dZZUVyckNjRGhJb0x1aWRPeDdyZGdMaG5KSjVCTTFmeGJYWkVrZ1V1akh3?=
 =?utf-8?B?Ui9ETWhtdDBXWkpVeXFzUXVDRWl4LzkyMTNMQnRveGFOai93bkZ5ZUVMZ3oy?=
 =?utf-8?B?K083UWQ3YmxNaVAvYzRqOUdnakM2cFBMWDFYcU1UYVZuakVWZEx6WkJyc2M3?=
 =?utf-8?B?ZW5JMFJVY1pGNWFvZ1FPK1JuU2VDdzJycmxLNFNveVJMVEcwcXNiZ0drMEdw?=
 =?utf-8?B?TkhqN2lHMjNnNUh5ak5jT1FJeTJYdkNxTHhOUGVvUUZqZzhvWWNIVWd6V1Bp?=
 =?utf-8?B?TDJlOU53R3RaTytoMWN0QTJmbFpDemp6STVxSUNVVjRSdW5KdXNWVnVTYnEx?=
 =?utf-8?B?dzdhUDd6UzJQQjlvZGJUd2FTeklsczU3NEp1VWxCRjZ6S3J6WFlnTmcwTURD?=
 =?utf-8?B?M05Da3N4UGVab3hScVI2Tm1JT3hKM2Z0WTNnZkVDb1VGZlJXdGEwbHF4aG9u?=
 =?utf-8?B?cWZuVFlEeGljcml4MFY1ejFHMUtvY2R2NFV6VGx5K1E4TWxhSlZyRFl0TUQz?=
 =?utf-8?B?blhiRCsvaUQxZ1NZZVBFaXpMRkt5ZG5nb2pvSHRZZ3dmTStLdnNwU1NYaENU?=
 =?utf-8?B?NGxIV2hpVGdMYnFYaDJYVkUxcndraVJqS1lJVDcvYVZQYmViUm94V3MydHlR?=
 =?utf-8?B?QmIzYStWbzF2ci9hVDNEQ3R6RjZrR3QxRUlQL2E2bG93T0xCMDZ2SzNsdzBZ?=
 =?utf-8?B?Y1d2anZLamttMWRHNWxMSTVLd0NzUjhrTFk4dzZkSjZqMkVKSUdKQjdZcXRk?=
 =?utf-8?B?RE5nV3FVNnNvTkxzNXZaK1l5cllIV2FSVlRCMEpPVmFZZTFrWFlxVytHTnhl?=
 =?utf-8?B?NXozdTZnL2ZDZC80TUNPRzhGdnBlZWZkWjl2R29iTElEMms0ZFZ1a0dydjdw?=
 =?utf-8?B?eE01b0xYR3JtcXh5U3dTM3d5NVdlQ2lwdWd2a0ZIeDRnR1A1QUx5Y21TUnJ5?=
 =?utf-8?B?YTRIVS9VRGZQQ3JZa3BGWldqMkN1T2tST2NTbUlFRHR3dDJSejcvZkpIZFdE?=
 =?utf-8?B?eHVQTDdPWGNSNWtDV3cwN3VNTGprb3lqem8vM1BrNXV0OTVhcFl1TU1ISmhW?=
 =?utf-8?Q?srGTPpWtL2S4fkMJ/HIWjgACm?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48777223-f5d0-4b47-16eb-08dcdc75aa44
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:48:30.7159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlsxmjxexqKWZCAuXK0gGBZoUEOL+R5GGBWlfY8Pnz9UusJbxzAmT13nbVIkLbs+tOvVtqcdf2cCT96pWCCBQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_014844_763324_D343F8E6 
X-CRM114-Status: GOOD (  16.93  )
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

CmhpIEplcm9tZToKCiDCoMKgwqAgwqDCoMKgIFRoYW5rcyBmb3IgeW91ciBhZHZpY2UsIEkgd2ls
bCBtb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBzcXVhc2gKdGhlIHBhdGNoIGJlZm9yZSBz
ZW5kaW5nIGl0LgoKCk9uIDIwMjQvOS8yNCAxNjozNSwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBb
IEVYVEVSTkFMIEVNQUlMIF0KPgo+IE9uIEZyaSAyMCBTZXAgMjAyNCBhdCAxNjoxNiwgQ2h1YW4g
TGl1IHZpYSBCNCBSZWxheSA8ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPj4gVGhlIGV4aXN0aW5nIGxvY2tpbmcgbWVjaGFuaXNtIG9mIENDRiBjYW4g
ZWZmZWN0aXZlbHkgYXZvaWQgY29uY3VycmVudAo+PiByZWdpc3RlciBhY2Nlc3MuIHN0cnVjdCBt
ZXNvbl9jbGtfbXBsbF9kYXRhIGhhcyBubyBtZWFuaW5nIGluIGRlZmluaW5nCj4+IGEgc3Bpbmxv
Y2sgcmVwZWF0ZWRseS4KPj4KPj4gSW4gYWRkaXRpb24sIHRoZSByZWdpc3RlciBjb3JyZXNwb25k
aW5nIHRvIE1QTEwgZG9lcyBub3Qgc2hhcmUgdGhlIHNhbWUKPj4gcmVnaXN0ZXIgd2l0aCBvdGhl
ciBtb2R1bGUgZHJpdmVycywgc28gdGhlcmUgaXMgbm8gY29uY3VycmVudCBhY2Nlc3MgdG8KPj4g
dGhlIHJlZ2lzdGVyIHdpdGggb3RoZXIgbW9kdWxlcyBkcml2ZXJzLgo+Pgo+PiBFdmVyeSBkcml2
ZXIgZmlsZSB3aXRoIG1wbGwgZGVmaW5lcyBhIHNwaW5sb2NrIHdpdGggdGhlIHNhbWUgbmFtZSAo
ZXZlbgo+PiBpZiBkZWZpbmVkIGFzICJzdGF0aWMiKSwgZ2l2aW5nIHRoZSBpbGx1c2lvbiBvZiBy
ZXBlYXRlZCBkZWZpbml0aW9ucz8KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2h1YW4gTGl1IDxjaHVh
bi5saXVAYW1sb2dpYy5jb20+Cj4gSSdtIG9rIHdpdGggdGhlIHBhdGNoIGluIGdlbmVyYWwgYnV0
IEkgaGF2ZSBwcm9ibGVtIHdpdGggdGhlIHdvcmRpbmcuCj4gVGhlIGxvY2sgaXMgbm90IG1lYW5p
bmdsZXNzLiBJdCBoYXMgYSBtZWFuaW5nIGJ1dCBpdCBkb2VzIG5vdCBzZXJ2ZSBhCj4gcHVycG9z
ZSwgYXQgbGVhc3Qgbm90IGFueW1vcmUuIFlvdSBjb3VsZCB3cml0ZSB0aGF0IGl0IGlzIHVzZWxl
c3MsIG9yCj4gc3VwZXJmbHVvdXMgaWYgeW91IHdhbnQgdG8sIGJ1dCBub3QgbWVhbmluZ2xlc3Mu
Cj4KPiBBbHNvLCBwbGVhc2Ugc3F1YXNoIHRoZSBjaGFuZ2VzLiAxIHBhdGNoIGZvciB0aGlzIGlz
IGZpbmUuCj4KPj4gLS0tCj4+IENodWFuIExpdSAoNik6Cj4+ICAgICAgICBjbGs6IG1lc29uOiBt
cGxsOiBEZWxldGUgYSBtZWFuaW5nbGVzcyBzcGlubG9jayBmcm9tIHRoZSBNUExMCj4+ICAgICAg
ICBjbGs6IG1lc29uOiBheGc6IERlbGV0ZSB0aGUgc3BpbmxvY2sgZnJvbSB0aGUgTVBMTAo+PiAg
ICAgICAgY2xrOiBtZXNvbjogbWVzb244YjogRGVsZXRlIHRoZSBzcGlubG9jayBmcm9tIHRoZSBN
UExMCj4+ICAgICAgICBjbGs6IG1lc29uOiBneGJiOiBEZWxldGUgdGhlIHNwaW5sb2NrIGZyb20g
dGhlIE1QTEwKPj4gICAgICAgIGNsazogbWVzb246IGcxMmE6IERlbGV0ZSB0aGUgc3BpbmxvY2sg
ZnJvbSB0aGUgTVBMTAo+PiAgICAgICAgY2xrOiBtZXNvbjogczQ6IERlbGV0ZSB0aGUgc3Bpbmxv
Y2sgZnJvbSB0aGUgTVBMTAo+Pgo+PiAgIGRyaXZlcnMvY2xrL21lc29uL2F4Zy5jICAgICAgfCAg
NiAtLS0tLS0KPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9jbGstbXBsbC5jIHwgMTEgLS0tLS0tLS0t
LS0KPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9jbGstbXBsbC5oIHwgIDEgLQo+PiAgIGRyaXZlcnMv
Y2xrL21lc29uL2cxMmEuYyAgICAgfCAgNiAtLS0tLS0KPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9n
eGJiLmMgICAgIHwgIDYgLS0tLS0tCj4+ICAgZHJpdmVycy9jbGsvbWVzb24vbWVzb244Yi5jICB8
ICAzIC0tLQo+PiAgIGRyaXZlcnMvY2xrL21lc29uL3M0LXBsbC5jICAgfCAgNiAtLS0tLS0KPj4g
ICA3IGZpbGVzIGNoYW5nZWQsIDM5IGRlbGV0aW9ucygtKQo+PiAtLS0KPj4gYmFzZS1jb21taXQ6
IDBlZjUxMzU2MGI1M2Q0OTljODI0Yjc3MjIwYzUzN2VhZmUxZGY5MGQKPj4gY2hhbmdlLWlkOiAy
MDI0MDkxOC1tcGxsX3NwaW5sb2NrLTRiOWI1NWM0NGZkNQo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4g
LS0KPiBKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
