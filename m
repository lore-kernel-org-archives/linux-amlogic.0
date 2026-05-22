Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA76CD5BB0
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 May 2026 11:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zn2HEpk5yoXXnLfed60iS4xCK58aVuaqFMtXXaoGKnU=; b=pAYVQj5vhrIN41IVT3TmZIe1I9
	DOJ6LGj+kiH7zbQtRMLjccgMZAd+C2GNnQeef6AD+0j85SmcHdz8bJRGxvTwGtc/hT7jnb7VqA+G9
	GBu6bTtVSxjjm6L5bTYlz5lQ3OIyDq8tDvaWFNCGBsxDvWVbENjtqiOFuQ2qxYYXoPFW9s8CaJTJ0
	/eRwjJOZPw1B5nnHgJY/y5WO6lWsqDTu09BEPhj7cqkZpOL+HeYlzePzLeZ3BqeOATUKPjPwLVjUD
	AwWVog7KPZGXfpTPbXmWPuldBCH+LzFcf6L+8uK362YDDVFyHQJL0/ljr10THc9eSngPgCYYIPLqc
	PCxj+tUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOJS-0000000AfJZ-1z4b;
	Fri, 22 May 2026 11:45:11 +0000
Received: from mail-japaneastazon11023073.outbound.protection.outlook.com ([52.101.127.73] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOJP-0000000AfIr-3ULy;
	Fri, 22 May 2026 11:45:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGU4JaGvkAC6s32c0rFVreVBuTKD2GreK7MgrP0hxyhohj5F7aA8Jk9uFyyA/ueqNICHhg4Ogk3FECTstZkBeqv69tTtU2IA0jjTdi1s99AvsBpauPNKSdAPGVkfEHBMlxHpU19n4UxDNJpealUQuMaJSEy8J4XY2bCELklXcfd33hl754s+fdDz2HCUGKeA7tgjrYQERRxyRjtUR7XB/3xJv3gRYGi6Tq2a2fu2B8hY7bXvsjiKAdROg/MJE/8VABtdfg1dvp5BbkyV4p3Th/iz444nhtMoJux6Ws0GwIq3p2lf9KpbFtlmWh+gZDTqZoC7DY0UhtjsgtQaVE8f3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tdQC0Bt65JnQr9aYisnmrIEEtfADpkbf1pSjfQh6/c=;
 b=LbIrKE6o8Zeu6ccjS61JciVCAGzSkVrBNlTA+GhbLdIt0FPlLNHLM2ZgPaQUQ2cZ202/EqAoc9bVRWy8wG+B5ai2/nFVQlxspdb7DGMtlmvT4AJiVtlRLXolTGc60/dQTt9NQG6fAoV/7AyZkOeU5l2rinuyFdBMuepZmcHpweoumN/LZsNyTPBywvfW7bM4G/rlhv3qsLQSHEzd4hQnJCkhOO2A6tNV/x74khHX6XRdjoOIPMKWI+2oE15oEpM60u3Md9Yvp2N2ag8H9/q/o3WllF5GMCyKUAt0fVd3WyJgM+OUQdJTxp9B/+3S81keNst+ak2y5a21WRAj9tuR6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tdQC0Bt65JnQr9aYisnmrIEEtfADpkbf1pSjfQh6/c=;
 b=kpH02bnOn+nROgNfA040Cq+HI1BZRn5v5v3sM/SYWdBLM+recdIJWBgZW0bFwDZBW9FlgyjGwAZfBS1Q0yA01O+q5LG8VAUFQbPzOx/+FkfTvdYhrLNfk/B469SfUdYKhHLgLzPJAepbJu+sm39ZNqPHfskoDLZ6bm6hkI3v18UjTt0gqTic7ZXxp1ErWTIqurK//IoKHiWrIlZ9nyIfCvIaI5r56ox7gB5EJvSRdEc0fpE7SiI/JrXNjZxTfhjzR9WO1DQ0hpEXkxn2syDO0WKBu0+5hVehcnYpkteFvTSd5jBT96lt4RRrKBQJpLXUsmA6OC1wtncLC9bXKW6Nsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEYPR03MB7191.apcprd03.prod.outlook.com (2603:1096:101:d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.7; Fri, 22 May 2026
 11:44:47 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0071.005; Fri, 22 May 2026
 11:44:47 +0000
Message-ID: <86d0e5f0-f1be-4fa9-aad9-c498e2740e95@amlogic.com>
Date: Fri, 22 May 2026 19:44:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dt-bindings: clock: Add Amlogic A9 PLL clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-2-41cb4071b7c9@amlogic.com>
 <20260515-subtle-sepia-tuatara-cfee3d@quoll>
 <40e83bed-e7a0-4c66-806c-c2988c5d0f33@amlogic.com>
 <7c458070-a56a-4d49-89fc-efeb388beffc@kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <7c458070-a56a-4d49-89fc-efeb388beffc@kernel.org>
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEYPR03MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f50ac5-e2b9-4496-a251-08deb7f7868b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|56012099003|18002099003|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: EqaQvtPL2PpKpT1LEVXXqjLlY6wzH4W8c/E39YOXxJU+wvhzOT/vgCIYqzYCQn++ZMGw4l5XvO3LjtZr+8QAxmwYK0RzC34mLj+CT1SxSI1aPaUOCLsZBKtBM8NWYFh/2TVFk4qoRMcgVcYLLvFtstIJ7hPH5sxTF3R3W6qs5sQNsQEE6oZoSMU/hav38a//CmZR8hgiMQEvfjMDQpQ/Kf3JiM8PErleBLaDJYWueP5yrUIwi5e53E+Ofn/K3cpzqjLf43p0QZft6hilruxC5v18bPEiU96Z57b9mPnoTTcv+hbsN5awDlh75StlX5XKIQ2szowvzgkibvnJElZT7zdQ5Jxc4RBnTinoVUk4nK7+OPMXm2zeHV5599RQDHJ4+wIS5ibmj6ee7E/dzQsCOs3GULUm010s8ghguAt7sSP/teVSYiCAyL94Np0GJ1cp6WIqE0cekxBa8ZnTWyQg+ywLmTaZMw++0Dm3H2dKojTnh+5+Frt4FqXwWH7oW7yMCm968gffvz1BEk3UlDHONkbBJNdzZEoOcyP6FhSLxe5iZGjho13Y+0sVNYBMl1rFdv1nlu5/6qFcd8P0/f3Lei1CUvz2vi5OXbgFK9Asm5irlYbAv4Ujovr8zJWHnZeq4xUGtveboA+dXY/NdSeYxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(56012099003)(18002099003)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c05OQ3lxWGZPU25JYkFsSlN0dWNzMFE4cWhUY2NJR080bnhPS0dnUFhaT1Vq?=
 =?utf-8?B?aUZnS2V5U3VYUHhsaStmUk5NZmlXRTBDMWFmS3hGN1k3NUtyRmtzbkdhbEtN?=
 =?utf-8?B?VTdvYkVYWVpHSzhKVlI5SnZTdnI5V1Z0a1B1azVSOHpBaGZhRno2cytkelVo?=
 =?utf-8?B?aUNrTGkySWxObjFBb2kyN2lMNit6d2dlc3hPdHpIUWZONDhidko5djRYWVhQ?=
 =?utf-8?B?UytkamNaVnlLSFdLQlhvekVOSkJubHFqZzNpTEYwWFIySnJqUEczdVhqYSsy?=
 =?utf-8?B?QVNKVmJBaUJqU2FTUCtNWUFRQ0ZkMTFxVUZmck4zRVgySEQ1UjFseUpYMGVx?=
 =?utf-8?B?TFZHZi9EUFFhQk10N1p6RCtyWDNNQjNwemVHNmo2d2xlVEY0WFpwTkZQeW9B?=
 =?utf-8?B?VklNdmllRUQ0RHFYNmRoN0NkUEcrZ3hzQXNaU3hjenV4MXBFNlBBV3pnMk11?=
 =?utf-8?B?L0JHSTFWSXUweDVuejhESWZETXQrUjJKam9ZU1lrcXFmc0dZS1FxdHdFR3Jz?=
 =?utf-8?B?cVRoa0ZGR0E1MmllOVBwZTA2NjdHcW13ZTE5cVZTZG5SZHNHNVBES0FhZWZu?=
 =?utf-8?B?MElrMGw0QkZyamc1elMyK3dwUjZ5NVZhdHlBb3JwdVg2NVNobmFSaTNwQkQ1?=
 =?utf-8?B?OGthdDlYY1ZGSFlhYjVXeWdlSlBlc2l2azBWYnd1NHBnYlJQc280bHpuL1RU?=
 =?utf-8?B?aVVSODZLTVBNdEs3WVovWWIyWEZGcjNmTHFseVNIRFhPQ3FaS3Q1S1V2dkE5?=
 =?utf-8?B?R2JhSldQV1dNK3NBbWtVb2dmUHlPZWNEVDJOdGlFQ21uTEVpSkR6MFRBbmVN?=
 =?utf-8?B?dUZKUmZ5cTk2RmFFWlQ5cjFUZmlaWGtnVjdMWjNtbjJHQnBBdS9TMEZEZ1Rh?=
 =?utf-8?B?Q081YnlKTEpheVJ1K2U4cVBaYXNPVWJTQS9wSWY2WXN0Y2lyK0J1U0l3eWhq?=
 =?utf-8?B?UFlsMTJGZGowVk8yWk1hcm92ZnBmU1Y1RUQ1V3pEY3RRdTljZGozWjhlWG5W?=
 =?utf-8?B?cXNUQzBzaTk4UnExWTN2RUlCb0JLemhWdkpOcHdHUE91WTV2YmdIYXoySjNs?=
 =?utf-8?B?dTFDdWVpT3hhYlVUcnJ6QTl5MHhwQzNSbDFkdEl3ZWQwaGpHRkxmVkQvWTUy?=
 =?utf-8?B?UW5ZNyszODh2b3d5dmh1ZFJRYVdqSFpkNGM3dDI1dzJZT00wdnRxaUlaSjhu?=
 =?utf-8?B?citEMEdOQng2ZjJiaDZMTTFTWE56N3ROV1hVLy9MdEpLelFxZ0g5VjZTOXRR?=
 =?utf-8?B?MHQ1dmloL3F3T2tMRHFHMjFFRjd2NFBGNmcrbG5FVnRmT3o4YWpyS2pRN3ov?=
 =?utf-8?B?aFY1MHg5UE53NWlBcnBZZG9TdGVQcWFQWmxVRFkxNHV3VFZDUUI3b2FJMzVZ?=
 =?utf-8?B?NjlLOEhCbnA3MVRIMVg0UUlpbGxsbS95UlZaTHZibnRQWnZ1Ti9sbFhrbWdK?=
 =?utf-8?B?QjB0NDdMMlNHcGFLZ25zVndhNlZJUDBERVZHa2RWbDFWa00reGRNNk9HTWM0?=
 =?utf-8?B?ZURTYjBjVmVCSENYdk1lTDdMdnVrcHZrZGRxV2o1U1lYWVkzd04rTGhONTBB?=
 =?utf-8?B?SGZmK3AxMitrblEyY3ZiY2JEcW15ZUs2VHlHemt5L2FhQ3hzMDZLWjNteU9m?=
 =?utf-8?B?NHdCbmx0WUZhSm1NQk12ZXZ1cE1VMkxyY0VvbDFsWngrRnRENHg4OG1xL0Ji?=
 =?utf-8?B?YkQra3k0NVpSa1dnUlppNHpvTEZhQllDMktiM0s4LzJzTGx3R0dkK1k2VVRW?=
 =?utf-8?B?S0tsQmM4OFIxdW9nSTNxZGNFMENSQVhxcmhXREJaVTIrVktBYUVWODNSbVBK?=
 =?utf-8?B?MjJiM1NKSlJ6Yk5DRGFUbGZ0TWh5bmFHZWowM21FSmRPTGgySE40TTVsSG5z?=
 =?utf-8?B?WXNFZE5tRmV3RlZQWU8wOGp1dGg0LzhwQ3VrRmlWeGcxMGNaSFJXS0VHajJW?=
 =?utf-8?B?RXlXb0g4eEFhdE1iYTQrR1I4VzlCZld1ckp3dXZxdklpUmlNRXIyVlZ1TWtm?=
 =?utf-8?B?aXo4Y3c1aXJNNlVhZ2tpalVCVVUrek1FMDNyNUVIaGxOeXN4T0VPYTlmeEtB?=
 =?utf-8?B?ZUxIUjhCSnJ1aTN0YlVEenRGVjl5QmhNR2xOZ3pUbzc4ZFZUZEt4RHltSVdu?=
 =?utf-8?B?RGlwNjNmd2N2V0FXbDdQZkNINVFRMlhIbHBxKzNKQlJGS0FUTXp5R1ZUWEx2?=
 =?utf-8?B?b1Q0OXBVcjBFdkEwbHpLNm9oMmVoVTBlSm00TjlZRlZPVHNIOUFZb3R4b3pI?=
 =?utf-8?B?cHpBTlNxVU5KUms4Z0xDRE1mdVFZOTdnM3BXQkpSZ1VWbitwV0x6MHNmdGVR?=
 =?utf-8?B?T0dpd0NNRU1WbHhraFZleFVNdm9IZ244M2x3T1FOMGlSM3pVSVhrdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f50ac5-e2b9-4496-a251-08deb7f7868b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 11:44:47.6565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUI/sgEjDPlP2u+lKbmORO9K9ojv2sQXRgz/MTrVaupciGS3ai9gcf6AJQTOL1POtHty7DB1KqdWiynSXFe4zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_044507_886467_0A5AF6CC 
X-CRM114-Status: GOOD (  13.98  )
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

T24gNS8yMi8yMDI2IDU6MTYgUE0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gWyBFWFRF
Uk5BTCBFTUFJTCBdCj4KPiBPbiAyMi8wNS8yMDI2IDA4OjIwLCBKaWFuIEh1IHdyb3RlOgo+PiBI
aSBLcnp5c3p0b2YsCj4+Cj4+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcuCj4+Cj4+IE9uIDUvMTUv
MjAyNiA0OjA5IFBNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4+Pgo+Pj4gT24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgMDg6NDc6MjRQTSArMDgwMCwg
SmlhbiBIdSB3cm90ZToKPj4+PiBBZGQgdGhlIFBMTCBjbG9jayBjb250cm9sbGVyIGR0LWJpbmRp
bmdzIGZvciB0aGUgQW1sb2dpYyBBOSBTb0MgZmFtaWx5Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNvbT4KPj4+PiAtLS0KPj4+PiAgICAuLi4vYmlu
ZGluZ3MvY2xvY2svYW1sb2dpYyxhOS1wbGwtY2xrYy55YW1sICAgICAgICB8IDExMCArKysrKysr
KysrKysrKysrKysrKysKPj4+PiAgICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMs
YTktcGxsLWNsa2MuaCAgICB8ICA1NSArKysrKysrKysrKwo+Pj4+ICAgIDIgZmlsZXMgY2hhbmdl
ZCwgMTY1IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhOS1wbGwtY2xrYy55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYTktcGxsLWNsa2Mu
eWFtbAo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi40
ZWU2MDEzYmExYTEKPj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYTktcGxsLWNsa2MueWFtbAo+Pj4+IEBA
IC0wLDAgKzEsMTEwIEBACj4+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+Pj4+ICsjIENvcHlyaWdodCAoQykgMjAyNiBBbWxvZ2lj
LCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQKPj4+PiArJVlBTUwgMS4yCj4+Pj4gKy0tLQo+Pj4+
ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Nsb2NrL2FtbG9naWMsYTktcGxs
LWNsa2MueWFtbCMKPj4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjCj4+Pj4gKwo+Pj4+ICt0aXRsZTogQW1sb2dpYyBBOSBTZXJpZXMgUExM
IENsb2NrIENvbnRyb2xsZXIKPj4+PiArCj4+Pj4gK21haW50YWluZXJzOgo+Pj4+ICsgIC0gTmVp
bCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4+Pj4gKyAgLSBKZXJvbWUg
QnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPj4+PiArICAtIEppYW4gSHUgPGppYW4uaHVA
YW1sb2dpYy5jb20+Cj4+Pj4gKyAgLSBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2lj
LmNvbT4KPj4+PiArCj4+Pj4gK3Byb3BlcnRpZXM6Cj4+Pj4gKyAgY29tcGF0aWJsZToKPj4+PiAr
ICAgIGVudW06Cj4+Pj4gKyAgICAgIC0gYW1sb2dpYyxhOS1ncDAtcGxsCj4+Pj4gKyAgICAgIC0g
YW1sb2dpYyxhOS1oaWZpMC1wbGwKPj4+PiArICAgICAgLSBhbWxvZ2ljLGE5LWhpZmkxLXBsbAo+
Pj4+ICsgICAgICAtIGFtbG9naWMsYTktbWNsazAtcGxsCj4+Pj4gKyAgICAgIC0gYW1sb2dpYyxh
OS1tY2xrMS1wbGwKPj4+PiArCj4+Pj4gKyAgcmVnOgo+Pj4+ICsgICAgbWF4SXRlbXM6IDEKPj4+
PiArCj4+Pj4gKyAgJyNjbG9jay1jZWxscyc6Cj4+Pj4gKyAgICBjb25zdDogMQo+Pj4+ICsKPj4+
PiArICBjbG9ja3M6Cj4+Pj4gKyAgICBpdGVtczoKPj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjog
cGxsIGlucHV0IG9zY2lsbGF0b3IgZ2F0ZQo+Pj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBmaXhl
ZCBpbnB1dCBjbG9jayBzb3VyY2UgZm9yIG1jbGtfc2VsXzAKPj4+PiArICAgICAgLSBkZXNjcmlw
dGlvbjogdTNwMnBsbCBpbnB1dCBjbG9jayBzb3VyY2UgZm9yIG1jbGtfc2VsXzAgKG9wdGlvbmFs
KQo+Pj4gU2Vjb25kIGNsb2NrIGlzIGFsc28gb3B0aW9uYWwuIERyb3AgIihvcHRpb25hbCkiIGNv
bW1lbnQsIGp1c3QKPj4+IGNvbmZ1c2luZy4KPj4KPj4gR1AwIGhhcyBvbmx5IG9uZSBwYXJlbnQg
Y2xvY2ssIHdoaWxlIE1DTEsgaGFzIHRocmVlLgo+Pgo+PiBUaGUgc2Vjb25kIGFuZCB0aGlyZCBw
YXJlbnQgZW50cmllcyBvZiBHUDAgYXJlIHZhY2FudCwKPj4KPj4gc28gdGhleSBuZWVkIHRvIGJl
IG1hcmtlZCBvcHRpb25hbC4KPj4KPj4gSSB3aWxsIGFkZCB0aGUgb3B0aW9uYWwgcHJvcGVydHkg
Zm9yIHRoZSBzZWNvbmQgY2xvY2sgaW4gdGhlIG5leHQgcmV2aXNpb24uCj4gSG93PyBSZWFkIHRo
ZSBwcmV2aW91cyBmZWVkYmFjay4uLgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKCk15
IGFwb2xvZ2llcywgSSBtaXN1bmRlcnN0b29kIHlvdXIgcHJldmlvdXMgY29tbWVudC4KSSB3aWxs
IGRyb3AgIihvcHRpb25hbCkiIGZyb20gdGhlIGNsb2NrIGRlc2NyaXB0aW9ucy4KCkl0IHdpbGwg
YmUgdXBkYXRlZCBhczoKIMKgIGNsb2NrczoKIMKgIMKgIGl0ZW1zOgogwqAgwqAgwqAgLSBkZXNj
cmlwdGlvbjogcGxsIGlucHV0IG9zY2lsbGF0b3IgZ2F0ZQogwqAgwqAgwqAgLSBkZXNjcmlwdGlv
bjogZml4ZWQgaW5wdXQgY2xvY2sgc291cmNlIGZvciBtY2xrX3NlbF8wCiDCoCDCoCDCoCAtIGRl
c2NyaXB0aW9uOiB1M3AycGxsIGlucHV0IGNsb2NrIHNvdXJjZSBmb3IgbWNsa19zZWxfMAoKCkJl
c3QgcmVnYXJkcywKCkppYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
