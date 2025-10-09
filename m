Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4E8CCA470
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Oct 2025 03:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+srv5Hi1yksR51980UEDkIOcNJ3CtWgI/f1fwdUZmI=; b=gY+r1J5wvfm0kjhAdUJKnE9O72
	tp8pDTYUZYt2iXIjUofJ8tdJIVsMegcvjqBQxh1JuwZKDdJT47KBCWy7I4UeN3fzgRhmIwUzMW+R7
	Idq0NdL23x/wnLUj208IXR2QkoJZlfAYfoemBvxOsWtWq3UrQ2vD33Wk4kS7ZO7iPnWYRWcbHrTGT
	N+iZd8SESazMKt9tdesBlrg2355uwprlVS41SwTlyRTpRznQaH8/uPX4olO+nZz/ioMDwc5ugv2XT
	y2j5Z5v8VxKljoE0V986tRke3xW4whS6C7Sdpn4BdtHhrij/5jzXowAfxSp2DMligK23R0IZ49PLQ
	zU+VvOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6h2q-0000000550W-3TZE;
	Thu, 09 Oct 2025 03:10:20 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6h2n-000000054zs-2dl6;
	Thu, 09 Oct 2025 03:10:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+qpWWEl1dYUW95HdB856a0FWtLZg9IAJUYiSaI5E+4xqzyBjAuILxm2IktFvinNAyP6gYhvix9L/WQk6Yyep5zOwCPJz6N1mbU36SGVJjNazMzH/upMb4HWubM2jommOZ3Ilptk8X0NimS2m5jNzb+B9vXcSGFE0xjAoOaoz9wUbkxa7pd4ScRAuI96zvyASO4yt5aqBbTWcV/Z8rJRMAmNIkxUA0ik6nBCQrS2is42n1mdtuSgNilvs5RoYwrcE6uq3mXYXXnpGPGQcyoVdz6Aua4uyo1BJ3G63hxdNFHNLUs0zQbwcu3Hyn6HpU26qg/8dDa4VPOYdLUHgvjPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CaaS0u2cQxB3qPzZbea7DZU/CU8srWiTDq/tpDFReo=;
 b=WR9dsDSOPQPvoa93wxP6SyHqvpwnnEXrd1kJ3Qaewf5SU836I7jXb0vg2BPnnpvmjhjtGALUgRaIvGYkyT9x1Tc/ATIeyCIKMNtrc2Xot/8PM6XoDP/ReX/5WwphlSjn6Xn5oUvxkxK1CtMFlll6TOxeVvDTouUeUVYkmRz527P5r61g/R1qSUwrUQ3GtbNmeKLAem1/vGHwBt0G1EVfMqqmll/qQbGzVsEJTStrgu4quOzbt/8Ojxw/fFRUqaB++I57Ye0FgXVCJhqZZ11B038g+sm5Mk6DEG0z7F7ML0229h+MsJtpxdl2Vyyr74t5qBbuutYczHJDN6ZgC+nblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CaaS0u2cQxB3qPzZbea7DZU/CU8srWiTDq/tpDFReo=;
 b=Nu26ZMW0iegVrBVhUbibKZ6SEb5KfKWOkvVlhTuyVtoaKNxGf6GN38Bun8mt/U/WWAFYtLG0/A3OSr3TGdWRWKGOIaytVmStgrIgwvXz+BEMmgk+8NgVwvw1kQFHZiFG81Kjy+frwsvoFZd5nviclji1/kRUp+DbgWye11O52K3eQdf0FxKYxzro8Ln5LPae81hcIlBlXNp4HQYHnu/A+/3w41cY8XnHeTph6HFth61Ih2JNLcAtYuhZWc3PvAElrJSDrEWHG5dDZz328E4jC3CgtFHb6NkxOpBb1//qjoXZlVQhS6rzG6gkCnv/TTSpJrr/slCz3wSUVZRx0ke/uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYSPR03MB7542.apcprd03.prod.outlook.com (2603:1096:400:413::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 03:10:02 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 03:10:01 +0000
