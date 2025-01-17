Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEE0C02188
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jan 2025 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bit6ziNzCKNOL9TKx78OH6oYzviF/ID0oEVyW0nMNCM=; b=AnlMFkzdtzetcr6/xlgi/QwS75
	ckpKJURn04Y/yFy2FZ23/PVd3E4vtCiLLgTFIZ4xjYdDde8SMPCqFD+2L5/dSvERvDxB8DecuXU0i
	rxn6RZbDg27TTt8IKcaA1SvghvAkXn99lRXgrQYAnm4hLVLrVLmng48vmP/l7jP5Z7qbKv/uGpG+T
	OaLOFM0sBhu6JjGlpLpRp/u66mYBMEjaLJgcPR0+heWth+zkrpraaMB+N9kH4PByNPsOFcD3KPz2N
	ICM0pjWQ/9iGF4nGiI1+w2fIm6EL0mxefeBehV6II1d/cgKqr8OXmFvovmMM2e0y4Qai8rgTTXvBw
	Z/f+qU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhJe-0000000HHM0-3RGJ;
	Fri, 17 Jan 2025 08:02:54 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhIz-0000000HHAl-20NF;
	Fri, 17 Jan 2025 08:02:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKprf6LLd24Nw4YhUajpct+Ok5wosl3Z2TOEHOaj5+fZt/d5dS6XoJuJ5YFVe4yNb1SfOesT7hy3hqVEsSst9iMU5/Ns+nDsXtdB/DjqSfT2VGPQBWfxfcGrJMhtHCu3sFuINPb0MoyWsr65v7jtG4hnXaEbUALtc44Euv/r3ZleR/T1ojpWfAIYqTbkYotPipw/6vGkmgVpMBAYaQpVB1zjFQdJih1r7CLsdGC1VlAwGl1hqxPBTIymg1/QUKReP7eO4pC0pLq/K8KDPT4QTajcGQRsiI9+OjecaSWFQIe5c7eZIFtkwn9T+oG3+xIyKcL546owb3y2xDlYuft4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0kaBaIXeDDQAzpvGPMg5ITUf/TulrUMuScRTosbNxY=;
 b=s4TKcbJLIrH8KeKetFaG7mme4j1BNCN8LeaMROxi/sfE+cgAzlTlZqPoGpMS2N0lA16QKqgTF+6X2cqFZyZ7Steql9sGpgUwlMYZy1NUxCk7xDdIDWY2GUJaIf9cOShk9vdqSGREyKPS96PSpQWgLut9xy6xIEmggzRGrIprDlIZMip+WnICdngiC+QasrnF2RFPX+/g6ldS15a4mf4qF33l2lXJgkhLGHnwn7zZBRtPJ7YIsqtznO3OVuPi7z5+LC4C92yX7YLF5jfPKKJTgLasCzb0yH5lLQyzRTr5xEfc8swrODkacDFTzf+eUT/+YDbUZtlVgOupX/o4ZuYZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0kaBaIXeDDQAzpvGPMg5ITUf/TulrUMuScRTosbNxY=;
 b=po+8/o5lAYpiZ42Fwxiv9TrXChLX4CXadq1adP+mHl8O7lO//+92EY9k/541x81WK5ow08F3CUOuGQqumh5cfJyCIkLbgzoSnFBcV9+I7mkeBt2+f/d5kxfildG46lyEqKTO1gnlB5b7CY+RoAOhlyAkx6LpgF7H97oG88jpdZGzVDPoWUnKaNh1fO4CitWwRhKhQv0VnF1e+SRQXXajejCCFKQc7dnjOyNXcWV3hUyvR3jOHF05hIfJKCTWxf28IIFxGs1Uj9iOvfWysgpcGsUGdT/dxeuADeeN7lBONPSzL/+yGwGxGxs7lrZFnjDdaYHZn3bzLXJpuq4X6ba1tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYSPR03MB7642.apcprd03.prod.outlook.com (2603:1096:400:42c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 08:01:59 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 08:01:58 +0000
