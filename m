Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4200D32D8B
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 10:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQv6AUpFvlAxVRzAyqbimPesZOWvJ1jYuUZWLVxA6Mk=; b=wOeWAHwDQWDeX4yPiExAiooTCS
	HtwvpL+Ng9C8i7AIXYcvG0kSi/0F9oNiVm+h2SVJBFkxsydWf0RV2H9frLp0gN4yujr59hIkjDDnK
	wzSAi0JK7FUhgU2TxoC6fG7cDzKbJZ7sLa+78+hzLFe9DhsEzWLedZPIxVftazGTC78Wr6+ko76r2
	dVtP1ZESSwZGRJKxpOyXjW3aDfPjIZzixg8l/NXWlN/F4+i3iIucTPHx2JbHQI+7wcCPg3ReLp1Js
	t7ixB0rW4Y6kMKUbDfOwDjlyISeZ/HeNZeaZdAEP0/4GKt6vBB25MvyIy/uEIsYNOcWQu4bfOmzby
	KLBpentQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo0g-000000031Jc-43oB;
	Tue, 12 Nov 2024 10:20:34 +0000
Received: from mail-sg2apc01on20719.outbound.protection.outlook.com ([2a01:111:f403:200f::719] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnnN-00000002yIK-3k3E;
	Tue, 12 Nov 2024 10:06:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EN8noqVtqRz2Am9asJco8QKcHHHKVPnN3SZ4yHx6AyF0itGGWiNqnZK52citPWgOVHbjQY7ztzc/3i4S1OwHzo2M9lQFyEtX5uXtQs9P7CTcKIfJIjvHGU1d91ditb/ZNq62eMaUQEUOscGIcevDagBAW4jSOCCWJC7iXQHsRMHCkr+9P4WllEI2z/ttRUZ5OowPH0WKT375/JOJRuoHhJF4EC8tUa7Mx2SIDRacHo7YWFzGESNkhtUUNFrb7QJBFt9Pm3X3D9zJn0CRE2WqG/swTiudviJ/YmTSyeayK5EQI/rTww9xzV099WA/XbR1eEKVspKXQVcwIZCiJKXONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElOw7rmGWaS5t8u48irYFRYWBGV9o3J3e6tEOyR9Xdk=;
 b=tvrSBw9gL9pVvpZNjL4efOgbQ1lW3T0lPXpytl8myY+Ld6KNYindHXnccZpoRCpgF5MLILHW264ZL9ze/TApLafj/Y0zV3HZdiJ4nuPB6n/kn85mhGto4CrXTG07egh0o0aLoJmAxKMyT13gcb+JZofqy4WoWnUu2pNcK89fElf09XOsiBF6rRLEr8SxIPrO/XBw8rWPjkT6oS29w8/tc1XU3bf/OZOvGJTk7JBqDXo8PE6qBuI40a27aXWLCRJKQhKWlUJZq1hnRQ7NP7UTaC3ghW6h4su+c8GeIbGt1FqB/zUBzW9jYfokBh9sWY8pTIYu+LQOmQx1/hapMqHNvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElOw7rmGWaS5t8u48irYFRYWBGV9o3J3e6tEOyR9Xdk=;
 b=OmWAJm/iXEPSeFkWhEYsjDE/ONbZpj1jgIenbUeJd7jPUimiu7RBGwwMCvSs+zNCKpYCd/1pZuVAghGN2JmTAOU971/HojzscwQ1mBo+AxF8K2H2eQun/gQPPyj5CgtraFIJT0/IFCXlmjCPUO4PbzWIAWZ7h8MPezGneTfYRMtKF2snzKmz3IXxHg0ilj2i8DEz64p2op44kPWtPe9J2qHiR01STYEEE1lSHELzbdoN20SSlgCZgErDZTZATwXMFWtmu7kt2qZxdiLkoH41uuYObYi3k15zGY2UvMvrdA6J8DG242gmgDidkZXccfgPCBvyyQBgqYozKLmQGpho1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SI2PR03MB5786.apcprd03.prod.outlook.com (2603:1096:4:150::10)
 by SEYPR03MB7892.apcprd03.prod.outlook.com (2603:1096:101:166::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.25; Tue, 12 Nov
 2024 10:06:38 +0000
Received: from SI2PR03MB5786.apcprd03.prod.outlook.com
 ([fe80::3f37:cacc:420b:9b86]) by SI2PR03MB5786.apcprd03.prod.outlook.com
 ([fe80::3f37:cacc:420b:9b86%3]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:06:38 +0000
Message-ID: <f8c3b6e7-2f5d-493e-8254-2a27623f0d2e@amlogic.com>
Date: Tue, 12 Nov 2024 18:05:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: core: refine disable unused clocks
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <1jcykltj7g.fsf@starbuckisacylon.baylibre.com>
 <20241004133953.494445-1-jbrunet@baylibre.com>
 <07594a59-c999-4592-84b8-4e163d3edba4@amlogic.com>
 <1jttci2k8k.fsf@starbuckisacylon.baylibre.com>
 <85aae140-5c9b-4ff9-a522-549009f62601@amlogic.com>
 <1jcyj62gi7.fsf@starbuckisacylon.baylibre.com>
 <5eb12197-330c-4f55-82f7-d13ea458ba43@amlogic.com>
 <1j4j4c3l2n.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1j4j4c3l2n.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To SI2PR03MB5786.apcprd03.prod.outlook.com
 (2603:1096:4:150::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR03MB5786:EE_|SEYPR03MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 66480c75-284c-4ca5-5189-08dd0301b267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjhwRGRqbjdXeXJvUDJlVEM2MjdVNVVoRStUVml6eVcybWJKWWdFWWZmaTdF?=
 =?utf-8?B?YzNxQXBUeFBsOXlXdGVUUkZQS2g2eDN5NWZoSkM1MXBkZERUaVhhNjY1M1hS?=
 =?utf-8?B?SVg0cE42OHVpQ1NDSjhEQXVkdHcxUWY5ZnFYdzdxMWhLM2hvSkVKT1FIUTNi?=
 =?utf-8?B?cklVL01xVm1jN0xCWWJJU2dsYzNxU0ZYeG4xYlowVzRzR2xOcmZoRndReXow?=
 =?utf-8?B?cEwvZjJ3ZHpuc1dJamRmb1RwMGJVWTYwOWQ5REd6RVhYN3ByVk9JSDYwcTVk?=
 =?utf-8?B?bWJ3YWUyYU9QdXVKZWY3ODJpRDBxZjlYVlI0U1J2M0lxeVpyVStGT3VDbEk2?=
 =?utf-8?B?QW9NK01Nd2lhbm5ZdnIvS1dFaUNqZjdDZGk5My9jZTVPZFZ3VmJSdXJMUU41?=
 =?utf-8?B?b3I2d2czNHpQeFFudmluQXZJSG8rMUw5ZXVNaDUzWEpNZmhIYnBKM1dhcllY?=
 =?utf-8?B?cTM4UnRyVGpubjkvV0dsZGV5SjlHQnRrZ0NQdDdhSGdoT3c3MVdITERXSXht?=
 =?utf-8?B?TFNuZTRiMUpMbmprY1pGd1lqalVIbWs1RUhHeXRrOTZsTFJTWFR6bWNrMGRs?=
 =?utf-8?B?ZXFiVDlVSEdJRStkRVAveStiaWZiczNUL1c2SW9HRllzcGVqKzJqaWdUMHFy?=
 =?utf-8?B?U1A5YmZDQVpxbEp3U092UkJjV2tRY251WENCd0F2ai94aWFndDRPVzZOL0pU?=
 =?utf-8?B?NFI3MlpaWXNNMUQvNm1qYW5XV2hqVGFxNnZmUXFiakdCVTR1eGlEbkszTk1i?=
 =?utf-8?B?U1hwQ05SZys2bVlPTlhaZW5XcFdOWnNQK010WU14bUJSZjBTOFhPa0pabUF3?=
 =?utf-8?B?bmJweHNOenhMMnY0V1Yvdld3ekx3TjFIRzArSVE5MVZHS2RnTkdhemt3aU83?=
 =?utf-8?B?UU9iZlIvM21pK0lBaVVkWUFxUGgzd1lqNFBEYm1aMGYzZnV6NFJHZHNVS3Q1?=
 =?utf-8?B?Nnc3TUk3cDN3YzZINGdkRmJ3cjNTRlBncWFLT0RoZ2hpdjc3QlRpL1ovZWRT?=
 =?utf-8?B?dVc3TXVUWUJVc3NFTTgrTHkrbHJVUTNwallJa1IwaWZoNSthWGhqZGxKTFg4?=
 =?utf-8?B?dVY3SGp4dGFWWGdIaGlNL3ZPZ0FYdnR0UnN3U0tERm5LMElKTVUvc3R5N0pX?=
 =?utf-8?B?S0J4VzFwS2pNQmdRL1pBb1oxcGRaekFyRmdTdTVlUU9GNkc5MjExQitRN09M?=
 =?utf-8?B?aWpad3pMK1ZPNDZlVzhNbTd5VTljWDd2Um5rcUxpR044VjVUc0dFOXBEQWFx?=
 =?utf-8?B?ZWNCVGQ3MXIwTERTUUJ1YkhXRkZxaHV5NzFURjA5djhuN2x6QnMreHg3aHBD?=
 =?utf-8?B?bHRjMEtMcFQwRVFSR2NFdUJoZHJncjdtQ29weTNmUllVU1ZsWGQ1UytoeVky?=
 =?utf-8?B?QzJaejRnbFZIWjJpSUtuRENNbksybEJNRzA1TmRHNEZFYUp4TzNYM1NRK3BJ?=
 =?utf-8?B?eWRIMDVSMkpJNjlqMEhPY1BSeDVLMWlHa0M0bEpUQ2VXMmJ2akwvb2xTLzFw?=
 =?utf-8?B?K0FnQzNlQ09FazNRellsNjBBdE1TMnhMZ0FOeTRKeDlTUGZHaGFvY0ROVW1h?=
 =?utf-8?B?UDJvblAxTUdYV2NJcjdsYUVpZWJTamJOYjVOcTBmM0lyWnZQZ3lycnJXV2dN?=
 =?utf-8?B?OHQ0cWgxU05RK3hXTmw2b3FUZ1ZzdFpaOXE3YTRZckxMYnp3Y0hBS0k5OVBs?=
 =?utf-8?B?K0UxdjZzendVSFBKSUkzaGdSbE4xaWNPR2Z5RWluUklCeVRuaGZYbEl5WGNU?=
 =?utf-8?Q?cciV+gvX4FOPcJjLchrv1ARMP4myCtjZtvG/dL2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5786.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmZ3OTZlMW5uSVFrNjF0eEdtdkZxakRWRmU1SEowcmp5ZkhJT2x3N05obXd4?=
 =?utf-8?B?YzlPLzdaYnB1UW1ybkhqUUpHbzJtWXIxUnNXZDZKR3A5N0Jham1LNXZpemVO?=
 =?utf-8?B?cnpsR053dzJYVlBFQW5SQVVSTnNCOGxURkpaYlcySURRRHJncEZ1cUpVVXY0?=
 =?utf-8?B?WXg1ZzcyQ294ZFdsM016ZENSbEh6T2ZRblArRk5WRytZVHBTNjVpaFpVNXk0?=
 =?utf-8?B?TDB1RzNBdVovTW03K3BabS8xY0tIRFhFcjJWWG9relp1K0d5OE5BZCtFaWVm?=
 =?utf-8?B?dUpydVlzdFBZVWtOb1IrbDdLeXFWNEpMV01JZG9GdHdqTlZJWG5xS1dRMEE0?=
 =?utf-8?B?bFc0U1c3aVczUzRrNk9DdXhZRmFEemw2NndLSTY1NXp6RTMzVWM0b0c2eVd4?=
 =?utf-8?B?L3pkMTFWMXBkSWowNUZxT2FncTU2d2Izd3Z4cnJYM1hucVpGN3N0UjBNM2li?=
 =?utf-8?B?T25jeWQrNkxDTmRTTUpSYUpxaVZpOG94RHdnVUdtYVp6WEo3V3N3YVBIOW44?=
 =?utf-8?B?RW83SWJ3aFRWa1lPUWQ3R2g4Z1pZWWFvbUkyR1VFajRtV0hHRXZlV2pIcnd3?=
 =?utf-8?B?T1VzbjhzdExnRVNlT3FKRWFnaTZ2NTc4emUwRDdOdHR4c1BYYUV1Q21rbEtu?=
 =?utf-8?B?SUFFODQ4aml1WGxDNVp1alpzL1N5UmJhUTZOWDdvMzBsSXViNkR5eGN2WnZK?=
 =?utf-8?B?UmFMQit1RUdwRzVaVlNYd094YTk5SzlmUGcvNDZUeDFRdWtLVHVXUVllMkdt?=
 =?utf-8?B?dk96UVdBMkx0RXZORVZ1Szl0TFFFakpWRlh2MlNpaXhHaDZGUC85Mk9sYzY4?=
 =?utf-8?B?UHRjNG82Tlk0WG1wbnNEd2ErS3lCN1NUZDZiSDJIenBxbUNEbmxLRytMYktq?=
 =?utf-8?B?WTRqL2x3YzFyQ1N0Uk5mZkJlNStTQWVFeVg1WmJRZmp0TDZtMUxwa2dpWVRV?=
 =?utf-8?B?ZHdLcFoza09ldVhvRUQ2MGVTUUUyd2twNllSUWtRdnRhQUZSRmwxcjdyODF1?=
 =?utf-8?B?V2NVVCt6aHowSnBqZkg1cG56SzkyRFNKZ0pqQ05RMXpHQnY0ZW5rNjN3V1Qx?=
 =?utf-8?B?NG02K0N2U3ZSY3U4cGNBK3M0VFJrL1NMVkM3Z05WcTJVZndhSmZFazlYL1gy?=
 =?utf-8?B?RXRkQ3FlRlJMM2w1SnBYWVdacG1saDlkQ1pVbGZwME5jbFZJNWd3bmFZalZ3?=
 =?utf-8?B?QlM5aldNa2YwamdFNFFVMWVxMklUKzNJakxWdVo2a01hWURhbEdjZWNhQ3Bw?=
 =?utf-8?B?TU92Vy82cU1mSzFJRll3Q1lNTTh0Zjl0KytHbXlKL3I3dmJva0VqdXlRSE9v?=
 =?utf-8?B?N0JaWStBNTFJTXpHbk9FVTUvN2t4MlV0S2ZPd3BJZ0NXRlYyczZJUG9xb0xU?=
 =?utf-8?B?YmE5TUw2NXlja3ZjUkoybjVseS9lK3NWSXVHbGpTb3F2aEp5eHQwUVFWRHdS?=
 =?utf-8?B?eEs0b2ZFZ1Z2UzE3eGRKUUpOOWlrRVpBZUF4WXRwZ3dnMFQrSlVpQVNuQ1Ix?=
 =?utf-8?B?bndVZ1g4YzRnOHpjU3ROMmUrRmx5d2xwQUc5eFJtRHRmaVllV0NtbUdnRURQ?=
 =?utf-8?B?bFVsNW1ybjg1RDFKMXdaTkR4eVcxQm0vdUpCZ25zb1QrdzlOOVNWcC80aWds?=
 =?utf-8?B?UFhZY2pxZnBNZnBkNlZoeUpFRVJyK2pZT1VkUDNzUWpCRmZob0N0UzV3R2FG?=
 =?utf-8?B?b1NLdUFFQ042S01PV25rSldrSlUvT1VjVGlia0EyMjE5dldENUVFT29kaEc0?=
 =?utf-8?B?SmZ0SUNMeElETE9CVUd4K1YxSmQ0NFpDeXpESzVoMldWTkh5ak1oaENjTU0v?=
 =?utf-8?B?ZTk5djhLUDRNb01jemR2K3NWTTRPTk1QaXBTcjRUMWlTV0pqdHhVNXBjUFl6?=
 =?utf-8?B?TVpGT0p6Q0ZyVGZFWnJxeEhvMnJkU0xrV1d3cEQ2U2xmdzBES3JGQTFxekVX?=
 =?utf-8?B?NkpjTDJwT211aTk3UmtpUXRpdms5ZjdycCsyM2w2Rm8rc2ExYjJhL3RDNmpy?=
 =?utf-8?B?amtrQ1U1N3Z2RENJRERXRjBFQi9iS1NzUjNhZzZWK3RFUGw4cjM3SGN5dFZQ?=
 =?utf-8?B?ZnZEL1MvSDlxWldOQWd0QS9KK1YzWUpHVzhZSnhJUXJ3alZaYmJGalkyRmFK?=
 =?utf-8?Q?K2n0angc3NXoDi7P+9iHBQM9L?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66480c75-284c-4ca5-5189-08dd0301b267
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5786.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:06:38.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwXPwkSUxe7PQTjsdkP+jwNWs+E8nW7MMxQZz3Iu4FePoCYdoReAAjEHhxiTWQHFL4wLuMjClxIeHKxV2Cf7Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_020650_141856_4003FBF0 
X-CRM114-Status: GOOD (  19.61  )
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

Ck9uIDExLzEyLzIwMjQgNDozNiBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVYVEVSTkFM
IEVNQUlMIF0KPgo+IE9uIEZyaSAwOCBOb3YgMjAyNCBhdCAxOTo0OSwgQ2h1YW4gTGl1IDxjaHVh
bi5saXVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Cj4+IE9uIDExLzgvMjAyNCA1OjU5IFBNLCBKZXJv
bWUgQnJ1bmV0IHdyb3RlOgo+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pgo+Pj4gT24gRnJpIDA4
IE5vdiAyMDI0IGF0IDE3OjIzLCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4gd3Jv
dGU6Cj4+Pgo+Pj4+Pj4+IC0gICAgICAgaWYgKGNvcmUtPmZsYWdzICYgQ0xLX0lHTk9SRV9VTlVT
RUQpCj4+Pj4+Pj4gKyAgICAgICAvKgo+Pj4+Pj4+ICsgICAgICAgICogSWYgdGhlIHBhcmVudCBp
cyBkaXNhYmxlZCBidXQgdGhlIGdhdGUgaXMgb3Blbiwgd2Ugc2hvdWxkIHNhbml0aXplCj4+Pj4+
Pj4gKyAgICAgICAgKiB0aGUgc2l0dWF0aW9uLiBUaGlzIHdpbGwgYXZvaWQgYW4gdW5leHBlY3Rl
ZCBlbmFibGUgb2YgdGhlIGNsb2NrIGFzCj4+Pj4+Pj4gKyAgICAgICAgKiBzb29uIGFzIHRoZSBw
YXJlbnQgaXMgZW5hYmxlZCwgd2l0aG91dCBjb250cm9sIG9mIENDRi4KPj4+Pj4+PiArICAgICAg
ICAqCj4+Pj4+Pj4gKyAgICAgICAgKiBEb2luZyBzbyBpcyBub3QgcG9zc2libGUgd2l0aCBhIENM
S19PUFNfUEFSRU5UX0VOQUJMRSBjbG9jayB3aXRob3V0Cj4+Pj4+Pj4gKyAgICAgICAgKiBmb3Jj
ZWZ1bGx5IGVuYWJsaW5nIGEgd2hvbGUgcGFydCBvZiB0aGUgc3VidHJlZS4gIEp1c3QgbGV0IHRo
ZQo+Pj4+Pj4+ICsgICAgICAgICogc2l0dWF0aW9uIHJlc29sdmUgaXQgc2VsZiBvbiB0aGUgZmly
c3QgZW5hYmxlIG9mIHRoZSBjbG9jawo+Pj4+Pj4+ICsgICAgICAgICovCj4+Pj4+Pj4gKyAgICAg
ICBpZiAoIXBhcmVudF9lbmFibGVkICYmIChjb3JlLT5mbGFncyAmIENMS19PUFNfUEFSRU5UX0VO
QUJMRSkpCj4+Pj4gQXQgZmlyc3QsIEkgY291bGRuJ3QgZ3Jhc3AgdGhlIGxvZ2ljIGJlaGluZCB0
aGUgJ3JldHVybicgaGVyZS4gTm93IGl0J3MKPj4+PiBjbGVhci4gVGhpcyBhcHByb2FjaCBpcyBl
cXVpdmFsZW50IHRvIGNvbXBsZXRlbHkgZ2l2aW5nIHVwIG9uCj4+Pj4gaGFuZGxpbmcgY2xvY2tz
IHdpdGggQ0xLX09QU19QQVJFTlRfRU5BQkxFIGZlYXR1cmUgaW4KPj4+PiBjbGtfZGlzYWJsZV91
bnVzZWRfc3VidHJlZSgpLgoKUmVmZXJyaW5nIHRvIHRoZSBzaXR1YXRpb24gb2YgJ2Nsa19jJyBi
ZWxvdywgY29tYmluZWQgd2l0aCB5b3VyCnByZXZpb3VzIGV4cGxhbmF0aW9uOgoKKiBLbm93aW5n
IHRoZSBwYXJlbnQgc3RhdHVzIGFsbG93cyB0byBzYWZlbHkgZGlzYWJsZSBjbG9ja3Mgd2l0aAog
wqAgQ0xLX09QU19QQVJFTlRfRU5BQkxFIHdoZW4gdGhlIHBhcmVudCBpcyBlbmFibGVkLiBPdGhl
cndpc2UgaXQgbWVhbnMKIMKgIHRoYXQsIHdoaWxlIHRoZSBjbG9jayBpcyBub3QgZ2F0ZWQgaXQg
aXMgZWZmZWN0aXZlbHkgZGlzYWJsZWQuIFR1cm5pbmcgb24KIMKgIHRoZSBwYXJlbnRzIHRvIHNh
bml0aXplIHRoZSBzaXRhdGlvbiB3b3VsZCBicmluZyBiYWNrIG91ciBpbml0aWFsCiDCoCBwcm9i
bGVtLCBzbyBqdXN0IGxldCBpdCBzYW5pdGl6ZSBpdHNlbGYgd2hlbiB0aGUgY2xvY2sgZ2V0cyB1
c2VkLgoKRG8geW91IG1lYW4gJ2Nsa19jJyBjYXNlcyBzaG91bGQgYmUgc2FuaXRpemVkIGJlZm9y
ZSBjbGtfZGlzYWJsZV91bnVzZWQoKQooc3VjaCBhcyBkdXJpbmcgZHJpdmVyIHByb2JlKCksIGV0
Yy4pPyBEcm9wcGVkIGluIGNsa19kaXNhYmxlX3VudXNlZF9zdWJ0cmVlKCk/ClRoaXMgaXMgYWN0
dWFsbHkgbXkgYmlnZ2VzdCBjb25mdXNpb24u8J+ZgQoKPj4+Pgo+Pj4gTm8uIEl0J3MgaGFuZGxl
ZCBjb3JyZWN0bHkgYXMgbG9uZyBhcyB0aGUgdHJlZSBpcyBpbiBjb2hlcmVudCBzdGF0ZS4KPj4+
Cj4+PiBXaGF0IGlzIG5vdCBkb25lIGFueW1vcmUgaXMgZml4aW5nIHVwIGFuIGluY29uc2lzdGVu
dCB0cmVlLCBieSB0aGlzIEkKPj4+IG1lYW46IEEgY2xvY2sgd2l0aCBDTEtfT1BTX1BBUkVOVF9F
TkFCTEUsIHdoaWNoIHJlcG9ydCBlbmFibGVkIGZyb20gaXRzCj4+PiBvd24gcmVnaXN0ZXJzIGJ1
dCBoYXMgaXRzIHBhcmVudCBkaXNhYmxlZC4KPj4+Cj4+PiBJbiB0aGF0IHBhcnRpY3VsYXIgY2Fz
ZSwgY2xrX2Rpc2FibGVfdW51c2VkX3N1YnRyZWUoKSB3b24ndCBiZSB0dXJuaW5nIG9uCj4+PiBl
dmVyeXRoaW5nIHRvIHByb3Blcmx5IGRpc2FibGUgdGhhdCBvbmUgY2xvY2suIFRoYXQgaXMgdGhl
IHJvb3QgY2F1c2Ugb2YKPj4+IHRoZSBwcm9ibGVtIHlvdSByZXBvcnRlZCBpbml0aWFsbHkuIFRo
ZSBjbG9jayBpcyBkaXNhYmxlZCBhbnl3YXkuCj4+Pgo+Pj4gRXZlcnkgb3RoZXIgY2FzZSBhcmUg
cHJvcGVybHkgaGFuZGxlZCAoYXQgbGVhc3QgSSB0aGluaykuCj4+IG5hbWUgICAgICAgICAgICAg
IGVuX3N0cyAgICAgICAgICAgIGZsYWdzCj4+IGNsa19hICAgICAgICAgICAgICAgIDEgICAgICAg
ICAgQ0xLX0lHTk9SRV9VTlVTRUQKPj4gICAgICBjbGtfYiAgICAgICAgICAgIDAgICAgICAgICAg
ICAgICAgMAo+PiAgICAgICAgICBjbGtfYyAgICAgICAgMSAgICAgICAgIENMS19PUFNfUEFSRU5U
X0VOQUJMRQo+Pgo+PiBCYXNlZCBvbiB0aGUgYWJvdmUgY2FzZToKPj4gMS4gV2hlbiAnY2xrX2Mn
IGlzIGNvbmZpZ3VyZWQgd2l0aCBDTEtfT1BTX1BBUkVOVF9FTkFCTEUsIGRpc2FibGluZwo+PiAn
Y2xrX2MnIHJlcXVpcmVzIGVuYWJsaW5nICdjbGtfYicgZmlyc3QgKGRpc2FibGluZyAnY2xrX2Mn
IGJlZm9yZQo+PiBkaXNhYmxpbmcgJ2Nsa19iJykuIEhvdyBjYW4gdG8gZW5zdXJlIHRoYXQgZHVy
aW5nIHRoZSBwZXJpb2Qgb2YKPj4gZGlzYWJsaW5nICdjbGtfYycsICdjbGtfYicgcmVtYWlucyBl
bmFibGVkPwo+IFRoYXQncyBwZXJmZWN0IGV4YW1wbGUgb2YgaW5jb2hlcmVudCBzdGF0ZS4KPiBI
b3cgY2FuICdjbGtfYycgYmUgZW5hYmxlZCBpZiBpdHMgcGFyZW50IGlzIGRpc2FibGUuIFRoYXQg
bWFrZXMgbm8KPiBzZW5zZSwgc28gdGhlcmUgaXMgbm8gcG9pbnQgZW5hYmxpbmcgYSB3aG9sZSBz
dWJ0cmVlIGZvciB0aGlzIElNTy4KPgo+PiAyLiAnY2xrX2MnIGlzIG5vdCBjb25maWd1cmVkIHdp
dGggQ0xLX0lHTk9SRV9VTlVTRUQsIGl0IHNob3VsZCBiZQo+PiBkaXNhYmxlZCBsYXRlci4gSG93
ZXZlciwgaGVyZSBpdCBnb2VzIHRvIGEgJ2dvdG8nIHN0YXRlbWVudCBhbmQgdGhlbgo+PiByZXR1
cm4gJ2ZhbHNlJywgdWx0aW1hdGVseSByZXN1bHRpbmcgaW4gJ2Nsa19jJyBub3QgYmVpbmcgZGlz
YWJsZWQ/Cj4gV2UndmUgZGlzY3Vzc2VkIHRoYXQgMiB0aW1lcyBhbHJlYWR5LiBUaGlzIGRpc2N1
c3Npb24gaXMgZ29pbmcgaW4KPiBjaXJjbGVzIG5vdy4KPgo+Pj4+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgZ290byB1bmxvY2tfb3V0Owo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgICAgICAgICAgLyoKPj4+
Pj4+PiBAQCAtMTUxNiw4ICsxNTQ1LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGNsa19kaXNhYmxl
X3VudXNlZF9zdWJ0cmVlKHN0cnVjdCBjbGtfY29yZSAqY29yZSkKPj4+Pj4+Pgo+Pj4+Pj4+ICAg
ICAgdW5sb2NrX291dDoKPj4+Pj4+PiAgICAgICAgICAgICBjbGtfZW5hYmxlX3VubG9jayhmbGFn
cyk7Cj4+Pj4+Pj4gLSAgICAgICBpZiAoY29yZS0+ZmxhZ3MgJiBDTEtfT1BTX1BBUkVOVF9FTkFC
TEUpCj4+Pj4+Pj4gLSAgICAgICAgICAgICAgIGNsa19jb3JlX2Rpc2FibGVfdW5wcmVwYXJlKGNv
cmUtPnBhcmVudCk7Cj4+Pj4+Pj4gKyAgICAgICByZXR1cm4gKGNvcmUtPmZsYWdzICYgQ0xLX0lH
Tk9SRV9VTlVTRUQpICYmIGVuYWJsZWQ7Cj4+Pj4+Pj4gICAgICB9Cj4+Pj4+Pj4KPj4+Pj4+PiAg
ICAgIHN0YXRpYyBib29sIGNsa19pZ25vcmVfdW51c2VkIF9faW5pdGRhdGE7Cj4+Pj4+Pj4gQEAg
LTE1NTAsMTYgKzE1NzgsMTYgQEAgc3RhdGljIGludCBfX2luaXQgY2xrX2Rpc2FibGVfdW51c2Vk
KHZvaWQpCj4+Pj4+Pj4gICAgICAgICAgICAgY2xrX3ByZXBhcmVfbG9jaygpOwo+Pj4+Pj4+Cj4+
Pj4+Pj4gICAgICAgICAgICAgaGxpc3RfZm9yX2VhY2hfZW50cnkoY29yZSwgJmNsa19yb290X2xp
c3QsIGNoaWxkX25vZGUpCj4+Pj4+Pj4gLSAgICAgICAgICAgICAgIGNsa19kaXNhYmxlX3VudXNl
ZF9zdWJ0cmVlKGNvcmUpOwo+Pj4+Pj4+ICsgICAgICAgICAgICAgICBjbGtfZGlzYWJsZV91bnVz
ZWRfc3VidHJlZShjb3JlLCB0cnVlKTsKPj4+Pj4+Pgo+Pj4+Pj4+ICAgICAgICAgICAgIGhsaXN0
X2Zvcl9lYWNoX2VudHJ5KGNvcmUsICZjbGtfb3JwaGFuX2xpc3QsIGNoaWxkX25vZGUpCj4+Pj4+
Pj4gLSAgICAgICAgICAgICAgIGNsa19kaXNhYmxlX3VudXNlZF9zdWJ0cmVlKGNvcmUpOwo+Pj4+
Pj4+ICsgICAgICAgICAgICAgICBjbGtfZGlzYWJsZV91bnVzZWRfc3VidHJlZShjb3JlLCB0cnVl
KTsKPj4+Pj4+Pgo+Pj4+Pj4+ICAgICAgICAgICAgIGhsaXN0X2Zvcl9lYWNoX2VudHJ5KGNvcmUs
ICZjbGtfcm9vdF9saXN0LCBjaGlsZF9ub2RlKQo+Pj4+Pj4+IC0gICAgICAgICAgICAgICBjbGtf
dW5wcmVwYXJlX3VudXNlZF9zdWJ0cmVlKGNvcmUpOwo+Pj4+Pj4+ICsgICAgICAgICAgICAgICBj
bGtfdW5wcmVwYXJlX3VudXNlZF9zdWJ0cmVlKGNvcmUsIHRydWUpOwo+Pj4+Pj4+Cj4+Pj4+Pj4g
ICAgICAgICAgICAgaGxpc3RfZm9yX2VhY2hfZW50cnkoY29yZSwgJmNsa19vcnBoYW5fbGlzdCwg
Y2hpbGRfbm9kZSkKPj4+Pj4+PiAtICAgICAgICAgICAgICAgY2xrX3VucHJlcGFyZV91bnVzZWRf
c3VidHJlZShjb3JlKTsKPj4+Pj4+PiArICAgICAgICAgICAgICAgY2xrX3VucHJlcGFyZV91bnVz
ZWRfc3VidHJlZShjb3JlLCB0cnVlKTsKPj4+Pj4+Pgo+Pj4+Pj4+ICAgICAgICAgICAgIGNsa19w
cmVwYXJlX3VubG9jaygpOwo+Pj4+Pj4+Cj4+Pj4+Pj4gLS0KPj4+Pj4+PiAyLjQ1LjIKPj4+Pj4+
Pgo+Pj4+PiAtLQo+Pj4+PiBKZXJvbWUKPj4+IC0tCj4+PiBKZXJvbWUKPiAtLQo+IEplcm9tZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