Message-ID: <b8105d25-112c-4406-9f3a-8fbbd0754b26@amlogic.com>
Date: Thu, 9 Oct 2025 11:09:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] clk: amlogic: Add PLLs and peripheral clocks for A4
 and A5 SoCs
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
 <1jv7kz3w1p.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jv7kz3w1p.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYSPR03MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 623a9d38-87a9-4494-c701-08de06e15610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHQzejU5cFlyODFDZ05KQUVKNEpqNW9CMUJCLy9rZTErZEducDdDTXFualVh?=
 =?utf-8?B?OUZoM2ZSLzFHVDR1VDdRZmFZVmNzcmxBL2ZxdDQwYXQrRlNCeHB5OGs4c25o?=
 =?utf-8?B?OFhlQjRrMXJkZDUzUkpFM0wyeHZHY1hET1kwTEV6dlhzcHVmZDBWV2p3VVBQ?=
 =?utf-8?B?RWJlSEl5aXBYRGsvOHFDSUhqNEloK3pBSDFpa0NUL2p3ZGJYeDNnb1huQWFY?=
 =?utf-8?B?YU9tNVlncEx0R2lFd2haSTFBMEhQa2hROUwrZldCZnM5RStFK2p3UHhmTTdO?=
 =?utf-8?B?dVcyQnIrK3V6K0YxUnNlSVQxOEZqclNNb1dQc1JXekhkNzdBdkh4eDdVRmEw?=
 =?utf-8?B?dFgrd2M2aG1qUm1hd0JjbVBUcWNsNlBKRFFZRUxPNFlkTjY5dHA3OTE1NENS?=
 =?utf-8?B?bEFnZlZqbStXRVNSNldFUHRoMVdNTUJlSDBKYUs0WE9jbWFuTHBUNHVYaDdh?=
 =?utf-8?B?QzRjOGpKVXZrZmMzNVNXaFFhR3M1RUtkaHZxWUUzd0hNdUNLekJJeHN5elB4?=
 =?utf-8?B?K0EwcjlCelErcktVVFJ3WDZVa0o2SXFsVGM2YzZ3T2FhQVZwOFhOV3Joc0Ey?=
 =?utf-8?B?QnE5VUhvREE0NkZKVm82SXpZUmh0R2RkODNUWjVlTmdaMHJHdDRoZGZTdVRj?=
 =?utf-8?B?c3FPN0pZTUhZSnNZV0c1clJ0SGRlYi8yUzlpdkZDTmV1YkV4K2hvUGNYdVhH?=
 =?utf-8?B?OE1VcHlSdGoycCtjV0RDQ1B3N0loODQ4K1dacXlDOVYyMVBOQzZRWXhaSTh0?=
 =?utf-8?B?OGQ4aGIxU1hjYk9sQjlsclAyVElST0ZhblpIMm5DWW9ZNjNWZzR6cjhqMUE3?=
 =?utf-8?B?blJvWWQwWitKTFN3WXQ0ZUZqd0QyVCtmSTNvT3JHSEFsaVl6b0UzSFhrSURB?=
 =?utf-8?B?ZVdvc1pvckFNMWtMdklEUGp0RlM5Q21TZkxIMGFuditFZ2RUc0ZlNUExU2Vu?=
 =?utf-8?B?MWVyM3g2ZytCYlU3dE53OWQvejBvcnVRYTFYU0tObFp0RnRrRXVEeEdVTkRD?=
 =?utf-8?B?enFVK1BSR2JQYmlHdkpZMUJrcUY2ZTdKQ2FYNHN5bjhZYVhDSTZ5c0hPbnBs?=
 =?utf-8?B?VVlFSk9XRWo2cGhqZ1RNMHVQNThqSzU0T0hBZlhtcFFQNWxPUVowVkJaNDFv?=
 =?utf-8?B?di9zMUR5Ni9LaUJlNlNjRkJ4dFNtWXFvYThxUEtQOU1UTjJvQlhjWHg5cVZH?=
 =?utf-8?B?ODhtK1pINkxYb2JTemo3L1czZHh5YkN1UlJRSWdreDJSbEZrWEo5QlR3Um5T?=
 =?utf-8?B?SWtVT1ByWUx5K1NVMU9aSDdXZGg0SkxYNjJhOWJTL3NVaGVUMW96UDVwbDRV?=
 =?utf-8?B?QWtXV2F4RkRSTGVVNHljUUI1aVNtTEFMOGoyNHRjRW1jdjE2S0pGT0tMZnpN?=
 =?utf-8?B?bmY2aURwTGhaanpRK2RXbDVGUEZxQklLbXBGUFUyN0FZcWd4S3BHMS9BclJh?=
 =?utf-8?B?dytkc1FMMEdKei8wR0dzb3BkdWdFbVk1NWkxa3VNLy9hYVU4cXBNekMwMk1l?=
 =?utf-8?B?NGprU2hCZGUwZUFRSStzTlFtY1pnMTU4SFdXVUJ5SWRDS1I5YXdiVThYUnpH?=
 =?utf-8?B?QUd4Zm9tdDJTaUV3ZDRJQy9pK0JBaVpUbUNuTmRSdnpwSFUwK0ZkMHdaZWJH?=
 =?utf-8?B?dzJualRIY3cySmY3a2dGSU9veVlpV1JSMVBiWGhtUEhDNEJEU3czVDFzbi81?=
 =?utf-8?B?M1NrTDJWS2dYcHM2c0xFdnIrRkFuZUl4OW0rU3JUMUZhUlByRU1tTHV5TjhE?=
 =?utf-8?B?YzlQUUt1SUdtM2pnNUtGSzBmV3AxOG5xc2Izay9kLzhsVjZUU3hXbzZiSWJO?=
 =?utf-8?B?QVZ1aWV1blFaa2JkelRocmlXQVRJQlhwbWV2bXVSaVEvMWJyWGxDSzU3K0Rt?=
 =?utf-8?B?VEs2RGRJa0hKdXpNdGFjKzk0Y0RXQktZcURJT0VNMjR1ZE4vY2o4UnpmMFNv?=
 =?utf-8?Q?fY4+fLKZheeRYLUEhaWv05la45v5w/ay?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmFYSUVEemk5OXZUaTk3eVhpOW5DcHdmUnJWSDdtSGlvK3JtWmNqT2Q1REpB?=
 =?utf-8?B?TkpjWWUxN2pRM0tDZ3F1Z2pkZWxLeEdzeDNWN0VkaVlOSFJYWkF0MXk1RTAv?=
 =?utf-8?B?MC9LSXRENFJPL2taWGMrd0JZWVFqVXJNWVh5T1BZS3BxY1V0ZExUTnNkNVZ5?=
 =?utf-8?B?QlFpSWhZQjcvV0Y3clZ6VmtGOVZKOElueVFJRVdWeXlHeFoxWEMzZmMwMEhE?=
 =?utf-8?B?OGtHZStTVXhFbW9kNUdPNS9pNG1lYjl6YnhMUGYyNVo5NU9tdzZXKzkzeFk1?=
 =?utf-8?B?ODl0UXdzM0dqNzR5Ky85ZFhjeTZWek01NDFWR3lGTFVvUDZqdmpMd05DbEJK?=
 =?utf-8?B?UVRKYkxLYXB0dzVheFhka3lvL3p1M2I1Tmt0YjBydzJMK1cyWXQ1U08yYnBq?=
 =?utf-8?B?UlZPTkN4Ukdldm1mazhjaUUyeWdLYytEcThSQU1ndWtkcEMzUHhtWDFZc3ln?=
 =?utf-8?B?bVpEWXQ4UVgxSU9UNHFiZHlBR2tkYkcrb1l3b1Z3eWlNekwxeTIvbTZyekdS?=
 =?utf-8?B?clkxcC9Sa0hac1k3WlE4VlpEbFl2K2FrOU1hY09Xcjg3SXRydWZTaWdkN2l1?=
 =?utf-8?B?TWFTc3ZJVUZ3M2hMekhwZW9qVmp0UHJ0UGlDc0RXYnc4SXpEY0pXMFdyVjN0?=
 =?utf-8?B?WHZkSjJXN0Vpd2FOUlIwN2QvQUxYUFRyRm5BaHhyNE1XeTlVR0Y1VGV3S0t4?=
 =?utf-8?B?WS91MjZ1WGc5RWVkZW9rUGxqQXZxd0ZrN1l5aUs0VUNzMWZLeHpIUUF6ZUlF?=
 =?utf-8?B?R2tmQmFUN0k3cDlVeEs4TmtjMjVDU04vYkRFY0Z2QmdjSWt4TlE2MVZQcHkx?=
 =?utf-8?B?bW1jcm1XVE5NUEU5aEJOWUVITDNROXArVEJzbnpDb1hocXUzby9Ra1NuWkZo?=
 =?utf-8?B?NExlQ2pJelJTWWJvWW9TQnBYaUtvQzVhMDk4Z1kxblN1SGVxVnNoZTQyUHhR?=
 =?utf-8?B?bGhtSHEwSUJjYUJ0Yk9keEdYMzJ3QkNnWFFTOGdUcmI1RC9FOFhIQWdJVDFu?=
 =?utf-8?B?eDlQL2tDME80ZGtmZnRCYUQ4YW1BYzJkMG80Wk94UkROS2NHMlE5WS9FS3ZR?=
 =?utf-8?B?RDlPYmFJSlZnbmZOT3BBZk1EZFZCSW5lR013NHpCQmJPa3pDWTIwWHczWk1h?=
 =?utf-8?B?d1R0MkhEUWk0d1FJRVhOS1NJa3dmYUZlZnFQSjhONWRVZUttanhQSnVGMUhK?=
 =?utf-8?B?bE1hVVhTb0Q1cFdqZkdibGR1eWEza20rNnMyaGgxV01PamltY1JBZ21aSFRx?=
 =?utf-8?B?b3V3ZXoxUTFFdmE1WkR1anNLWkl0aWE1OWhhYjRjYnR5dno1WS90emFMNzdJ?=
 =?utf-8?B?UlBraFIwS2NqVTZXTnBWOTR1azI4dnpLWERlc1RuZThRdThBYWZQL0lXWmFn?=
 =?utf-8?B?ZUJyY0lGZStzdmlraU5ybWxraG91bTN5Y0FiMkpNYmtNQTN4bHhhNUZJSGZq?=
 =?utf-8?B?dW5OUHdqTjBWcllSNDl2SXdmTDQ2TXdCS05jbkd5QW9KZ0UwY1c2UDBxTUd4?=
 =?utf-8?B?eHB1QTJldGhFd09Vc0Mzak5oTVUyL2Iwa2ZSM0FPVWtoWlBjVVFFVElVNVJT?=
 =?utf-8?B?SURaeldlS3FUcitxSjQwVDhVRlVnRGdYU29hTFp3cGwrNVQrRzFWNVBlWkYv?=
 =?utf-8?B?TmtEMzd2KzZ4THFRVjZMelJ0MnhOR0lPaDlham9KaEZsYkVGT0FEZTdadTc4?=
 =?utf-8?B?RU50UWJIdnRTUnZLemJPT2hzM0x2V3g4ajFsaEFsMk15Rmo1aU5EZ2NqbXVp?=
 =?utf-8?B?YTRCZjBKNllvdlBja1c2ZjJrUUhFQjZmYXRiR1lsZWtJeEhhUVY1SG9qVlNO?=
 =?utf-8?B?ODNaMU5JemZTUXZpVnRaNXJDblpzeWNma1dyVllJcEtySFNmWlhvYkYycGN0?=
 =?utf-8?B?S2IrUWpVUzV4MmRJSVVLUklNYzJXa0lnWmxLeEJhMkQxdjJ5NkVGRDZLL2Z3?=
 =?utf-8?B?Und2c3hRV2xVb0V6UHE4RnN3cjdyQ0sveFRoWW1QS0dLMFFub1c1LzRsTzdw?=
 =?utf-8?B?ZDV2OEpIdjIweW1Zazc2d0dpZHZFMVhRLzF3SkNTWVN4OWJBOUtWM2NmZDh6?=
 =?utf-8?B?dVNxM3V1Z2F4MXEvSmVXdURYeHFITmNmRVEzNVdhRlByMkhSbE5naUQ0SEFR?=
 =?utf-8?Q?7MDQs7PlBkpBDd0VFziRVrGbM?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623a9d38-87a9-4494-c701-08de06e15610
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 03:10:01.7373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3W1EVupv0PX2jzZgq0d8W8oxOt+jIloWyfxfRqhsk+91HAwDjqUjSrYFxPI34AWoiPxsDPIzOyH+VALEz50iow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7542
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_201018_353867_B722FFD1 
X-CRM114-Status: GOOD (  23.48  )
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