Message-ID: <33d3ed1b-be77-4ea1-b0ac-ba150ee0490f@amlogic.com>
Date: Fri, 17 Jan 2025 16:01:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add Amlogic T7 PLL clock
 controller
To: Rob Herring <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250108094025.2664201-1-jian.hu@amlogic.com>
 <20250108094025.2664201-2-jian.hu@amlogic.com>
 <20250110155404.GA2928945-robh@kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <20250110155404.GA2928945-robh@kernel.org>
X-ClientProxiedBy: SG2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:3:17::13) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYSPR03MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: d382be02-ca57-4644-a85f-08dd36cd3745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0oxWTRQejNOVU1uQm5IMnZsZHlDeDBxL2owUVBzTlRuVUJFUDE5YzFzMjhh?=
 =?utf-8?B?SGFEN0FyWHVHblBmQWU0ZnM4TEhsblVZVHI0M1Iza2k5N3BoOEUyUUs0K1dB?=
 =?utf-8?B?c1lNZnhuTlVZZEQyMlRidzdZS1ZtVndDaElrU245RzZMVll2ZjdpZHlpNmJj?=
 =?utf-8?B?NlFzTU1NOVp1azcyTmNhaHNnWjRNaXhzaXBEcGxuYlU2aGYzVzFjWit2M0hM?=
 =?utf-8?B?THhvbGRTNmZ1Vnd3RTZsQ0sxOTRNL1FuMTltZDlVYnNWRmZTczVlTTR0ZVl5?=
 =?utf-8?B?NjRPSjJqblF4ak5kNnc5c09BdU5Hc0R3M0hsWTVqSjRmb3p2alFEc1ZWdzRX?=
 =?utf-8?B?SStGa3BISnNmWUdQZzllaTQzaGVlY054TkIya3VaRis0ak9kK01QSVlNaGdP?=
 =?utf-8?B?NVNUR0VOS3g2a1VvbWhwL1c4Rk13N3ZIUForMmw4c3VDSFZKMk5janFvMXRj?=
 =?utf-8?B?L2VDN1RhQVV6M3FrUWljYjA3TEswRHIxR2JSc3l5cHFxVmJ0SlF4ZGJMejBx?=
 =?utf-8?B?SU9hd1Q3R2ZFM0djSkZsQXNJRkVMeTAyWExvYVZnd0pvSGxJeSt4M1oyMjlT?=
 =?utf-8?B?TGltSnFZTzlqZmdPTnJyNVRjQjlnQTBSdUFpSVdDU2t1YVpJRjAyUHBWK0xq?=
 =?utf-8?B?VW5WOWdDdlAzaU9lRW5Ka0F4YktLcUYvSzlnOEd3dVNPRkxqMTlpdGRLT1M5?=
 =?utf-8?B?SXhkejJpaFZ4cG1PRFVtK1lhdzJOODkra3RKSGVtQVhvRWJsaytWY3lhWVp6?=
 =?utf-8?B?MTdUYnZ3QTNVVnpIWHg1RmM3Z2pvU3dqTDFCaVY3V1lQYkROOHVSZml1Wldl?=
 =?utf-8?B?cnBsc1hNcVBMV2wzK3FVZFovNExQOWNsaGhDWVMrMmQwYWNLNlBNYkVORnNj?=
 =?utf-8?B?VHRmTHNOaFJtWCsvM2Z6TTlreTJrZHlmY3crWkRxM3ZFSDhmS2ZzWGQ1d2s1?=
 =?utf-8?B?Ym8weTZTa0kxYmdnaHRFdTJMTlRUbnRab3Vid3RwZmpOTzRZSG5oRzhxUk1L?=
 =?utf-8?B?WTJzV2psbTZBWUNJQ3hmb2l6bjdpK3FLejRmVWhSTE1yZHBiN3U0RVRoMFNT?=
 =?utf-8?B?azFYd0cyNmhFUGF3U0NySVRTekhPQkhSd21ic05BYUJPUFBLNnRoOHFjTjBE?=
 =?utf-8?B?VlhWRFk2dGxJQWJzZHd2RktiU1JwRW1BRDRBYkg4Q3NrbHA3U1NLK0ozTkJZ?=
 =?utf-8?B?NzRlZlV6NkhsMUlKVzA2UEE0cG9JZm9mK0tOTVhMTEJGcnBFNnBKVVBHMTRC?=
 =?utf-8?B?T2pJY0U0VytFa0NYS2E2ck02VGhIRUNNampsaHRhc2dBWlBhSjdMcnVnZk95?=
 =?utf-8?B?US8wTUVMMk1KTDZjeEVrTDBMdWlndGFzTzM1M08xdDZXTkZ3ei9OQ3F4b01i?=
 =?utf-8?B?aDkrUGRDY0hxL1N0d2k2UFd6aVMraVRQanVzTnhOUzhLU1oyOVpMZjZYaFh4?=
 =?utf-8?B?Ynoydi9pU2xvOFJGTmZ2UWQ1amlWcHVZZTlFK3JWZmRxSXNubFlEU1BHbkht?=
 =?utf-8?B?ZlQ2anArU1NQYmxOSUhlRWs4bkN4WDdyYU5aRFM0Z0cxLzZFTFR5QXc2RStG?=
 =?utf-8?B?elpySjJ5NmVsTFZrUGFNdGVyckdRTVJCOTgxbUJaVk54L254emJnSmtmZ0hO?=
 =?utf-8?B?VjNDZmVIYy94ODZBYktxOFhyL3h5RXVTbHA2ZUJKNW1nU01lN3p5dVB6QlFE?=
 =?utf-8?B?WWtuNU5DSUZwaTdOZWtmQUJITWovdDR4TFJ6UngxZ0Q2dE1ObktDdzc3eDBM?=
 =?utf-8?B?bU05UExwZTlNblBZN2doSmRiWmlYb2dvbjEwOW5YQTJwOVdJNkF2NUswNjZY?=
 =?utf-8?B?bTFvRndFeDNNTzNQSEJDQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1c0b1FNeXlIMXJGZ2p1ZkF0ajdrbGl3OGVwMG5PSHFiTUF0M1EzTktRbFJI?=
 =?utf-8?B?ZVAzOTBZcEZNdTdpbHdBaDN3Y1E1UC9Edm1peXU2a00rbk93V3pNSjZPMXhr?=
 =?utf-8?B?YmJacHA2cDFKTFdYc2JVcDEvVytjS1kzeDFQV1pSd095TlA2cHNKVjBhdjdm?=
 =?utf-8?B?aURPaXhFSXp6YWlrWDQ0VFJoM0RNN1RqdWNpTlE4TUg1ak9XbCsyeUpBalJk?=
 =?utf-8?B?d1IyZlF0NzdzZVVhLyt3WFF5SWs4TlNBS0REcUdPclpTN2YxUk0yOUJ5NEcz?=
 =?utf-8?B?NmFNZWJLeTJOVFY1K09Ha0ZmV2dBZWtzZ1F1dFc3emhHeEh6akIwZ1M3VFhE?=
 =?utf-8?B?Mnc2Y21DYkppUEcveHY1ZVdmWTFrM3ptRDkzNFlBbU9NTlBJUXhZWXU0anVz?=
 =?utf-8?B?UzVseitJT1RYMHdEMVhjMS9pZ1Q3Qk5rRUYzSG5CVFBZNnNvNU1pYjlLSHdC?=
 =?utf-8?B?aDN4TzBBc1BXVEpLK2RVNkluSThCeG9HeSsyZzM0WERkY2V5UWVJcHJ0cHFI?=
 =?utf-8?B?ZlZqV1BXbi9xZWlIME9hNHowNURwUTJTdW5MQlpjUVBPbk1jbGF2TXY2QWV0?=
 =?utf-8?B?MXpmUlpKUzJjYmV5NG0vaVVBcnFyY0tBZkU0REhOeVUxUnVMNHhBUmhBV2x5?=
 =?utf-8?B?MmdzakJHV3BqTTdCZVJoZ0lSNjc2VVBFb0ZWSmFONnpISHd1UFFQNTBySVdV?=
 =?utf-8?B?REJKYWF5WGNNWEgxWERqak1lc0MvTTBPL2I5OWd4YmQ2YVU0Mi9KTEUvS0ZS?=
 =?utf-8?B?Zjg1TDhQTk9mbk44bThqZ2FRNy9SZ09tTTRKYVRIRHM5SVhPNHBLWXN2VnJX?=
 =?utf-8?B?UGlIWEl6WGJwMnlQUUFseldPMCtGak9QbjBZU1ZmQlBTdHM0cEN5N0xyTTlI?=
 =?utf-8?B?clFQN1RDUFcxRG11QTJCbW9MUkNXeVorS3I1NHlpeTZPMU1yTElEOHh3dHBV?=
 =?utf-8?B?RnZ1aDJMNW9ab0E2bzArN3BqT2lSYkczY29rK2pKTWRmYnltMURkTTkweGtC?=
 =?utf-8?B?cFpyQ05lSDY5aHpVRUhldjhHTWJuR2dYaXFWb3hEV0VpTWZDWDE3TlVXQUVN?=
 =?utf-8?B?Ym41ZHRWeEN4bXREZWRLK1JyRVJ3aEVwYVQ4c0xPcmE5L1BhSXFZcmFyWW9i?=
 =?utf-8?B?bWRmTzdlQWE3Q1BZOTlzQzFRY3ZvK1IyVnU3YnptbU5kRkdhMk9OSGVHOVQ1?=
 =?utf-8?B?WEtFbmZLY3c5V0xrcmt6Y3k2ZlFsZm1WT3RyVDQxc1Z5QUw5Y2VmNXlQQWFO?=
 =?utf-8?B?RkVET09hRml5QzRpMGQ2ZG9WVzFIa3J3MXFYQ3lVRlFBUVMvM0ZPbjNiZmpm?=
 =?utf-8?B?bWtESExqbjA5aXc1U1ZwNEZTdXlRRHR2TUFlNU1vZTh4RUlXNEJvQ25JNVJM?=
 =?utf-8?B?WWVkN0t5blJVZlpzZjllckd0NWo4N3NxUDZjdmJGbnZ2MkdhZFV6Z1BrOUtC?=
 =?utf-8?B?Uis0WDFpdmxwV1IvRFdUOXFidDBZKzF4SWNRWFZabUpieDFhMVJSUW1QYmJL?=
 =?utf-8?B?UmhBTWQzN2xGWDQ1WHZWZTY4SEhyY1hhWkRvWVo5U2p2UTVGazhtUEhJVTly?=
 =?utf-8?B?YjMzQkw1NjcydTQxT2JpaXNHRWYzYjZxL1E0UFZjQVR3bE1PT2NSSEJXdmxk?=
 =?utf-8?B?elgwZnlCS0VFNGJ0bUw3clpGRUhibitpaEkwWUdkZnFNK09mNFI1QmM1YUZs?=
 =?utf-8?B?UVJwdS9FS0o5MFV4OEFwU1RPZVBGSm00dUhsVVMyTFpDYWQrT0ZZSWtFdTdB?=
 =?utf-8?B?TFYySlpjY0s4MFFHOEJkUlVTdzd1dk5BZEdweFQ3aFBnT1lNbVpFRExKUWor?=
 =?utf-8?B?RTA5MU9QckhtZmthYjBrSjRZaWVGU0xHeWVRWDV4cm5tQzlEc0VCd1Qzc2FC?=
 =?utf-8?B?Z0Z2RDNwTzJUR3BWT2R5YXNlTkJUdjJndVhHZ2NXSS9FYkY5VnZKYjNMSWRq?=
 =?utf-8?B?VDE4cFk4NDRCU2lWTFdFV2JJWGpTeUNYOXdFbHNzM1BqZEhZN0k2c2I4L2lJ?=
 =?utf-8?B?dTlxalNaWXFmRFdLQTlubEZqbVJQdEhDUUM3WjFMczFyRnBVaGJjZEs5Z2Rn?=
 =?utf-8?B?ano0ZVBoTk1NVlpSQkRZRFFwQjFEZjJsb0VPRUdmSlV5MFR6LzVYdElyVm4v?=
 =?utf-8?Q?6o3GUD3SsvtHKkPusci8+wdGd?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d382be02-ca57-4644-a85f-08dd36cd3745
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 08:01:58.1918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7/1DjAZmAa5zAqirrV3YL4LC/BULXJagC7LoH7CTN7gYdQN3IcSBPuFBxh76pdMXSArVRLZpyVV0gMMwtkG7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7642
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_000213_679035_5BD490CB 
X-CRM114-Status: GOOD (  18.57  )
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

