Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597EAC2BBCA
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2024 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=frx8F+d0MVcUyHP0S/F+r4MVcojKUm3VFErs1YNdc40=; b=i5ufAO5Uq4Ta4VEF1XRds3tRD8
	dSXOuMDkrsLKCAVeT79eBpel4i/CP+7nGyg3CLUgDqLNHLq4F8vaXBWDhxo1Qyb0KeNyBSIV2mHB9
	EYXk7AkrGEDCLYSOzCJpHVAi1WYgZMB07F4TGYrclgrzUluwnsBK7orOMc0LnDpcmQLVCDvN0Huku
	+h+Rg5DvhOK1R9EB4DjfhrK1KwOil0/9+6HLyXFBuLreHyAXCVhT1GsJC3hLo0VZkWRumOSFd8xzw
	bKMQwBo99ZPD9HM+oDUhYg1FyGcqgsgeh4bc7iWoCHFYh7n1pMiMyb0CHQSkRfMn9Q4X6cvvm8heo
	5So1Y9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN80B-0000000DGv6-1BPH;
	Fri, 28 Jun 2024 09:34:43 +0000
Received: from mail-psaapc01on20723.outbound.protection.outlook.com ([2a01:111:f400:feae::723] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN801-0000000DGrS-1hNt;
	Fri, 28 Jun 2024 09:34:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFuPnVE5i6QvQDjqxA0ID1ZyL85EQ3VP2b+dnqLvHuiNfo/dDlew7FIRTqy9leX6hs99+ghywCVAX3bbVNKjxKNWbVjWs8Qy5r+0/toc2T2yblwroxjXS3AR+4EPftxHeJ+w8v8XgdoGC1FHR6JiIkAtEE638DZazwY7nII7Y+58kaMp/TVR3Oz0Ds1O2Lt7oWJej6gTb+dzw2AbkM+OwykThI5o8//TR6CyJgnTrT4vB19miRBal7FwU+RmjI7FwWTmSbPdERMF6Ve4eqoJ/3+NCpkcF5leFszpK98mxk6rCkNsBX2OcKSM8Eex/JURTDavUp7jhnD+V8q/cmJweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WFZoF7CljGFThezclI2iSB1WMXfKwBCwIBvLUaWfQA=;
 b=mn1Cr94KPz1Ku7aDML0NtFucMGRjxJEGZwkmbcwTOZFtl2o/h9D3X8elGxQ369bOaJUlRq+XFOv6KJvNVo4M0aKLxHdnxqx5Rc/bwmWu26PZ9WFI/iK5EW0BXX8BlzFVONXOy9PxyPdeUocnxRMP1yNspAf+3cxC8dLb5PEqWoaNoPbfz6FPvMrw+0FCVPsSXR5VcZ+3einbMbfxYGdCUe1tPPcMnUD7NzHop1TZJXGIH+Xx8jbtrOvsR9kewl2wVFYP9Whj09tH5M629T2XuiQLHjYrL14HB3jKfWLWX3hjh/ZmBsCjLLpPDbxgzp1xPqFjuW1fG9+FRhFVLsypSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WFZoF7CljGFThezclI2iSB1WMXfKwBCwIBvLUaWfQA=;
 b=uDsFV3NpiM5A90cnhsURy/bmowKgU/+g3YNR7bELfavGqDEeYb4KEHbuZ7/6b+KP9HcXrH+Iu5y4jQ6dPbqY+5iM8FHdLtimQfNK1xr2nNGM39g6txxcrXttvUPuy2p69NlgmMXuJFOc+5betMOfa6Z3I7eG7HU2PchwQChnPjEII/k7Dg+vqC0bj6BzZl7eDWHWEiFji+Smza4JbkA9agTyIARKaCXu3oxgP3pQvL4N9rIcPC6DFMy8OGcxEn0WQtyHgDedwnWKVwgqibdtjw0/nHz+GW+VAQmtT45iDgkZtJRkKRD8MF5cxL7JTkwGfT8oO/JHBx1DTjnWme9FsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SEZPR03MB7220.apcprd03.prod.outlook.com (2603:1096:101:ec::16)
 by TYSPR03MB8684.apcprd03.prod.outlook.com (2603:1096:405:91::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 09:34:07 +0000
Received: from SEZPR03MB7220.apcprd03.prod.outlook.com
 ([fe80::76dd:f717:3e9:1142]) by SEZPR03MB7220.apcprd03.prod.outlook.com
 ([fe80::76dd:f717:3e9:1142%6]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 09:34:07 +0000
Message-ID: <ef625710-f14b-46d1-a6a6-75e5365f9b53@amlogic.com>
Date: Fri, 28 Jun 2024 17:34:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-kernel@vger.kernel.org
References: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
 <20240611-a4_pinctrl-v1-1-dc487b1977b3@amlogic.com>
 <20240613170816.GA2020944-robh@kernel.org>
Content-Language: en-US
From: Huqiang Qin <huqiang.qin@amlogic.com>
In-Reply-To: <20240613170816.GA2020944-robh@kernel.org>
X-ClientProxiedBy: SG2PR01CA0111.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::15) To SEZPR03MB7220.apcprd03.prod.outlook.com
 (2603:1096:101:ec::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR03MB7220:EE_|TYSPR03MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: dee203f5-e147-4a81-849c-08dc975574dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFRiR2tyR28rUlY5QWs3cEhwQWxjNDdObWtMU1lQMWhuY2F6L25EdEdPck1K?=
 =?utf-8?B?T1dYNEJqRXYwVVFaanRNY3o1czh5UkhDVmpwaS9EVkVRYXROTkVPZS9Sd0Zq?=
 =?utf-8?B?dTZTN0RpZGtkdFpiM0tobkJXdHlFWTdNY3dCV3o4UWZUeWVMQXZRZ3NMWUtq?=
 =?utf-8?B?Z0tja2tvRCswejB3eTR6U0RiSHJFN0U3RDJCR2RnMWVTMVM0RklsRlVTd1hz?=
 =?utf-8?B?dWc5aGFscU1NQlFBeXBUY0dRTTZxOXdURk5paXNUMnRPemhBQnBxWGpYQWhi?=
 =?utf-8?B?UEdDZjladUVZKzhlL09Cd2w1ZGk3eXpPOGdNSzZpWXlXM0owa0p1RHpIRjRa?=
 =?utf-8?B?QVV4UzduaWpGbTAzVzhINE5wU1dRWmZGV0VoUGRyN2F0dGJCYit1bXFSejd6?=
 =?utf-8?B?NUdmNDBNcmZqLzlsV3RiYUVGajAwMzNYZ0JlUzdkeEg2Q2IvY3A5dzZoRXhw?=
 =?utf-8?B?MjJ6d1BjOTdyUWxoSXBBcG1vTnVIRm5OZHNDRjdudkFVaDNrUlE2aVVQUEdi?=
 =?utf-8?B?eHZCazkyNVNJRHJVRC9WNzNHbmcxQklBMm91YjhXZ3JrSEx0amptWGJMbzc5?=
 =?utf-8?B?VWdzYTNPRGE5VDBRRzkvcEIyeWRrY2FNNHlLWEFpa1N2RHBPUDVXTmVWZGVR?=
 =?utf-8?B?TEU1Q21iOEtNNlJhcHZmYzBjaEZLK0wybjlzanRnREI1M0twVkl1cTZQbG0y?=
 =?utf-8?B?MTVxeDZWOXVzd1BGWGJ0Nk5VcXlWcjVRYlY0M1hjUnpEajVvSnh4bHpCNW1X?=
 =?utf-8?B?L0FTUlplUlV3amxPMXdLUUpWYjZhNlQzSjE0cm1oMlgwR3NkN3hDUm5ickxa?=
 =?utf-8?B?K3l6RFd6ejFoYng3UnpzZGk5WkI0aWZZN3dqdlJoeEdjMGpUUW1sRHRGK09I?=
 =?utf-8?B?UGR4aHMyc0xNbVBXaWZLZTkxbFFFS2lRaHJISUdCY2ZOSjRpTTNSdmVnVWJH?=
 =?utf-8?B?NE8rbWt1WlV5UTFoR2V2dG5yS2pTbXRHTzFySUVvVnc1cVZkdjBDMy9YUHBR?=
 =?utf-8?B?TjRiR1dNaldZS29TS1VpTjUyWWpzcDA4T3pmWmZUeHRNU0dQYXlBUndnRzZa?=
 =?utf-8?B?SG1lbm5PM1NpYjdLV1ErM0NaSlM4cC9nNU1rSjMraVZsOXRVbXBEZEdNSDRN?=
 =?utf-8?B?cnFLdW1yYUpxLzMzNDM4ZUp3VDhDSXB2R0hpNzJtNVV5T2lzdnZBYWRLU0ls?=
 =?utf-8?B?RklZbk9WSGx0WHRpVTFiaVJVL0l3eExodHoxUVYwbnVVUnlHZlNFeHgxT1Jh?=
 =?utf-8?B?R1FmRVdPdWF1bUFrcTNFalpVVTRseWdXMjM4TlpJY0hqMjBBdys2UFVCMXNO?=
 =?utf-8?B?Ni95UEJXNkdQaFlYSWxJN0pLeDdHeU1hV0l0c2JpeWV4b2RSOEIzblV2Z1pi?=
 =?utf-8?B?RC9HWnBtNldqME9nTTAwUzlFbjRwSVpMT1A2enIyYjNhUW1peUZRVnRNbGM5?=
 =?utf-8?B?aXphc1ppWTBhVWwwWDlsa2xOZXFuUE9MTThabjA0dTF2dDJ5SkdtV3V4c1BI?=
 =?utf-8?B?dE1WN01KMm9ZOUpOTnV5aE4vY2xOd25zMHd6V0NDdk4wM3JydXlXZ0Ivb0tC?=
 =?utf-8?B?QWRpUkREbjdnUDBUSjFJL2p5bzN0bDVQMzh3WDFUVzNZVjdZakdvbjBqOXBQ?=
 =?utf-8?B?b2Jpb2tJRW8xRi95cEVWbWFvMDRLNHNvaEh1aUMreGx5bFZSZHJ4bUc3bnpV?=
 =?utf-8?B?WnpVMW1NT0txMWkvL29aSTF2Q09oNXJiMWRnVXlSM3NRbWVtNE9reEJqRXhk?=
 =?utf-8?B?SkNLbldSU3dpT1NtMzBicDArZW92Vk9kNkhCU2tvcmRDb0p2STVRR2JsTTlN?=
 =?utf-8?B?eUNwNXozNWZHaFI3dVBTdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7220.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0ViN1NRb2JrWEgyL1FMcVlXdzZGcHQyRnpTcDVLRmlxTnc4R3lSMHRMek5K?=
 =?utf-8?B?U3luTHVvd0dsU1pYelcxd000U2FyQlh0OWo2YTdkQlVCc0Z2WEo2K2Z1YWRR?=
 =?utf-8?B?eDJBLzNTb0V1d0V3TmlueExFOGNkbVJiNUdrdG4rQm5qaG1FbzZWV0tqenp4?=
 =?utf-8?B?eUJjdVpEZjBkNk0rbEJNZ2Z2RytxbjVyelcwVGRta1JQM25yMkFxTHFrYkZF?=
 =?utf-8?B?YlVxUHJXVEk3dkxOVG1jcVFNUWtxaUNPdDJZeEFWK09mNVBmY000MFZtZFln?=
 =?utf-8?B?KzZ3UFFVdUFyMU91aU8vRUZuWS9pRzdpVGRtRXhYSWc2Z21UVmJxdDBEQnp6?=
 =?utf-8?B?MmhnUnZ1TjltVTBWWFdUQlpxK2FKWkpxa01PSzhaaGxENGVKTDFYeXNUVGc4?=
 =?utf-8?B?SDViNnErdlBKMFFhanMrNlZKdXNUYkl6bVIzT2NPTk9hdlNCLzBYeFJrTHhU?=
 =?utf-8?B?bjlId2lQNDFGVk4zeXVvQTY4NkZBckZHZldoWkxjTlFLVGdoL24vNTNndTNm?=
 =?utf-8?B?ZnpnRk1sdDFJcmZYM3liZjlTWXUwU3JkZVUyRHl0cG9SUmJhUXB3T0sxT2Va?=
 =?utf-8?B?TXlZTVpBVE9ZcFNCcGdNdEJYNFgyais3OWhQcHNXbSthQkJRV1UvcFdubE56?=
 =?utf-8?B?K29WOFkwalROdVdEcldOYmJacWtZT0FzRHJta3J4cW5OckxERExVRVN6ZXF3?=
 =?utf-8?B?cTBqa1Noa1RUbWZtS1l6YVNlY2pZWEIvY2hlbUk3SjB2d0E3QjZ4ODNjR1Z2?=
 =?utf-8?B?ek93VXRadlVacm1iL3lzSlNoYXNGQ0pzd1VVd2lHb2hQNm9HNE9zTXdyRlBH?=
 =?utf-8?B?V25Rc2kyNjdIUmFHRGxJVkVsdklGS0dYRVEzeWxueVE5UFFIdmRoNG1QWHh4?=
 =?utf-8?B?Z3hJVGMvNnNUNGI0ckM3eGdCUmpOOUQ2NHZJN0lNVThRUVJ3ODFpQjRiREhj?=
 =?utf-8?B?UWV1U3NtMHdnWDgzTlJZeVZZRlR1ZHZROTB3UWdWTk9nZzlON1FqaGVrY0xv?=
 =?utf-8?B?MWNKVjRNc0NmRFFGSUdEWEpFQmlndVoyK2RtdEVDR01LM3FuQTR2V3VMTkxM?=
 =?utf-8?B?VUFIWVFLVVlBb0hwZkt4VGtwYUNiZ2FydjZib0NqZTFtMTFOeUIwSDIwL0Ft?=
 =?utf-8?B?MHUrN3NraEtLeUQ4empCQnlVK1h4R293eFRTTHU1Vi9DZnYrV3pwMXNQcFhU?=
 =?utf-8?B?cUE5MnZuOFZNUmJXbm5BWnZ5WTRmc3YybDJuUTRyTm5uWnE2VE5ESTJKNjVK?=
 =?utf-8?B?RlVUNU1ZQlBVMU9KbmhJNGdXMGVNZnRrSnptK2JZUUliRWxPbHNNTGx6dTRU?=
 =?utf-8?B?czYwd1dNdEtoSVNZcWRuMkpRaEpZdDVqaFFRYTUrZTZvNGUzRm9uVmJLQVY3?=
 =?utf-8?B?RWliVFFHMWdLV1BmdU5qWC9RU29YSEhkYnhReWVoMHZCbzQwNW1sbksyTmlo?=
 =?utf-8?B?UGY1YThQTEo0ejc0SXVtKzg2NUFRaGgrWkpCZnk0L2FoOEZHTVdYMUR3NEZ3?=
 =?utf-8?B?SGtuZTBzT0piR3BDeVZUYlhOd2VRL3dmd3NsRW4xRStKU2VaQThsNS94L2Ju?=
 =?utf-8?B?VlJrbU5oS0NNY2loV1dGWEh4WHZxNDFpT050bGt0WVkvdGppT2pOZUpzWlgy?=
 =?utf-8?B?aWNxT2FvbjZhQTkyUFJRalpRSEV1VHdaRE82VXplY3d3Yms1NTZFRGpKSk1V?=
 =?utf-8?B?SGppMGxmVzRvYWlhTldxQytYTEF2dnJHVUVaeVM3b3VMTDloaEI3NkNjNVlJ?=
 =?utf-8?B?M0JaL1k1VFNNckJGRFFRVTZwdUIvV1orQ3R4Skd2SFBKYWF6UXp2ZzJrOWlo?=
 =?utf-8?B?UlFOWnNmZDE4eE5MWG4rU3RBK2NpSjB0eUtmTUdkNzUvRzEwQUNqZi9GS2RX?=
 =?utf-8?B?a08yQ01LNmsvSXNoQmk1dDRpYU8xS25DYUQzL0VNQ05BM3Jwc0FQVDAxekZs?=
 =?utf-8?B?eTUyYndXUmlpdjF3SmxxS1hIWG92a3JPQWY4dUY2R1F1blJERWdOWFhtZzJB?=
 =?utf-8?B?RnBmWFNRU3hVSlRqeDVvMEZWeHFqWFFDZHY4Y2VUUzBIT0JQajVZVERQOG1l?=
 =?utf-8?B?Vno0RVVpZ2ZSU0lwNExMbU1vNkE4T3VQQ2lESE9mMTBwL2tsLzFMOStSSEhS?=
 =?utf-8?B?N014WFVWcVVnckxFWXRSYk0vUEcwUVVDbUY2VHdyOEtKQkxSY2NLb0J2eTlw?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee203f5-e147-4a81-849c-08dc975574dc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 09:34:07.0398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1l1cLY3rpNLrXbQpGowRf8RAvEpnLfmEzJvvaYenFDSbI0yBygPY4qWJP+sR8bldseuY8bjK27v79Umfk5zc7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8684
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_023433_617535_68F62BF6 
X-CRM114-Status: GOOD (  24.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKVGhhbmtzIGZvciB5b3VyIHJlcGx5IQoKT24gMjAyNC82LzE0IDE6MDgsIFJvYiBI
ZXJyaW5nIHdyb3RlOgouLi4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvZ3Bp
by9hbWxvZ2ljLGE0LXBlcmlwaHMtcGluY3RybC5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9ncGlv
L2FtbG9naWMsYTQtcGVyaXBocy1waW5jdHJsLmgKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4g
aW5kZXggMDAwMDAwMDAwMDAwLi5kZmFiY2E0YjQ3OTAKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysg
Yi9pbmNsdWRlL2R0LWJpbmRpbmdzL2dwaW8vYW1sb2dpYyxhNC1wZXJpcGhzLXBpbmN0cmwuaAo+
PiBAQCAtMCwwICsxLDkzIEBACj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBNSVQpICovCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChjKSAyMDI0IEFtbG9n
aWMsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPj4gKyAqIEF1dGhvcjogWGlhbndlaSBaaGFv
IDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+ICsgKi8KPj4gKwo+PiArI2lmbmRlZiBfRFRf
QklORElOR1NfQU1MT0dJQ19BNF9QRVJJUEhTX1BJTkNUUkxfSAo+PiArI2RlZmluZSBfRFRfQklO
RElOR1NfQU1MT0dJQ19BNF9QRVJJUEhTX1BJTkNUUkxfSAo+PiArCj4+ICsvKiBHUElPRSAqLwo+
PiArI2RlZmluZSBHUElPRV8wCQkJCTAKPj4gKyNkZWZpbmUgR1BJT0VfMQkJCQkxCj4+ICsKPj4g
Ky8qIEdQSU9EICovCj4+ICsjZGVmaW5lIEdQSU9EXzAJCQkJMgo+PiArI2RlZmluZSBHUElPRF8x
CQkJCTMKPj4gKyNkZWZpbmUgR1BJT0RfMgkJCQk0Cj4+ICsjZGVmaW5lIEdQSU9EXzMJCQkJNQo+
PiArI2RlZmluZSBHUElPRF80CQkJCTYKPj4gKyNkZWZpbmUgR1BJT0RfNQkJCQk3Cj4+ICsjZGVm
aW5lIEdQSU9EXzYJCQkJOAo+PiArI2RlZmluZSBHUElPRF83CQkJCTkKPj4gKyNkZWZpbmUgR1BJ
T0RfOAkJCQkxMAo+PiArI2RlZmluZSBHUElPRF85CQkJCTExCj4+ICsjZGVmaW5lIEdQSU9EXzEw
CQkJMTIKPj4gKyNkZWZpbmUgR1BJT0RfMTEJCQkxMwo+PiArI2RlZmluZSBHUElPRF8xMgkJCTE0
Cj4+ICsjZGVmaW5lIEdQSU9EXzEzCQkJMTUKPj4gKyNkZWZpbmUgR1BJT0RfMTQJCQkxNgo+PiAr
I2RlZmluZSBHUElPRF8xNQkJCTE3Cj4gCj4gSSdtIG5vdCByZWFsbHkgbXVjaCBvZiBhIGZhbiBv
ZiB1c2luZyBkZWZpbmVzIGZvciBHUElPcywgYnV0IGlmIHlvdSBkbywgCj4gd291bGRuJ3QgYmUg
YmV0dGVyIHRvIHNwbGl0IGJhbmtzIGFuZCBsaW5lcyB1cCByYXRoZXIgdGhhbiBhIGdsb2JhbCAK
PiBudW1iZXIgc3BhY2UuIFNlZSBBU1BFRURfR1BJTygpIG9yIHRlZ3JhIGhlYWRlci4KCldlIGhh
dmUgYWx3YXlzIHdhbnRlZCB0byBtYWtlIHRoZSBHUElPIGNvZGUgbG9vayBiZWF1dGlmdWwgYW5k
IGNvbmNpc2UuCgpIb3dldmVyLCBzaW5jZSB3ZSBwdXQgYWxsIHRoZSBiYW5rcyB0b2dldGhlciBh
dCB0aGUgYmVnaW5uaW5nLCB0aGlzIGFsc28KbWVhbnMgdGhhdCB0aGUgYXV0b21hdGljIG51bWJl
cmluZyBvZiBncGlvbGliIHdpbGwgYmVjb21lIGNvbnRpbnVvdXMsCndoaWxlIEFTUEVFRF9HUElP
KCkgd2lsbCBtYWtlIHRoZSBudW1iZXJpbmcgZGlzY29udGludW91cy4KCkluIHBpbmN0cmwtbWVz
b24uYywgd2UgZGlkIG5vdCBhc3NpZ24gYSB2YWx1ZSB0byBwYy0+Y2hpcC5vZl94bGF0ZSwKc28g
dGhpcyB3aWxsIHVzZSB0aGUgZGVmYXVsdCB0cmFuc2xhdGlvbiBmdW5jdGlvbiBvZl9ncGlvX3Np
bXBsZV94bGF0ZSgpCgpvZl9ncGlvX3NpbXBsZV94bGF0ZSgpIHBlcmZvcm1zIGEgbGluZWFyIGNv
bnZlcnNpb24gb24gdGhlIHBhcmFtZXRlcnMKcGFzc2VkIGluIGJ5IERULiBJbiB0aGlzIHdheSwg
aW4gcGluY3RybC1tZXNvbi5jLCB3ZSBjYW4gZWFzaWx5IHVzZQptZXNvbl9jYWxjX3JlZ19hbmRf
Yml0KCkgdG8gZ2V0IHRoZSByZWdpc3RlciBjb3JyZXNwb25kaW5nIHRvIHRoZSBwaW4uCgpIb3dl
dmVyLCB3aGVuIHdlIHJlZmVyIHRvIHRoZSBBU1BFRURfR1BJTygpIGFwcHJvYWNoLCB3ZSBoYXZl
IHRvIGltcGxlbWVudApvdXIgb3duIG9mX3hsYXRlIHRvIGNvbnZlcnQgdGhlIG1hY3JvLWRlZmlu
ZWQgbnVtYmVycyAoZGlzY29udGludW91cykgaW50bwpjb250aW51b3VzIG51bWJlcnMgb2YgZ3Bp
b2xpYi4KCkFuZCB3ZSBuZWVkIHRvIGRlZmluZSBlYWNoIHJhbmdlIG9uIERULCBzaW1pbGFyIHRv
OgoJcGVyaXBoc19waW5jdHJsOiBwaW5jdHJsQDQwMDAgewoJCWNvbXBhdGlibGUgPSAiYW1sb2dp
YyxhNC1wZXJpcGhzLXBpbmN0cmwiOwoJCS4uLgoJCWdwaW86IGJhbmtANDAwMCB7CgkJCS4uLgoJ
CQkvKiAgZ3Bpb19vZmZzZXQgIHBpbl9vZmZzZXQgIG5waW5zICAqLwoJCQlncGlvLXJhbmdlcyA9
IDwmcGVyaXBoc19waW5jdHJsIDAgIEFNTE9HSUNfR1BJTyhHUElPRSwgMCkgMiA+LAkvKiAgMCB+
IDEgKi8KCQkJCSAgICAgIDwmcGVyaXBoc19waW5jdHJsIDIgIEFNTE9HSUNfR1BJTyhHUElPRCwg
MCkgMTY+LAkvKiAgMiB+IDE3ICovCgkJCQkgICAgICA8JnBlcmlwaHNfcGluY3RybCAxOCBBTUxP
R0lDX0dQSU8oR1BJT0IsIDApIDE0PiwJLyogMTggfiAzMSAqLwoJCQkJICAgICAgPCZwZXJpcGhz
X3BpbmN0cmwgMzIgQU1MT0dJQ19HUElPKEdQSU9YLCAwKSAxOD4sCS8qIDMyIH4gNDkgKi8KCQkJ
CSAgICAgIDwmcGVyaXBoc19waW5jdHJsIDUwIEFNTE9HSUNfR1BJTyhHUElPVCwgMCkgMjM+Owkv
KiA1MCB+IDcyICovCgkJfTsKCX07Ck1vcmVvdmVyLCB3ZSBhbHNvIG5lZWQgdG8gY29udmVydCB0
aGUgZm9sbG93aW5nIGdyb3VwcyBvZiBmdW5jdGlvbnM6CglwYy0+Y2hpcC5nZXRfZGlyZWN0aW9u
ID0gbWVzb25fZ3Bpb19nZXRfZGlyZWN0aW9uOwoJcGMtPmNoaXAuZGlyZWN0aW9uX2lucHV0ID0g
bWVzb25fZ3Bpb19kaXJlY3Rpb25faW5wdXQ7CglwYy0+Y2hpcC5kaXJlY3Rpb25fb3V0cHV0ID0g
bWVzb25fZ3Bpb19kaXJlY3Rpb25fb3V0cHV0OwoJcGMtPmNoaXAuZ2V0ID0gbWVzb25fZ3Bpb19n
ZXQ7CglwYy0+Y2hpcC5zZXQgPSBtZXNvbl9ncGlvX3NldDsKCgoKT2YgY291cnNlIHRoZXJlIGlz
IGFub3RoZXIgd2F5IHRvIGRvIGl0LiBEVCBjYW4gYmUgd3JpdHRlbiBsaWtlIHRoaXM6CglwZXJp
cGhzX3BpbmN0cmw6IHBpbmN0cmxANDAwMCB7CgkJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGE0LXBl
cmlwaHMtcGluY3RybCI7CgkJLi4uCgkJZ3Bpb2U6IGJhbmtAMCB7CgkJCS4uLgoJCX07CgkJZ3Bp
b2Q6IGJhbmtAMSB7CgkJCS4uLgoJCX07CgkJZ3Bpb2I6IGJhbmtAMiB7CgkJCS4uLgoJCX07CgkJ
Z3Bpb3g6IGJhbmtAMyB7CgkJCS4uLgoJCX07CgkJZ3Bpb3Q6IGJhbmtANCB7CgkJCS4uLgoJCX07
Cgl9OwoKQnV0IHRoaXMgc3RpbGwgcmVxdWlyZXMgYSBsb3Qgb2YgbW9kaWZpY2F0aW9ucyB0byBw
aW5jdHJsLW1lc29uLmMsCmJlY2F1c2UgcGluY3RybC1tZXNvbi5jIHdhcyBvcmlnaW5hbGx5IGRl
c2lnbmVkIGZvciBvbmUgZ3Bpb2NoaXA6CglzdGF0aWMgaW50IG1lc29uX3BpbmN0cmxfcGFyc2Vf
ZHQoc3RydWN0IG1lc29uX3BpbmN0cmwgKnBjKQoJewoJCS4uLgoJCWNoaXBzID0gZ3Bpb2NoaXBf
bm9kZV9jb3VudChwYy0+ZGV2KTsKCQlpZiAoIWNoaXBzKSB7CgkJCQlkZXZfZXJyKHBjLT5kZXYs
ICJubyBncGlvIG5vZGUgZm91bmRcbiIpOwoJCQkJcmV0dXJuIC1FSU5WQUw7CgkJfQoJCWlmIChj
aGlwcyA+IDEpIHsKCQkJCWRldl9lcnIocGMtPmRldiwgIm11bHRpcGxlIGdwaW8gbm9kZXNcbiIp
OwoJCQkJcmV0dXJuIC1FSU5WQUw7CgkJfQoJCS4uLgoJfQoKClRoZSBhYm92ZSBhcmUgdGhlIGlz
c3VlcyBJIGtub3cgYW5kIGhhdmUgY29uc2lkZXJlZC4gQmVjYXVzZSBpdCBpbnZvbHZlcwphIGxv
dCBvZiBtb2RpZmljYXRpb25zLCBhbmQgd2UgYWxzbyBuZWVkIHRvIGVuc3VyZSBjb21wYXRpYmls
aXR5IHdpdGgKb3RoZXIgcGxhdGZvcm1zLCB3ZSBkbyBub3Qgd2FudCB0byBkbyB0aGlzLgoKVGhl
cmUgYXJlIG1hbnkgaGlzdG9yaWNhbCByZWFzb25zIHdoeSBBbWxvZ2ljJ3MgUGluY3RybC9HUElP
IGRyaXZlciBpcyBzbyBsb25nLgpJIGhhdmUgYmVlbiBjb25zaWRlcmluZyB3aGV0aGVyIHRvIHJl
ZmFjdG9yIEFtbG9naWMncyBQaW5jdHJsIGRyaXZlciBmb3IKYSBsb25nIHRpbWUsIGJ1dCBJIGRv
bid0IGtub3cgd2hldGhlciB0aGUgY29tbXVuaXR5IHdpbGwgYWNjZXB0IG15IGRvaW5nIHNvLgpJ
ZiBBbWxvZ2ljJ3MgZHJpdmVyIGNhbiBiZSByZWZhY3RvcmVkLCB0aGUgZHJpdmVyIHdpbGwgYmVj
b21lIHVuaXZlcnNhbC4KVG8gc3VwcG9ydCBuZXcgcGxhdGZvcm1zLCB3ZSBvbmx5IG5lZWQgdG8g
YWRkIHRoZSBwaW5jdHJsIG5vZGUgdG8gdGhlIERUCm9mIHRoZSBuZXcgcGxhdGZvcm0sIHdpdGhv
dXQgaGF2aW5nIHRvIGFkZCBhIGMgZmlsZSBhbmQgaCBmaWxlIGFuZCBjb21wYXRpYmxlCmV2ZXJ5
IHRpbWUuCgpJZiBJIGNhbiByZWZhY3RvciBBbWxvZ2ljJ3MgUGluY3RybCwgSSB3aWxsIHByb3Zp
ZGUgYSBuZXcgdmVyc2lvbiBvZgpQaW5jdHJsIGRyaXZlciB3aXRoaW4gdGhpcyB5ZWFyIGF0IHRo
ZSBsYXRlc3QuIElmIG5vdCwgd2UgY2FuJ3QgdGhpbmsKb2YgYSBiZXR0ZXIgd2F5IHRvIG1ha2Ug
dGhpcyBwYXRjaCBiZXR0ZXIuIFdlIGNhbiBvbmx5IGRvIHRoZSBuZXh0IGJlc3QgdGhpbmcKYW5k
IHJlbW92ZSBhbWxvZ2ljLGE0LWFvYnVzLXBpbmN0cmwuaCBhbmQgYW1sb2dpYyxhNC1wZXJpcGhz
LXBpbmN0cmwuaApmcm9tIHRoZSBwYXRjaC4gQWx0aG91Z2ggdGhpcyB3aWxsIG5vdCBhZmZlY3Qg
dGhlIGZ1bmN0aW9uIG9mIFBpbmN0cmwsCml0IHdpbGwgbm90IGJlIGFzIGVhc3kgdG8gdXNlIGFz
IGJlZm9yZS4KCkZvciBleGFtcGxlOgoJV2hlbiB0aGVyZSBpcyBhIG1hY3JvIGRlZmluaXRpb246
ICAgZ3Bpb3MgPSA8JmdwaW8gR1BJT1hfMTUgR1BJT19BQ1RJVkVfTE9XPjsKCVdoZW4gdGhlcmUg
aXMgbm8gbWFjcm8gZGVmaW5pdGlvbjogIGdwaW9zID0gPCZncGlvIDQ3IEdQSU9fQUNUSVZFX0xP
Vz47CgoKSWYgdGhlcmUgaXMgYW55IGJldHRlciB3YXkgdG8gZG8gaXQsIHBsZWFzZSBndWlkZSBt
ZS4KClRoYW5rIHlvdSBzbyBtdWNo77yBCgo6KQoKQmVzdCByZWdhcmRzLApIdXFpYW5nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
