Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96E5D41D6F
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YenjfkKd/rbui7STHBTWZnGN5bRhBTulLuQTmY2mps0=; b=xFwQvf9m+QLRN6P9ui6Kj33mqK
	uMEEb8u8bWnKtw69lAaG1C/LxzNLWWgMGcPSGYfxPon0eO5+bSPAd4JSO8dEPojDgYsO2Haq4QjbD
	NpjfckzLpnXgz1cto5RrbIC/e91wSPOSatW3XfuPKP1lxgKgxBNHsvOpvgQiV+jwPf4Dwebv8vRGi
	Zg9nKTThnown4AdEo7+S1e1UdAZb059hzri9ej9+oKFCKNYhlq9x7NxCGUQQDdkd27E8rGcaQYj5l
	WpqGDs7DPHXTEZmXUME5eqTWI/kvofFgZhiM/D0C7lYo7B0ZWD581TIQTxoWyGtSJuUhRZNRsgkFs
	rdjrbp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmm4-00000002jtg-3beB;
	Tue, 12 Nov 2024 09:01:24 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmj1-00000002jSf-14cW;
	Tue, 12 Nov 2024 08:58:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zP3cadDrW53JG1A317vJupJnbo9awHC21+V+KXB4R7leZh6f3vlVR3CYsM8By5jkjourpbwNTG0krV5A4t+w23G3IXVwWhIxWnLZR3QYACHZ2K4xWvbTJ3f4kZXieEfCGx/lVnqZOqywkLMfsuA+3uQp2RJf7qDcLijde9fhJqbVSAJfe8tQgBBnmfYti5+DaAknDtrc/WxS6n54uNX3w0AMi+NEVqkqS/28fvAihK3UkW3cFf00VfosLwZNr4vB3kF+k8CehimWSEvlQpWcAj3+jcYzY0W/Z7I6MM/9XTTaMrcLvUSf9w3pPixUQ/9uCNO9lhhVZnrd/JrpJaR2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mab5Ghv6pURrAfMcFp9Tq0aBoxqStyoSgNbVv47clw=;
 b=RQz3EASoWL2EncgU6pB6OrhMa+T/0Q1mdzIb5y9WtImwb2DgGc2DiAi9pd+IcEjIGVyYyoXP31xOazn3H3fz45kr4FRJi9T9SG3DLwrD7hKVoCwVBhsGtk/RaXVezpiX/L8agQXy9Hvn7iEUxMRWm9u9nYXj6yMXp6+vQXMGKGVhkF7ZZ/LNfPQcg47bDO93iG/Y5kv2/aIIGboQh3vH6ca1Ju+OaIk+ouTOgrKjLjILqEjbvSlgOq/4HDzHPHbd7udCs6aUhbrAsaZWwttnnkbNHyZ3EpGyhHi7jXv+JB4x7Nx2MAT73xuqHzoTz55HFbjyYtd+V2miazYvV9PgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mab5Ghv6pURrAfMcFp9Tq0aBoxqStyoSgNbVv47clw=;
 b=vAw5cr0cnrI0/6HnCMhfH2SVFdOmUUoM7grFDNpvWVex+oa1/McXVkuBqE9UItWHXFEFzChk6Gin134k3zvVRch8qe+8NG972ricS8KlaO/QGzYW3OzTCVdvrlEXgvx0ekM+EK/lilJ4mxcq9GfoBc+mT8lfq8IuvMB3ySOoyn2c1cU5a8ldiW3yJddrO5eEqTx2mF+puWOsttr+berHIlm2d6zqQDqkX0R+AHb4wkhLyb9e7ntiP2LWVlTQAH3cQy1kXjRtS/w8rH7QTPc0Rte7+Dc0FcA82RCRZ+QetmmGuQD8cldN2rGsxu/bJ3tlBobTVNPe+vaemhsOwu7Vsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB8534.apcprd03.prod.outlook.com (2603:1096:405:6a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Tue, 12 Nov
 2024 08:58:06 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 08:58:06 +0000
Message-ID: <00e16b73-ddbe-4d9c-b485-9ed2a1e10087@amlogic.com>
Date: Tue, 12 Nov 2024 16:58:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 0/4] Pinctrl: A4: Add pinctrl driver
Content-Language: en-US
To: neil.armstrong@linaro.org, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
 <27aa3716-1d28-4da8-80e6-212d7f94d193@linaro.org>
 <84bbb8b3-d638-47e5-a0e9-371e9e56c89f@amlogic.com>
 <97e2b1e4-1763-42c4-a3f0-986492ecfd97@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <97e2b1e4-1763-42c4-a3f0-986492ecfd97@linaro.org>
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: 59548d11-6247-4420-a849-08dd02f81f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFJyTU8zTDFiY3NEK1JDVEFnVFBnNE9tRVRMUzQxUXpGNm5IK3I1TFVGbzVW?=
 =?utf-8?B?MHp3TVQxM1VMQmtNVDhBaWx4SFFwTDlrZXkyL3FqYkt4M3hjcjhnZ3ZQdEZp?=
 =?utf-8?B?YkhCRk5mTzZLbDRLcHAvRytNekozRmJXaDl6bERVUWNvK2J1WWtDUzQ3Zk84?=
 =?utf-8?B?Wi9mZlRLdUo1UmFYQ3VoTGdwN2VlTGhGWndiaFJMa0k2NzNOYjMveWFUcGtP?=
 =?utf-8?B?bUl0WnphdTN0cjhIcUYwbTlRckZDOUZicnh2ZUhrRUNSWUNoM2hjd05lYjNR?=
 =?utf-8?B?SzVQOVBaNnIvMk1hOE1aVHZwQmx5YU04WlBjMkxHdkFXS1E5bHV3enVjN25z?=
 =?utf-8?B?aE9vUDZneTJMRC9iOTBKSTBBNWxLK3ZQMzh6c3llZWoza1N0TWpRaXJyYVdp?=
 =?utf-8?B?Zmt1V1pya0hlTEQxa0xqVnJ6alNrQWdSZkJlR0tzNHRlQ2FSczcxSDBQY1R2?=
 =?utf-8?B?b2RJbVJmT1dyWUF5MUtFOVIxT1d4ZTh6eGhaZFg5SmRmWkFLMlJRRmZmRWRW?=
 =?utf-8?B?THVnMFdmdWJBdFgweHJxSWpBQWRtVDZJS3dIRENxbFp3b2FMUjJvR2x1OEgy?=
 =?utf-8?B?NHVkaDVXd1BlMkVTMURtOFIwa3hBUUdqbkRCczAvWlNIVzB3c2dUOTlPdkNs?=
 =?utf-8?B?Z0EyQ0wwUHhzSUtxWmwrY0k5Q1pEMHlDQTRBczdnN2JaVzFxbERWY2t3YVA4?=
 =?utf-8?B?dHkyZWFiNk1nM2oySTB2ZXh2Q3N5b0FyM0hWSUZBSzR6clJ2UGxVM2ZsY2V0?=
 =?utf-8?B?M2F5MnNtUExEQTdpZWJ0Ty9IY2Q3b3hVbFlhMjUyUnA2QU12YjJONmJXWUJN?=
 =?utf-8?B?bVgrVEE1eUF0TUN4MWdQK1FScVdSKzZkSjBDUWtQK0dKa3FKOW1EdWlDb2Vv?=
 =?utf-8?B?em1ERFdkdDlaTzdyc1pXVXIvZVQ3bURwcENxZ2pLTGtYRGJYK0VQN1dXR1Vh?=
 =?utf-8?B?aTRQcWRySk11c0x6ekxVeEdqcHVycTRsSWVVaWo5NURHV2NnRTZ5NGlFYmZD?=
 =?utf-8?B?dm1GR2VTY1pvNmhkeE1QampmcUdqVnpJTjY0MVlhZXJCT0RuZ2NYZkhzakJ0?=
 =?utf-8?B?dmFjcWg5V0xISjNNOVc4bHVOVUZCWVo0cDgzb2xablZLeFVlb1pGb1VjanRl?=
 =?utf-8?B?bHlzUGd5a3NMUTg4QU83OXQxclNFZlNLUFZTZnVZaXBvY21kclF5bmp6QTZm?=
 =?utf-8?B?STBPT0c1MWMvTFJQRE9SK3VwamRGOWxwQ0J1YVNCN0svWFZ4MEV1ckorSGQ1?=
 =?utf-8?B?Umo2UlZaZnlZbnRCZ2RUYkxrdUROc1VNZVFlYi9GWk5uMXVMa3cvWHNHRkx1?=
 =?utf-8?B?MDFiTnZwQmkyM2ZKWTdOeHdHdFVIRDd1bDhTMUNSeTRyZVh1VDhJU2ZSbmR2?=
 =?utf-8?B?OHkzUHZIZmdmTzFmelkreUNHbW9yZjY3TGEwZ28wZXh6bTZVRVlCaGUwTlkv?=
 =?utf-8?B?YllaUmJMcURGYnFBUDJPNm1kTTVCb1FwRFU5d3U0eWtlZkRGTGxPQnRieFRl?=
 =?utf-8?B?SCt2Yks3NW5WQ1hEcnR6Q0s4VE1keWp3Yyt4bHVYT0kvZ2N6TllUaEtZMXVW?=
 =?utf-8?B?aUhUdU1iQUFmNlI4OFJ3bStSaSt3ZG4vbkhMZ2MwenNZY1JQS1VFcjJrcERF?=
 =?utf-8?B?QzFrMlhyYWlLVUIzQitkUStpajJ2cmdEUjVPOG9oNkhwMEF5YUZsWDhKTFNC?=
 =?utf-8?B?OG4vZ0tWM1I3bUFEakd2eXRNZVBNSkwxcU04S0oyck5YczhacUE5TFhmYk1p?=
 =?utf-8?Q?kjfKdapHF/JDc/59MnfSTdYRjgORSCdNFLgh/cW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHpINk9DbHA4M0tkUWdtcXVpSk41WFZ0RFBBSGg4ZCsyTjUzMlJSdU05UTlY?=
 =?utf-8?B?RnZ6ZThlaG5kVEpWQzdwY2pBeUlreXpvNUVPZWNVN1o1ejRCR0kwb1VUYVMv?=
 =?utf-8?B?RGR0alg0YytVVWdudlVYUzNZYVhPTVBKTHJyTENMSmxBV0wvTVdyN3FlWkNs?=
 =?utf-8?B?WDVCNE1TT1pVZm80bmpUdkpkWkx0TzJRWGxLVTJWTk1JaHdJVFVxZG1udTY3?=
 =?utf-8?B?Vk80cmNkNlR2aHZjTkFwQ0tOcHU5NnJiNnE2VW9hajdrTHNXcHhJOGlNRXlP?=
 =?utf-8?B?YjZ3cVpTZzFyTDJ4MjFSSE1pVWJrV0xSNnNGY3lTSzk5K3hKcys4b0txL0dh?=
 =?utf-8?B?cG1NclJHTTN1SjVkV1JmRm04NlJCdW1xd2dwT2hIVTZibFgvVWFMYnlZY0tz?=
 =?utf-8?B?NGs4Qm0rc0pkYlVUUlZjbkVydUUraTluNU5PQTJ2cjQ2MXNlZXlkektZRjhX?=
 =?utf-8?B?bXRNeXFuQTZLeTkwZnBaREpNMDdJMGl6MmcrY1lFSTg1T09uamhsR0dJREhO?=
 =?utf-8?B?ZzBqMUhsWjVFb3E2SDVUbUU4bzRuYlh1enRFcGF3T1pvTVE5TmF1Rnc4SzFC?=
 =?utf-8?B?dERRRzRVTlMwZHY3NEQvM3dScUJlNVF0MHVxcUVZRU5yWTNFaUhYelo3OWJV?=
 =?utf-8?B?TWxGN01meUJPcFpDRjdWR1FacFBpdWE4UWZrYVQ0bjJpZVZsZUljcGlJVW1T?=
 =?utf-8?B?WWlKVDJEbEZWdHMrUm9IWUowL2hyTmpsckVIbURURDE1c1craE5ISkRnMlRr?=
 =?utf-8?B?Q243UjIxekFmRnFxczkyVnZlaVBrT3RPdUQzSWVQdk1hSDNxYUdWUDRuRlQ3?=
 =?utf-8?B?Vlp1R3NRb29SZmVvdks5ZEQvSFFaWUh6MFh5QnJYUWRoMjUxYUNSNEYyK1BZ?=
 =?utf-8?B?andiby9ZUWhNc2s0LzgwR3dmcnZFOU5mMTUzZlRnUFdBeWZreVN5UERJdmVV?=
 =?utf-8?B?YTgyaVZrcmkxVVhPRlQ1Y0ViYm5IT1YwTGRUZDBWaUVSbXZZaXJha0tPSWNW?=
 =?utf-8?B?SEZ4VXMxbW5EZ2JGM2FhUld0cnhoUC9vVEZETDROQ0gwaU5LK1dGcnpLK0Zk?=
 =?utf-8?B?ZWw5cmdKQ3d0OW9Id1FaZU9HU2g4WWFmQ2tidkNOajFBam1oa1FqaFdMdmVq?=
 =?utf-8?B?NHp4UHBDeW1FM0huRStiVzZFRVU1S3B0VXRiWmZ6bkVwQVRXMnR5ZTRVZjZB?=
 =?utf-8?B?c2ZrVXMrSzFzVU9BeVYwWkZWTHp4RW9ZTFF1ODg4dDMzR3ZySlp2TTE2aTlP?=
 =?utf-8?B?ZGxHanJsWjlJK21vVDdyZFJiUmZhRnU5alg3VUIrUWMrM0RNOGl2RmdUTzFW?=
 =?utf-8?B?bG02MGdQdGJ3RzhTenFxRzQ5L2pXTXFXOVUyQzlhMW9ha2xuN05FeFJDLzB1?=
 =?utf-8?B?UTBVNGVnVVBsQ2tDTklVd0xRdkpHamV1UEhQbGtFVlloaFhJNmwrK0YwZThX?=
 =?utf-8?B?ZE54TWY1ZU1ERUF3ZlpFTlhjbTBYbzl1NnFxazFLRC9RVTlyRU9adHh5Smg1?=
 =?utf-8?B?N0lXR0FiajJVcWZMcWVJaU1wSWNhaUVma2RVLzVpVlIzdi9YRjFEc2tudHVy?=
 =?utf-8?B?TVFFM2hxZDhZaVNUM1FKL3U1L1RROXJGWlNpenhsbTFiN0ZTZ2I0TWZDOW9I?=
 =?utf-8?B?eDlCQUgwNTlGbFJHbkUwQm1BQy9GVWM5cUR6TVBpMjZvS0pmL1BTUjkvQXll?=
 =?utf-8?B?RWJ4NG54UDFieGxaWWxlbVNhQ1IxaWpCNFUxSnRucDFIam5LWHRTTGp5VTBE?=
 =?utf-8?B?Rk1YWDlvcDFYTGxETzlFYWxWbGp5RmNQNm1TKzRKVWlxMzJQUFBhaWhtaWp0?=
 =?utf-8?B?dnJHWTFjQi8zODE5TWV2ejhzb0JaOFQ0ZjV6MGUxN25aOE9UMCtsS2lRdTB1?=
 =?utf-8?B?RE43TzZ1aDF4UHVveEhJdVFvOU5vQVI0TjhjQitCZ1N1dVZtMEhPMlRiSmxO?=
 =?utf-8?B?OEJGRTBYWTFpc0NIZ205SkxaM2VyeHA1NllnaU1VZkdxbUJWYktsSlNHbzgw?=
 =?utf-8?B?TXlSQXVOU2JkNnl0ZW5ZaXJwSWJhQmNUVm05UVZSVlprQXF0M2tQR3Z4bEw2?=
 =?utf-8?B?dTJNcmNXWHNhemlGckRneU9vSnVrTkp4WVJrU2xhUUdFblFSd3phUXRaeWZy?=
 =?utf-8?B?TzZldGxtY2N0L29vY1pmazJYSGsyZTQxQ3lHckpkT2tXaUJSOStZMGlWdU03?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59548d11-6247-4420-a849-08dd02f81f7e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 08:58:06.2037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYpBBgnkIhX8hnaUHAtXb/8jOMDmYCdDFHUXT2WP7RZXUWKVjQXOO8ojiK52ZD8ku11QNGfLzR/5DH/uFH7URBb3ZVVxG63Ah3HXGAMO6SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8534
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_005815_339922_85C027E1 
X-CRM114-Status: GOOD (  18.47  )
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