SGksIFJvYgoKVGhhbmtzIGZvciB5b3VyIHJldmlldwoKT24gMjAyNS8xLzEwIDIzOjU0LCBSb2Ig
SGVycmluZyB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPgo+IE9uIFdlZCwgSmFuIDA4LCAy
MDI1IGF0IDA1OjQwOjIxUE0gKzA4MDAsIEppYW4gSHUgd3JvdGU6Cj4+IEFkZCBEVCBiaW5kaW5n
cyBmb3IgdGhlIFBMTCBjbG9jayBjb250cm9sbGVyIG9mIHRoZSBBbWxvZ2ljIFQ3IFNvQyBmYW1p
bHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+Cj4+
IC0tLQo+PiAgIC4uLi9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHQ3LXBsbC1jbGtjLnlhbWwgICB8
IDEwMyArKysrKysrKysrKysrKysrKysKPj4gICAuLi4vZHQtYmluZGluZ3MvY2xvY2svYW1sb2dp
Yyx0Ny1wbGwtY2xrYy5oICAgfCAgNTcgKysrKysrKysrKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwg
MTYwIGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsdDctcGxsLWNsa2MueWFtbAo+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsdDctcGxs
LWNsa2MuaAo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL2FtbG9naWMsdDctcGxsLWNsa2MueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHQ3LXBsbC1jbGtjLnlhbWwKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5mZDAzMjM2NzhkMzcKPj4gLS0tIC9k
ZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2sv
YW1sb2dpYyx0Ny1wbGwtY2xrYy55YW1sCj4+IEBAIC0wLDAgKzEsMTAzIEBACj4+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCj4+ICsjIENv
cHlyaWdodCAoQykgMjAyNCBBbWxvZ2ljLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQKPj4gKyVZ
QU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Ns
b2NrL2FtbG9naWMsdDctcGxsLWNsa2MueWFtbCMKPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0aXRsZTogQW1sb2dpYyBU
NyBQTEwgQ2xvY2sgQ29udHJvbCBDb250cm9sbGVyCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiAr
ICAtIE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+PiArICAtIEpl
cm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+PiArICAtIEppYW4gSHUgPGppYW4u
aHVAYW1sb2dpYy5jb20+Cj4+ICsgIC0gWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dp
Yy5jb20+Cj4+ICsKPj4gK2lmOgo+IE1vdmUgdGhpcyBhZnRlciAncmVxdWlyZWQnIHNlY3Rpb24u
Cj4KPiBHZW5lcmFsbHkgd2UgcHV0ICdpZicgdW5kZXIgJ2FsbE9mJyBiZWNhdXNlIHdlJ3JlIGxp
a2VseSB0byBoYXZlIGFub3RoZXIKPiBpZi90aGVuIHNjaGVtYSBvbiB0aGUgbmV4dCBjb21wYXRp
YmxlIGFkZGVkLiBJZiB5b3UgZG9uJ3QgdGhpbmsgdGhpcwo+IGJpbmRpbmcgd2lsbCBldmVyIGdl
dCB1c2VkIG9uIGFub3RoZXIgY2hpcCwgdGhlbiBpdCBpcyBmaW5lIGFzLWlzLgoKCk9LLMKgIEkg
d2lsbCBtb3ZlICdpZicgYWZ0ZXIgJ3JlcXVpcmVkJy7CoCBhbmQgYWRkIHR3byAnaWYnIGZvciB0
aGVtLgoKPj4gKyAgcHJvcGVydGllczoKPj4gKyAgICBjb21wYXRpYmxlOgo+PiArICAgICAgY29u
dGFpbnM6Cj4+ICsgICAgICAgIGNvbnN0OiBhbWxvZ2ljLHQ3LXBsbC1tY2xrCj4+ICsKPj4gK3Ro
ZW46Cj4+ICsgIHByb3BlcnRpZXM6Cj4+ICsgICAgY2xvY2tzOgo+PiArICAgICAgaXRlbXM6Cj4+
ICsgICAgICAgIC0gZGVzY3JpcHRpb246IG1jbGsgcGxsIGlucHV0IG9zY2lsbGF0b3IgZ2F0ZQo+
PiArICAgICAgICAtIGRlc2NyaXB0aW9uOiAyNE0gb3NjaWxsYXRvciBpbnB1dCBjbG9jayBzb3Vy
Y2UgZm9yIG1jbGtfc2VsXzAKPj4gKyAgICAgICAgLSBkZXNjcmlwdGlvbjogZml4IDUwTWh6IGlu
cHV0IGNsb2NrIHNvdXJjZSBmb3IgbWNsa19zZWxfMAo+PiArCj4+ICsgICAgY2xvY2stbmFtZXM6
Cj4+ICsgICAgICBpdGVtczoKPj4gKyAgICAgICAgLSBjb25zdDogaW5wdXQKPj4gKyAgICAgICAg
LSBjb25zdDogbWNsa19pbjAKPj4gKyAgICAgICAgLSBjb25zdDogbWNsa19pbjEKPiBNb3ZlIHRo
ZXNlIHRvIHRvcC1sZXZlbCBhbmQgdGhlbiBib3RoIG9mIHRoZXNlIGFyZSBqdXN0ICdtaW5JdGVt
czogMycuCgoKT2suCgo+PiArCj4+ICtlbHNlOgo+PiArICBwcm9wZXJ0aWVzOgo+PiArICAgIGNs
b2NrczoKPj4gKyAgICAgIGl0ZW1zOgo+PiArICAgICAgICAtIGRlc2NyaXB0aW9uOiBwbGwgaW5w
dXQgb3NjaWxsYXRvciBnYXRlCj4+ICsKPj4gKyAgICBjbG9jay1uYW1lczoKPj4gKyAgICAgIGl0
ZW1zOgo+PiArICAgICAgICAtIGNvbnN0OiBpbnB1dAo+IEFuZCAnbWF4SXRlbXM6IDEnIGhlcmUu
CgoKT2suCgo+Cj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAg
ZW51bToKPj4gKyAgICAgIC0gYW1sb2dpYyx0Ny1wbGwtZ3AwCj4+ICsgICAgICAtIGFtbG9naWMs
dDctcGxsLWdwMQo+PiArICAgICAgLSBhbWxvZ2ljLHQ3LXBsbC1oaWZpCj4+ICsgICAgICAtIGFt
bG9naWMsdDctcGxsLXBjaWUKPj4gKyAgICAgIC0gYW1sb2dpYyx0Ny1tcGxsCj4+ICsgICAgICAt
IGFtbG9naWMsdDctcGxsLWhkbWkKPj4gKyAgICAgIC0gYW1sb2dpYyx0Ny1wbGwtbWNsawo+PiAr
Cj4+ICsgIHJlZzoKPj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4+ICsgICcjY2xvY2stY2VsbHMn
Ogo+PiArICAgIGNvbnN0OiAxCj4+ICsKPj4gKyAgY2xvY2tzOgo+PiArICAgIG1pbkl0ZW1zOiAx
Cj4+ICsgICAgbWF4SXRlbXM6IDMKPj4gKwo+PiArICBjbG9jay1uYW1lczoKPj4gKyAgICBtaW5J
dGVtczogMQo+PiArICAgIG1heEl0ZW1zOiAzCj4gVGhlc2UgYXJlIHRoZSAndG9wLWxldmVsJyBk
ZWZpbml0aW9ucyBpZiB0aGF0J3Mgbm90IGNsZWFyLgoKCk9rLCBJIHdpbGwgcHV0IGl0IGluIHRo
ZSB0b3AuCgo+PiArCj4+ICtyZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsgIC0gJyNj
bG9jay1jZWxscycKPj4gKyAgLSByZWcKPj4gKyAgLSBjbG9ja3MKPj4gKyAgLSBjbG9jay1uYW1l
cwo+PiArCj4+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPj4gKwo+PiArZXhhbXBsZXM6
Cj4+ICsgIC0gfAo+PiArICAgIGFwYiB7Cj4+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+
Owo+PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPj4gKwo+PiArICAgICAgICBjbG9jay1j
b250cm9sbGVyQDgwODAgewo+PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3
LXBsbC1ncDAiOwo+PiArICAgICAgICAgICAgcmVnID0gPDAgMHg4MDgwIDAgMHgyMD47Cj4+ICsg
ICAgICAgICAgICBjbG9ja3MgPSA8JnNjbWlfY2xrIDI+Owo+PiArICAgICAgICAgICAgY2xvY2st
bmFtZXMgPSAiaW5wdXQiOwo+PiArICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+PiAr
ICAgICAgICB9Owo+PiArCj4+ICsgICAgICAgIGNsb2NrLWNvbnRyb2xsZXJAODMwMCB7Cj4+ICsg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsdDctcGxsLW1jbGsiOwo+PiArICAgICAg
ICAgICAgcmVnID0gPDAgMHg4MzAwIDAgMHgxOD47Cj4+ICsgICAgICAgICAgICBjbG9ja3MgPSA8
JnNjbWlfY2xrIDI+LAo+PiArICAgICAgICAgICAgICAgICAgICAgPCZ4dGFsPiwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgIDwmc2NtaV9jbGsgMzE+Owo+PiArICAgICAgICAgICAgY2xvY2stbmFt
ZXMgPSAiaW5wdXQiLCAibWNsa19pbjAiLCAibWNsa19pbjEiOwo+PiArICAgICAgICAgICAgI2Ns
b2NrLWNlbGxzID0gPDE+Owo+PiArICAgICAgICB9Owo+PiArICAgIH07Cj4+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsdDctcGxsLWNsa2MuaCBiL2luY2x1
ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyx0Ny1wbGwtY2xrYy5oCj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTg4YzM0MjAyOGRiCj4+IC0tLSAvZGV2
L251bGwKPj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHQ3LXBsbC1j
bGtjLmgKPj4gQEAgLTAsMCArMSw1NyBAQAo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UgKi8KPj4gKy8qCj4+ICsgKiBDb3B5cmlnaHQg
KGMpIDIwMjQgQW1sb2dpYywgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLgo+PiArICogQXV0aG9y
OiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+PiArICovCj4+ICsKPj4gKyNpZm5kZWYg
X19UN19QTExfQ0xLQ19ICj4+ICsjZGVmaW5lIF9fVDdfUExMX0NMS0NfSAo+PiArCj4+ICsvKiBH
UDAgKi8KPj4gKyNkZWZpbmUgQ0xLSURfR1AwX1BMTF9EQ08gICAgMAo+PiArI2RlZmluZSBDTEtJ
RF9HUDBfUExMICAgICAgICAgICAgICAgIDEKPj4gKwo+PiArLyogR1AxICovCj4+ICsjZGVmaW5l
IENMS0lEX0dQMV9QTExfRENPICAgIDAKPj4gKyNkZWZpbmUgQ0xLSURfR1AxX1BMTCAgICAgICAg
ICAgICAgICAxCj4+ICsKPj4gKy8qIEhJRkkgKi8KPj4gKyNkZWZpbmUgQ0xLSURfSElGSV9QTExf
RENPICAgMAo+PiArI2RlZmluZSBDTEtJRF9ISUZJX1BMTCAgICAgICAgICAgICAgIDEKPj4gKwo+
PiArLyogUENJRSAqLwo+PiArI2RlZmluZSBDTEtJRF9QQ0lFX1BMTF9EQ08gICAwCj4+ICsjZGVm
aW5lIENMS0lEX1BDSUVfUExMX0RDT19ESVYyICAgICAgMQo+PiArI2RlZmluZSBDTEtJRF9QQ0lF
X1BMTF9PRCAgICAyCj4+ICsjZGVmaW5lIENMS0lEX1BDSUVfUExMICAgICAgICAgICAgICAgMwo+
PiArCj4+ICsvKiBNUExMICovCj4+ICsjZGVmaW5lIENMS0lEX01QTExfUFJFRElWICAgIDAKPj4g
KyNkZWZpbmUgQ0xLSURfTVBMTDBfRElWICAgICAgICAgICAgICAxCj4+ICsjZGVmaW5lIENMS0lE
X01QTEwwICAgICAgICAgIDIKPj4gKyNkZWZpbmUgQ0xLSURfTVBMTDFfRElWICAgICAgICAgICAg
ICAzCj4+ICsjZGVmaW5lIENMS0lEX01QTEwxICAgICAgICAgIDQKPj4gKyNkZWZpbmUgQ0xLSURf
TVBMTDJfRElWICAgICAgICAgICAgICA1Cj4+ICsjZGVmaW5lIENMS0lEX01QTEwyICAgICAgICAg
IDYKPj4gKyNkZWZpbmUgQ0xLSURfTVBMTDNfRElWICAgICAgICAgICAgICA3Cj4+ICsjZGVmaW5l
IENMS0lEX01QTEwzICAgICAgICAgIDgKPj4gKwo+PiArLyogSERNSSAqLwo+PiArI2RlZmluZSBD
TEtJRF9IRE1JX1BMTF9EQ08gICAwCj4+ICsjZGVmaW5lIENMS0lEX0hETUlfUExMX09EICAgIDEK
Pj4gKyNkZWZpbmUgQ0xLSURfSERNSV9QTEwgICAgICAgICAgICAgICAyCj4+ICsKPj4gKy8qIE1D
TEsgKi8KPj4gKyNkZWZpbmUgQ0xLSURfTUNMS19QTExfRENPICAgMAo+PiArI2RlZmluZSBDTEtJ
RF9NQ0xLX1BSRSAgICAgICAgICAgICAgIDEKPj4gKyNkZWZpbmUgQ0xLSURfTUNMS19QTEwgICAg
ICAgICAgICAgICAyCj4+ICsjZGVmaW5lIENMS0lEX01DTEtfMF9TRUwgICAgIDMKPj4gKyNkZWZp
bmUgQ0xLSURfTUNMS18wX0RJVjIgICAgNAo+PiArI2RlZmluZSBDTEtJRF9NQ0xLXzBfUFJFICAg
ICA1Cj4+ICsjZGVmaW5lIENMS0lEX01DTEtfMCAgICAgICAgIDYKPj4gKyNkZWZpbmUgQ0xLSURf
TUNMS18xX1NFTCAgICAgNwo+PiArI2RlZmluZSBDTEtJRF9NQ0xLXzFfRElWMiAgICA4Cj4+ICsj
ZGVmaW5lIENMS0lEX01DTEtfMV9QUkUgICAgIDkKPj4gKyNkZWZpbmUgQ0xLSURfTUNMS18xICAg
ICAgICAgMTAKPj4gKwo+PiArI2VuZGlmIC8qIF9fVDdfUExMX0NMS0NfSCAqLwo+PiAtLQo+PiAy
LjQ3LjEKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