SGkgSmVyb21lLAoKIMKgIMKgIFRoYW5rcyBmb3IgeW91ciByZXZpZXcsIGJlY2F1c2UgdGhlIG5h
dGlvbmFsIGRheSBob2xpZGF5cyBkaWQgbm90CnRpbWVseSBmZWVkYmFjay4KCgpPbiAxMC8xLzIw
MjUgMzo0NSBQTSwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPgo+
IE9uIFR1ZSAzMCBTZXAgMjAyNSBhdCAxNzozNywgQ2h1YW4gTGl1IHZpYSBCNCBSZWxheSA8ZGV2
bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPj4gVGhpcyBw
YXRjaCBzZXJpZXMgaW5jbHVkZXMgY2hhbmdlcyByZWxhdGVkIHRvIHRoZSBQTEwgYW5kIHBlcmlw
aGVyYWwKPj4gY2xvY2tzIGZvciBib3RoIHRoZSBBNCBhbmQgQTUgU29Dcy4KPj4KPj4gVGhlIHBh
dGNoZXMgZm9yIEE1IHdlcmUgcHJldmlvdXNseSBzdWJtaXR0ZWQgdXAgdG8gVjMgYnkgWGlhbndl
aS4KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMTAzLWE1LWNsay12My0wLWEy
MDdjZTgzYjllOUBhbWxvZ2ljLmNvbS8KPj4gQWZ0ZXIgZnJpZW5kbHkgY29vcmRpbmF0aW9uLCBJ
4oCZdmUgdGFrZW4gb3ZlciBhbmQgY29udGludWVkIHRoZQo+PiBzdWJtaXNzaW9uIGFzIHBhcnQg
b2YgdGhpcyBzZXJpZXMuIFRoZSBkdC1iaW5kaW5ncyBwYXRjaCByZXRhaW5zIFJvYidzCj4+IG9y
aWdpbmFsICJSZXZpZXdlZC1ieSIgdGFnLCBhbmQgSSBob3BlIHRoaXMgaGFzbuKAmXQgY2F1c2Vk
IGFueQo+PiBhZGRpdGlvbmFsIGNvbmZ1c2lvbi4KPiAuLi4gYW5kIHlldCB5b3UgcmVzdGFydCB0
aGUgdmVyc2lvbmluZyBvZiB0aGUgc2VyaWVzIG1ha2luZyBpdCBoYXJkZXIKPiBmb3IgcGVvcGxl
IHRvIGZvbGxvdyB0aGF0CgoKU29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlIGNhdXNlZC4gVGhl
IG1haW4gY2hhbmdlcyBjb21wYXJlZCB0byB0aGUKcHJldmlvdXMgdmVyc2lvbiBieSBYaWFud2Vp
IGFyZSBpbiB0aGUgZHJpdmVyIHBhcnQuCgpUaGUgZHQtYmluZGluZ3MgcGFydCBvbmx5IGhhcyBt
aW5vciBtb2RpZmljYXRpb25zIGluIFtQQVRDSCAxNC8xOV0uCgpUaGUgZHJpdmVyIHBhcnQgaGFz
IHJlbGF0aXZlbHkgbGFyZ2VyIGNoYW5nZXMgYmVjYXVzZSBpdCBuZWVkcyB0byBiZQpiYXNlZCBv
biB0aGUgY29kZSBiYXNlIHlvdSBwcmV2aW91c2x5IHN1Ym1pdHRlZC4KCgo+PiBCb3RoIEE0IGFu
ZCBBNSBiZWxvbmcgdG8gdGhlIEF1ZGlvIHNlcmllcy4gSnVkZ2luZyBieSB0aGVpciBuYW1lcywg
b25lCj4+IG1pZ2h0IGFzc3VtZSB0aGF0IEE1IGlzIGFuIHVwZ3JhZGUgdG8gQTQsIGJ1dCBpbiBm
YWN0LCBBNSB3YXMgcmVsZWFzZWQKPj4gYSB5ZWFyIGVhcmxpZXIgdGhhbiBBNC4KPj4KPj4gU2lu
Y2UgdGhlcmUgYXJlIGRpZmZlcmVuY2VzIGluIHRoZSBQTExzIGFuZCBwZXJpcGhlcmFsIGNsb2Nr
cyBiZXR3ZWVuCj4+IHRoZSBBNCBhbmQgQTUgU29DcyAoZXNwZWNpYWxseSB0aGUgUExMKSwgYW5k
IHRha2luZyBpbnRvIGFjY291bnQgZmFjdG9ycwo+PiBzdWNoIGFzIG1lbW9yeSBmb290cHJpbnQg
YW5kIG1haW50YWluYWJpbGl0eSwgdGhpcyBzZXJpZXMgZG9lcyBub3QKPj4gYXR0ZW1wdCB0byBt
ZXJnZSB0aGUgdHdvIGludG8gYSBzaGFyZWQgZHJpdmVyIGFzIHdhcyBkb25lIGZvcgo+PiBHMTJB
L0cxMkIvU00xLgo+IC4uLiBhbmQgd2UgZW5kIHVwIHdpdGggMTkgcGF0Y2hlcyBzZXJpZXMgd2hp
bGUgaXQgY291bGQgYmUgc3BsaXR0ZWQgaW50bwo+IG1hbmFnZWFibGUgc2VyaWVzLCBmb3IgZWFj
aCBjb250cm9sbGVyIG9mIGVhY2ggU29DCgoKSSdtIG5vdCBzdXJlIGlmIEkgdW5kZXJzdG9vZCB5
b3UgY29ycmVjdGx5LgoKRG8geW91IG1lYW4gdGhhdCBJIHNob3VsZCBzcGxpdCB0aGlzIHNlcmll
cyBvZiAxOSBwYXRjaGVzIGludG8gbXVsdGlwbGUKcGF0Y2ggc2VyaWVzIGFuZCBzZW5kIHRoZW0g
c2VwYXJhdGVseT8gRm9yIGV4YW1wbGU6CnNlcmllIDE6IEE0IFNDTUkgY2xvY2sgY29udHJvbGxl
ciAoZHQtYmluZGluZ3MpCnNlcmllIDI6IEE0IFBMTCBjbG9jayBjb250cm9sbGVyIChkdC1iaW5k
aW5ncywgZHJpdmVyLCBkdHMpCnNlcmllIDM6IEE0IHBlcmlwaGVyYWxzIGNsb2NrIGNvbnRyb2xs
ZXIgKGR0LWJpbmRpbmdzLCBkcml2ZXIsIGR0cykKLi4uIEE1IHNpbWlsYXJseT8KCgo+PiBUaGlz
IHBhdGNoIHNlcmllcyBpbmNsdWRlcyBhbGwgcmVsYXRlZCBkdC1iaW5kaW5ncywgZHJpdmVyLCBh
bmQgZHRzCj4+IGNoYW5nZXMgZm9yIHRoZSBQTExzIGFuZCBwZXJpcGhlcmFsIGNsb2Nrcy4gRm9s
bG93aW5nIG91ciBwYXN0IGNvbnZlbnRpb24KPj4gZm9yIGNsb2NrLXJlbGF0ZWQgc3VibWlzc2lv
bnMsIHRoZSBkdHMgY2hhbmdlcyBhcmUgcGxhY2VkIGF0IHRoZSBlbmQKPj4gYW5kIHN1Ym1pdHRl
ZCBzZXBhcmF0ZWx5LiBJZiB0aGlzIG9yZGVyaW5nIG1ha2VzIGl0IGhhcmRlciBmb3IKPj4gbWFp
bnRhaW5lcnMgdG8gcmV2aWV3IG9yIHBpY2sgcGF0Y2hlcywgcGxlYXNlIGZlZWwgZnJlZSB0byBw
b2ludCBpdCBvdXQuCj4+Cj4+IENvLWRldmVsb3BlZC1ieTogWGlhbndlaSBaaGFvIDx4aWFud2Vp
LnpoYW9AYW1sb2dpYy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndl
aS56aGFvQGFtbG9naWMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHVhbiBMaXUgPGNodWFuLmxp
dUBhbWxvZ2ljLmNvbT4KPj4gLS0tCj4+IENodWFuIExpdSAoMTkpOgo+PiAgICAgICAgZHQtYmlu
ZGluZ3M6IGNsb2NrOiBBZGQgQW1sb2dpYyBBNCBTQ01JIGNsb2NrIGNvbnRyb2xsZXIKPj4gICAg
ICAgIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTQgUExMIGNsb2NrIGNvbnRyb2xs
ZXIKPj4gICAgICAgIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTQgcGVyaXBoZXJh
bHMgY2xvY2sgY29udHJvbGxlcgo+PiAgICAgICAgY2xrOiBhbWxvZ2ljOiBPcHRpbWl6ZSBQTEwg
ZW5hYmxlIHRpbWluZwo+PiAgICAgICAgY2xrOiBhbWxvZ2ljOiBDb3JyZWN0IGxfZGV0ZWN0IGJp
dCBjb250cm9sCj4+ICAgICAgICBjbGs6IGFtbG9naWM6IEZpeCBvdXQtb2YtcmFuZ2UgUExMIGZy
ZXF1ZW5jeSBzZXR0aW5nCj4+ICAgICAgICBjbGs6IGFtbG9naWM6IEFkZCBBNCBQTEwgY2xvY2sg
Y29udHJvbGxlciBkcml2ZXIKPj4gICAgICAgIGNsazogYW1sb2dpYzogQWRkIEE0IGNsb2NrIHBl
cmlwaGVyYWxzIGNvbnRyb2xsZXIgZHJpdmVyCj4+ICAgICAgICBhcm02NDogZHRzOiBhbWxvZ2lj
OiBBNDogQWRkIHNjbWktY2xrIG5vZGUKPj4gICAgICAgIGFybTY0OiBkdHM6IGFtbG9naWM6IEE0
OiBBZGQgUExMIGNvbnRyb2xsZXIgbm9kZQo+PiAgICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzog
QTQ6IEFkZCBwZXJpcGhlcmFscyBjbG9jayBjb250cm9sbGVyIG5vZGUKPj4gICAgICAgIGR0LWJp
bmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTUgU0NNSSBjbG9jayBjb250cm9sbGVyIHN1cHBv
cnQKPj4gICAgICAgIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTUgUExMIGNsb2Nr
IGNvbnRyb2xsZXIKPj4gICAgICAgIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTUg
cGVyaXBoZXJhbHMgY2xvY2sgY29udHJvbGxlcgo+PiAgICAgICAgY2xrOiBhbWxvZ2ljOiBBZGQg
QTUgUExMIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVyCj4+ICAgICAgICBjbGs6IGFtbG9naWM6IEFk
ZCBBNSBjbG9jayBwZXJpcGhlcmFscyBjb250cm9sbGVyIGRyaXZlcgo+PiAgICAgICAgYXJtNjQ6
IGR0czogYW1sb2dpYzogQTU6IEFkZCBzY21pLWNsayBub2RlCj4+ICAgICAgICBhcm02NDogZHRz
OiBhbWxvZ2ljOiBBNTogQWRkIFBMTCBjb250cm9sbGVyIG5vZGUKPj4gICAgICAgIGFybTY0OiBk
dHM6IGFtbG9naWM6IEE1OiBBZGQgcGVyaXBoZXJhbCBjbG9jayBjb250cm9sbGVyIG5vZGUKPj4K
Pj4gICAuLi4vY2xvY2svYW1sb2dpYyxhNC1wZXJpcGhlcmFscy1jbGtjLnlhbWwgICAgICAgICB8
IDEyMiArKysKPj4gICAuLi4vYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhNC1wbGwtY2xrYy55YW1s
ICAgICAgICB8ICA2MSArKwo+PiAgIC4uLi9jbG9jay9hbWxvZ2ljLGE1LXBlcmlwaGVyYWxzLWNs
a2MueWFtbCAgICAgICAgIHwgMTM0ICsrKysKPj4gICAuLi4vYmluZGluZ3MvY2xvY2svYW1sb2dp
YyxhNS1wbGwtY2xrYy55YW1sICAgICAgICB8ICA2MyArKwo+PiAgIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9hbWxvZ2ljLWE0LmR0c2kgICAgICAgIHwgIDgwICsrCj4+ICAgYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTUuZHRzaSAgICAgICAgfCAgODcgKysKPj4gICBk
cml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1MyAr
Kwo+PiAgIGRyaXZlcnMvY2xrL21lc29uL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA0ICsKPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9hMS1wbGwuYyAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCj4+ICAgZHJpdmVycy9jbGsvbWVzb24vYTQtcGVyaXBoZXJhbHMuYyAg
ICAgICAgICAgICAgICAgfCA3NjQgKysrKysrKysrKysrKysrKysrCj4+ICAgZHJpdmVycy9jbGsv
bWVzb24vYTQtcGxsLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAyNDIgKysrKysrCj4+ICAg
ZHJpdmVycy9jbGsvbWVzb24vYTUtcGVyaXBoZXJhbHMuYyAgICAgICAgICAgICAgICAgfCA4ODMg
KysrKysrKysrKysrKysrKysrKysrCj4+ICAgZHJpdmVycy9jbGsvbWVzb24vYTUtcGxsLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgfCA0NzYgKysrKysrKysrKysKPj4gICBkcml2ZXJzL2Nsay9t
ZXNvbi9jbGstcGxsLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA3NiArLQo+PiAgIGRyaXZl
cnMvY2xrL21lc29uL2Nsay1wbGwuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKPj4g
ICAuLi4vY2xvY2svYW1sb2dpYyxhNC1wZXJpcGhlcmFscy1jbGtjLmggICAgICAgICAgICB8IDEy
OSArKysKPj4gICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYTQtcGxsLWNsa2Mu
aCAgICB8ICAxNSArCj4+ICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGE0LXNj
bWktY2xrYy5oICAgfCAgNDIgKwo+PiAgIC4uLi9jbG9jay9hbWxvZ2ljLGE1LXBlcmlwaGVyYWxz
LWNsa2MuaCAgICAgICAgICAgIHwgMTMyICsrKwo+PiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xv
Y2svYW1sb2dpYyxhNS1wbGwtY2xrYy5oICAgIHwgIDI0ICsKPj4gICBpbmNsdWRlL2R0LWJpbmRp
bmdzL2Nsb2NrL2FtbG9naWMsYTUtc2NtaS1jbGtjLmggICB8ICA0NCArCj4+ICAgMjEgZmlsZXMg
Y2hhbmdlZCwgMzQwNiBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKPj4gLS0tCj4+IGJh
c2UtY29tbWl0OiAwMWYzYTZkMWQ1OWI4ZTI1YTZkZTI0M2IwZDczMDc1Y2YwNDE1ZWFmCj4+IGNo
YW5nZS1pZDogMjAyNTA5MjgtYTRfYTVfYWRkX2Nsb2NrX2RyaXZlci0yYjdjOWQ2OTU2MzMKPj4K
Pj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
