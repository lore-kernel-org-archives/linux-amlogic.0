Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D522D41C0B
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2024 06:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asUd2BM5NCcBjnVjZbibTIq0xkznYkOW/rY6VcgGREU=; b=jZCOg3Px/twV5phh7D6MRCysKe
	Xzd17jVHvyUJkMLjnQXzG2Z0Zn535cIzJmLK+hcrHNS101M+K6OWG+Z7x3k8K6hdkTFAb5bQGmCVW
	tq81YXT37TB+wCsw2GGWUMJMQvOUFb2MvnmGrUSG+S12kT6DWqcXzZCVSjklzPToGx0ZwT3/U6s+X
	n6vgXGkHuZ9ThpICt2LWOxxKpZ0aMeIDBlB+T+WbrQt3PcT9e/WhA8kkBxyPPoul5hu6bijjBLKDu
	lnKEC4QFHE6k3Rblsy3IvToAZkm3daCMQAmlol/TCEs5SRRW/oVYUM2ykFi2olMognBiuCs4dnQ/I
	kjUo7XZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7J4-00000005wZe-1J06;
	Wed, 13 Nov 2024 06:56:50 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB7J1-00000005wYv-04pD;
	Wed, 13 Nov 2024 06:56:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtM4ivHIRRzPdbULriix/XfW4J8GOc0dmxQAneE/qtGM94umgmWAClEb7VHHwrOBPjmqoPlEpRmcM8ZKZ3orZWyQmHg7LhUFK5u/LcEX4ae6JhrYxJz/9KrHMz1exYEpIemoprDjE07R4CGByOVC4Hf2rcG/KoxS12W+jjfiXschaaUFzeqxKnGdFO9z3rdfV5552jHVa0rv3yPz6Uz5RVrjL/ttNWQbGzW+p3kjKLuOo4KxZSRv1NVX/MYeLrou2/a+njlU3JdjUj+b5TtJxiG4iKOpqiwambzEwlzJEevFdADlp9Qo7gNJ6ogJ4pvzAKOpvOwRR4BA+Cs982o0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUKN+fEuN4Y5I/RBQj0NdhTgdsXGIktrhT8DVNjjRO8=;
 b=AkBfexM0QCKqm95bN8jKayJJ5tVAF8FOWsWwAhJKC63uObLw9E8Vwe1admBRiRKACKilafoJJDjWrbd/typoIyNcaKNJWRl5zSNMZnFpoaL3xj+uz2QorsyNH7HVuH81HkGqq1XhAGwiTbJLdy/qKGXvKpTkWzRd/D044CW1tEuJU+Wcx0BtqZn9xPL23CrKUFkdCL9kdZl64oZBWgRQXd7l0kBagA8fcwYig/KgyZJYdaC2R015K5aDeZ675cESlhIqSm3m1rHu3WK7jbrh1dzeb40VIYctsQdHhHYRuZI04qKnWYa5peBv19DaetWO/DjRbAPOgisaP8RnZ+NA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUKN+fEuN4Y5I/RBQj0NdhTgdsXGIktrhT8DVNjjRO8=;
 b=gG3jeR1fWjgFnjvwQUrbqF7KCojPSE8m68LMAIfTtUthCKSq0wgcbH5DTza+6Ofyihy1xOnjufc77+yOHJeixEAzgCEHTDVV6w7bwpkkebuePGXQjtftuqgQXNYc8F/XpmMQOQq2cYuhL7jR14QcsV52nFgOD4fmdM3zhuF3sI9hsOgEWqsZlCZbjRUm154jXzCV22MP+0K7BRzE2+UdNPxV+jSZtSDaR5uKn9ZwKWlFez2Mro5JJB2Qn3wo+2WJEe5c6bAaPawRTEXUaohSpXEdzKERT7hGotFINLWD8B7QzZTPwBFTO/cNI+scQMkmVsMlJZZmNyp9G+4jvl3sdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB8497.apcprd03.prod.outlook.com (2603:1096:101:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 06:56:31 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 06:56:30 +0000
Message-ID: <da391fec-738a-4044-a598-fee1137dfa5c@amlogic.com>
Date: Wed, 13 Nov 2024 14:55:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: meson: Fix the determine rate error in
 clk_regmap_divider_ro_ops
To: neil.armstrong@linaro.org, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jian Hu <jian.hu@amlogic.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241112-fix_childclk_of_roclk_has_been_tampered_with-v2-1-64f8009cdf2a@amlogic.com>
 <35307d7a-a110-430d-9ba5-808a05450adb@linaro.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <35307d7a-a110-430d-9ba5-808a05450adb@linaro.org>
X-ClientProxiedBy: SG2PR06CA0236.apcprd06.prod.outlook.com
 (2603:1096:4:ac::20) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a007d4-8da7-4bb4-1a24-08dd03b04d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0I1M2xPTFhpUVRndTVWZHFYRHhqZ2xsL2VycVVxRStJUXc2c2xCd0hTZmJU?=
 =?utf-8?B?WUhZS3BZRi9vQ2lNN0J3YitsYjdHT1Zqa3dwMkdpZTR3bzNYQ3lCMVViZ0dr?=
 =?utf-8?B?d3VuenhzZldDcVo5WVU1a1JPM1lvTjhMYUhWbEN6eHVLSTZNT1FKcDZaY25l?=
 =?utf-8?B?M1lqUUd3OEFkSjhwYjdxRHNqVDhhc1dLa1AwbG5BbFlWckFGN3kvVEpOQ2Er?=
 =?utf-8?B?VDAvWmI5UDRNZUc4S3I3c2xoSlJFRm9ucklERnR2RFRUQzBNQ3B3QndyMlBl?=
 =?utf-8?B?MGF6amxSTThSOTVLQ1NHWTZzbWQ3RWE2SEtleDlZTFNaOGhwSUthVSt6czhL?=
 =?utf-8?B?aXVLRC9WT2tzYVFxVEh0cUVWWkVEVXhMNElZeWZLaVZHS05XVFhMSzhYT3JU?=
 =?utf-8?B?bTdmU1RkWis3YkE3dXMzVmsxLzNJams1L1RYTC9TWVhHUTRSMW83aGdKRGJa?=
 =?utf-8?B?cSsrUHNaQVZVVEpIb3RoeHUwREN6b0VzT21sa0hwUDg1VnIzRE5qdEhWRXVF?=
 =?utf-8?B?eDlVeUVhRCtkSWpRWEtOZnRLRkVkcnNkeEtFaEtPSTBlRlVQNDVjVzFVTWZv?=
 =?utf-8?B?amQwK3ZkUVlVZjV6d1gzSmcyU2hqUHliUXpwTnlCdUlBdHNxbEIwWVljSEhD?=
 =?utf-8?B?Z1lieThDVW1CdFlITFJrdERtMDY3TFNSeEZydDVGRVYxSDlVcFNLbnRMQzNp?=
 =?utf-8?B?Nk1sNlFMcWFmY3Mwdk5kQ1hFcTBTK21XbXZqTGhNem1wS1Z0SStlRG1QMWpk?=
 =?utf-8?B?RC9pSGNHZGZHVUFoSW5ETEhLV0FXWkhndDRjSThBdTZjQ1kyNEdjMUtWaTJC?=
 =?utf-8?B?REpsdnJ3VEVFcXJsUHJjUzhGZ201enlmSjZXaEEwN2cxb1E4a0ZhTEVhSTFh?=
 =?utf-8?B?MFFqWFFtUk82UklXM0ZjVjZOb01wQVFuMDdUR0dEb2EwZDZRWHl0aGYwcmph?=
 =?utf-8?B?b1hCOUNXVUJvZUVPRHZJU3V3TS94MWcrQ0VtU2FEZ3gzVW42UkNrUU0xdjhv?=
 =?utf-8?B?a1YzT2hFYk1TNHhwWnpqV0VONHNmcnRyczRpQW9VQXF1cVVKdHpzc1cyNUx0?=
 =?utf-8?B?QWtJS2p3bHAvUDVnd3c5YnRaTnZBTlhmMjhJbnJWa2hCQWRaYit5ZXl2cDBT?=
 =?utf-8?B?WklzNHJWZWRrSGVSVnIzOUZYN2pyTVAzRDBMRS8xQWYvT1c3aWZFN3BYK1ZR?=
 =?utf-8?B?MTNhOVNGRWh2OTVMUTdveFo4Tkdpd014TElDbnQ4Sm55cWhxdUlkR1dFZElW?=
 =?utf-8?B?ejJxdkpjVXpGTnJoSnByUnZTdldobG9zdHc3K2M1dVBUYUNtVW5zT2RoMU03?=
 =?utf-8?B?b3dZd0VqNk9JRWRpQ2hDS1kxaWllV2JDWW1icGZpYm96Z3NaWmpaSldyNmdP?=
 =?utf-8?B?VlJ4dEovalFzSGU4R0hid0YyQ25jQWl5WnJrbm9DcWxIdno3K2lUZkJibmFN?=
 =?utf-8?B?bHRqMVBCY2pXNlN3Qjh6dEZrT1VqLzRlZ0V3SVRDem9ZRU83bjJlOXNsVWhI?=
 =?utf-8?B?dmdQdHdpSitYT0FwNUh0NjF1UElnMjYwM1kwYnFrRFFFN0tzTWNtOW1KU0l0?=
 =?utf-8?B?MDFnYzMvRGQzTTVKWFhSU3RKck5yZmVoV3I3NFdHRTl5WVFZOE1nQUZXUDdn?=
 =?utf-8?B?aVZvb1ZvM292S1B3NmRQMG42M0hTakp5Q3U4MnhoSEtPUi9oL0FpTW93YURy?=
 =?utf-8?B?WTlNWTg0eGN3R2E1cDB3dWxSaWhLVTQweU5HRGx2aHJxWjMvbFloZ2hkQ0NB?=
 =?utf-8?Q?Gx5cj1M52Ot63db6DAVsrMjkOT4a0xQD9jTgmYy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Szh0L0V4ZEdvS1BQNXBRVWN0VkNabnJoSDFOLzB2Z2RmdXhtaGd3M1FHbkk1?=
 =?utf-8?B?Y3BMR3grN05lcGc5Ukl1MGwrR0swMkJ0d2l0UkthRUpPaG5DVDhkcjRpeDF6?=
 =?utf-8?B?UjBYaURSL3ZuNTIvYmZWSi9aa3BGeHdVRWo3YjNkSjJQRW9EemRLVEF2bkU0?=
 =?utf-8?B?UkdDaHQ2RUprTk03SDhPSEp2Zko1a1BsK3VuOC9CREcyaCtJWHRlbUMvb2x6?=
 =?utf-8?B?dFBxZEtwVG9RTDQybm1ObFVpZ011Wk9OeDZHbEpFektjNDN6c0RwbmFWcVVk?=
 =?utf-8?B?bmhaemxJK0hNcHNRcVNOMkZibW1YV2hUb2F4YitTVnRPR0RIOVp4RThKVnFU?=
 =?utf-8?B?TWFOekdQYitkNEFvZFBZVlBoMFl6QmNDS2s4bzdTV1gzQThVSncvMk9keFRy?=
 =?utf-8?B?dTNRUlljZlJuc0d1VmZaSXZlUmtGY1lNdUFFYmVQTVp5Ukc0WXFHK3Y5c2hu?=
 =?utf-8?B?OVMvK0NyZ2hRRjl3U0dtNU9yalBwclA3Y3lWUzIwMDkzWjdUaVJyRXp5RmRo?=
 =?utf-8?B?YzQ0UTdRcGxnU1dpa2hyWWhMS1VvTVh6VHU5NFc0bEIxVDlGd1hCVzgrNEkw?=
 =?utf-8?B?OUZ4MEdoRm5WRzQ5YTN5NTNoMFZka1pwU0ErVitvTnRjY25FVUZWZUVZUlFj?=
 =?utf-8?B?OGhUZTRoZXhsaFV3dVBZNW8rcFlPendrbk5rMXVPUHUzSHk4cjhzM3I0Q0U0?=
 =?utf-8?B?N1V0UW01S2pLQ3ZtMkFZdEJIY3R2RjFpZzNjM29QV0UxTXpTVmhrNXFISDMz?=
 =?utf-8?B?U1lUZmlwR2NGaHVnTzEvTE83Sk9MZ1pqWkJGdktpN1dEeTF5OW5EbHJmSnFB?=
 =?utf-8?B?TjloTHkyby9GcmRscTZzSk1vZnpWRXZWUzRRRlBrQ0Z3OW40MERvUGp4bjA3?=
 =?utf-8?B?ZlFuVHdFTTRFbXBnb3VUcS9PNHgyWGxwOG1BUWIyMXNRaWNTWUxrNkR3b2ZR?=
 =?utf-8?B?OC93WmkrRjg5ZlA1M2ZFMUNoTVJIU205c2F2RmdRdWxSYnNPenoxR2RoWThN?=
 =?utf-8?B?T0hJRXpycERKRGxUb29XOWhWbkU4bmtXN2RJdFJvSXMyL2VUZWdLSHlUcjRy?=
 =?utf-8?B?ZHppaklEdlRYZGM4NEgrRFpZT2ZwZjEyOHlIeTZaMDdSNWxsS3FHdFFkeU5y?=
 =?utf-8?B?eDZ1NmprdmNidjJJWXNpckN3VCs2N0laeHg4ckppY2t4czhKcEFFSU1UQUVi?=
 =?utf-8?B?MnpkS3d1Nzg1bjg0N1Z2aTFpdjZTMHJkaTdpNXdaWENvaGZRSUoyeHBvc3RV?=
 =?utf-8?B?NGtjeUNldXkvcE0wNWJIVWw4UXRyOTBxWDNrbTJFZ3d5VXlrUHVsK1M0eEc0?=
 =?utf-8?B?Z2c5b2tNNnFVZlZOTnNGVlVaS0NVWlE2VDFVU1BLeFU2dU8vNUVMczVxd01N?=
 =?utf-8?B?M3plditxbUpCaVZhQVNXdVRpVWNoMzVPRm9taE8xWnJOQVJnK1lVNitMaDFI?=
 =?utf-8?B?Mk1MRElucGFmZytWSlRxRnpwdTlHSnowaGN2V005MkU0MEo0dmQ4L1FwdThV?=
 =?utf-8?B?YUo1NzU5N21idDBoNEZYUVJYcElseEZRSmdDVkRSV2hwakgrcno3QnBvUlp3?=
 =?utf-8?B?RmhlUHhRbHY3T3N5K1hOOFpjMFZEUzl4eTk5M0pGVENHcEhHdkhscitZK2dW?=
 =?utf-8?B?L29rMFVlS29VRWV1eGtnOGM1eG1wUjRiRFgwL3grbDVMMFdZKy9nRUtNRjBo?=
 =?utf-8?B?NjJ5Zk1Yc3B2MDhtdER1MXNtdjYzL1B1VDR1TkY3OHo4UnFMU3FwL2xDb0ND?=
 =?utf-8?B?MjRDTkl4Zmk4Tm56LytMcWUwZDhFQm43OEhWME5DQlEvWTB2WGZHeHlrZ0Ji?=
 =?utf-8?B?Q0hFaFVmWGdZK1hQZGFEbzNIb05CUWNPNlE3UzZsNmVXME9GeTg2YURtWSsv?=
 =?utf-8?B?NDlNSkxvNlNtN2d4K0tEV01zWWQ2ZkJkcHRKVXZjU2VZMTJZdDRlNWZydTNQ?=
 =?utf-8?B?RFhlbzlzcmR4clZtRkZnM2RQNlMyR05ydHlzVEhpbWZaRzdlQVlsc3ZFZEsv?=
 =?utf-8?B?WVdGMFAxZHczTUJ6VHJYQmxCeisrRW5wNXFPWHlRN3BIOEVIL3RaV2ZBWnFX?=
 =?utf-8?B?bFE3dlVLd1Y0YVVMcDZveHhucElpeDZQWkt3UEJCQk5uWVpia2ZzNnI5NFZV?=
 =?utf-8?Q?6IPnVsF9iLS5s6CTG+BHr+NLl?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a007d4-8da7-4bb4-1a24-08dd03b04d8a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 06:56:30.8439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzZn16BuZfwRByk/QX8tG96glUu4+zux5Z64lCCtVq+9sfRR5QcPU+v54MW/WCl27vRcyNq/JRqHZBUgeqcD7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_225647_224653_BB1DC335 
X-CRM114-Status: GOOD (  19.63  )
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

Ck9uIDExLzEyLzIwMjQgOToyNCBQTSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gWyBFWFRFUk5B
TCBFTUFJTCBdCj4KPiBPbiAxMi8xMS8yMDI0IDEzOjU3LCBDaHVhbiBMaXUgdmlhIEI0IFJlbGF5
IHdyb3RlOgo+PiBGcm9tOiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KPj4KPj4g
VGhlIHJhdGUgZGV0ZXJtaW5lZCBieSBjYWxsaW5nIGNsa19yZWdtYXBfZGl2aWRlcl9yb19vcHMg
d2l0aAo+PiBjbGtfcmVnbWFwX2Rpdl9kZXRlcm1pbmVfcmF0ZSBpcyBub3QgUk8sIHdoaWNoIHdp
bGwgcmVzdWx0IGluIHRoZQo+PiB1bmV4cGVjdGVkIG1vZGlmaWNhdGlvbiBvZiB0aGUgZnJlcXVl
bmN5IG9mIGl0cyBjaGlsZHJlbiB3aGVuIHNldHRpbmcKPj4gdGhlIHJhdGUgb2YgYSBjbG9jayB0
aGF0IHJlZmVyZW5jZXMgY2xrX3JlZ21hcF9kaXZpZGVyX3JvX29wcy4KPj4KPj4gRmlleHM6IGVh
MTFkZGE5ZTA5MSAoImNsazogbWVzb246IGFkZCByZWdtYXAgY2xvY2tzIikKPj4gU2lnbmVkLW9m
Zi1ieTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiBCYWNrZ3Jv
dW5kOiBEdXJpbmcgdGhlIGV4ZWN1dGlvbiBvZiBjbGtfc2V0X3JhdGUoKSwgdGhlIGZ1bmN0aW9u
Cj4+IGNsa19jb3JlX3JvdW5kX3JhdGVfbm9sb2NrKCkgaXMgY2FsbGVkIHRvIGNhbGN1bGF0ZSB0
aGUgbWF0Y2hpbmcgcmF0ZQo+PiBhbmQgc2F2ZSBpdCB0byAnY29yZS0+bmV3X3JhdGUnLiBBdCB0
aGUgc2FtZSB0aW1lLCBpdCByZWNhbGN1bGF0ZXMgYW5kCj4+IHVwZGF0ZXMgaXRzICdjaGlsZC0+
bmV3cmF0ZScuIEZpbmFsbHksIGNsa19jaGFuZ2VfcmF0ZSgpIGlzIGNhbGxlZCB0bwo+PiBzZXQg
YWxsICduZXdfcmF0ZXMnLgo+PiAtLS0KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBSZW1vdmUgdGhl
IENMS19ESVZJREVSX1JFQURfT05MWSBqdWRnbWVudCBsb2dpYyBpbgo+PiBjbGtfcmVnbWFwX2Rp
dl9kZXRlcm1pbmVfcmF0ZSgpLgo+PiAtIEFkZCBjbGtfcmVnbWFwX2Rpdl9yb19kZXRlcm1pbmVf
cmF0ZSgpLgo+PiAtIExpbmsgdG8gdjE6IAo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjQxMTExLWZpeF9jaGlsZGNsa19vZl9yb2Nsa19oYXNfYmVlbl90YW1wZXJlZF93aXRoLXYxLTEt
ZjhjMWI2ZmZkY2IwQGFtbG9naWMuY29tCj4+IC0tLQo+PiDCoCBkcml2ZXJzL2Nsay9tZXNvbi9j
bGstcmVnbWFwLmMgfCAzNiAKPj4gKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1yZWdtYXAuYyAKPj4gYi9k
cml2ZXJzL2Nsay9tZXNvbi9jbGstcmVnbWFwLmMKPj4gaW5kZXggMDdmN2U0NDFiOTE2Li5lZGY2
NWNhOTJjN2EgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1yZWdtYXAuYwo+
PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcmVnbWFwLmMKPj4gQEAgLTgwLDIxICs4MCw2
IEBAIHN0YXRpYyBpbnQgY2xrX3JlZ21hcF9kaXZfZGV0ZXJtaW5lX3JhdGUoc3RydWN0IAo+PiBj
bGtfaHcgKmh3LAo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGNsa19yZWdtYXAgKmNsayA9
IHRvX2Nsa19yZWdtYXAoaHcpOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBjbGtfcmVnbWFwX2Rpdl9k
YXRhICpkaXYgPSBjbGtfZ2V0X3JlZ21hcF9kaXZfZGF0YShjbGspOwo+PiAtwqDCoMKgwqAgdW5z
aWduZWQgaW50IHZhbDsKPj4gLcKgwqDCoMKgIGludCByZXQ7Cj4+IC0KPj4gLcKgwqDCoMKgIC8q
IGlmIHJlYWQgb25seSwganVzdCByZXR1cm4gY3VycmVudCB2YWx1ZSAqLwo+PiAtwqDCoMKgwqAg
aWYgKGRpdi0+ZmxhZ3MgJiBDTEtfRElWSURFUl9SRUFEX09OTFkpIHsKPgo+IFlvdSdyZSBicmVh
a2luZyBjdXJyZW50IGNvZGUgYnkgbm8gbW9yZSBjaGVja2luZyB0aGlzIGZsYWcsCj4gdGhlIG5l
dyBjbGtfcmVnbWFwX2Rpdl9yb19kZXRlcm1pbmVfcmF0ZSgpIGlzIGZpbmUsIGJ1dCB5b3Ugc2hv
dWxkIGNhbGwKPiBpdCBmcm9tIGhlcmUgaWYgQ0xLX0RJVklERVJfUkVBRF9PTkxZIGlzIHNldC4K
Ck15IGlkZWEgaXMgdGhhdCB0aGUgbmV3bHkgYWRkZWQgY2xrX3JlZ21hcF9kaXZfcm9fZGV0ZXJt
aW5lX3JhdGUoKQppbXBsZW1lbnRzIHRoZSBmdW5jdGlvbmFsaXR5IG9mIGhhbmRsaW5nIENMS19E
SVZJREVSX1JFQURfT05MWSBpbgpjbGtfcmVnbWFwX2Rpdl9kZXRlcm1pbmVfcmF0ZSgpLiBJZiB3
ZSBzdGlsbCBrZWVwIHRoZSBsb2dpYyBmb3IKaGFuZGxpbmcgQ0xLX0RJVklERVJfUkVBRF9PTkxZ
IGhlcmUsIGl0IHdpbGwgbWFrZQpjbGtfcmVnbWFwX2Rpdl9kZXRlcm1pbmVfcmF0ZSgpIGFtYmln
dW91cyBhbmQgZWFzaWx5IGNvbmZ1c2VkLgoKPgo+IE5laWwKPgo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldCA9IHJlZ21hcF9yZWFkKGNsay0+bWFwLCBkaXYtPm9mZnNldCwgJnZhbCk7
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gLQo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHZhbCA+Pj0gZGl2LT5zaGlmdDsKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB2YWwgJj0gY2xrX2Rpdl9tYXNrKGRpdi0+d2lkdGgpOwo+PiAtCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRpdmlkZXJfcm9fZGV0ZXJtaW5lX3JhdGUoaHcsIHJl
cSwgZGl2LT50YWJsZSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkaXYt
PndpZHRoLCAKPj4gZGl2LT5mbGFncywgdmFsKTsKPj4gLcKgwqDCoMKgIH0KPj4KPj4gwqDCoMKg
wqDCoCByZXR1cm4gZGl2aWRlcl9kZXRlcm1pbmVfcmF0ZShodywgcmVxLCBkaXYtPnRhYmxlLCBk
aXYtPndpZHRoLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRpdi0+ZmxhZ3MpOwo+PiBAQCAtMTI3LDkgKzEx
MiwyOCBAQCBjb25zdCBzdHJ1Y3QgY2xrX29wcyBjbGtfcmVnbWFwX2RpdmlkZXJfb3BzID0gewo+
PiDCoCB9Owo+PiDCoCBFWFBPUlRfU1lNQk9MX05TX0dQTChjbGtfcmVnbWFwX2RpdmlkZXJfb3Bz
LCBDTEtfTUVTT04pOwo+Pgo+PiArc3RhdGljIGludCBjbGtfcmVnbWFwX2Rpdl9yb19kZXRlcm1p
bmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0ICpyZXEpCj4+ICt7Cj4+ICvCoMKgwqDCoCBzdHJ1Y3QgY2xr
X3JlZ21hcCAqY2xrID0gdG9fY2xrX3JlZ21hcChodyk7Cj4+ICvCoMKgwqDCoCBzdHJ1Y3QgY2xr
X3JlZ21hcF9kaXZfZGF0YSAqZGl2ID0gY2xrX2dldF9yZWdtYXBfZGl2X2RhdGEoY2xrKTsKPj4g
K8KgwqDCoMKgIHVuc2lnbmVkIGludCB2YWw7Cj4+ICvCoMKgwqDCoCBpbnQgcmV0Owo+PiArCj4+
ICvCoMKgwqDCoCByZXQgPSByZWdtYXBfcmVhZChjbGstPm1hcCwgZGl2LT5vZmZzZXQsICZ2YWwp
Owo+PiArwqDCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gcmV0Owo+PiArCj4+ICvCoMKgwqDCoCB2YWwgPj49IGRpdi0+c2hpZnQ7Cj4+ICvCoMKgwqDC
oCB2YWwgJj0gY2xrX2Rpdl9tYXNrKGRpdi0+d2lkdGgpOwo+PiArCj4+ICvCoMKgwqDCoCByZXR1
cm4gZGl2aWRlcl9yb19kZXRlcm1pbmVfcmF0ZShodywgcmVxLCBkaXYtPnRhYmxlLCBkaXYtPndp
ZHRoLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGl2LT5mbGFncywgdmFsKTsKPj4gK30KPj4gKwo+
PiDCoCBjb25zdCBzdHJ1Y3QgY2xrX29wcyBjbGtfcmVnbWFwX2RpdmlkZXJfcm9fb3BzID0gewo+
PiDCoMKgwqDCoMKgIC5yZWNhbGNfcmF0ZSA9IGNsa19yZWdtYXBfZGl2X3JlY2FsY19yYXRlLAo+
PiAtwqDCoMKgwqAgLmRldGVybWluZV9yYXRlID0gY2xrX3JlZ21hcF9kaXZfZGV0ZXJtaW5lX3Jh
dGUsCj4+ICvCoMKgwqDCoCAuZGV0ZXJtaW5lX3JhdGUgPSBjbGtfcmVnbWFwX2Rpdl9yb19kZXRl
cm1pbmVfcmF0ZSwKPj4gwqAgfTsKPj4gwqAgRVhQT1JUX1NZTUJPTF9OU19HUEwoY2xrX3JlZ21h
cF9kaXZpZGVyX3JvX29wcywgQ0xLX01FU09OKTsKPj4KPj4KPj4gLS0tCj4+IGJhc2UtY29tbWl0
OiA2NjQ5ODhlYjQ3ZGQyZDZhZTFkOWU0MTg4ZWM5MTgzMjU2MmY4ZjI2Cj4+IGNoYW5nZS1pZDog
Cj4+IDIwMjQxMTExLWZpeF9jaGlsZGNsa19vZl9yb2Nsa19oYXNfYmVlbl90YW1wZXJlZF93aXRo
LTYxZGJjYzYyMzc0Ngo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