SGkgTmVpbCwKICAgIFRoYW5rcyBmb3IgeW91ciByZXBseS4KCk9uIDIwMjQvMTEvMTIgMTY6MjQs
IE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIDExLzEx
LzIwMjQgMDQ6MjYsIFhpYW53ZWkgWmhhbyB3cm90ZToKPj4gSGkgTmVpbCwKPj4gwqDCoMKgIFRo
YW5rcyBmb3IgeW91ciByZXBseS4KPj4KPj4gT24gMjAyNC8xMS8xMCAyMDoyNCwgTmVpbCBBcm1z
dHJvbmcgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBIaSwKPj4+Cj4+PiBM
ZSAwMS8xMS8yMDI0IMOgIDA5OjI3LCBYaWFud2VpIFpoYW8gdmlhIEI0IFJlbGF5IGEgw6ljcml0
IDoKPj4+PiBBZGQgcGluY3RybCBkcml2ZXIgc3VwcG9ydCBmb3IgQW1sb2lnYyBBNCBTb0MKPj4+
Pgo+Pj4+IEkgd2FudCB0byBmaW5kIG91dCB3aGF0IGtpbmQgb2Ygc29sdXRpb24gaXMgZmVhc2li
bGUgdG8KPj4+PiBtZWV0IHRoZSBuZWVkcyBvZiBhbGwgcGFydGllcy4gVGhpcyBSRkMgdmVyaW9u
IGlzIG9uZSBvZiB0aGVtLgo+Pj4+Cj4+Pj4gQWxsIG9mIEFtb2dpYyBTb0NzIEdQSU8gZGV2aWNl
IHJlcXVpcmVtZW50IGlzIG1ldCBoZXJlIGJ5Cj4+Pj4gYWRkaW5nIEdQSU8gYmFuayBkZWZpbml0
aW9uIGluc3RlYWQgb2YgdGhlIHBpbiBkZWZpbml0aW9uLgo+Pj4+IEJpbmRpbmcgaGVhZGVyIGZp
bGVzIHdpbGwgbm8gbG9uZ2VyIGJlIGFkZGVkIHRvIGZ1dHVyZQo+Pj4+IFNvQ3MncyBwaW4gZGV2
aWNlcy4KPj4+Pgo+Pj4+IFRoZSBwaW5jdHJsIHNvZnR3YXJlIG9ubHkgYWRkcyBpbnN0ZXJmYWNl
IG9mIG9mX3hsYXRlIHRvIHN1cHBvcnQKPj4+PiBmb3IgdHJhbnNmb3JtYXRpb24gd2l0aG91dCBh
ZmZlY3RpbmcgdGhlIG92ZXJhbGwgZnJhbWV3b3JrIGFuZAo+Pj4+IGlzIGNvbXBhdGlibGUgd2l0
aCBwcmV2aW91cyBkcml2ZXJzLgo+Pj4+Cj4+Pj4gVGhlIGNvZGUgaW4gRFRTIGZpbGUgaXMgYWxz
byByZWFkYWJsZSB3aGVuIHVzaW5nIEdQSU8sIGFzIGJlbG93Ogo+Pj4+Cj4+Pj4gcmVzZXQtZ3Bp
b3MgPSA8JmdwaW8gQU1MT0dJQ19HUElPKEFNTE9HSUNfR1BJT19YLCA2KSBHUElPX0FDVElWRV9M
T1c+Owo+Pj4KPj4+IEZpbmUsIGJ1dCB3aHkgbm90IHVzZSAzIGNlbGxzIGluc3RlYWQgb2YgdGhp
cyBtYWNybyA/IFNpbmNlIHlvdSAKPj4+IGludHJvZHVjZWQgdGhlCj4+PiBjdXN0b20geGxhdGUs
IHBhcnNpbmcgdGhlIDMgY2VsbHMgd291bGQgYmUgZWFzaWVyIHRoYXQgdXNpbmcgYSBtYWNybzoK
Pj4+Cj4+PiByZXNldC1ncGlvcyA9IDwmZ3BpbyBBTUxPR0lDX0dQSU9fWCA2IEdQSU9fQUNUSVZF
X0xPVz47Cj4+Pgo+Pj4gTmVpbAo+Pgo+PiBJIHdhcyBwcmVwYXJlZCB0byBkbyB0aGlzIGJlZm9y
ZSwgbWFpbmx5IGxhdGVyIGNvbnNpZGVyaW5nIAo+PiBpbmNvbXBhdGlibGUgYmluZGluZywgdXNp
bmcgdGhlIG9yaWdpbmFsIHR3byBwYXJhbWV0ZXIgcGFzc2luZwo+Pgo+PiBJZiB1c2UgdGhyZWUg
cGFyYW1ldGVycywgScKgIG5lZWQgdG8gbW9kaWZ5IHRoZSBjb3JyZXNwb25kaW5nIGJpbmRpbmcg
Cj4+IHByb3BlcnR5LiBpbiBmaWxlOgo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGluY3RybC9hbWxvZ2ljLG1lc29uLXBpbmN0cmwtY29tbW9uLnlhbWwKPj4KPj4gwqDCoMKg
wqDCoMKgICIjZ3Bpby1jZWxscyI6Cj4+IMKgwqDCoMKgwqDCoMKgwqAgY29uc3Q6IDIKPj4gSXQg
bXVzdCBiZSBjb21wYXRpYmxlIHdpdGggdGhlIGN1cnJlbnQgbnVtYmVyIG9mIHBhcmFtZXRlcnMo
MykKPiAKPiBZZXMsIHlvdSBtYXkgbW92ZSB0aGUgI2dwaW8tY2VsbHMgZGVmaW5pdGlvbiBvdXQg
b2YgdGhlIGNvbW1vbiB5YW1sCj4gYW5kIGRlZmluZSB0aGVtIGluIHRoZSBzb2Mgc3BlZmljIHlh
bWwgYW5kIHNldCBpdCB0byAzIGZvciBhNC4KPiAKCkkgY2FuIG1vZGlmeSAKRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvYW1sb2dpYyxtZXNvbi1waW5jdHJsLWNvbW1v
bi55YW1sIApmaWxlCmNoYW5nZQogICAgICAgICAiI2dwaW8tY2VsbHMiOgogICAgICAgICAgIGNv
bnN0OiAyCnRvCiAgICAgICAgICIjZ3Bpby1jZWxscyI6CiAgICAgICAgICAgZW51bTogWzIsIDNd
CgogIGFuZCBtYWtlIGl0IHRvIGNvbXBhdGlibGUgd2l0aCBzdWJzZXF1ZW50IG9uZXMuIERvIHlv
dSBmZWVsIE9LPwoKPiBOZWlsCj4gCj4+Cj4+Pgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWGlh
bndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+Pj4gLS0tCj4+Pj4gQ2hhbmdl
cyBpbiB2NDoKPj4+PiAtIEFkZCBpbnRlcmZhY2Ugb2Ygb2ZfeGxhdGUgc3VwcG9ydC4KPj4+PiAt
IEFkZCBjb25zdCBmb3Igc29tZSB2YXJpYWJsZS4KPj4+PiAtIExpbmsgdG8gdjM6IAo+Pj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEwMTgtYTRfcGluY3RybC12My0wLWU3NmZkMWNm
MDFkN0BhbWxvZ2ljLmNvbQo+Pj4+Cj4+Pj4gQ2hhbmdlcyBpbiB2MzoKPj4+PiAtIFJlbW92ZSBo
ZWFkIGZpbGUgZnJvbSBiaW5kaW5nLgo+Pj4+IC0gTW92ZSBHUElPIGRlZmluZSB0byBmaWxlICou
Yy4KPj4+PiAtIExpbmsgdG8gdjI6IAo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NDEwMTQtYTRfcGluY3RybC12Mi0wLTNlNzRhNjVjMjg1ZUBhbWxvZ2ljLmNvbQo+Pj4+Cj4+Pj4g
Q2hhbmdlcyBpbiB2MjoKPj4+PiAtIFVzZSBvbmUgbWFyY28gaW5zdGVhZCBvZiBhbGwgcGluIGRl
ZmluZS4KPj4+PiAtIEFkZCB1bml0IG5hbWUgZm9yIGR0cyBub2RlLgo+Pj4+IC0gTGluayB0byB2
MTogCj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNjExLWE0X3BpbmN0cmwt
djEtMC1kYzQ4N2IxOTc3YjNAYW1sb2dpYy5jb20vCj4+Pj4KPj4+PiAtLS0KPj4+PiBYaWFud2Vp
IFpoYW8gKDQpOgo+Pj4+IMKgwqDCoMKgwqDCoCBkdC1iaW5kaW5nczogcGluY3RybDogQWRkIHN1
cHBvcnQgZm9yIEFtbG9naWMgQTQgU29Dcwo+Pj4+IMKgwqDCoMKgwqDCoCBwaW5jdHJsOiBtZXNv
bjogYWRkIGludGVyZmFjZSBvZiBvZl94bGF0ZQo+Pj4+IMKgwqDCoMKgwqDCoCBwaW5jdHJsOiBt
ZXNvbjogQWRkIGRyaXZlciBzdXBwb3J0IGZvciBBbWxvZ2ljIEE0IFNvQ3MKPj4+PiDCoMKgwqDC
oMKgwqAgYXJtNjQ6IGR0czogYW1sb2dpYzogYTQ6IGFkZCBwaW5jdHJsIG5vZGUKPj4+Pgo+Pj4+
IMKgIC4uLi9iaW5kaW5ncy9waW5jdHJsL2FtbG9naWMsbWVzb24tcGluY3RybC1hMS55YW1sIHzC
oMKgwqAgMiArCj4+Pj4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTQu
ZHRzacKgwqDCoMKgwqDCoMKgIHzCoMKgIDM2ICsKPj4+PiDCoCBkcml2ZXJzL3BpbmN0cmwvbWVz
b24vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oMKgIDYgKwo+Pj4+IMKgIGRyaXZlcnMvcGluY3RybC9tZXNvbi9NYWtlZmlsZcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAxICsKPj4+PiDCoCBkcml2ZXJz
L3BpbmN0cmwvbWVzb24vcGluY3RybC1hbWxvZ2ljLWE0LmPCoMKgwqDCoMKgwqDCoMKgIHwgMTMy
MSAKPj4+PiArKysrKysrKysrKysrKysrKysrKwo+Pj4+IMKgIGRyaXZlcnMvcGluY3RybC9tZXNv
bi9waW5jdHJsLW1lc29uLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDQgKwo+
Pj4+IMKgIGRyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLmjCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoMKgIDQgKwo+Pj4+IMKgIGluY2x1ZGUvZHQtYmluZGluZ3MvZ3Bp
by9hbWxvZ2ljLWdwaW8uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNTAgKwo+Pj4+IMKg
IDggZmlsZXMgY2hhbmdlZCwgMTQyNCBpbnNlcnRpb25zKCspCj4+Pj4gLS0tCj4+Pj4gYmFzZS1j
b21taXQ6IDU4ZTJkMjhlZDI4ZTViYzg4MzZmOGMxNGRmMWY5NGMyN2MxZjllMmYKPj4+PiBjaGFu
Z2UtaWQ6IDIwMjQxMDEyLWE0X3BpbmN0cmwtMDlkMWIyYTE3ZTQ3Cj4+Pj4KPj4+PiBCZXN0IHJl
Z2FyZHMsCj4+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
